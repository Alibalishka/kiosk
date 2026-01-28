import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/vibration.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_content.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/bonus_bloc/bonus_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/home_repository.dart';
import 'package:qr_pay_app/src/features/home/vm/bonus_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:shimmer/shimmer.dart';

class FreeItemSheet extends StatefulWidget {
  const FreeItemSheet({
    super.key,
    required this.items,
  });
  final Item? items;
  @override
  State<FreeItemSheet> createState() => _FreeItemSheetState();
}

class _FreeItemSheetState extends State<FreeItemSheet> {
  late BonusBloc bonusBloc;
  ScrollController scrollController = ScrollController();
  double verticalDragOffset = 0.0;
  double dragThreshold = 100.0;
  bool isAtStart = true;
  bool isShowTitle = false;

  @override
  void initState() {
    super.initState();
    bonusBloc = BonusBloc(homeRepository: sl<HomeRepository>());
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // Если прокрутка в самом начале
    if (scrollController.offset <= 0 && !isAtStart) {
      setState(() => isAtStart = true);
    }
    // Если прокрутка ушла от начала
    else if (scrollController.offset > 0 && isAtStart) {
      setState(() => isAtStart = false);
    }

    if (scrollController.offset < context.mediaQuery.size.width / 1.2 &&
        isShowTitle) {
      setState(() => isShowTitle = false);
    }
    // Если прокрутка ушла от начала
    else if (scrollController.offset >= context.mediaQuery.size.width / 1.2 &&
        !isShowTitle) {
      setState(() => isShowTitle = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (0 < details.delta.dy) {
          setState(() => verticalDragOffset += details.delta.dy);
        }
      },
      onVerticalDragEnd: (details) {
        if (verticalDragOffset > dragThreshold) {
          context.router.pop(context);
        } else {
          setState(() => verticalDragOffset = 0.0);
        }
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Scaffold(
          backgroundColor: AppColors.none,
          bottomNavigationBar: BlocConsumer<BonusBloc, BonusState>(
            bloc: bonusBloc,
            listener: (context, state) => state.maybeWhen(
              orElse: () => null,
              failed: (message) => showCustomSheet(
                context,
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.semanticBgSurface1,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12))),
                  child: BottomSheetContent(
                    title: LocaleKeys.coffeLimit.tr(),
                    text: message,
                    buttonText: LocaleKeys.close.tr(),
                    icon: AppWebpImages.modalClock,
                    onTap: () {},
                  ),
                ),
              ),
              successOrder: (response) => context.router.push(
                CheckoutProviderRoute(
                  checkoutModel: response,
                  organizationId: context.read<BonusVm>().bonusRequest.itemId,
                  isSubscription: true,
                ),
              ),
            ),
            builder: (context, state) => state.maybeWhen(
              loading: () => const CircleLoader(),
              orElse: () => Container(
                decoration: const BoxDecoration(
                    color: AppComponents.buttondockBgColorDefault),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: AppPaddings.all,
                      child: CustomButton(
                        text: LocaleKeys.order.tr(),
                        onPressed: () => bonusBloc.add(
                          BonusEvent.orderSubscription(
                            body: context.read<BonusVm>().bonusRequest,
                          ),
                        ),
                      ),
                    ),
                    const ColumnSpacer(0.4),
                  ],
                ),
              ),
            ),
          ),
          body: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: context.mediaQuery.size.height),
            child: AnimatedContainer(
              color: AppComponents.modalBgColorDefault,
              // color: AppColors.primitiveBlue100,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              transform: Matrix4.translationValues(0, verticalDragOffset, 0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverAppBar(
                        floating: false,
                        pinned: true,
                        toolbarHeight: 100,
                        backgroundColor: AppComponents.modalBgColorDefault,
                        shadowColor: AppColors.none,
                        surfaceTintColor: AppColors.none,
                        elevation: 0,
                        expandedHeight: context.mediaQuery.size.width,
                        leading: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: isShowTitle ? 1 : 0,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: InkWell(
                              radius: 100,
                              onTap: () => context.router.pop(),
                              child: const Icon(
                                CupertinoIcons.back,
                                size: 32,
                                color: AppColors.primitiveNeutralwarm0,
                                shadows: [
                                  Shadow(
                                    color: AppColors.primitiveNeutralwarm1000,
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        centerTitle: true,
                        title: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: isShowTitle ? 1 : 0,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.items?.name ?? '',
                                    style: AppTextStyles.headingH3.copyWith(
                                      color: AppColors.semanticFgDefault,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        flexibleSpace: LayoutBuilder(
                          builder: (context, constraints) {
                            double maxExtent = context.mediaQuery.size
                                .width; // Максимальная высота AppBar
                            double minExtent =
                                kToolbarHeight; // Минимальная высота AppBar
                            double currentExtent = constraints
                                .biggest.height; // Текущая высота AppBar

                            // Определяем прогресс сворачивания (от 0 до 1)
                            double scrollFactor = ((maxExtent - currentExtent) /
                                    (maxExtent - minExtent))
                                .clamp(0.0, 1.0);

                            // Адаптивное смещение градиента
                            double topOffset = scrollFactor *
                                (maxExtent /
                                    1.6); // Используем половину maxExtent

                            return FlexibleSpaceBar(
                              collapseMode: CollapseMode.parallax,
                              background: Stack(
                                fit: StackFit.expand,
                                children: [
                                  CachedNetworkImage(
                                    height: maxExtent,
                                    progressIndicatorBuilder:
                                        (context, url, progress) =>
                                            Shimmer.fromColors(
                                      baseColor: AppComponents.shimmerBase,
                                      highlightColor:
                                          AppComponents.shimmerHighlight,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: AppColors.primitiveNeutral0,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                      ),
                                    ),
                                    imageUrl:
                                        widget.items?.images?[0].path ?? '',
                                    imageBuilder: (context, placeholder) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        image: DecorationImage(
                                          image: placeholder,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Градиент, который поднимается
                                  Positioned.fill(
                                    child: AnimatedContainer(
                                      duration: Duration.zero,
                                      transform: Matrix4.translationValues(
                                          0, -topOffset, 0),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            AppComponents.modalBgColorDefault,
                                            AppComponents.modalBgColorDefault
                                                .withOpacity(0),
                                            AppColors.none,
                                          ],
                                          stops: const [0, 0.25, 1.0],
                                          tileMode: TileMode.repeated,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Кнопка закрытия
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        Vibration.vibrate();
                                        context.router.pop(context);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        margin: const EdgeInsets.only(
                                            top: 48, right: 16),
                                        padding: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(
                                          color:
                                              AppColors.primitiveNeutralwarm0,
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          AppSvgImages.closeLarge,
                                          color: AppComponents
                                              .buttongroupButtonWhiteIconColorDefault,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      // SliverAppBar(
                      //   floating: false,
                      //   pinned: true,
                      //   stretch: true,
                      //   toolbarHeight: 100,
                      //   backgroundColor: AppComponents.modalBgColorDefault,
                      //   shadowColor: AppColors.none,
                      //   surfaceTintColor: AppColors.none,
                      //   elevation: 0,
                      //   expandedHeight: context.mediaQuery.size.width,
                      //   leading: AnimatedOpacity(
                      //     duration: const Duration(milliseconds: 500),
                      //     opacity: isShowTitle ? 1 : 0,
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(top: 40),
                      //       child: InkWell(
                      //         radius: 100,
                      //         onTap: () => context.router.pop(),
                      //         child: const Icon(
                      //           CupertinoIcons.back,
                      //           size: 24,
                      //           color: AppColors.primitiveNeutralwarm0,
                      //           shadows: [
                      //             Shadow(
                      //               color: AppColors.primitiveNeutralwarm1000,
                      //               blurRadius: 5.0,
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      //   centerTitle: true,
                      //   title: Padding(
                      //     padding: const EdgeInsets.only(top: 40),
                      //     child: AnimatedOpacity(
                      //       duration: const Duration(milliseconds: 500),
                      //       opacity: isShowTitle ? 1 : 0,
                      //       child: RichText(
                      //         text: TextSpan(
                      //           children: [
                      //             TextSpan(
                      //               text: widget.items?.name ?? '',
                      //               style: AppTextStyles.headingH3.copyWith(
                      //                   color: AppColors.semanticFgDefault),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      //   flexibleSpace: LayoutBuilder(
                      //     builder: (context, constraints) {
                      //       double offset = scrollController.offset;
                      //       double maxOffset = context.mediaQuery.size.width;

                      //       // Адаптивное вычисление topOffset
                      //       double screenHeight = MediaQuery.of(context)
                      //           .size
                      //           .height; // Получаем высоту экрана
                      //       double dynamicHeightFactor = screenHeight /
                      //           580; // Коэффициент на основе высоты экрана (можно подстроить)

                      //       // Высчитываем адаптивное смещение
                      //       double topOffset = (offset / maxOffset) *
                      //           (200.0 * dynamicHeightFactor);

                      //       return FlexibleSpaceBar(
                      //         collapseMode: CollapseMode.parallax,
                      //         background: Stack(
                      //           fit: StackFit.expand,
                      //           children: [
                      //             CachedNetworkImage(
                      //               height: context.mediaQuery.size.width,
                      //               progressIndicatorBuilder:
                      //                   (context, url, progress) =>
                      //                       Shimmer.fromColors(
                      //                 baseColor: AppComponents.shimmerBase,
                      //                 highlightColor:
                      //                     AppComponents.shimmerHighlight,
                      //                 child: Container(
                      //                   decoration: const BoxDecoration(
                      //                     color: AppColors.primitiveNeutral0,
                      //                     borderRadius: BorderRadius.all(
                      //                         Radius.circular(8)),
                      //                   ),
                      //                 ),
                      //               ),
                      //               imageUrl:
                      //                   widget.items?.images?[0].path ?? '',
                      //               imageBuilder: (context, placeholder) =>
                      //                   Container(
                      //                 decoration: BoxDecoration(
                      //                   borderRadius: const BorderRadius.all(
                      //                       Radius.circular(8)),
                      //                   image: DecorationImage(
                      //                     image: placeholder,
                      //                     fit: BoxFit.cover,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),

                      //             // Градиент, который поднимается
                      //             Positioned.fill(
                      //               child: AnimatedContainer(
                      //                 duration: Duration.zero,
                      //                 transform: Matrix4.translationValues(
                      //                     0, -topOffset, 0),
                      //                 decoration: const BoxDecoration(
                      //                   gradient: LinearGradient(
                      //                     begin: Alignment.bottomCenter,
                      //                     end: Alignment.center,
                      //                     colors: [
                      //                       AppComponents.modalBgColorDefault,
                      //                       AppColors.none,
                      //                     ],
                      //                     stops: [0.0, 1.0],
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //             Align(
                      //               alignment: Alignment.topRight,
                      //               child: GestureDetector(
                      //                 behavior: HitTestBehavior.opaque,
                      //                 onTap: () {
                      //                   Vibration.vibrate();
                      //                   context.router.pop(context);
                      //                 },
                      //                 child: Container(
                      //                   height: 40,
                      //                   width: 40,
                      //                   margin: const EdgeInsets.only(
                      //                       top: 48, right: 16),
                      //                   padding: const EdgeInsets.all(8),
                      //                   decoration: const BoxDecoration(
                      //                     color:
                      //                         AppColors.primitiveNeutralwarm0,
                      //                     shape: BoxShape.circle,
                      //                   ),
                      //                   child: SvgPicture.asset(
                      //                     AppSvgImages.closeLarge,
                      //                     color: AppComponents
                      //                         .buttongroupButtonWhiteIconColorDefault,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),

                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: AppPaddings.horizontal16,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      // const ColumnSpacer(0.8),
                                      Text(
                                        widget.items?.name ?? '',
                                        style: AppTextStyles.headingH1.copyWith(
                                          color: AppComponents
                                              .listitemTitleColorDefault,
                                        ),
                                      ),
                                      const ColumnSpacer(0.8),
                                      Text(
                                        widget.items?.description ?? '',
                                        style: AppTextStyles.bodyL.copyWith(
                                            color: AppComponents
                                                .listitemBodytextColorDefault),
                                      ),
                                      const ColumnSpacer(1.6),
                                      MediaQuery.removePadding(
                                        context: context,
                                        removeBottom: true,
                                        child: ListView.separated(
                                          shrinkWrap: true,
                                          separatorBuilder: (context, index) =>
                                              const ColumnSpacer(1.6),
                                          itemCount:
                                              widget.items?.options?.length ??
                                                  0,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) =>
                                              OptionWidget(
                                                  option: widget
                                                      .items?.options?[index]),
                                        ),
                                      ),
                                      const ColumnSpacer(1.6),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  isAtStart
                      ? Column(
                          children: [
                            const ColumnSpacer(9),
                            Container(
                              height: context.mediaQuery.size.width / 1.5,
                              color: AppColors.none,
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OptionWidget extends StatefulWidget {
  const OptionWidget({
    super.key,
    required this.option,
  });
  final Option? option;

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  int groupValue = 0;

  @override
  void initState() {
    super.initState();
    context.read<BonusVm>().addOption(widget.option);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.option?.name ?? '',
          style: AppTextStyles.headingH3.copyWith(
              color: AppComponents.blockBlocktitleHeadingColorDefault),
        ),
        const ColumnSpacer(1.2),
        AlignedGridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.option?.products?.length ?? 0,
          itemBuilder: (context, index) => OptionProductWidget(
            product: widget.option?.products?[index],
            value: index,
            groupValue: groupValue,
            onChanged: (index, item) {
              setState(() => groupValue = index!);
              context
                  .read<BonusVm>()
                  .updateOptionProduct(widget.option?.id, item);
            },
          ),
        ),
      ],
    );
  }
}

class OptionProductWidget extends StatelessWidget {
  const OptionProductWidget({
    super.key,
    required this.product,
    required this.value,
    required this.groupValue,
    this.onChanged,
  });
  final Product? product;
  final int value;
  final int groupValue;
  final Function(int?, Product?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bool selected = value != groupValue;
        if (selected) {
          onChanged!(value, product);
        }
      },
      child: Container(
        height: 152,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: value == groupValue
              ? const LinearGradient(
                  stops: [0.1, 0.85],
                  colors: [
                    Color.fromRGBO(197, 120, 33, 1),
                    Color.fromRGBO(149, 11, 46, 1)
                  ],
                )
              : null,
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.semanticBgSurface1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                height: 72,
                imageUrl: product?.image ?? '',
                progressIndicatorBuilder: (context, url, progress) =>
                    Shimmer.fromColors(
                  baseColor: AppComponents.shimmerBase,
                  highlightColor: AppComponents.shimmerHighlight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primitiveNeutral0,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                fit: BoxFit.cover,
                imageBuilder: (context, placeholder) => Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                      image: placeholder,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const ColumnSpacer(0.2),
              Text(
                product?.name ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyM.copyWith(
                  color: AppComponents.listitemBodytextColorDefault,
                ),
              ),
              const ColumnSpacer(0.4),
              Text(
                '${product?.price == 0 ? '' : '+'} ${priceFormat(product?.price.toString() ?? '')} ₸',
                style: AppTextStyles.bodyM.copyWith(
                  color: AppColors.semanticBgSurface7,
                ),
              ),
            ],
          ),
        ),
      ),
      // Container(
      //   color: AppColors.none,
      //   child: Row(
      //     children: [
      //       Container(
      //         height: 28,
      //         width: 28,
      //         padding: const EdgeInsets.all(6),
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           border: Border.all(
      //             width: 2,
      //             color: AppComponents.radiobuttonBorderColorCheckedDefault,
      //           ),
      //         ),
      //         child: widget.value == widget.groupValue
      //             ? Container(
      //                 decoration: const BoxDecoration(
      //                   shape: BoxShape.circle,
      //                   color: AppComponents.radiobuttonIconColorCheckedDefault,
      //                 ),
      //               )
      //             : const SizedBox.shrink(),
      //       ),
      //       const RowSpacer(1.4),
      //       Expanded(
      //         child: Text(
      //           widget.product?.name ?? '',
      //           style: AppTextStyles.bodyL.copyWith(
      //             color: AppComponents.listitemBodytextColorDefault,
      //           ),
      //         ),
      //       ),
      //       Text(
      //         '+ data',
      //         style: AppTextStyles.bodyM.copyWith(
      //           color: AppComponents.listitemBodytextColorDefault,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
