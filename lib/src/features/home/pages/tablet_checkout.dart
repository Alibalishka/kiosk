import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
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
import 'package:qr_pay_app/src/core/widgets/inactivity_watcher.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/pages/product_page.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/in_restaurant_content.dart';
import 'package:qr_pay_app/src/features/home/widgets/item_checkout.dart';
import 'package:qr_pay_app/src/features/kiosk/widgets/kiosk_Interaction_listener.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TabletCheckoutPage extends StatelessWidget {
  const TabletCheckoutPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vmQrMenu = context.read<QrMenuVm>();
    return KioskInteractionListener(
      kioskService: context.read<QrMenuVm>().kioskService,
      child: InactivityWatcher(
        isKioskMode: context.read<QrMenuVm>().isKioskMode,
        inactivityDuration: context.read<QrMenuVm>().kioskService.idleDuration,
        decisionDuration: const Duration(seconds: 10),
        onLeave: () {
          context.read<QrMenuVm>().clearBasket();
          context.router.pop();
        },
        child: Scaffold(
          appBar: CustomAppBar(
            text: LocaleKeys.yourOrder.tr(),
            height: 80,
            isTablet: true,
            hasLeading: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () => context.read<QrMenuVm>().clearBasket(),
                  child: SvgPicture.asset(
                    AppSvgImages.trash,
                    height: 3.sh,
                    color: AppColors.semanticErrorDefault,
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppComponents.buttondockBgColorDefault,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            padding: AppPaddings.all,
            child: SafeArea(
              child: Consumer<QrMenuVm>(
                builder: (context, value, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            LocaleKeys.total.tr(),
                            style: AppTextStyles.bodyLStrong.copyWith(
                              fontSize: vmQrMenu.isTablet ? 16.sp : null,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${value.basketService.basket.length} ${LocaleKeys.dish.tr()} ${priceFormat(value.getTotalPrice().toInt().toString())} ₸',
                            style: AppTextStyles.headingH3.copyWith(
                                fontSize: vmQrMenu.isTablet ? 16.sp : null,
                                color: AppComponents
                                    .blockBlocktitleHeadingColorDefault),
                          ),
                        ],
                      ),
                      const ColumnSpacer(1.2),
                      CupertinoButton(
                        borderRadius: BorderRadius.circular(16),
                        onPressed: () => value.nameController.text.isEmpty
                            ? _showNameInputDialog(context)
                            : context.read<QrMenuVm>().tabletCheckout(context),
                        color: const Color(0xffF24634),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                LocaleKeys.payWith.tr(),
                                style: AppTextStyles.bodyMStrong.copyWith(
                                    fontSize: vmQrMenu.isTablet ? 15.sp : null,
                                    color: AppComponents
                                        .buttongroupButtonPrimaryTextColorDefault),
                              ),
                              const RowSpacer(0.4),
                              SvgPicture.asset(
                                AppSvgImages.kaspiQr,
                                height: 2.5.sh,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          body: Consumer<QrMenuVm>(
            builder: (context, value, state) {
              final basket = value.basketService.basket;

              if (basket.isEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (context.mounted) context.router.pop();
                });
              }

              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),

                  // Основной список заказов
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Column(
                          children: [
                            ItemCheckout(
                              item: basket[index],
                              removeTap: () =>
                                  value.removeFromBasket(basket[index]),
                              addTap: () =>
                                  value.addToBasket(context, basket[index], 1),
                            ),
                            if (index != basket.length - 1)
                              Padding(
                                padding: AppPaddings.horizontal12,
                                child: const CustomDivider(),
                              ),
                          ],
                        );
                      },
                      childCount: basket.length,
                    ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 32)),

                  // Рекомендованные товары
                  if (value.getRecommended().isNotEmpty)
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: AppPaddings.horizontal12,
                            child: Text(
                              LocaleKeys.anythingElse.tr(),
                              style: AppTextStyles.headingH3.copyWith(
                                fontSize: vmQrMenu.isTablet ? 16.sp : null,
                                color: AppComponents
                                    .blockBlocktitleHeadingColorDefault,
                              ),
                            ),
                          ),
                          const ColumnSpacer(1.6),
                          SizedBox(
                            height: (Platform.isIOS
                                ? 50.1.sh
                                : context.screenSize.width > 600
                                    ? 44.5.sh
                                    : 51.sh),
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: AppPaddings.horizontal12,
                              scrollDirection: Axis.horizontal,
                              itemCount: value.getRecommended().length,
                              separatorBuilder: (_, __) => const RowSpacer(1.2),
                              itemBuilder: (context, index) {
                                final recommended =
                                    value.getRecommended()[index];
                                final count =
                                    value.getItemCount(recommended.id ?? 0);
                                final hasModifiers =
                                    recommended.modifiers?.isNotEmpty == true;

                                return ItemRecomended(
                                  item: recommended,
                                  bottom: count == 0
                                      ? GestureDetector(
                                          onTap: () => hasModifiers
                                              ? showCustomSheet(
                                                  context,
                                                  child: ProductPage(
                                                      item: recommended),
                                                )
                                              : value.addToBasket(
                                                  context, recommended, 1),
                                          child: Container(
                                            height:
                                                vmQrMenu.isTablet ? 4.sh : 40,
                                            padding: const EdgeInsets.symmetric(
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
                                                // Text(
                                                //   '${priceFormat(recommended.price.toString())} ₸',
                                                //   overflow:
                                                //       TextOverflow.ellipsis,
                                                //   maxLines: 1,
                                                //   style: AppTextStyles
                                                //       .bodyMStrong
                                                //       .copyWith(
                                                //     fontSize:
                                                //         vmQrMenu.isTablet
                                                //             ? 14.sp
                                                //             : null,
                                                //     color: AppComponents
                                                //         .productcardorderContentTextcontentProducttitleColorDefault,
                                                //   ),
                                                // ),
                                                // RowSpacer(0.1.w),
                                                SvgPicture.asset(
                                                  AppSvgImages.plus,
                                                  height: vmQrMenu.isTablet
                                                      ? 14.sp
                                                      : 16,
                                                  color: AppComponents
                                                      .buttongroupButtonGrayTextColorDefault,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: AppColors.semanticBgSurface3,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () =>
                                                      value.removeFromBasket(
                                                          recommended),
                                                  child: Container(
                                                    height: 40,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 12,
                                                        horizontal: 16),
                                                    color: AppColors.none,
                                                    child: SvgPicture.asset(
                                                      AppSvgImages.minus,
                                                      color: AppComponents
                                                          .buttongroupButtonGrayIconColorDefault,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                count.toString(),
                                                style: AppTextStyles.bodyLStrong
                                                    .copyWith(
                                                  color: AppComponents
                                                      .buttongroupButtonGrayIconColorDefault,
                                                ),
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () => hasModifiers
                                                      ? showCustomSheet(
                                                          context,
                                                          child: ProductPage(
                                                              item:
                                                                  recommended),
                                                        )
                                                      : value.addToBasket(
                                                          context,
                                                          recommended,
                                                          1),
                                                  child: Container(
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
                        ],
                      ),
                    ),
                ],
              );

              // return CustomScrollView(
              //   slivers: [
              //     const SliverToBoxAdapter(child: SizedBox(height: 16)),
              //     SliverList(
              //       delegate: SliverChildBuilderDelegate(
              //         (context, index) {
              //           return Column(
              //             children: [
              //               ItemCheckout(
              //                 item: basket[index],
              //                 removeTap: () =>
              //                     value.removeFromBasket(basket[index]),
              //                 addTap: () => value.addToBasket(basket[index], 1),
              //               ),
              //               if (index != basket.length - 1)
              //                 Padding(
              //                   padding: AppPaddings.horizontal12,
              //                   child: const CustomDivider(),
              //                 ),
              //             ],
              //           );
              //         },
              //         childCount: basket.length,
              //       ),
              //     ),
              //     const SliverToBoxAdapter(child: SizedBox(height: 32)),
              //   ],
              // );
            },
          ),
        ),
      ),
    );
  }

  void _showNameInputDialog(BuildContext context) {
    final viewModel = context.read<QrMenuVm>();
    final controller = viewModel.nameController;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.2),
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: FadeTransition(
            opacity: animation,
            child: Center(
              child: StatefulBuilder(
                builder: (context, setState) {
                  // Удаляем старые слушатели, если были
                  controller.removeListener(() {});
                  controller.addListener(() {
                    if (context.mounted) {
                      setState(() {});
                    }
                  });

                  return SizedBox(
                    width: context.mediaQuery.size.width / 1.4,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Stack(
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: IntrinsicHeight(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      LocaleKeys.enterYourName.tr(),
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.headingH3.copyWith(
                                        // fontSize:
                                        //     viewModel.isTablet ? 16.sp : null,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    const ColumnSpacer(2.4),
                                    CupertinoTextField(
                                      controller: controller,
                                      placeholder: LocaleKeys.yourName.tr(),
                                      autofocus: true,
                                      maxLength: 10,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[a-zA-Zа-яА-Я]')),
                                      ],
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 16),
                                      placeholderStyle:
                                          AppTextStyles.bodyM.copyWith(
                                        // fontSize: viewModel.isTablet
                                        //     ? 14.sp
                                        //     : 18,
                                        fontSize: 14.sp,
                                      ),
                                      style: AppTextStyles.bodyM.copyWith(
                                        // fontSize:
                                        // viewModel.isTablet ? 14.sp : 18,
                                        fontSize: 14.sp,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: CupertinoColors
                                            .quaternarySystemFill,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                    ),
                                    const ColumnSpacer(1.2),
                                    Text(
                                      LocaleKeys.nameRequired.tr(),
                                      style: AppTextStyles.bodyL.copyWith(
                                        // fontSize: viewModel.isTablet ? 13.sp : null,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                    const ColumnSpacer(1.2),
                                    CupertinoButton(
                                      color: controller.text.trim().isEmpty
                                          ? AppComponents
                                              .inputPrimaryBgColorDefault
                                          : AppComponents
                                              .buttongroupButtonPrimaryBgColorDefault,
                                      borderRadius: BorderRadius.circular(12),
                                      onPressed: controller.text.trim().isEmpty
                                          ? null
                                          : () {
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                              Navigator.of(context).pop();
                                              viewModel.tabletCheckout(context);
                                            },
                                      child: Text(
                                        'Сохранить',
                                        style: AppTextStyles.bodyM.copyWith(
                                          fontSize: 18,
                                          color:
                                              AppColors.primitiveNeutralcold0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: 16,
                            child: GestureDetector(
                              onTap: () {
                                viewModel.nameController.clear();
                                FocusManager.instance.primaryFocus?.unfocus();
                                context.router.pop();
                              },
                              child: const Icon(Icons.close, size: 32),
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
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
