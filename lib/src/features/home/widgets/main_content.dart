import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/extensions/analytics.dart';
import 'package:qr_pay_app/src/core/logic/token_storage.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_button2.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/vm/detail_vm.dart';
import 'package:qr_pay_app/src/features/profile/widgets/enter_phone_bottom_sheet.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
    required this.item,
    required this.viewModel,
  });
  final DetailItemModel item;
  final DetailVm viewModel;

  @override
  Widget build(BuildContext context) => item.data?.menuLink == null &&
          !(item.data?.canReserve ?? false)
      ? const SizedBox.shrink()
      : Container(
          decoration: const BoxDecoration(
            color: AppComponents.blockBgColorDefault,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
          child: Padding(
            padding: AppPaddings.horizontal16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // const ColumnSpacer(1.6),
                // Text(
                //   item.data?.name ?? '',
                //   maxLines: 5,
                //   overflow: TextOverflow.ellipsis,
                //   style: AppTextStyles.headingH3
                //       .copyWith(color: AppColors.semanticFgDefault),
                // ),
                // const ColumnSpacer(0.4),
                // Text(
                //   item.data?.catalog?.name ?? '',
                //   style: AppTextStyles.bodyL.copyWith(
                //       color: AppComponents.blockBlocktitleTitleColorDefault),
                // ),
                item.data?.menuLink == null
                    ? const SizedBox.shrink()
                    : const ColumnSpacer(1.6),
                item.data?.hasMenu ?? false
                    ? CustomButton(
                        text: LocaleKeys.placeAnOrder.tr(),
                        onPressed: () {
                          AnalyticsService.openContentMenu(
                            id: item.data!.id!,
                            name: item.data?.name ?? 'null',
                          );

                          context.router.push(QrMenuProviderRoute(
                            detailVm: viewModel,
                            menuId: item.data!.id,
                          ));
                        },
                        hasIcon: true,
                        icon: AppSvgImages.restaurantWhite,
                      )
                    : item.data?.menuLink == null
                        ? const SizedBox.shrink()
                        : CustomButton(
                            text: LocaleKeys.placeAnOrder.tr(),
                            onPressed: () {
                              AnalyticsService.openContentMenu(
                                id: item.data!.id!,
                                name: item.data?.name ?? 'null',
                              );

                              item.data?.menuLink == null
                                  ? showTopSnackBar(
                                      Overlay.of(context),
                                      const CustomSnackBar.error(
                                          textAlign: TextAlign.start,
                                          message: 'К сожалению нету меню'),
                                      dismissType: DismissType.onSwipe,
                                    )
                                  : LaunchInBrowserUtil.launchUrl(
                                      item.data!.menuLink!);
                            },
                            hasIcon: true,
                            icon: AppSvgImages.restaurantWhite,
                          ),

                const ColumnSpacer(1.2),
                item.data?.canReserve ?? false
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CustomButton2(
                            text: LocaleKeys.bookTable.tr(),
                            isButtonText: true,
                            backgroundColor: AppColors.none,
                            icon: AppSvgImages.calendar2,
                            hasIcon: true,
                            onPressed: () {
                              if (sl<ITokenStorage>().getToken() == null) {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  isDismissible: true,
                                  useRootNavigator: true,
                                  backgroundColor:
                                      AppComponents.modalBgColorDefault,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(12))),
                                  builder: (context) =>
                                      const EnterPhoneBottomSheet(),
                                );
                              } else {
                                context.router.push(
                                  BookingProviderRoute(
                                    item: item,
                                    canReserve: item.data?.canReserve ?? false,
                                  ),
                                );
                              }
                            }),
                      )
                    : const SizedBox.shrink(),
                // CustomButton(
                //     text: 'QR Menu',
                //     onPressed: () {
                //       context.router.push(const EstablishmentDetailRoute());
                //     }),
              ],
            ),
          ),
        );
}
