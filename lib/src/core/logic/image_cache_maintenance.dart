import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:flutter/painting.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_pay_app/src/core/widgets/safe_network_image.dart';

/// Итог одного прогона обслуживания — удобно логировать и проверять на месте.
class ImageCacheSweepReport {
  const ImageCacheSweepReport({
    required this.expiredFiles,
    required this.trimmedFiles,
    required this.orphanFiles,
    required this.freedBytes,
    required this.remainingBytes,
    required this.remainingFiles,
    required this.duration,
  });

  /// Удалено по истечении срока хранения.
  final int expiredFiles;

  /// Удалено при выходе за потолок размера.
  final int trimmedFiles;

  /// Удалено «сирот» — файлов на диске без записи в БД.
  final int orphanFiles;

  final int freedBytes;
  final int remainingBytes;
  final int remainingFiles;
  final Duration duration;

  int get deletedFiles => expiredFiles + trimmedFiles + orphanFiles;

  @override
  String toString() =>
      'ImageCacheSweep(expired: $expiredFiles, trimmed: $trimmedFiles, '
      'orphans: $orphanFiles, freed: ${_mb(freedBytes)}, '
      'remaining: ${_mb(remainingBytes)} in $remainingFiles files, '
      'took: ${duration.inMilliseconds}ms)';

  static String _mb(int bytes) => '${(bytes / 1048576).toStringAsFixed(1)}MB';
}

/// Периодическое обслуживание кэша картинок.
///
/// Зачем это вообще нужно — flutter_cache_manager 3.4.1 не удаляет файлы.
/// В `CacheStore._removeCachedFile` объект File собирается прямо из
/// `cacheObject.relativePath` (голое имя вида `uuid.webp`), тогда как реальный
/// файл лежит в `<temp>/kioskImageCache/uuid.webp`. Путь резолвится
/// относительно рабочей директории процесса, `existsSync()` возвращает false,
/// и `delete()` не вызывается никогда: из БД запись уходит, а файл остаётся
/// на диске навсегда.
///
/// На киоске, который не перезапускают неделями и который получает новые
/// URL при каждом обновлении меню, это означает безостановочный рост
/// временной папки — до тех пор, пока на устройстве не кончится место.
/// Дальше ломаются и запись кэша, и sqlite, и приложение начинает
/// «глючить». Починено в 3.4.2, но чистка «сирот», уже накопленных на
/// работающих киосках, всё равно нужна отдельно.
///
/// Поэтому политику хранения реализуем сами и не полагаемся на пакет.
class ImageCacheMaintenance {
  ImageCacheMaintenance._();

  static final ImageCacheMaintenance instance = ImageCacheMaintenance._();

  // ---- Политика хранения -------------------------------------------------

  /// Как часто запускается чистка, пока приложение работает.
  static const Duration sweepInterval = Duration(hours: 6);

  /// Отсрочка первого прогона, чтобы не мешать холодному старту меню.
  static const Duration firstSweepDelay = Duration(minutes: 2);

  /// Сколько файл живёт с момента последнего обращения к нему.
  static const Duration retention = Duration(days: 14);

  /// Потолок кэша картинок на диске.
  static const int maxDiskBytes = 300 * 1024 * 1024;

  /// Потолок in-memory кэша сырых байтов.
  static const int maxMemoryBytes = kBytesCacheMaxBytes;

  /// Потолок глобального ImageCache Flutter (декодированные кадры).
  static const int maxDecodedBytes = 80 * 1024 * 1024;
  static const int maxDecodedImages = 150;

  /// «Сироту» удаляем не сразу: файл мог быть создан загрузкой, которая
  /// прямо сейчас идёт и ещё не успела записать строку в БД.
  static const Duration orphanGracePeriod = Duration(hours: 1);

  // ------------------------------------------------------------------------

  Timer? _timer;
  bool _sweeping = false;

  /// Последний успешный прогон — для диагностики на устройстве.
  ImageCacheSweepReport? lastReport;

