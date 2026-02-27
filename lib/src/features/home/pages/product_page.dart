import 'dart:developer';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
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
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

// class ProductPage extends StatefulWidget {
//   const ProductPage({
//     super.key,
//     required this.item,
//   });

//   final Items item;

//   @override
//   State<ProductPage> createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage>
//     with SingleTickerProviderStateMixin {
//   final ScrollController _scrollController = ScrollController();

//   // ✅ вместо setState на каждый пиксель
//   final ValueNotifier<double> _dragOffset = ValueNotifier<double>(0.0);
//   final ValueNotifier<int> _count = ValueNotifier<int>(1);

//   // ✅ вместо setState в scroll listener
//   final ValueNotifier<bool> _isAtStart = ValueNotifier<bool>(true);
//   final ValueNotifier<bool> _isShowTitle = ValueNotifier<bool>(false);

//   // если AdditionsWidget не триггерит notifyListeners() — этим тиком обновим цену
//   final ValueNotifier<int> _modsTick = ValueNotifier<int>(0);

//   late final AnimationController _dragResetCtrl = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 300),
//   );

//   double _dragFrom = 0.0;
//   double _dragTo = 0.0;

//   double _titleThreshold = 0.0;
//   final double _dragThreshold = 200.0;

//   VideoPlayerController? _videoController;
//   bool _isVideo = false;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final w = MediaQuery.of(context).size.width;
//     _titleThreshold = w / 1.2;
//   }

//   @override
//   void initState() {
//     super.initState();

//     _scrollController.addListener(_scrollListener);

//     // ✅ Provider read можно в initState (не listen)
//     final vm = context.read<QrMenuVm>();
//     vm.basketService.selectedModifiers = [];

//     _dragResetCtrl.addListener(() {
//       final t = Curves.easeOut.transform(_dragResetCtrl.value);
//       _dragOffset.value = lerpDouble(_dragFrom, _dragTo, t)!;
//     });

//     _initVideoIfNeeded();
//   }

//   Future<void> _initVideoIfNeeded() async {
//     final images = widget.item.image;
//     if (images == null || images.isEmpty) return;

//     final file = images.first.file;
//     if (file == null || file.isEmpty) return;

//     final isMp4 = file.toLowerCase().contains('.mp4');
//     if (!isMp4) return;

//     _isVideo = true;

//     try {
//       final ctrl = VideoPlayerController.networkUrl(Uri.parse(file));
//       await ctrl.initialize();
//       await ctrl.setVolume(0.0);
//       await ctrl.setLooping(true);
//       await ctrl.play();

//       if (!mounted) {
//         await ctrl.dispose();
//         return;
//       }

//       setState(() {
//         _videoController?.dispose();
//         _videoController = ctrl;
//       });
//     } catch (_) {
//       // если видео упало — просто покажем картинку
//       _isVideo = false;
//     }
//   }

//   void _scrollListener() {
//     final atStart = _scrollController.offset <= 0;
//     if (atStart != _isAtStart.value) _isAtStart.value = atStart;

//     final showTitle = _scrollController.offset >= _titleThreshold;
//     if (showTitle != _isShowTitle.value) _isShowTitle.value = showTitle;
//   }

//   void _animateDragTo(double target) {
//     _dragFrom = _dragOffset.value;
//     _dragTo = target;
//     _dragResetCtrl
//       ..stop()
//       ..value = 0
//       ..forward();
//   }

//   int _calcModifiersPrice(QrMenuVm vm) {
//     final selected = vm.basketService.selectedModifiers;
//     return selected.fold<int>(0, (sum, modifier) {
//       final modifierItemsPrice = modifier.items?.fold<int>(
//             0,
//             (itemsSum, item) => itemsSum + (item.price ?? 0),
//           ) ??
//           0;
//       return sum + modifierItemsPrice;
//     });
//   }

//   bool _modsTickScheduled = false;

//   void _bumpModsTickSafe() {
//     if (_modsTickScheduled) return;
//     _modsTickScheduled = true;

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _modsTickScheduled = false;
//       if (!mounted) return;
//       _modsTick.value++;
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_scrollListener);
//     _scrollController.dispose();

