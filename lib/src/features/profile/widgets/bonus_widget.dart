import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/widgets/animated_card.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';

class BonusWidget extends StatelessWidget {
  const BonusWidget({
    super.key,
    required this.viewModel,
  });
  final ProfileVm viewModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileVm>(
      builder: (context, value, state) {
        return Row(
          children: [
            Expanded(
              child: AnimatedCard(
                child: Material(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: GestureDetector(
                    onTap: () => context.router
                        .push(BonusPageRoute(viewModel: viewModel)),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 146,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 130,
                              decoration: BoxDecoration(
                                color: AppColors.semanticBgSurface2,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 0, bottom: 16),
                                margin: const EdgeInsets.all(1.5),
                                decoration: BoxDecoration(
                                  color: AppColors.semanticBgSurface2,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const ColumnSpacer(4.1),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              priceFormat(value.user?.data
                                                      ?.balance?.bonus
                                                      .toString() ??
                                                  '0'),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: AppTextStyles.headingH1
                                                  .copyWith(
                                                      color: AppComponents
                                                          .navmenuNavmenuelementLabelColorDefault),
                                            ),
                                            const ColumnSpacer(0.6),
                                            Text(
                                              LocaleKeys.bonusesUpper.tr(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: AppTextStyles.bodyM.copyWith(
                                                  color: AppComponents
                                                      .navmenuNavmenuelementLabelColorDefault),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: SvgPicture.asset(
                                          AppSvgImages.chevronForward),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8,
                          top: -7,
                          child: Image.asset(
                            AppWebpImages.backgroundSquare2,
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const RowSpacer(1.2),
            Expanded(
              child: AnimatedCard(
                child: Material(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: GestureDetector(
                    onTap:
                        // viewModel.user?.data?.subscription == null
                        //     ?
                        () => context.router
                            .push(const SubscriptionProviderRoute()),
                    //         .then((val) {
                    //   if (val != null) {
                    //     // value.fetchUser();
                    //     // showCustomSheet(
                    //     //   context,
                    //     //   child: Container(
                    //     //     decoration: const BoxDecoration(
                    //     //         color: AppColors.semanticBgSurface1,
                    //     //         borderRadius: BorderRadius.vertical(
                    //     //             top: Radius.circular(12))),
                    //     //     child: BottomSheetContent(
                    //     //       title: LocaleKeys.paymentSuccessful.tr(),
                    //     //       text: LocaleKeys.successSubscriptionPay.tr(),
                    //     //       buttonText: LocaleKeys.close.tr(),
                    //     //       icon: AppWebpImages.backgroundSquare,
                    //     //     ),
                    //     //   ),
                    //     // );
                    //   }
                    // }).then((_) => viewModel.user?.data?.subscription == null
                    //             ? context.read<ProfileVm>().fetchUser()
                    //             : null),
                    // : () => context.router
                    //     .push(const SubscriptionInfoPageRoute()),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 146,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 130,
                              decoration: BoxDecoration(
                                gradient:
                                    viewModel.user?.data?.subscription == null
                                        ? const LinearGradient(
                                            colors: [
                                              Color.fromRGBO(198, 122, 33, 1),
                                              Color.fromRGBO(158, 30, 44, 1),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          )
                                        : null,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 0, bottom: 16),
                                margin: const EdgeInsets.all(1.5),
                                decoration: BoxDecoration(
                                  color: AppColors.semanticBgSurface2,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const ColumnSpacer(5.6),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${LocaleKeys.subscription.tr()} ${viewModel.subscription?.data?.name ?? ''}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyles.headingH4
                                                  .copyWith(
                                                      color: AppComponents
                                                          .navmenuNavmenuelementLabelColorDefault),
                                            ),
                                            const ColumnSpacer(0.6),
                                            Text(
                                              viewModel.user?.data
                                                          ?.subscription ==
                                                      null
                                                  ? LocaleKeys.arrange.tr()
                                                  : LocaleKeys.issued.tr(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyles.bodyM.copyWith(
                                                  color: AppComponents
                                                      .navmenuNavmenuelementLabelColorDefault),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: SvgPicture.asset(
                                          AppSvgImages.chevronForward),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8,
                          top: -7,
                          child: Image.asset(
                            AppWebpImages.delete4,
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