  /// Настраивает бюджет декодированных картинок и запускает периодическую
  /// чистку. Вызывать один раз при старте приложения.
  void start() {
    applyDecodedImageBudget();

    _timer?.cancel();
    unawaited(Future<void>.delayed(firstSweepDelay, sweep));
    _timer = Timer.periodic(sweepInterval, (_) => unawaited(sweep()));
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  /// Ограничивает глобальный ImageCache Flutter.
  ///
  /// По умолчанию это 1000 картинок / 100 МБ. Для киоска многовато: hero на
  /// ProductPage декодируется в несколько десятков мегабайт, и пары таких
  /// кадров хватает, чтобы выбить из кэша всю сетку меню и заставить её
  /// декодироваться заново на каждом скролле.
  void applyDecodedImageBudget() {
    PaintingBinding.instance.imageCache
      ..maximumSizeBytes = maxDecodedBytes
      ..maximumSize = maxDecodedImages;
  }

  /// Прогон обслуживания. Безопасно вызывать повторно — параллельные вызовы
  /// схлопываются.
  Future<ImageCacheSweepReport?> sweep() async {
    if (_sweeping) return null;
    _sweeping = true;
    final started = DateTime.now();

    try {
      trimBytesCache(maxMemoryBytes);

      final directory = await _cacheDirectory();
      if (directory == null || !directory.existsSync()) {
        return null;
      }

      await _ensureCacheReady();
      final objects = await kioskCacheRepo.getAllObjects();
      final now = DateTime.now();

      // Последнее обращение: touched, а если его нет — validTill.
      DateTime lastUsed(CacheObject o) => o.touched ?? o.validTill;

      final live = <CacheObject>[];
      final doomed = <CacheObject>[];

      for (final object in objects) {
        if (now.difference(lastUsed(object)) > retention) {
          doomed.add(object);
        } else {
          live.add(object);
        }
      }
      final expiredCount = doomed.length;

      // Если после чистки по сроку всё ещё не влезаем в потолок — режем
      // самые давно не используемые.
      live.sort((a, b) => lastUsed(a).compareTo(lastUsed(b)));
      var liveBytes = live.fold<int>(0, (sum, o) => sum + (o.length ?? 0));
      var trimmedCount = 0;
      while (liveBytes > maxDiskBytes && live.isNotEmpty) {
        final victim = live.removeAt(0);
        liveBytes -= victim.length ?? 0;
        doomed.add(victim);
        trimmedCount++;
      }

      // Удаляем файлы по ПРАВИЛЬНОМУ пути, затем — записи в БД.
      var freedBytes = 0;
      final deletedIds = <int>[];
      for (final object in doomed) {
        freedBytes += await _deleteFile(directory, object.relativePath);
        final id = object.id;
        if (id != null) deletedIds.add(id);
      }
      if (deletedIds.isNotEmpty) {
        await kioskCacheRepo.deleteAll(deletedIds);
      }

      // Файлы без записи в БД — то, что накопил баг пакета.
      final referenced = live.map((o) => o.relativePath).toSet();
      final orphanResult =
          await _deleteOrphans(directory, referenced, now: now);
      freedBytes += orphanResult.bytes;

      final remaining = await _measure(directory);

      final report = ImageCacheSweepReport(
        expiredFiles: expiredCount,
        trimmedFiles: trimmedCount,
        orphanFiles: orphanResult.count,
        freedBytes: freedBytes,
        remainingBytes: remaining.bytes,
        remainingFiles: remaining.count,
        duration: DateTime.now().difference(started),
      );
      lastReport = report;
      dev.log('$report', name: 'ImageCacheMaintenance');
      return report;
    } catch (e, stack) {
      dev.log(
        'sweep failed: $e',
        name: 'ImageCacheMaintenance',
        error: e,
        stackTrace: stack,
      );
      return null;
    } finally {
      _sweeping = false;
    }
  }

  /// Полный сброс кэша картинок: диск, БД, байты в памяти и декодированные
  /// кадры. Нужен для «сбросить кэш» из сервисного меню.
  Future<void> clearAll() async {
    try {
      clearBytesCache();
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();

      await _ensureCacheReady();
      final objects = await kioskCacheRepo.getAllObjects();
      final ids = <int>[];
      for (final object in objects) {
        final id = object.id;
        if (id != null) ids.add(id);
      }
      if (ids.isNotEmpty) await kioskCacheRepo.deleteAll(ids);

      final directory = await _cacheDirectory();
      if (directory != null && directory.existsSync()) {
        await _deleteOrphans(directory, const <String>{}, now: null);
      }
    } catch (e) {
      dev.log('clearAll failed: $e', name: 'ImageCacheMaintenance');
    }
  }

  /// Гарантирует, что sqlite-база кэша открыта.
  ///
  /// `kioskCacheRepo.getAllObjects()` обращается к `db!` напрямую и падает на
  /// null, если базу ещё никто не открывал. Открывает её конструктор
  /// `CacheStore`, то есть первое обращение к `kioskCacheManager` — а оно
  /// ленивое и до этого момента могло не случиться.
  Future<void> _ensureCacheReady() async {
    // Заведомо отсутствующий ключ: поднимает ленивую инициализацию менеджера
    // и дожидается открытия базы, ничего не меняя в кэше.
    await kioskCacheManager.getFileFromCache('qrpay://cache-maintenance-probe');
    await kioskCacheRepo.open();
  }

  /// Тот же путь, что строит `IOFileSystem`: `<temp>/<cacheKey>`.
  Future<Directory?> _cacheDirectory() async {
    try {
      final base = await getTemporaryDirectory();
      return Directory('${base.path}/$kKioskImageCacheKey');
    } catch (_) {
      return null;
    }
  }

  /// Возвращает освобождённые байты.
  Future<int> _deleteFile(Directory directory, String relativePath) async {
    try {
      final file = File('${directory.path}/$relativePath');
      if (!file.existsSync()) return 0;
      final size = await file.length();
      await file.delete();
      return size;
    } catch (_) {
      return 0;
    }
  }

  Future<({int count, int bytes})> _deleteOrphans(
    Directory directory,
    Set<String> referenced, {
    required DateTime? now,
  }) async {
    var count = 0;
    var bytes = 0;
    try {
      final entries = directory.listSync(followLinks: false);
      for (final entry in entries) {
        if (entry is! File) continue;
        final name = entry.uri.pathSegments.last;
        if (referenced.contains(name)) continue;

        try {
          // Свежий файл мог быть создан идущей прямо сейчас загрузкой,
          // которая ещё не записала строку в БД.
          if (now != null) {
            final modified = entry.statSync().modified;
            if (now.difference(modified) < orphanGracePeriod) continue;
          }
          final size = await entry.length();
          await entry.delete();
          count++;
          bytes += size;
        } catch (_) {
          // файл занят или уже удалён — пропускаем
        }
      }
    } catch (_) {
      // директорию могли удалить между вызовами
    }
    return (count: count, bytes: bytes);
  }

  Future<({int count, int bytes})> _measure(Directory directory) async {
    var count = 0;
    var bytes = 0;
    try {
      for (final entry in directory.listSync(followLinks: false)) {
        if (entry is! File) continue;
        count++;
        try {
          bytes += await entry.length();
        } catch (_) {
          // файл исчез — не важно
        }
      }
    } catch (_) {
      // директорию могли удалить
    }
    return (count: count, bytes: bytes);
  }
}
