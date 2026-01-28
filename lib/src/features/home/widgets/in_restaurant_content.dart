import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/safe_network_image.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/pages/product_page.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/item_checkout.dart';
import 'package:qr_pay_app/src/features/profile/widgets/not_auth_profile.dart';
import 'package:sizer/sizer.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class InRestaurantContent extends StatefulWidget {
  const InRestaurantContent({
    super.key,
  });

  @override
  State<InRestaurantContent> createState() => _InRestaurantContentState();
}

class _InRestaurantContentState extends State<InRestaurantContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QrMenuVm>(
      builder: (context, value, state) {
        value.basketService.basket.isEmpty ? context.router.pop() : null;
        return SingleChildScrollView(
          // controller: value.menuController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 16, bottom: 0),
                decoration: const BoxDecoration(
                    color: AppComponents.blockBgColorDefault,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(24))),
                child: ShakeWidget(
                  shake: value.qrError,
                  child: GestureDetector(
                    onTap: () => context.router
                        .push(
                          QrProviderRoute(
                            type: 'menu',
                            isSubscribed: false,
                          ),
                        )
                        .then((_) => value.checkOrganization()),
                    child: Container(
                      padding: AppPaddings.horizontal16,
                      decoration: BoxDecoration(
                        color: AppComponents.blockBgColorDefault,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SvgPicture.asset(
                              AppSvgImages.qrIcon,
                              color: AppColors.semanticFgDefault,
                            ),
                          ),
                          const RowSpacer(1.2),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.organizationId.isEmpty
                                      ? LocaleKeys.scanQR.tr()
                                      : value.menuData?.organization?.name ??
                                          value.detailVm?.data.data?.address ??
                                          '',
                                  style: AppTextStyles.headingH4.copyWith(
                                    color: AppComponents
                                        .listitemBodytextColorDefault,
                                  ),
                                ),
                                const ColumnSpacer(0.2),
                                if (value.qrError)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(
                                      LocaleKeys.requiredField.tr(),
                                      style: AppTextStyles.bodyS.copyWith(
                                          color: AppColors.primitiveRed500),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              AppSvgImages.chevronForward,
                              color: AppComponents.listitemIconleftColorDefault,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SeparatorContainer(),
              Container(
                padding: const EdgeInsets.only(top: 8),
                decoration: const BoxDecoration(
                    color: AppComponents.blockBgColorDefault,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: AppPaddings.horizontal16,
                      child: Text(
                        '${value.basketService.basket.length} ${LocaleKeys.dish.tr()} ${priceFormat(value.getTotalPrice().toInt().toString())} ₸',
                        style: AppTextStyles.headingH3.copyWith(
                            color: AppComponents
                                .blockBlocktitleHeadingColorDefault),
                      ),
                    ),
                    const ColumnSpacer(0.4),
                    MediaQuery.removePadding(
                      context: context,
                      removeBottom: true,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: value.basketService.basket.length,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) =>
                            Padding(
                          padding: AppPaddings.horizontal12,
                          child: const CustomDivider(),
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            ItemCheckout(
                          item: value.basketService.basket[index],
                          removeTap: () => value.removeFromBasket(
                              value.basketService.basket[index]),
                          addTap: () => value.addToBasket(
                            context,
                            value.basketService.basket[index],
                            1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const ColumnSpacer(0.8),
              value.getRecommended().isEmpty
                  ? const SizedBox.shrink()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: AppPaddings.horizontal12,
                          child: Text(
                            LocaleKeys.anythingElse.tr(),
                            style: AppTextStyles.headingH3.copyWith(
                                color: AppComponents
                                    .blockBlocktitleHeadingColorDefault),
                          ),
                        ),
                        const ColumnSpacer(1.6),
                        SizedBox(
                          height: 379,
                          child: Padding(
                            padding: AppPaddings.horizontal12,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  const RowSpacer(1.2),
                              itemCount: value.getRecommended().length,
                              itemBuilder: (context, index) {
                                return ItemRecomended(
                                  item: value.getRecommended()[index],
                                  bottom: value.getItemCount(value
                                                  .getRecommended()[index]
                                                  .id ??
                                              0) ==
                                          0
                                      ? GestureDetector(
                                          onTap: () => value
                                                      .getRecommended()[index]
                                                      .modifiers
                                                      ?.isEmpty ??
                                                  true
                                              ? value.addToBasket(
                                                  context,
                                                  value.getRecommended()[index],
                                                  1,
                                                )
                                              : showCustomSheet(
                                                  context,
                                                  child: ProductPage(
                                                      item: value
                                                              .getRecommended()[
                                                          index]),
                                                ),
                                          child: Container(
                                              height: 40,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: AppComponents
                                                    .buttongroupButtonGrayBgColorDefault,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${priceFormat(value.getRecommended()[index].price.toString())} ₸',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: AppTextStyles
                                                        .bodyMStrong
                                                        .copyWith(
                                                            color: AppComponents
                                                                .productcardorderContentTextcontentProducttitleColorDefault),
                                                  ),
                                                  const RowSpacer(0.8),
                                                  SvgPicture.asset(
                                                    AppSvgImages.plus,
                                                    height: 16,
                                                    color: AppComponents
                                                        .buttongroupButtonGrayTextColorDefault,
                                                  ),
                                                ],
                                              )),
                                        )
                                      : Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: AppColors.semanticBgSurface3,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () => value
                                                      .removeFromBasket(value
                                                              .getRecommended()[
                                                          index]),
                                                  child: Container(
                                                    height: 40,
                                                    color: AppColors.none,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 12,
                                                        horizontal: 16),
                                                    child: SvgPicture.asset(
                                                      AppSvgImages.minus,
                                                      color: AppComponents
                                                          .buttongroupButtonGrayIconColorDefault,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                value
                                                    .getItemCount(value
                                                            .getRecommended()[
                                                                index]
                                                            .id ??
                                                        0)
                                                    .toString(),
                                                style: AppTextStyles.bodyLStrong
                                                    .copyWith(
                                                  color: AppComponents
                                                      .buttongroupButtonGrayIconColorDefault,
                                                ),
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () => value
                                                              .getRecommended()[
                                                                  index]
                                                              .modifiers
                                                              ?.isEmpty ??
                                                          true
                                                      ? value.addToBasket(
                                                          context,
                                                          value.getRecommended()[
                                                              index],
                                                          1,
                                                        )
                                                      : showCustomSheet(
                                                          context,
                                                          child: ProductPage(
                                                              item: value
                                                                      .getRecommended()[
                                                                  index]),
                                                        ),
                                                  child: Container(
                                                    // width: 40,
                                                    height: 40,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 12),
                                                    color: AppColors.none,
                                                    child: SvgPicture.asset(
                                                      AppSvgImages.plus,
                                                      color: AppComponents
                                                          .buttongroupButtonGrayIconColorDefault,
                                                    ),
                                                  ),
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
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}

class ItemRecomended extends StatelessWidget {
  const ItemRecomended({
    super.key,
    required this.item,
    required this.bottom,
  });

  final Items? item;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<QrMenuVm>(context, listen: false);
    return GestureDetector(
      // onTap: () =>
      //  showCupertinoModalBottomSheet(
      //   expand: false,
      //   context: context,
      //   backgroundColor: Colors.transparent,
      //   builder: (context) => ProductPage(
      //     item: item!,
      //     // isSubscription: viewModel.isSubscription,
      //     // isMenuPage: true,
      //   ),
      // ),
      // onTap: () => showCupertinoDepthSheet(
      //   context,
      //   child: ProductPage(item: item!),
      //   onClose: () {
      //     viewModel.videoService.videoPlayerController?.play();
      //   },
      // ),

      onTap: () => showCustomSheet(
        context,
        child: ProductPage(item: item!),
        onClose: () {
          viewModel.videoService.videoPlayerController?.play();
        },
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: viewModel.isTablet ? 300 : 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ColumnSpacer(1.6),

              item?.image?.isEmpty ?? true
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        AppWebpImages.emptyStatus,
                        height: context.mediaQuery.size.width / 2.7,
                      ),
                    )
                  : SafeNetworkImage(
                      // width: 150,
                      height: context.isDesktop
                          ? 500 / 2.8
                          : context.mediaQuery.size.width / 2.7,
                      imageUrl: item?.image?.first.path ??
                          item?.image?.first.file ??
                          '',
                      imageBuilder: (context, placeholder) => Container(
                        height: context.isDesktop
                            ? 500 / 2.8
                            : context.mediaQuery.size.width / 2.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: placeholder,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

              const ColumnSpacer(0.8),
              Text('${priceFormat(item?.price.toString() ?? '0')} ₸',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyles.bodyXlStrong.copyWith(
                    fontSize: viewModel.isTablet ? 16.sp : null,
                  )
                  // .copyWith(color: AppColors.primitiveNeutralwarm0),
                  ),
              const ColumnSpacer(0.4),
              Container(
                alignment: Alignment.topLeft,
                child: Text(item?.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextStyles.bodyLStrong.copyWith(
                      fontSize: viewModel.isTablet ? 15.sp : null,
                    )
                    // .copyWith(color: AppColors.primitiveNeutralwarm0),
                    ),
              ),
              const ColumnSpacer(0.4),
              Text(item?.description ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppTextStyles.bodyS.copyWith(
                    fontSize: viewModel.isTablet ? 14.sp : null,
                    color: AppColors.semanticFgSofter,
                  )
                  // .copyWith(color: AppColors.primitiveNeutralwarm0),
                  ),
              const ColumnSpacer(0.6),
              const Spacer(),
              bottom ?? const SizedBox.shrink(),
              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     padding: AppPaddings.symmetric8x16,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       color: AppColors.semanticBgSurface3,
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         const SizedBox(width: 24),
              //         Text(
              //           '${priceFormat(item?.price.toString() ?? '0')} ₸ ',
              //           style: AppTextStyles.bodyMStrong.copyWith(
              //               color: AppComponents
              //                   .buttongroupButtonGrayTextColorDefault),
              //         ),
              //         SvgPicture.asset(AppSvgImages.plus,
              //             color: AppComponents
              //                 .buttongroupButtonGrayTextColorDefault)
              //       ],
              //     ),
              //   ),
              // ),
              const ColumnSpacer(0.8),
            ],
          ),
        ),
      ),
    );
  }
}
// class ItemRecomended extends StatelessWidget {
//   const ItemRecomended({
//     super.key,
//     required this.item,
//     required this.bottom,
//   });

//   final Items? item;
//   final Widget? bottom;

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = Provider.of<QrMenuVm>(context, listen: false);
//     return GestureDetector(
//       onTap: () => showCustomSheet(
//         context,
//         child: ProductPage(
//           item: item!,
//           // isSubscription: viewModel.isSubscription,
//           // isMenuPage: true,
//         ),
//       ),
//       child: Container(
//         width: viewModel.isTablet
//             ? context.mediaQuery.size.width / 3
//             : context.mediaQuery.size.width / 2.3,
//         decoration: BoxDecoration(
//           // color: AppColors.primitiveBlue100,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Container(
//           decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const ColumnSpacer(1.6),
//               item?.image?.isEmpty ?? true
//                   ? ClipRRect(
//                       borderRadius: BorderRadius.circular(16),
//                       child: Image.asset(
//                         AppWebpImages.placeholderMenu,
//                         height: viewModel.isTablet
//                             ? context.mediaQuery.size.width / 3
//                             : context.mediaQuery.size.width / 2.3,
//                       ),
//                     )
//                   : CachedNetworkImage(
//                       height: viewModel.isTablet
//                           ? context.mediaQuery.size.width / 3
//                           : context.mediaQuery.size.width / 2.3,
//                       color: AppColors.primitiveBlue100,
//                       imageUrl: item?.image?.first.path ??
//                           item?.image?.first.file ??
//                           '',
//                       imageBuilder: (context, placeholder) => Container(
//                         width: 200,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           image: DecorationImage(
//                             image: placeholder,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//               const ColumnSpacer(0.8),
//               Text(
//                 '${priceFormat(item?.price.toString() ?? '0')} ₸',
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 style: AppTextStyles.bodyXlStrong,
//               ),
//               const ColumnSpacer(0.4),
//               Container(
//                 alignment: Alignment.topLeft,
//                 child: Text(
//                   item?.name ?? '',
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 2,
//                   style: AppTextStyles.bodyLStrong,
//                 ),
//               ),
//               const ColumnSpacer(0.4),
//               Text(
//                 item?.description ?? '',
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//                 style: AppTextStyles.bodyM.copyWith(
//                     color: AppComponents
//                         .productcardorderContentTextcontentProductsubtitleColorDefault),
//               ),
//               // const ColumnSpacer(0.6),
//               const Spacer(),
//               bottom ?? const SizedBox.shrink(),
//               // GestureDetector(
//               //   onTap: () {},
//               //   child: Container(
//               //     padding: AppPaddings.symmetric8x16,
//               //     decoration: BoxDecoration(
//               //       borderRadius: BorderRadius.circular(12),
//               //       color: AppColors.semanticBgSurface3,
//               //     ),
//               //     child: Row(
//               //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //       children: [
//               //         const SizedBox(width: 24),
//               //         Text(
//               //           '${priceFormat(item?.price.toString() ?? '0')} ₸ ',
//               //           style: AppTextStyles.bodyMStrong.copyWith(
//               //               color: AppComponents
//               //                   .buttongroupButtonGrayTextColorDefault),
//               //         ),
//               //         SvgPicture.asset(AppSvgImages.plus,
//               //             color: AppComponents
//               //                 .buttongroupButtonGrayTextColorDefault)
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               const ColumnSpacer(0.8),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ShakeWidget extends StatefulWidget {
  final Widget child;
  final bool shake;

  const ShakeWidget({
    super.key,
    required this.child,
    required this.shake,
  });

  @override
  State<ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _offsetAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -10.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10.0, end: 10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10.0, end: -10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10.0, end: 10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10.0, end: 0.0), weight: 1),
    ]).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant ShakeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if (widget.shake && !oldWidget.shake) {
    //   _controller.forward(from: 0.0);
    // }
    if (widget.shake) {
      // Vibration.vibrate(preset: VibrationPreset.dramaticNotification);
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offsetAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_offsetAnimation.value, 0),
          child: widget.child,
        );
      },
    );
  }
}
