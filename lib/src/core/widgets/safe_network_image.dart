import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';

typedef ImageContentBuilder = Widget Function(
  BuildContext context,
  ImageProvider imageProvider,
);

// ---------------------------------------------------------------------------
// Таймауты. Без них `flutter_cache_manager` висит на зависшем соединении
// бесконечно и намертво занимает слот в очереди — на киоске с нестабильным
// Wi-Fi этого достаточно, чтобы картинки перестали появляться вообще.
// ---------------------------------------------------------------------------

/// Ожидание заголовков ответа.
const Duration kImageConnectTimeout = Duration(seconds: 15);

/// Максимальная пауза между чанками тела ответа (защита от «залипшей» закачки).
const Duration kImageStallTimeout = Duration(seconds: 15);

/// Общий потолок на одну загрузку файла целиком.
const Duration kImageFetchTimeout = Duration(seconds: 30);

/// Сколько раз виджет пробует загрузить картинку перед показом errorWidget.
const int kImageMaxAttempts = 3;

/// Потолок на фоновое докачивание видео товара — файлы заметно тяжелее
/// картинок, поэтому запас больше.
const Duration kVideoFetchTimeout = Duration(minutes: 3);

// ---------------------------------------------------------------------------
// Пулы приоритетов.
//
// Важно: у `flutter_cache_manager` есть собственный глобальный лимит
// `FileService.concurrentFetches` с одной FIFO-очередью и БЕЗ приоритетов.
// Пока он был равен 10 (дефолт), а сумма наших пулов — 16, реальную очередь
// держал пакет, и фоновый prefetch спокойно вставал впереди видимых картинок.
// Поднимаем его выше суммы наших пулов, чтобы очерёдность определяли именно
// они.
// ---------------------------------------------------------------------------

const int _kWidgetMaxParallel = 10;
const int _kPrefetchMaxParallel = 3;
const int _kVideoCacheMaxParallel = 2;

/// С запасом больше, чем `_kWidgetMaxParallel + _kPrefetchMaxParallel +
/// _kVideoCacheMaxParallel`, чтобы пакет никогда не становился узким местом.
const int _kCacheManagerConcurrentFetches = 24;

/// Пул с честной (FIFO) передачей слота: освободившийся слот передаётся
/// напрямую следующему в очереди, а не «отпускается» в общий доступ.
///
/// Прошлая схема (`active--`, затем `complete()`) лимит не нарушала, но была
/// несправедливой: свежий вызов, пришедший между этими двумя шагами, забирал
/// слот вперёд того, кто уже стоял в очереди. На киоске это значило, что
/// картинка, уехавшая с экрана, могла обгонять видимую.
class _Pool {
  _Pool(this._max);

  final int _max;
  int _active = 0;
  final List<Completer<void>> _queue = [];

  Future<void> run(Future<void> Function() work) async {
    if (_active >= _max) {
      final c = Completer<void>();
      _queue.add(c);
      // Слот нам передадут уже занятым — счётчик не трогаем.
      await c.future;
    } else {
      _active++;
    }
    try {
      await work();
    } finally {
      if (_queue.isNotEmpty) {
        _queue.removeAt(0).complete();
      } else {
        _active--;
      }
    }
  }
}

/// Высокий приоритет: видимые на экране [SafeNetworkImage].
final _Pool _widgetPool = _Pool(_kWidgetMaxParallel);

/// Низкий приоритет: фоновый прогрев кэша.
final _Pool _prefetchPool = _Pool(_kPrefetchMaxParallel);

/// Низкий приоритет: фоновое докачивание видео товара.
final _Pool _videoCachePool = _Pool(_kVideoCacheMaxParallel);

Future<void> videoCacheThrottled(Future<void> Function() work) =>
    _videoCachePool.run(work);

// ---------------------------------------------------------------------------
// In-memory LRU cache for image bytes so that re-mounting the same URL
// (scroll back into view) is truly instant — no file I/O.
//
// Лимит считается В БАЙТАХ, а не в записях. Прошлый потолок «200 записей»
// ничего не гарантировал: hero-варианты весят ~220 КБ, то есть кэш мог тихо
// удерживать ~44 МБ в heap на киоске, который не перезапускают неделями.
// ---------------------------------------------------------------------------
final Map<String, Uint8List> _bytesCache = {};

/// Жёсткий потолок in-memory кэша сырых байтов.
const int kBytesCacheMaxBytes = 24 * 1024 * 1024;

