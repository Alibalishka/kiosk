import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/safe_network_image.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/pages/product_page.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/recomended.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

class QrMenuHeaderBackground extends StatefulWidget {
  final QrMenuVm viewModel;
  final BuildContext context;

  const QrMenuHeaderBackground({
    super.key,
    required this.viewModel,
    required this.context,
  });

  @override
  State<QrMenuHeaderBackground> createState() => _QrMenuHeaderBackgroundState();
}

class _QrMenuHeaderBackgroundState extends State<QrMenuHeaderBackground> {
  static const _slideInterval = Duration(seconds: 10);
  static const _slideDuration = Duration(milliseconds: 420);

  final CarouselSliderController _carouselController =
      CarouselSliderController();
  Timer? _autoSlideTimer;
  Timer? _dragSettleTimer;
  int _currentIndex = 0;
  bool _isPageDragging = false;
  late final Widget _gradientOverlay = Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          AppColors.primitiveNeutralwarm1000,
          AppColors.primitiveNeutralwarm1000.withOpacity(0.1),
          AppColors.none,
        ],
        stops: const [0, 0.35, 1.0],
      ),
    ),
  );

  bool get _adVisible =>
      widget.viewModel.isKioskMode &&
      widget.viewModel.kioskService.isAdVisible &&
      widget.viewModel.kioskService.currentScreenSaver != null;

  List<Items> get _items => widget.viewModel.menuData?.recommend ?? const [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _syncHeaderVideoForCurrent();
      _syncAutoSlideState();
    });
  }

  @override
  void didUpdateWidget(covariant QrMenuHeaderBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldItems = oldWidget.viewModel.menuData?.recommend ?? const <Items>[];
    final newItems = _items;

    if (newItems.isEmpty) {
      _currentIndex = 0;
      _autoSlideTimer?.cancel();
      _autoSlideTimer = null;
      return;
    }

    if (_currentIndex >= newItems.length || _currentIndex < 0) {
      _currentIndex = 0;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _carouselController.jumpToPage(0);
      });
    }

    if (oldItems != newItems) {
      _syncHeaderVideoForCurrent();
    }

    _syncAutoSlideState();
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _dragSettleTimer?.cancel();
    super.dispose();
  }

  void _setDraggingState(bool isDragging) {
    _dragSettleTimer?.cancel();
    if (!mounted || _isPageDragging == isDragging) return;
    setState(() {
      _isPageDragging = isDragging;
    });
  }

  void _scheduleDragEndSettle() {
    _dragSettleTimer?.cancel();
    _dragSettleTimer = Timer(const Duration(milliseconds: 120), () {
      if (!mounted) return;
      _setDraggingState(false);
    });
  }

  void _syncHeaderVideoForCurrent() {
    final item = _items.isNotEmpty ? _items[_currentIndex] : null;
    unawaited(
      widget.viewModel.videoService.loadHeaderVideoForItem(item).then((_) {
        if (!mounted) return;
        setState(() {});
      }),
    );
  }

  void _onPageChanged(int index) {
    if (!mounted) return;
    final prevIndex = _currentIndex;
    setState(() {
      _currentIndex = index;
    });
    if (prevIndex != _currentIndex) {
      _syncHeaderVideoForCurrent();
    }
    _restartAutoSlideTimer();
  }

  void _syncAutoSlideState() {
    if (_adVisible || _items.length <= 1) {
      _autoSlideTimer?.cancel();
      _autoSlideTimer = null;
      return;
    }
    _restartAutoSlideTimer();
  }

  void _restartAutoSlideTimer() {
    _autoSlideTimer?.cancel();
    if (_adVisible || _items.length <= 1) return;

    _autoSlideTimer = Timer.periodic(_slideInterval, (_) {
      if (!mounted) return;
      _carouselController.nextPage(
        duration: _slideDuration,
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty) return const SizedBox.shrink();
    final currentItem = _items[_currentIndex];

    return GestureDetector(
      onTap: (!_adVisible && widget.viewModel.scrollService.isAtStart)
          ? () async {
              final headerCtrl =
                  widget.viewModel.videoService.videoPlayerController;
              headerCtrl?.pause();
              _autoSlideTimer?.cancel();

              try {
                context.router.push(
                  ProductPageRoute(
                    item: currentItem,
                  ),
                );
                // await showCustomSheet(
                //   context,
                //   child: ProductPage(item: currentItem),
                // );
              } finally {
                if (!_adVisible) {
                  final c = widget.viewModel.videoService.videoPlayerController;
                  if (c != null && c.value.isInitialized) {
                    c.play();
                  }
                }
                _restartAutoSlideTimer();
              }
            }
          : null,
      child: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: (_) {
          _setDraggingState(true);
          _autoSlideTimer?.cancel();
        },
        onPointerUp: (_) => _scheduleDragEndSettle(),
        onPointerCancel: (_) => _scheduleDragEndSettle(),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            fit: StackFit.expand,
            children: [
              const ColoredBox(color: Colors.black),
              if (_items.length == 1)
                _buildPoster(currentItem)
              else
                LayoutBuilder(
                  builder: (context, constraints) =>
                      NotificationListener<ScrollNotification>(
                    // Не пускаем ScrollNotification к InactivityWatcher: авто-слайд
                    // карусели иначе бесконечно сбрасывает таймер бездействия.
                    onNotification: (_) => true,
                    child: NotificationListener<UserScrollNotification>(
                      onNotification: (notification) {
                        final isIdle =
                            notification.direction == ScrollDirection.idle;
                        _setDraggingState(!isIdle);
                        if (isIdle) {
                          _scheduleDragEndSettle();
                          _restartAutoSlideTimer();
                        } else {
                          _dragSettleTimer?.cancel();
                          _autoSlideTimer?.cancel();
                        }
                        return false;
                      },
                      child: CarouselSlider.builder(
                      carouselController: _carouselController,
                      itemCount: _items.length,
                      itemBuilder: (_, index, __) {
                        final item = _items[index];
                        final isCurrent = index == _currentIndex;
                        return RepaintBoundary(
                          child: SizedBox.expand(
                            child: ColoredBox(
                              color: Colors.black,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Positioned.fill(
                                    left: -2,
                                    right: -2,
                                    child: _buildPoster(item),
                                  ),
                                  if (isCurrent &&
                                      !_isPageDragging &&
                                      !_adVisible &&
                                      widget.viewModel.videoService.isVideo)
                                    Positioned.fill(
                                      left: -2,
                                      right: -2,
                                      child:
                                          _buildVideoFadeIn(widget.viewModel),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: constraints.maxHeight,
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                        disableCenter: true,
                        padEnds: false,
                        scrollPhysics: const ClampingScrollPhysics(),
                        autoPlay: false,
                        enlargeCenterPage: false,
                        onPageChanged: (index, _) => _onPageChanged(index),
                      ),
                    ),
                    ),
                  ),
                ),

              if (_items.length == 1 &&
                  !_isPageDragging &&
                  !_adVisible &&
                  widget.viewModel.videoService.isVideo)
                Positioned.fill(
                  left: -2,
                  right: -2,
                  child: _buildVideoFadeIn(widget.viewModel),
                ),

              // 3) gradient overlay
              IgnorePointer(
                ignoring: true,
                child: _gradientOverlay,
              ),

              // 4) overlay content
              IgnorePointer(
                ignoring: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RecomendedWidget(
                    item: currentItem,
                    viewModel: widget.viewModel,
                    activeIndex: _currentIndex,
                    recommendCount: _items.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPoster(Items? item) {
    if (item == null || (item.image?.isEmpty ?? true)) {
      return const ColoredBox(color: Colors.black);
    }
    final firstImage = item.image!.first;
    final url = (firstImage.file?.contains('mp4') == true)
        ? (firstImage.filePreview ?? firstImage.path ?? '')
        : (firstImage.file ?? firstImage.path ?? '');

    if (url.isEmpty) {
      return const ColoredBox(color: Colors.black);
    }

    return SafeNetworkImage(
      imageUrl: url,
      placeholder: const ColoredBox(color: Colors.black),
      errorWidget: const ColoredBox(color: Colors.black),
      imageBuilder: (context, placeholder) => DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: placeholder,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildVideoFadeIn(QrMenuVm viewModel) {
    final controller = viewModel.videoService.videoPlayerController;
    if (controller == null) return const SizedBox.shrink();

    return RepaintBoundary(
      child: ValueListenableBuilder(
        valueListenable: controller,
        builder: (_, value, __) {
          final ready = value.isInitialized;

          // ✅ “дорогой” эффект: видео мягко проявляется поверх постера
          return IgnorePointer(
            ignoring: !ready,
            child: AnimatedOpacity(
              opacity: ready ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              child: ready
                  ? FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: value.size.width,
                        height: value.size.height,
                        child: VideoPlayer(controller),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}




// class QrMenuHeaderBackground extends StatelessWidget {
//   final QrMenuVm viewModel;
//   final BuildContext context;

//   const QrMenuHeaderBackground({
//     super.key,
//     required this.viewModel,
//     required this.context,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final item = viewModel.menuData?.recommend?.first;
//     final isVideoReady =
//         viewModel.videoService.videoPlayerController?.value.isInitialized ??
//             false;

//     return GestureDetector(
//       onTap: viewModel.scrollService.isAtStart
//           ? () => showCustomSheet(
//                 context,
//                 child: ProductPage(item: item!),
//               )
//           : null,
//       child:  Stack(
//         fit: StackFit.expand,
//         children: [
//           if (viewModel.videoService.isVideo)
//             isVideoReady
//                 ? SizedBox(
//                     height: 220, // нужная тебе высота блока под видео
//                     child: buildVideo(viewModel),
//                   )
//                 // AspectRatio(
//                 //     aspectRatio: viewModel.videoService.videoPlayerController!
//                 //         .value.aspectRatio,
//                 //     child: VideoPlayer(
//                 //         viewModel.videoService.videoPlayerController!),
//                 //   )
//                 : _buildShimmer()
//           else
//             SafeNetworkImage(
//               imageUrl: item?.image?.first.file?.contains('mp4') == true
//                   ? item?.image?.first.path ?? ''
//                   : item?.image?.first.file ?? '',
//               imageBuilder: (context, placeholder) => Container(
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.all(Radius.circular(12)),
//                   image: DecorationImage(
//                     image: placeholder,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//                 colors: [
//                   AppColors.primitiveNeutralwarm1000,
//                   AppColors.primitiveNeutralwarm1000.withOpacity(0.1),
//                   AppColors.none,
//                 ],
//                 stops: const [0, 0.35, 1.0],
//               ),
//             ),
//           ),
//           RecomendedWidget(item: item, viewModel: viewModel),
//         ],
//       ),
//     );
//   }

//   Widget _buildShimmer() => Shimmer.fromColors(
//         baseColor: AppComponents.shimmerBase,
//         highlightColor: AppComponents.shimmerHighlight,
//         child: Container(
//           decoration: BoxDecoration(
//             color: AppColors.primitiveNeutral0,
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       );

//   Widget buildVideo(QrMenuVm viewModel) {
//     final controller = viewModel.videoService.videoPlayerController;

//     // if (controller == null || !controller.value.isInitialized) {
//     //   return const SizedBox.shrink(); // или заглушка / лоадер
//     // }

//     if (controller == null) {
//       return const ColoredBox(color: Colors.black);
//     }

//     final size = controller.value.size;

//     return RepaintBoundary(
//   child: ValueListenableBuilder(
//     valueListenable: controller,
//     builder: (_, value, __) {
//       if (!value.isInitialized) {
//         return _buildShimmer();
//       }

//       return FittedBox(
//         fit: BoxFit.cover,
//         child: SizedBox(
//           width: value.size.width,
//           height: value.size.height,
//           child: VideoPlayer(controller),
//         ),
//       );
//     },
//   ),
// );


//   }


// }
