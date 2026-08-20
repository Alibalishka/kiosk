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
// Two separate concurrency pools:
//   • _widgetPool — HIGH priority, for visible SafeNetworkImage widgets (10 slots)
//   • _prefetchPool — LOW priority, for background prefetching (4 slots)
// This ensures visible images always get bandwidth first.
// ---------------------------------------------------------------------------

/// Pool for visible widget image loading — high priority.
const int _kWidgetMaxParallel = 10;
int _widgetActive = 0;
final List<Completer<void>> _widgetQueue = [];

Future<void> _widgetThrottled(Future<void> Function() work) async {
  if (_widgetActive >= _kWidgetMaxParallel) {
    final c = Completer<void>();
    _widgetQueue.add(c);
    await c.future;
  }
  _widgetActive++;
  try {
    await work();
  } finally {
    _widgetActive--;
    if (_widgetQueue.isNotEmpty) {
      _widgetQueue.removeAt(0).complete();
    }
  }
}

/// Pool for background prefetching — low priority, fewer slots.
const int _kPrefetchMaxParallel = 4;
int _prefetchActive = 0;
final List<Completer<void>> _prefetchQueue = [];

Future<void> _prefetchThrottled(Future<void> Function() work) async {
  if (_prefetchActive >= _kPrefetchMaxParallel) {
    final c = Completer<void>();
    _prefetchQueue.add(c);
    await c.future;
  }
  _prefetchActive++;
  try {
    await work();
  } finally {
    _prefetchActive--;
    if (_prefetchQueue.isNotEmpty) {
      _prefetchQueue.removeAt(0).complete();
    }
  }
}

// ---------------------------------------------------------------------------
// In-memory LRU-ish cache for decoded image bytes so that re-mounting
// the same URL (scroll back into view) is truly instant — no file I/O.
// ---------------------------------------------------------------------------
final Map<String, Uint8List> _bytesCache = {};
const int _kMaxBytesEntries = 200;

void _putBytes(String url, Uint8List bytes) {
  // Move to "end" (most recently used) by removing + re-adding
  _bytesCache.remove(url);
  if (_bytesCache.length >= _kMaxBytesEntries) {
    // evict oldest quarter
    final keys = _bytesCache.keys.take(_kMaxBytesEntries ~/ 4).toList();
    for (final k in keys) {
      _bytesCache.remove(k);
    }
  }
  _bytesCache[url] = bytes;
}

/// Public API for prefetching: warms the in-memory bytes cache so that
/// [SafeNetworkImage] can display images instantly (zero I/O).
void warmBytesCache(String url, Uint8List bytes) => _putBytes(url, bytes);

// ---------------------------------------------------------------------------
// Long-lived CacheManager for kiosk — images stay on disk for 30 days,
// max 500 files, so the app rarely re-downloads anything.
// ---------------------------------------------------------------------------
final BaseCacheManager kioskCacheManager = CacheManager(
  Config(
    'kioskImageCache',
    stalePeriod: const Duration(days: 30),
    maxNrOfCacheObjects: 500,
  ),
);

// ---------------------------------------------------------------------------
// Pool for background video caching — separate from image pools and capped
// low, so warming the disk cache for a product's video never competes with
// the video actively being watched or with visible-widget image loads.
// ---------------------------------------------------------------------------
const int _kVideoCacheMaxParallel = 2;
int _videoCacheActive = 0;
final List<Completer<void>> _videoCacheQueue = [];

Future<void> videoCacheThrottled(Future<void> Function() work) async {
  if (_videoCacheActive >= _kVideoCacheMaxParallel) {
    final c = Completer<void>();
    _videoCacheQueue.add(c);
    await c.future;
  }
  _videoCacheActive++;
  try {
    await work();
  } finally {
    _videoCacheActive--;
    if (_videoCacheQueue.isNotEmpty) {
      _videoCacheQueue.removeAt(0).complete();
    }
  }
}

// ---------------------------------------------------------------------------
// Prefetch helpers — used by ViewModel to preload URLs into both disk and
// in-memory caches. Uses a SEPARATE low-priority pool so it never blocks
// visible widget image loading.
// ---------------------------------------------------------------------------

/// Prefetch a single URL (low-priority pool).
Future<void> precacheUrl(String url) async {
  if (url.isEmpty) return;
  // Already in memory → nothing to do
  if (_bytesCache.containsKey(url)) return;
  try {
    // Try disk cache first (no network)
    final info = await kioskCacheManager.getFileFromCache(url);
    if (info != null) {
      final bytes = await info.file.readAsBytes();
      _putBytes(url, bytes);
      return;
    }
    // Download via low-priority pool
    await _prefetchThrottled(() async {
      final file = await kioskCacheManager.getSingleFile(url);
      final bytes = await file.readAsBytes();
      _putBytes(url, bytes);
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

  Future<void> _loadImage() async {
    final url = widget.imageUrl;
    if (url.isEmpty) {
      if (mounted) setState(() => _hasError = true);
      return;
    }

    // 1. Instant path: bytes already in memory → zero await
    final cached = _bytesCache[url];
    if (cached != null) {
      if (!mounted) return;
      setState(() {
        _provider = _wrapResize(MemoryImage(cached));
        _fromMemory = true;
      });
      return;
    }

    // 2. Fast path: file already on disk → skip network entirely
    try {
      final info = await kioskCacheManager.getFileFromCache(url);
      if (info != null) {
        if (!mounted) return;
        final bytes = await info.file.readAsBytes();
        if (!mounted) return;
        _putBytes(url, bytes);
        setState(() {
          _provider = _wrapResize(MemoryImage(bytes));
          _fromMemory = true; // skip fade — it was local
        });
        return;
      }
    } catch (_) {
      // fall through to network fetch
    }

    // 3. Throttled network fetch (HIGH priority widget pool)
    await _widgetThrottled(() async {
      try {
        final file = await kioskCacheManager.getSingleFile(url);
        if (!mounted) return;

        final bytes = await file.readAsBytes();
        if (!mounted) return;

        _putBytes(url, bytes);

        setState(() {
          _provider = _wrapResize(MemoryImage(bytes));
        });
      } catch (_) {
        if (!mounted) return;
        setState(() => _hasError = true);
      }
    });
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

  Widget _defaultErrorWidget() {
    return SizedBox(
      width: 300,
      height: 300,
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