/// Вторичный предохранитель на случай очень мелких картинок.
const int _kMaxBytesEntries = 200;

int _bytesCacheBytes = 0;

/// Текущий объём in-memory кэша сырых байтов.
int get bytesCacheSizeInBytes => _bytesCacheBytes;

/// Количество записей в in-memory кэше сырых байтов.
int get bytesCacheLength => _bytesCache.length;

void _removeBytes(String url) {
  final removed = _bytesCache.remove(url);
  if (removed != null) _bytesCacheBytes -= removed.lengthInBytes;
}

void _putBytes(String url, Uint8List bytes) {
  // Move to "end" (most recently used) by removing + re-adding
  _removeBytes(url);

  // Картинку, которая сама по себе больше потолка, не кэшируем вовсе —
  // иначе она вытеснит всё остальное и всё равно будет вытеснена следующей.
  if (bytes.lengthInBytes > kBytesCacheMaxBytes) return;

  _bytesCache[url] = bytes;
  _bytesCacheBytes += bytes.lengthInBytes;

  _evictUntilWithinBudget();
}

/// Выселяет самые старые записи, пока кэш не уложится в лимиты.
void _evictUntilWithinBudget() {
  while ((_bytesCacheBytes > kBytesCacheMaxBytes ||
          _bytesCache.length > _kMaxBytesEntries) &&
      _bytesCache.isNotEmpty) {
    _removeBytes(_bytesCache.keys.first);
  }
}

/// Public API for prefetching: warms the in-memory bytes cache so that
/// [SafeNetworkImage] can display images instantly (zero I/O).
void warmBytesCache(String url, Uint8List bytes) => _putBytes(url, bytes);

/// Ужимает in-memory кэш до [maxBytes]. Используется периодическим
/// обслуживанием кэша.
void trimBytesCache(int maxBytes) {
  while (_bytesCacheBytes > maxBytes && _bytesCache.isNotEmpty) {
    _removeBytes(_bytesCache.keys.first);
  }
}

/// Полностью очищает in-memory кэш сырых байтов.
void clearBytesCache() {
  _bytesCache.clear();
  _bytesCacheBytes = 0;
}

/// Выбрасывает битую запись отовсюду, чтобы повторная попытка реально
/// сходила в сеть, а не подняла те же нечитаемые байты с диска.
Future<void> _evictBrokenImage(String url) async {
  _removeBytes(url);
  try {
    await kioskCacheManager.removeFile(url);
  } catch (_) {
    // запись могла быть уже удалена — не важно
  }
}

// ---------------------------------------------------------------------------
// FileService с таймаутами. `HttpFileService` из пакета не ставит таймаут ни
// на запрос, ни на чтение тела — зависшее соединение живёт вечно.
// ---------------------------------------------------------------------------
class _TimeoutFileService extends FileService {
  _TimeoutFileService() {
    concurrentFetches = _kCacheManagerConcurrentFetches;
  }

  final HttpFileService _inner = HttpFileService();

  @override
  Future<FileServiceResponse> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    final response = await _inner
        .get(url, headers: headers)
        .timeout(kImageConnectTimeout);
    return _StallGuardedResponse(response, kImageStallTimeout);
  }
}

/// Делегирует всё исходному ответу, но обрывает чтение тела, если очередной
/// чанк не пришёл за [_stallTimeout].
class _StallGuardedResponse implements FileServiceResponse {
  _StallGuardedResponse(this._inner, this._stallTimeout);

  final FileServiceResponse _inner;
  final Duration _stallTimeout;

  @override
  Stream<List<int>> get content => _inner.content.timeout(_stallTimeout);

  @override
  int? get contentLength => _inner.contentLength;

  @override
  int get statusCode => _inner.statusCode;

  @override
  DateTime get validTill => _inner.validTill;

  @override
  String? get eTag => _inner.eTag;

  @override
  String get fileExtension => _inner.fileExtension;
}

// ---------------------------------------------------------------------------
// Long-lived CacheManager for kiosk — images stay on disk for 30 days,
// max 500 files, so the app rarely re-downloads anything.
// ---------------------------------------------------------------------------
/// Имя кэша: и ключ CacheManager'а, и имя подпапки в temp-директории,
/// и имя sqlite-базы. Нужно снаружи, чтобы обслуживание нашло файлы.
const String kKioskImageCacheKey = 'kioskImageCache';

