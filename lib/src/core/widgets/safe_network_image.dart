import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:shimmer/shimmer.dart';

typedef ImageContentBuilder = Widget Function(
    BuildContext context, ImageProvider imageProvider);

class SafeNetworkImage extends StatefulWidget {
  final String imageUrl;
  final ImageContentBuilder imageBuilder;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? height;
  final double? width;

  const SafeNetworkImage({
    super.key,
    required this.imageUrl,
    required this.imageBuilder,
    this.placeholder,
    this.errorWidget,
    this.height,
    this.width,
  });

  @override
  State<SafeNetworkImage> createState() => _SafeNetworkImageState();
}

class _SafeNetworkImageState extends State<SafeNetworkImage> {
  Uint8List? _imageBytes;
  bool _hasError = false;
  bool _isLoaded = false;

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
      _isLoaded = false;
      _imageBytes = null;
      _loadImage();
    }
  }

  Future<void> _loadImage() async {
    try {
      final file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
      final bytes = await file.readAsBytes();

      if (!mounted) return;

      setState(() {
        _imageBytes = bytes;
        _isLoaded = true;
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return widget.errorWidget ?? _defaultErrorWidget();
    }

    if (_imageBytes == null) {
      return widget.placeholder ?? _defaultPlaceholder();
    }

    final imageProvider = MemoryImage(_imageBytes!);

    return AnimatedOpacity(
      opacity: _isLoaded ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      child: widget.imageBuilder(context, imageProvider),
    );
  }

  Widget _defaultPlaceholder() {
    return Shimmer.fromColors(
      baseColor: AppComponents.shimmerBase,
      highlightColor: AppComponents.shimmerHighlight,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: AppColors.primitiveNeutral0,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _defaultErrorWidget() {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Image.asset(AppWebpImages.placeholderMenu, fit: BoxFit.cover),
    );
  }
}
