import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/utils/qr_pay_image_url.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/vibration.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/inactivity_watcher.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/safe_network_image.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/additions.dart';
import 'package:qr_pay_app/src/features/home/widgets/product_info.dart';
import 'package:qr_pay_app/src/features/kiosk/widgets/kiosk_Interaction_listener.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.item,
    this.preloadedVideo,
  });

  final Items item;
  final VideoPlayerController? preloadedVideo;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // ✅ вместо setState на каждый пиксель
  final ValueNotifier<int> _count = ValueNotifier<int>(1);

  // ✅ обновляем из ScrollNotification
  final ValueNotifier<bool> _isAtStart = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _isShowTitle = ValueNotifier<bool>(false);

  // если AdditionsWidget не триггерит notifyListeners() — этим тиком обновим цену
  final ValueNotifier<int> _modsTick = ValueNotifier<int>(0);

  double _titleThreshold = 0.0;

  VideoPlayerController? _videoController;
  bool _isVideo = false;
  bool _ownsVideoController = true;

  void _onPreloadedVideoUpdate() {
    if (_videoController?.value.isInitialized ?? false) {
      _videoController!.removeListener(_onPreloadedVideoUpdate);
      _videoController!.play();
      if (mounted) setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final w = MediaQuery.of(context).size.width;
    _titleThreshold = w / 1.6;
  }

  @override
  @override
  void initState() {
    super.initState();

    final vm = context.read<QrMenuVm>();
    vm.basketService.selectedModifiers = [];

    if (widget.preloadedVideo != null) {
      _videoController = widget.preloadedVideo;
      _isVideo = true;
      _ownsVideoController = false;

      // ✅ не play() сразу
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        if (_videoController!.value.isInitialized) {
          _videoController!.play();
        } else {
          _videoController!.addListener(_onPreloadedVideoUpdate);
        }
      });
    } else {
      // ✅ инициализацию тоже лучше стартовать после первого кадра
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _initVideoIfNeeded();
      });
    }
  }

  // void initState() {
  //   super.initState();

  //   // ✅ Provider read можно в initState (не listen)
  //   final vm = context.read<QrMenuVm>();
  //   vm.basketService.selectedModifiers = [];

  //   if (widget.preloadedVideo != null) {
  //     _videoController = widget.preloadedVideo;
  //     _isVideo = true;
  //     _ownsVideoController = false;
  //     if (_videoController!.value.isInitialized) {
  //       _videoController!.play();
  //     } else {
  //       _videoController!.addListener(_onPreloadedVideoUpdate);
  //     }
  //   } else {
  //     _initVideoIfNeeded();
  //   }
  // }

  Future<void> _initVideoIfNeeded() async {
    final images = widget.item.image;
    if (images == null || images.isEmpty) return;

    final file = images.first.file;
    if (file == null || file.isEmpty) return;

    final isMp4 = file.toLowerCase().contains('.mp4');
    if (!isMp4) return;

    _isVideo = true;

    try {
      final ctrl = VideoPlayerController.networkUrl(Uri.parse(file));
      await ctrl.initialize();
      await ctrl.setVolume(0.0);
      await ctrl.setLooping(true);
      await ctrl.play();

      if (!mounted) {
        await ctrl.dispose();
        return;
      }

      setState(() {
        _videoController?.dispose();
        _videoController = ctrl;
      });
    } catch (_) {
      _isVideo = false;
    }
  }

  int _calcModifiersPrice(QrMenuVm vm) {
    final selected = vm.basketService.selectedModifiers;
    return selected.fold<int>(0, (sum, modifier) {
      final modifierItemsPrice = modifier.items?.fold<int>(
            0,
            (itemsSum, item) => itemsSum + (item.price ?? 0),
          ) ??
          0;
      return sum + modifierItemsPrice;
    });
  }

  bool _modsTickScheduled = false;

  void _bumpModsTickSafe() {
    if (_modsTickScheduled) return;
    _modsTickScheduled = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _modsTickScheduled = false;
      if (!mounted) return;
      _modsTick.value++;
    });
  }

  @override
  void dispose() {
    _count.dispose();
    _isAtStart.dispose();
    _isShowTitle.dispose();
    _modsTick.dispose();
    _videoController?.removeListener(_onPreloadedVideoUpdate);
    if (_ownsVideoController) {
      _videoController?.dispose();
    } else {
      _videoController?.pause();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ✅ НЕ слушаем весь vm
    final vm = context.read<QrMenuVm>();
    final isTablet = context.select<QrMenuVm, bool>((v) => v.isTablet);

    return KioskInteractionListener(
      kioskService: vm.kioskService,
      child: InactivityWatcher(
        isKioskMode: vm.isKioskMode,
        inactivityDuration: vm.kioskService.idleDuration,
        decisionDuration: const Duration(seconds: 10),
        onLeave: () => context.router.pop(),
        child: Scaffold(
          backgroundColor: AppComponents.modalBgColorDefault,
          bottomNavigationBar: _BottomBar(
            item: widget.item,
            isTablet: isTablet,
            count: _count,
            modsTick: _modsTick,
            calcModifiersPrice: () => _calcModifiersPrice(vm),
            onMinus: () {
              if (_count.value > 1) _count.value -= 1;
            },
            onPlus: () => _count.value += 1,
            onAdd: () async {
              final c = _count.value;
              if (widget.item.modifiers?.isEmpty ?? true) {
                await vm.addToBasket(context, widget.item, c);
                if (context.mounted) context.router.pop();
              } else {
                final ok = await vm.addComboBasket(context, widget.item, c);
                if (ok && context.mounted) context.router.pop();
              }
            },
          ),
          body: NotificationListener<ScrollNotification>(
            onNotification: (n) {
              if (n is! ScrollUpdateNotification) return false;

              final pixels = n.metrics.pixels;

              final atStart = pixels <= 0;
              if (atStart != _isAtStart.value) _isAtStart.value = atStart;

              final showTitle = pixels >= _titleThreshold;
              if (showTitle != _isShowTitle.value) {
                _isShowTitle.value = showTitle;
              }

              return false;
            },
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  floating: false,
                  pinned: true,
                  stretch: false,
                  toolbarHeight: 100,
                  backgroundColor: AppComponents.modalBgColorDefault,
                  shadowColor: AppColors.none,
                  surfaceTintColor: AppColors.none,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(0),
                    child: ValueListenableBuilder<bool>(
                      valueListenable: _isShowTitle,
                      builder: (_, show, __) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 160),
                          height: 1,
                          decoration: BoxDecoration(
                            boxShadow: show
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.04),
                                      blurRadius: 16,
                                      offset: const Offset(0, 6),
                                    ),
                                  ]
                                : [],
                          ),
                        );
                      },
                    ),
                  ),
                  expandedHeight: 55.h,
                  leading: ValueListenableBuilder<bool>(
                    valueListenable: _isShowTitle,
                    builder: (_, show, __) {
                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: show ? 1 : 0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: InkWell(
                            radius: 100,
                            onTap: () => context.router.pop(),
                            child: Icon(
                              CupertinoIcons.back,
                              size: isTablet ? 20.sp : 32,
                              color: AppColors.primitiveNeutralcold1000,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  centerTitle: true,
                  title: IgnorePointer(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: ValueListenableBuilder<bool>(
                        valueListenable: _isShowTitle,
                        builder: (_, show, __) {
                          return AnimatedOpacity(
                            duration: const Duration(milliseconds: 250),
                            opacity: show ? 1 : 0,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.item.name ?? '',
                                    style: AppTextStyles.headingH3.copyWith(
                                      color: AppColors.semanticFgDefault,
                                      fontSize: isTablet ? 16.sp : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: RepaintBoundary(
                      child: _ProductMediaBackground(
                        item: widget.item,
                        isVideo: _isVideo,
                        videoController: _videoController,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index == 0) {
                        return RepaintBoundary(
                          child: Padding(
                            padding: AppPaddings.horizontal16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProductInfoWidget(item: widget.item),
                                if (widget.item.modifiers?.isNotEmpty ==
                                    true) ...[
                                  ColumnSpacer(isTablet ? 5 : 2.4),
                                  AdditionsWidget(
                                    modifierData: widget.item.modifiers ?? [],
                                    onChanged: _bumpModsTickSafe,
                                  ),
                                  const ColumnSpacer(2.4),
                                ],
                              ],
                            ),
                          ),
                        );
                      }
                      return const ColumnSpacer(4);
                    },
                    childCount: 2,
                    addRepaintBoundaries: true,
                    addAutomaticKeepAlives: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.item,
    required this.isTablet,
    required this.count,
    required this.modsTick,
    required this.calcModifiersPrice,
    required this.onMinus,
    required this.onPlus,
    required this.onAdd,
  });

  final Items item;
  final bool isTablet;

  final ValueNotifier<int> count;
  final ValueNotifier<int> modsTick;

  final int Function() calcModifiersPrice;

  final VoidCallback onMinus;
  final VoidCallback onPlus;
  final Future<void> Function() onAdd;

  @override
  Widget build(BuildContext context) {
    final basePrice = item.price ?? 0;

    return RepaintBoundary(
      child: Container(
        decoration: BoxDecoration(
          color: AppComponents.buttondockBgColorDefault,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 20,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: ValueListenableBuilder<int>(
            valueListenable: modsTick,
            builder: (_, __, ___) {
              final modifiersPrice = calcModifiersPrice();
              final oneItemPrice = basePrice + modifiersPrice;
              return ValueListenableBuilder<int>(
                valueListenable: count,
                builder: (_, c, __) {
                  // Товар × кол-во + модификаторы один раз (уже с учётом кол-ва каждого модификатора)
                  // final totalPrice = basePrice * c + modifiersPrice;
                  final totalPrice = oneItemPrice * c;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.name ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bodyXl.copyWith(
                                fontSize: isTablet ? 15.sp : null,
                                color: AppComponents
                                    .blockBlocktitleHeadingColorDefault,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${priceFormat(totalPrice.toString())} ₸',
                            style: AppTextStyles.bodyXlStrong.copyWith(
                              fontSize: isTablet ? 15.sp : null,
                              color: AppComponents
                                  .blockBlocktitleHeadingColorDefault,
                            ),
                          ),
                        ],
                      ),
                      const ColumnSpacer(1.2),
                      Row(
                        children: [
                          Container(
                            width: isTablet ? 150 : 107,
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppComponents
                                  .buttongroupButtonGrayBgColorDefault,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: onMinus,
                                    child: Container(
                                      color: AppColors.none,
                                      child: Padding(
                                        padding: AppPaddings.sym16x12,
                                        child: SvgPicture.asset(
                                          AppSvgImages.minus,
                                          height: isTablet ? 24 : null,
                                          color: AppComponents
                                              .buttongroupButtonGrayIconColorDefault,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  c.toString(),
                                  style: AppTextStyles.bodyLStrong.copyWith(
                                    fontSize: isTablet ? 16.sp : null,
                                    color: AppComponents
                                        .buttongroupButtonGrayIconColorDefault,
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: onPlus,
                                    child: Container(
                                      color: AppColors.none,
                                      child: Padding(
                                        padding: AppPaddings.sym16x12,
                                        child: SvgPicture.asset(
                                          AppSvgImages.plus,
                                          height: isTablet ? 18 : null,
                                          color: AppComponents
                                              .buttongroupButtonGrayIconColorDefault,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RowSpacer(0.1.sh),
                          Expanded(
                            child: CupertinoButton(
                              borderRadius: BorderRadius.circular(16),
                              onPressed: onAdd,
                              color: AppComponents
                                  .buttongroupButtonPrimaryBgColorDefault,
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  LocaleKeys.addToOrder.tr(),
                                  style: AppTextStyles.bodyLStrong.copyWith(
                                    fontSize: isTablet ? 15.sp : null,
                                    color: AppComponents
                                        .buttongroupButtonPrimaryTextColorDefault,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ProductMediaBackground extends StatelessWidget {
  const _ProductMediaBackground({
    required this.item,
    required this.isVideo,
    this.videoController,
  });

  final Items item;
  final bool isVideo;
  final VideoPlayerController? videoController;

  @override
  Widget build(BuildContext context) {
    const bgColor = AppComponents.modalBgColorDefault;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final cacheHeight =
        (MediaQuery.of(context).size.height * 0.6 * pixelRatio).round();
    final heroProxyPx = qrPayHeroImageProxyPixels(context);

    return Stack(
      fit: StackFit.expand,
      children: [
        if (isVideo)
          Stack(
            alignment: Alignment.center,
            children: [
              if (item.image?[0].filePreview != null &&
                  !(videoController?.value.isInitialized == true &&
                      videoController?.value.isPlaying == true))
                SafeNetworkImage(
                  key: const ValueKey('preview'),
                  imageUrl: normalizeQrPayInsecureImageUrl(
                    item.image?[0].filePreview ?? '',
                    targetWidthPx: heroProxyPx.widthPx,
                    targetHeightPx: heroProxyPx.heightPx,
                  ),
                  imageBuilder: (context, provider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(8),
                      ),
                      image: DecorationImage(
                        image: ResizeImage(provider, height: cacheHeight),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.primitiveNeutral0,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
              if (videoController?.value.isInitialized ?? false)
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(8),
                    ),
                    child: SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: videoController!.value.size.width,
                          height: videoController!.value.size.height,
                          child: VideoPlayer(videoController!),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          )
        else if (item.image?.isNotEmpty ?? false)
          SafeNetworkImage(
            imageUrl: normalizeQrPayInsecureImageUrl(
              item.image?[0].file ?? item.image?[0].path ?? '',
              targetWidthPx: heroProxyPx.widthPx,
              targetHeightPx: heroProxyPx.heightPx,
            ),
            placeholder: Container(
              decoration: const BoxDecoration(
                color: AppColors.primitiveNeutral0,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            imageBuilder: (_, provider) => Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(8),
                ),
                image: DecorationImage(image: provider, fit: BoxFit.cover),
              ),
            ),
          )
        else
          Image.asset(AppWebpImages.emptyStatus),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: IgnorePointer(
            child: SizedBox(
              height: 120,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [bgColor, bgColor.withOpacity(0.0)],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Vibration.vibrate();
              context.router.pop(context);
            },
            child: Container(
              height: 4.sh,
              width: 4.sh,
              margin: const EdgeInsets.only(top: 60, right: 16),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColors.primitiveNeutralwarm0,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AppSvgImages.closeLarge,
                color: AppComponents.buttongroupButtonWhiteIconColorDefault,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