/// Тот же самый экземпляр репозитория, что использует [kioskCacheManager].
///
/// Держим ссылку, чтобы периодическое обслуживание могло удалять файлы и
/// записи в БД согласованно, не открывая второе подключение к sqlite.
final CacheObjectProvider kioskCacheRepo =
    CacheObjectProvider(databaseName: kKioskImageCacheKey);

final BaseCacheManager kioskCacheManager = CacheManager(
  Config(
    kKioskImageCacheKey,
    stalePeriod: const Duration(days: 30),
    maxNrOfCacheObjects: 500,
    repo: kioskCacheRepo,
    fileService: _TimeoutFileService(),
  ),
);

// ---------------------------------------------------------------------------
// Prefetch helpers — used by ViewModel to preload URLs into both disk and
// in-memory caches. Uses a SEPARATE low-priority pool so it never blocks
// visible widget image loading.
// ---------------------------------------------------------------------------

/// Prefetch a single URL (low-priority pool).
///
/// Специально НЕ декодирует картинку: прогрев не должен забивать глобальный
/// `ImageCache` кадрами, которые, возможно, никто не покажет. Целостность
/// байтов проверит [SafeNetworkImage] в момент показа.
Future<void> precacheUrl(String url) async {
  if (url.isEmpty) return;
  // Already in memory → nothing to do
  if (_bytesCache.containsKey(url)) return;
  try {
    // Try disk cache first (no network)
    final info = await kioskCacheManager.getFileFromCache(url);
    if (info != null) {
      final bytes = await info.file.readAsBytes();
      if (bytes.isNotEmpty) _putBytes(url, bytes);
      return;
    }
    // Download via low-priority pool
    await _prefetchPool.run(() async {
      final file =
          await kioskCacheManager.getSingleFile(url).timeout(kImageFetchTimeout);
      final bytes = await file.readAsBytes();
      if (bytes.isNotEmpty) _putBytes(url, bytes);
    });
  } catch (_) {
    // silently ignore prefetch errors
  }
}

class SafeNetworkImage extends StatefulWidget {
  final String imageUrl;
  final ImageContentBuilder imageBuilder;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? height;
  final double? width;

  /// Optional: decode the cached image at a specific pixel size to save GPU
  /// memory. Pass the *logical* size here; devicePixelRatio is applied
  /// automatically.
  final int? cacheWidth;
  final int? cacheHeight;

  const SafeNetworkImage({
    super.key,
    required this.imageUrl,
    required this.imageBuilder,
    this.placeholder,
    this.errorWidget,
    this.height,
    this.width,
    this.cacheWidth,
    this.cacheHeight,
  });

  @override
  State<SafeNetworkImage> createState() => _SafeNetworkImageState();
}

class _SafeNetworkImageState extends State<SafeNetworkImage> {
  ImageProvider? _provider;
  bool _hasError = false;
  bool _fromMemory = false;