//     _dragResetCtrl.dispose();
//     _dragOffset.dispose();
//     _count.dispose();
//     _isAtStart.dispose();
//     _isShowTitle.dispose();
//     _modsTick.dispose();

//     _videoController?.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ✅ НЕ слушаем весь vm
//     final vm = context.read<QrMenuVm>();
//     final isTablet = context.select<QrMenuVm, bool>((v) => v.isTablet);

//     return KioskInteractionListener(
//       kioskService: vm.kioskService!,
//       child: InactivityWatcher(
//         isKioskMode: vm.isKioskMode,
//         inactivityDuration: vm.kioskService!.idleDuration,
//         decisionDuration: const Duration(seconds: 10),
//         onLeave: () => context.router.pop(),
//         child: GestureDetector(
//           onVerticalDragUpdate: (details) {
//             if (details.delta.dy <= 0) return;

//             // ✅ без setState — только нотифаер
//             _dragResetCtrl.stop();
//             _dragOffset.value += details.delta.dy;
//           },
//           onVerticalDragEnd: (_) {
//             if (_dragOffset.value > _dragThreshold) {
//               context.router.pop(context);
//             } else {
//               _animateDragTo(0.0);
//             }
//           },
//           child: ClipRect(
//             // ✅ ограничили blur (если всё равно тяжело — убери BackdropFilter полностью)
//             child: ValueListenableBuilder<double>(
//               valueListenable: _dragOffset,
//               builder: (_, offset, child) {
//                 return Transform.translate(
//                   offset: Offset(0, offset),
//                   child: child,
//                 );
//               },
//               child: ColoredBox(
//                 color: Colors.black.withOpacity(0.06), // можно 0.04–0.12
//                 child: Scaffold(
//                   backgroundColor: AppComponents.modalBgColorDefault,
//                   bottomNavigationBar: _BottomBar(
//                     item: widget.item,
//                     isTablet: isTablet,
//                     count: _count,
//                     modsTick: _modsTick,
//                     calcModifiersPrice: () => _calcModifiersPrice(vm),
//                     onMinus: () {
//                       if (_count.value > 1) _count.value -= 1;
//                     },
//                     onPlus: () => _count.value += 1,
//                     onAdd: () async {
//                       final c = _count.value;
//                       if (widget.item.modifiers?.isEmpty ?? true) {
//                         await vm.addToBasket(context, widget.item, c);
//                         if (context.mounted) context.router.pop();
//                       } else {
//                         final ok =
//                             await vm.addComboBasket(context, widget.item, c);
//                         if (ok && context.mounted) context.router.pop();
//                       }
//                     },
//                   ),
//                   body: CustomScrollView(
//                     controller: _scrollController,
//                     slivers: [
//                       SliverAppBar(
//                         floating: false,
//                         pinned: true,
//                         stretch: true,
//                         toolbarHeight: 100,
//                         backgroundColor: AppComponents.modalBgColorDefault,
//                         shadowColor: AppColors.none,
//                         surfaceTintColor: AppColors.none,
//                         elevation: 0,
//                         scrolledUnderElevation: 0,
//                         bottom: PreferredSize(
//                           preferredSize: const Size.fromHeight(0),
//                           child: ValueListenableBuilder<bool>(
//                             valueListenable: _isShowTitle,
//                             builder: (_, show, __) {
//                               return AnimatedContainer(
//                                 duration: const Duration(milliseconds: 160),
//                                 height: 1,
//                                 decoration: BoxDecoration(
//                                   boxShadow: show
//                                       ? [
//                                           BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.04),
//                                             blurRadius: 16,
//                                             offset: const Offset(0, 6),
//                                           ),
//                                         ]
//                                       : [],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         expandedHeight: 55.h,
//                         leading: ValueListenableBuilder<bool>(
//                           valueListenable: _isShowTitle,
//                           builder: (_, show, __) {
//                             return AnimatedOpacity(
//                               duration: const Duration(milliseconds: 250),
//                               opacity: show ? 1 : 0,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 40),
//                                 child: InkWell(
//                                   radius: 100,
//                                   onTap: () => context.router.pop(),
//                                   child: const Icon(
//                                     CupertinoIcons.back,
//                                     size: 32,
//                                     color: AppColors.primitiveNeutralcold1000,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         centerTitle: true,
//                         title: IgnorePointer(
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 40),
//                             child: ValueListenableBuilder<bool>(
//                               valueListenable: _isShowTitle,
//                               builder: (_, show, __) {
//                                 return AnimatedOpacity(
//                                   duration: const Duration(milliseconds: 250),
//                                   opacity: show ? 1 : 0,
//                                   child: RichText(
//                                     text: TextSpan(
//                                       children: [
//                                         TextSpan(
//                                           text: widget.item.name ?? '',
//                                           style:
//                                               AppTextStyles.headingH3.copyWith(
//                                             color: AppColors.semanticFgDefault,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         flexibleSpace: LayoutBuilder(
//                           builder: (context, constraints) {
//                             final maxExtent =
//                                 MediaQuery.of(context).size.height * 0.6;
//                             final minExtent = kToolbarHeight;
//                             final currentExtent = constraints.biggest.height;

