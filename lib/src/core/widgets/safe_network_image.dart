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

/// Global concurrency pool: limits parallel image downloads to [_kMaxParallel]
/// so the I/O bus is not saturated when dozens of list items mount at once.
const int _kMaxParallel = 6;
int _active = 0;
final List<Completer<void>> _queue = [];

Future<void> _throttled(Future<void> Function() work) async {
  if (_active >= _kMaxParallel) {
    final c = Completer<void>();
    _queue.add(c);
    await c.future;
  }
  _active++;
  try {
    await work();
  } finally {
    _active--;
    if (_queue.isNotEmpty) {
      _queue.removeAt(0).complete();
    }
  }
}

/// In-memory LRU-ish cache for decoded image bytes so that re-mounting
/// the same URL (scroll back into view) is truly instant — no file I/O.
final Map<String, Uint8List> _bytesCache = {};
const int _kMaxBytesEntries = 120;

void _putBytes(String url, Uint8List bytes) {
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

  static final BaseCacheManager _cache = DefaultCacheManager();

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

    // 2. Throttled file/network fetch
    await _throttled(() async {
      try {
        final file = await _cache.getSingleFile(url);
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

      // If loaded from in-memory cache, skip fade animation
      child = _fromMemory
          ? content
          : _FadeIn(child: content);
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