  /// Отсекает результаты устаревших загрузок (URL сменился, пока грузили).
  int _loadToken = 0;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  @override
  void didUpdateWidget(covariant SafeNetworkImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageUrl != oldWidget.imageUrl) {
      _hasError = false;
      _provider = null;
      _fromMemory = false;
      _loadImage();
    }
  }

  @override
  void dispose() {
    // Гарантирует, что незавершённая загрузка не вызовет setState.
    _loadToken++;
    super.dispose();
  }

  bool _isStale(int token) => !mounted || token != _loadToken;

  Future<void> _loadImage() async {
    final token = ++_loadToken;
    final url = widget.imageUrl;

    if (url.isEmpty) {
      if (!_isStale(token)) setState(() => _hasError = true);
      return;
    }

    for (var attempt = 0; attempt < kImageMaxAttempts; attempt++) {
      if (_isStale(token)) return;

      Uint8List? bytes;
      // Байты из памяти/диска — локальные, показываем без fade-анимации.
      var isLocal = true;

      // 1. Мгновенный путь: байты уже в памяти.
      bytes = _bytesCache[url];

      // 2. Быстрый путь: файл уже на диске — сеть не нужна.
      if (bytes == null) {
        try {
          final info = await kioskCacheManager.getFileFromCache(url);
          if (info != null) {
            final diskBytes = await info.file.readAsBytes();
            if (diskBytes.isNotEmpty) bytes = diskBytes;
          }
        } catch (_) {
          // файла нет или он недоступен — идём в сеть
        }
      }

      // 3. Сеть, через высокоприоритетный пул и с таймаутом.
      if (bytes == null) {
        isLocal = false;
        Uint8List? downloaded;
        try {
          await _widgetPool.run(() async {
            final file = await kioskCacheManager
                .getSingleFile(url)
                .timeout(kImageFetchTimeout);
            if (_isStale(token)) return;
            final networkBytes = await file.readAsBytes();
            if (networkBytes.isNotEmpty) downloaded = networkBytes;
          });
        } catch (_) {
          downloaded = null;
        }
        bytes = downloaded;
      }

      if (_isStale(token)) return;

      if (bytes != null) {
        final provider = _wrapResize(MemoryImage(bytes));

        // Ключевая проверка: убеждаемся, что байты реально декодируются,
        // ПЕРЕД тем как отдать провайдер в imageBuilder. Раньше её не было, и
        // битые байты уходили в `DecorationImage`, который молча ничего не
        // рисует — ни ошибки, ни плейсхолдера, просто пустое место.
        if (await _decodes(provider)) {
          if (_isStale(token)) return;
          _putBytes(url, bytes);
          setState(() {
            _provider = provider;
            _fromMemory = isLocal;
          });
          return;
        }

        // Битая запись — выкидываем и пробуем ещё раз уже из сети.
        await _evictBrokenImage(url);
        if (_isStale(token)) return;
      }

      // Экспоненциальная пауза перед следующей попыткой.
      if (attempt < kImageMaxAttempts - 1) {
        await Future<void>.delayed(Duration(milliseconds: 400 * (1 << attempt)));
      }
    }

    if (_isStale(token)) return;
    setState(() => _hasError = true);
  }

  /// Декодирует картинку и подтверждает, что кадр получен.
  ///
  /// Кадр остаётся в глобальном `ImageCache`, поэтому последующая отрисовка
  /// тем же провайдером повторно НЕ декодирует — проверка бесплатна.
  Future<bool> _decodes(ImageProvider provider) {
    final completer = Completer<bool>();
    final stream = provider.resolve(ImageConfiguration.empty);
    ImageStreamListener? listener;

    void finish(bool ok) {
      if (completer.isCompleted) return;
      completer.complete(ok);
      final l = listener;
      if (l != null) stream.removeListener(l);
    }

    listener = ImageStreamListener(
      (info, _) {
        info.dispose();
        finish(true);
      },
      onError: (_, __) => finish(false),
    );
    stream.addListener(listener);

    return completer.future.timeout(
      kImageFetchTimeout,
      onTimeout: () {
        finish(false);
        return false;
      },
    );
  }

  /// Wrap the provider in a [ResizeImage] if the caller specified target
  /// decode dimensions, saving GPU memory on large photos.
  ImageProvider _wrapResize(ImageProvider provider) {
    if (widget.cacheWidth != null || widget.cacheHeight != null) {
      return ResizeImage(
        provider,
        width: widget.cacheWidth,
        height: widget.cacheHeight,
        allowUpscaling: false,
      );
    }
    return provider;
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (_hasError) {
      child = widget.errorWidget ?? _defaultErrorWidget();
    } else if (_provider == null) {
      child = widget.placeholder ?? _defaultPlaceholder();
    } else {
      final content = widget.imageBuilder(context, _provider!);

      // If loaded from in-memory / disk cache, skip fade animation
      child = _fromMemory ? content : _FadeIn(child: content);
    }

    return (widget.height != null || widget.width != null)
        ? SizedBox(height: widget.height, width: widget.width, child: child)
        : child;
  }

  Widget _defaultPlaceholder() {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: AppColors.primitiveNeutral0,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  /// Занимает ровно тот же слот, что и картинка: раньше здесь был жёсткий
  /// `SizedBox(300, 300)`, который родительский `SizedBox` обрезал.
  Widget _defaultErrorWidget() {
    return Container(
      height: widget.height,
      width: widget.width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.primitiveNeutral0,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(
        AppWebpImages.emptyStatus,
        fit: BoxFit.cover,
      ),
    );
  }
}

/// Lightweight implicit fade-in — avoids a full [AnimatedOpacity] + [Ticker]
/// per list item by using a one-shot [AnimatedOpacity].
class _FadeIn extends StatefulWidget {
  final Widget child;
  const _FadeIn({required this.child});

  @override
  State<_FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<_FadeIn> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Schedule opacity change for next frame so AnimatedOpacity can animate
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _opacity = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      child: widget.child,
    );
  }
}