//                             final scrollFactor = ((maxExtent - currentExtent) /
//                                     (maxExtent - minExtent))
//                                 .clamp(0.0, 1.0);

//                             final bgColor = AppComponents.modalBgColorDefault;
//                             final gradientOpacity =
//                                 lerpDouble(1.0, 0.7, scrollFactor)!;

//                             return FlexibleSpaceBar(
//                               collapseMode: CollapseMode.parallax,
//                               background: RepaintBoundary(
//                                 child: Stack(
//                                   fit: StackFit.expand,
//                                   children: [
//                                     if (_isVideo)
//                                       Stack(
//                                         alignment: Alignment.center,
//                                         children: [
//                                           if (widget
//                                                   .item.image?[0].filePreview !=
//                                               null)
//                                             CachedNetworkImage(
//                                               key: const ValueKey('preview'),
//                                               height: maxExtent,
//                                               imageUrl: widget.item.image?[0]
//                                                       .filePreview ??
//                                                   '',
//                                               imageBuilder:
//                                                   (context, provider) =>
//                                                       Container(
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       const BorderRadius
//                                                           .vertical(
//                                                     bottom: Radius.circular(8),
//                                                   ),
//                                                   image: DecorationImage(
//                                                     image: provider,
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                               ),
//                                               placeholder: (_, __) => Container(
//                                                 decoration: const BoxDecoration(
//                                                   color: AppColors
//                                                       .primitiveNeutral0,
//                                                   borderRadius:
//                                                       BorderRadius.all(
//                                                           Radius.circular(8)),
//                                                 ),
//                                               ),
//                                             ),
//                                           if (_videoController
//                                                   ?.value.isInitialized ??
//                                               false)
//                                             Positioned.fill(
//                                               child: FittedBox(
//                                                 fit: BoxFit.cover,
//                                                 child: SizedBox(
//                                                   width: _videoController!
//                                                       .value.size.width,
//                                                   height: _videoController!
//                                                       .value.size.height,
//                                                   child: ClipRRect(
//                                                     borderRadius:
//                                                         const BorderRadius
//                                                             .vertical(
//                                                       bottom:
//                                                           Radius.circular(8),
//                                                     ),
//                                                     child: VideoPlayer(
//                                                         _videoController!),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                         ],
//                                       )
//                                     else if (widget.item.image?.isNotEmpty ??
//                                         false)
//                                       CachedNetworkImage(
//                                         height: maxExtent,
//                                         imageUrl: widget.item.image?[0].file ??
//                                             widget.item.image?[0].path ??
//                                             '',
//                                         progressIndicatorBuilder:
//                                             (_, __, ___) => Container(
//                                           decoration: const BoxDecoration(
//                                             color: AppColors.primitiveNeutral0,
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(8)),
//                                           ),
//                                         ),
//                                         imageBuilder: (_, provider) =>
//                                             Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 const BorderRadius.vertical(
//                                               bottom: Radius.circular(8),
//                                             ),
//                                             image: DecorationImage(
//                                               image: provider,
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     else
//                                       Image.asset(AppWebpImages.emptyStatus),
//                                     Positioned(
//                                       left: 0,
//                                       right: 0,
//                                       bottom: 0,
//                                       height: maxExtent / 3.6,
//                                       child: IgnorePointer(
//                                         child: AnimatedOpacity(
//                                           duration:
//                                               const Duration(milliseconds: 140),
//                                           curve: Curves.easeOut,
//                                           opacity: gradientOpacity,
//                                           child: DecoratedBox(
//                                             decoration: BoxDecoration(
//                                               gradient: LinearGradient(
//                                                 begin: Alignment.bottomCenter,
//                                                 end: Alignment.topCenter,
//                                                 colors: [
//                                                   bgColor,
//                                                   bgColor.withOpacity(0.0)
//                                                 ],
//                                                 stops: const [0.0, 1.0],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: GestureDetector(
//                                         behavior: HitTestBehavior.translucent,
//                                         onTap: () {
//                                           Vibration.vibrate();
//                                           context.router.pop(context);
//                                         },
//                                         child: Container(
//                                           height: 4.sh,
//                                           width: 4.sh,
//                                           margin: const EdgeInsets.only(
//                                               top: 60, right: 16),
//                                           padding: const EdgeInsets.all(8),
//                                           decoration: const BoxDecoration(
//                                             color:
//                                                 AppColors.primitiveNeutralwarm0,
//                                             shape: BoxShape.circle,
//                                           ),
//                                           child: SvgPicture.asset(
//                                             AppSvgImages.closeLarge,
//                                             color: AppComponents
//                                                 .buttongroupButtonWhiteIconColorDefault,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       SliverList(
//                         delegate: SliverChildListDelegate(
//                           [
//                             Padding(
//                               padding: AppPaddings.horizontal16,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   ProductInfoWidget(item: widget.item),
//                                   if (widget.item.modifiers?.isNotEmpty ==
//                                       true) ...[
//                                     ColumnSpacer(isTablet ? 5 : 2.4),
//                                     AdditionsWidget(
//                                       modifierData: widget.item.modifiers ?? [],
//                                       onChanged: _bumpModsTickSafe,
//                                       // onChanged: () {
//                                       //   // ✅ вместо setState() — тик только для цены
//                                       //   _modsTick.value++;
//                                       // },
//                                     ),
//                                     const ColumnSpacer(2.4),
//                                   ],
//                                 ],
//                               ),
//                             ),
//                             const ColumnSpacer(4),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   // ✅ только этот оверлей реагирует на isAtStart
//                   floatingActionButton: ValueListenableBuilder<bool>(
//                     valueListenable: _isAtStart,
//                     builder: (_, atStart, __) {
//                       if (!atStart) return const SizedBox.shrink();
//                       return Column(
//                         children: [
//                           const ColumnSpacer(9),
//                           Container(
//                             height: MediaQuery.of(context).size.width / 1.5,
//                             color: AppColors.none,
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
    final bgColor = AppComponents.modalBgColorDefault;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final cacheHeight =
        (MediaQuery.of(context).size.height * 0.6 * pixelRatio).round();

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
                  imageUrl: item.image?[0].filePreview ?? '',
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
          CachedNetworkImage(
            imageUrl: item.image?[0].file ?? item.image?[0].path ?? '',
            fit: BoxFit.cover,
            memCacheHeight: cacheHeight,
            progressIndicatorBuilder: (_, __, ___) => Container(
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

// class ProductPage extends StatefulWidget {
//   const ProductPage({
//     super.key,
//     required this.item,
//   });
//   final Items item;

//   @override
//   State<ProductPage> createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage> {
//   late VideoPlayerController? videoPlayerController =
//       VideoPlayerController.networkUrl(Uri.parse(''));
//   ScrollController scrollController = ScrollController();
//   double verticalDragOffset = 0.0;
//   double dragThreshold = 200.0;
//   bool isAtStart = true;
//   bool isShowTitle = false;

//   bool isVideo = false;

//   int count = 1;

//   @override
//   void initState() {
//     super.initState();
//     scrollController.addListener(_scrollListener);
//     context.read<QrMenuVm>().basketService.selectedModifiers = [];
//     initializeVideoPlayer();
//   }

//   void initializeVideoPlayer() {
//     if (widget.item.image != null && (widget.item.image?.isNotEmpty ?? false)) {
//       if (widget.item.image?.first.file?.contains('.mp4') ?? false) {
//         isVideo = true;
//         videoPlayerController = VideoPlayerController.networkUrl(
//             Uri.parse(widget.item.image?.first.file ?? ''))
//           ..initialize().then((_) {
//             videoPlayerController?.setVolume(0.0);
//             videoPlayerController?.setLooping(true);
//             videoPlayerController?.play();
//             setState(() {});
//           });
//       }
//     }
//   }

//   void _scrollListener() {
//     // Если прокрутка в самом начале
//     if (scrollController.offset <= 0 && !isAtStart) {
//       setState(() => isAtStart = true);
//     }
//     // Если прокрутка ушла от начала
//     else if (scrollController.offset > 0 && isAtStart) {
//       setState(() => isAtStart = false);
//     }

//     if (scrollController.offset < context.mediaQuery.size.width / 1.2 &&
//         isShowTitle) {
//       setState(() => isShowTitle = false);
//     }
//     // Если прокрутка ушла от начала
//     else if (scrollController.offset >= context.mediaQuery.size.width / 1.2 &&
//         !isShowTitle) {
//       setState(() => isShowTitle = true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = Provider.of<QrMenuVm>(context, listen: true);

//     final int basePrice = widget.item.price ?? 0;

// // сумма всех выбранных модификаторов (учитывает количество, т.к. items с дублями)
//     final int modifiersPrice =
//         viewModel.basketService.selectedModifiers.fold<int>(0, (sum, modifier) {
//       final modifierItemsPrice = modifier.items?.fold<int>(
//             0,
//             (itemsSum, item) => itemsSum + (item.price ?? 0),
//           ) ??
//           0;
//       return sum + modifierItemsPrice;
//     });

// // цена за одну позицию с модификаторами
//     final int pricePerOne = basePrice + modifiersPrice;

// // итоговая цена с учётом count
//     final int totalPrice = pricePerOne * count;

//     return KioskInteractionListener(
//       kioskService: viewModel.kioskService!,
//       child: InactivityWatcher(
//         isKioskMode: viewModel.isKioskMode,
//         inactivityDuration: viewModel.kioskService!.idleDuration,
//         decisionDuration: const Duration(seconds: 10),
//         onLeave: () => context.router.pop(),
//         child: GestureDetector(
//           onVerticalDragUpdate: (details) {
//             if (0 < details.delta.dy) {
//               setState(() => verticalDragOffset += details.delta.dy);
//             }
//           },
//           onVerticalDragEnd: (details) {
//             if (verticalDragOffset > dragThreshold) {
//               context.router.pop(context);
//             } else {
//               setState(() => verticalDragOffset = 0.0);
//             }
//           },
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
//             child: Scaffold(
//               backgroundColor: AppColors.none,
//               bottomNavigationBar: Container(
//                 decoration: BoxDecoration(
//                   color: AppComponents.buttondockBgColorDefault,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       spreadRadius: 0,
//                       blurRadius: 20,
//                       offset: const Offset(0, -2),
//                     ),
//                   ],
//                 ),
//                 padding: const EdgeInsets.all(16),
//                 child: SafeArea(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               widget.item.name ?? '',
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: AppTextStyles.bodyXl.copyWith(
//                                 fontSize: viewModel.isTablet ? 15.sp : null,
//                                 color: AppComponents
//                                     .blockBlocktitleHeadingColorDefault,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           Text(
//                             '${priceFormat(totalPrice.toString())} ₸',
//                             style: AppTextStyles.bodyXlStrong.copyWith(
//                               fontSize: viewModel.isTablet ? 15.sp : null,
//                               color: AppComponents
//                                   .blockBlocktitleHeadingColorDefault,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const ColumnSpacer(1.2),
//                       Row(
//                         children: [
//                           Container(
//                             width: viewModel.isTablet ? 150 : 107,
//                             height: 65,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(16),
//                               color: AppComponents
//                                   .buttongroupButtonGrayBgColorDefault,
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: GestureDetector(
//                                     onTap: () => count != 1
//                                         ? setState(() => count--)
//                                         : null,
//                                     child: Container(
//                                       color: AppColors.none,
//                                       child: Padding(
//                                         padding: AppPaddings.sym16x12,
//                                         child: SvgPicture.asset(
//                                           AppSvgImages.minus,
//                                           height:
//                                               viewModel.isTablet ? 24 : null,
//                                           color: AppComponents
//                                               .buttongroupButtonGrayIconColorDefault,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   count.toString(),
//                                   style: AppTextStyles.bodyLStrong.copyWith(
//                                     fontSize: viewModel.isTablet ? 16.sp : null,
//                                     color: AppComponents
//                                         .buttongroupButtonGrayIconColorDefault,
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: GestureDetector(
//                                     onTap: () => setState(() => count++),
//                                     child: Container(
//                                       color: AppColors.none,
//                                       child: Padding(
//                                         padding: AppPaddings.sym16x12,
//                                         child: SvgPicture.asset(
//                                           AppSvgImages.plus,
//                                           height:
//                                               viewModel.isTablet ? 18 : null,
//                                           color: AppComponents
//                                               .buttongroupButtonGrayIconColorDefault,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           RowSpacer(0.1.sh),
//                           Expanded(
//                             child: CupertinoButton(
//                               borderRadius: BorderRadius.circular(16),
//                               onPressed: widget.item.modifiers?.isEmpty ?? true
//                                   ? () => viewModel
//                                       .addToBasket(
//                                         context,
//                                         widget.item,
//                                         count,
//                                       )
//                                       .then((_) => context.router.pop())
//                                   : () async {
//                                       viewModel
//                                           .addComboBasket(
//                                         context,
//                                         widget.item,
//                                         count,
//                                       )
//                                           .then((val) {
//                                         if (val) {
//                                           context.router.pop();
//                                         }
//                                       });
//                                     },
//                               color: AppComponents
//                                   .buttongroupButtonPrimaryBgColorDefault,
//                               padding: const EdgeInsets.symmetric(vertical: 0),
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 16),
//                                 child: Text(
//                                   LocaleKeys.addToOrder.tr(),
//                                   style: AppTextStyles.bodyLStrong.copyWith(
//                                       fontSize:
//                                           viewModel.isTablet ? 15.sp : null,
//                                       color: AppComponents
//                                           .buttongroupButtonPrimaryTextColorDefault),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               body: ConstrainedBox(
//                 constraints:
//                     BoxConstraints(maxHeight: context.mediaQuery.size.height),
//                 child: AnimatedContainer(
//                   color: AppComponents.modalBgColorDefault,
//                   duration: const Duration(milliseconds: 300),
//                   curve: Curves.easeOut,
//                   transform:
//                       Matrix4.translationValues(0, verticalDragOffset, 0),
//                   child: Stack(
//                     fit: StackFit.expand,
//                     children: [
//                       CustomScrollView(
//                         controller: scrollController,
//                         slivers: [
//                           SliverAppBar(
//                             floating: false,
//                             pinned: true,
//                             stretch: true,
//                             toolbarHeight: 100,
//                             backgroundColor: AppComponents.modalBgColorDefault,
//                             shadowColor: AppColors.none,
//                             surfaceTintColor: AppColors.none,
//                             elevation: 0,
//                             scrolledUnderElevation: 0,
//                             // лёгкая тень только когда мы прокрутились
//                             bottom: PreferredSize(
//                               preferredSize: const Size.fromHeight(0),
//                               child: AnimatedContainer(
//                                 duration: const Duration(milliseconds: 160),
//                                 height: 1,
//                                 decoration: BoxDecoration(
//                                   boxShadow: isShowTitle
//                                       ? [
//                                           BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.04),
//                                             blurRadius: 16,
//                                             offset: const Offset(0, 6),
//                                           ),
//                                         ]
//                                       : [],
//                                 ),
//                               ),
//                             ),
//                             expandedHeight: 55.h,
//                             // context.mediaQuery.size.height * 0.4,
//                             leading: AnimatedOpacity(
//                               duration: const Duration(milliseconds: 500),
//                               opacity: isShowTitle ? 1 : 0,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 40),
//                                 child: InkWell(
//                                   radius: 100,
//                                   onTap: () => context.router.pop(),
//                                   child: const Icon(
//                                     CupertinoIcons.back,
//                                     size: 32,
//                                     color: AppColors.primitiveNeutralcold1000,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             centerTitle: true,
//                             title: IgnorePointer(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 40),
//                                 child: AnimatedOpacity(
//                                   duration: const Duration(milliseconds: 500),
//                                   opacity: isShowTitle ? 1 : 0,
//                                   child: RichText(
//                                     text: TextSpan(
//                                       children: [
//                                         TextSpan(
//                                           text: widget.item.name ?? '',
//                                           style:
//                                               AppTextStyles.headingH3.copyWith(
//                                             color: AppColors.semanticFgDefault,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             flexibleSpace: LayoutBuilder(
//                               builder: (context, constraints) {
//                                 double maxExtent =
//                                     context.mediaQuery.size.height * 0.6;
//                                 // Максимальная высота AppBar
//                                 double minExtent =
//                                     kToolbarHeight; // Минимальная высота AppBar
//                                 double currentExtent = constraints
//                                     .biggest.height; // Текущая высота AppBar

//                                 // Определяем прогресс сворачивания (от 0 до 1)
//                                 double scrollFactor =
//                                     ((maxExtent - currentExtent) /
//                                             (maxExtent - minExtent))
//                                         .clamp(0.0, 1.0);

//                                 // Адаптивное смещение градиента
//                                 // double topOffset = scrollFactor *
//                                 //     (maxExtent /
//                                 //         1.6); // Используем половину maxExtent

//                                 // Плавный, «дорогой» градиент, который не дергается
//                                 final bgColor =
//                                     AppComponents.modalBgColorDefault;

//                                 // немножко убираем силу градиента при полном коллапсе
//                                 final double gradientOpacity =
//                                     lerpDouble(1.0, 0.7, scrollFactor)!;

//                                 return FlexibleSpaceBar(
//                                   collapseMode: CollapseMode.parallax,
//                                   background: Stack(
//                                     fit: StackFit.expand,
//                                     children: [
//                                       isVideo
//                                           ? Stack(
//                                               alignment: Alignment.center,
//                                               children: <Widget>[
//                                                 if (widget.item.image?[0]
//                                                         .filePreview !=
//                                                     null)
//                                                   CachedNetworkImage(
//                                                     key: const ValueKey(
//                                                         'preview'),
//                                                     height: maxExtent,
//                                                     imageUrl: widget
//                                                             .item
//                                                             .image?[0]
//                                                             .filePreview ??
//                                                         '',
//                                                     imageBuilder: (context,
//                                                             placeholder) =>
//                                                         Container(
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             const BorderRadius
//                                                                 .vertical(
//                                                           bottom:
//                                                               Radius.circular(
//                                                                   8),
//                                                         ),
//                                                         image: DecorationImage(
//                                                           image: placeholder,
//                                                           fit: BoxFit.cover,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     placeholder:
//                                                         (context, url) =>
//                                                             Shimmer.fromColors(
//                                                       baseColor: AppComponents
//                                                           .shimmerBase,
//                                                       highlightColor:
//                                                           AppComponents
//                                                               .shimmerHighlight,
//                                                       child: Container(
//                                                         decoration:
//                                                             const BoxDecoration(
//                                                           color: AppColors
//                                                               .primitiveNeutral0,
//                                                           borderRadius:
//                                                               BorderRadius.all(
//                                                                   Radius
//                                                                       .circular(
//                                                                           8)),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),

//                                                 // Видео сверху, если оно есть
//                                                 if (isVideo &&
//                                                     (videoPlayerController
//                                                             ?.value
//                                                             .isInitialized ??
//                                                         false))
//                                                   Positioned.fill(
//                                                     child: Opacity(
//                                                       opacity: isVideo
//                                                           ? 1.0
//                                                           : 0.0, // Плавно меняем прозрачность
//                                                       child: FittedBox(
//                                                         fit: BoxFit.cover,
//                                                         child: SizedBox(
//                                                           width:
//                                                               videoPlayerController!
//                                                                   .value
//                                                                   .size
//                                                                   .width,
//                                                           height:
//                                                               videoPlayerController!
//                                                                   .value
//                                                                   .size
//                                                                   .height,
//                                                           child: ClipRRect(
//                                                             borderRadius:
//                                                                 const BorderRadius
//                                                                     .vertical(
//                                                               bottom: Radius
//                                                                   .circular(8),
//                                                             ),
//                                                             child: VideoPlayer(
//                                                                 videoPlayerController!),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                               ],
//                                             )
//                                           : widget.item.image?.isNotEmpty ??
//                                                   false
//                                               ? CachedNetworkImage(
//                                                   height: maxExtent,
//                                                   progressIndicatorBuilder:
//                                                       (context, url,
//                                                               progress) =>
//                                                           Shimmer.fromColors(
//                                                     baseColor: AppComponents
//                                                         .shimmerBase,
//                                                     highlightColor:
//                                                         AppComponents
//                                                             .shimmerHighlight,
//                                                     child: Container(
//                                                       decoration:
//                                                           const BoxDecoration(
//                                                         color: AppColors
//                                                             .primitiveNeutral0,
//                                                         borderRadius:
//                                                             BorderRadius.all(
//                                                                 Radius.circular(
//                                                                     8)),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   imageUrl: widget.item
//                                                           .image?[0].file ??
//                                                       widget.item.image?[0]
//                                                           .path ??
//                                                       '',
//                                                   imageBuilder:
//                                                       (context, placeholder) =>
//                                                           Container(
//                                                     decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           const BorderRadius
//                                                               .vertical(
//                                                               bottom: Radius
//                                                                   .circular(8)),
//                                                       image: DecorationImage(
//                                                         image: placeholder,
//                                                         fit: BoxFit.cover,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )
//                                               : Image.asset(
//                                                   AppWebpImages.emptyStatus),

//                                       // Градиент, который поднимается
//                                       Positioned(
//                                         left: 0,
//                                         right: 0,
//                                         bottom: 0,
//                                         // высота «тумана»
//                                         height: maxExtent / 3.6,
//                                         child: IgnorePointer(
//                                           child: AnimatedOpacity(
//                                             duration: const Duration(
//                                                 milliseconds: 140),
//                                             curve: Curves.easeOut,
//                                             opacity: gradientOpacity,
//                                             child: DecoratedBox(
//                                               decoration: BoxDecoration(
//                                                 gradient: LinearGradient(
//                                                   begin: Alignment.bottomCenter,
//                                                   end: Alignment.topCenter,
//                                                   colors: [
//                                                     bgColor,
//                                                     bgColor.withOpacity(0.0),
//                                                   ],
//                                                   stops: const [0.0, 1.0],
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),

//                                       // Кнопка закрытия
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: GestureDetector(
//                                           behavior: HitTestBehavior.translucent,
//                                           onTap: () {
//                                             Vibration.vibrate();
//                                             context.router.pop(context);
//                                           },
//                                           child: Container(
//                                             height: 4.sh,
//                                             width: 4.sh,
//                                             margin: const EdgeInsets.only(
//                                                 top: 60, right: 16),
//                                             padding: const EdgeInsets.all(8),
//                                             decoration: const BoxDecoration(
//                                               color: AppColors
//                                                   .primitiveNeutralwarm0,
//                                               shape: BoxShape.circle,
//                                             ),
//                                             child: SvgPicture.asset(
//                                               AppSvgImages.closeLarge,
//                                               color: AppComponents
//                                                   .buttongroupButtonWhiteIconColorDefault,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                           SliverList(
//                             delegate: SliverChildListDelegate(
//                               [
//                                 Padding(
//                                   padding: AppPaddings.horizontal16,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       ProductInfoWidget(item: widget.item),
//                                       widget.item.modifiers?.isNotEmpty == true
//                                           ? Column(
//                                               children: [
//                                                 ColumnSpacer(viewModel.isTablet
//                                                     ? 5
//                                                     : 2.4),
//                                                 AdditionsWidget(
//                                                   modifierData:
//                                                       widget.item.modifiers ??
//                                                           [],
//                                                   onChanged: () {
//                                                     WidgetsBinding.instance
//                                                         .addPostFrameCallback(
//                                                             (_) {
//                                                       if (!mounted) return;
//                                                       setState(() {});
//                                                     });
//                                                   },
//                                                 ),
//                                                 const ColumnSpacer(2.4),
//                                               ],
//                                             )
//                                           : const SizedBox(),
//                                     ],
//                                   ),
//                                 ),
//                                 const ColumnSpacer(4),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       isAtStart
//                           ? Column(
//                               children: [
//                                 const ColumnSpacer(9),
//                                 Container(
//                                   height: context.mediaQuery.size.width / 1.5,
//                                   color: AppColors.none,
//                                 ),
//                               ],
//                             )
//                           : const SizedBox.shrink(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
