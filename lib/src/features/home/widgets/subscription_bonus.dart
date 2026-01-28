import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_content.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/ul_widget.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/vm/bonus_vm.dart';
import 'package:qr_pay_app/src/features/home/vm/home_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/animated_card.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/user_response.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';

class SubscriptionBonus extends StatelessWidget {
  const SubscriptionBonus({
    super.key,
    required this.subscription,
  });

  final SubscriptionData? subscription;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVm>(
      builder: (context, value, state) {
        return AnimatedCard(
          child: Material(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: GestureDetector(
              onTap: subscription?.isOrder ?? false
                  ? () => showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.warning(
                          textAlign: TextAlign.start,
                          message: 'Напиток сегодня получен',
                        ),
                        dismissType: DismissType.onSwipe,
                      )
                  : () => showCustomSheet(
                        context,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.semanticBgSurface1,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(12)),
                          ),
                          child: BottomSheetContent(
                            title: LocaleKeys.areYouAtTaryCoffee.tr(),
                            buttonText: LocaleKeys.scanQRcode.tr(),
                            icon: AppWebpImages.coffee,
                            subtitleCenter: false,
                            // subtitle: false,
                            content: Column(
                              children: [
                                LiWidget(
                                  data: LocaleKeys.taryCoffeeDescription1.tr(),
                                ),
                                LiWidget(
                                  data: LocaleKeys.taryCoffeeDescription2.tr(),
                                ),
                              ],
                            ),
                            onTap: () => context
                                .read<BonusVm>()
                                .loadMainData(
                                    idSubscription: subscription!.id!,
                                    dataCity: value.dataCity,
                                    currentCity: value.currentCity)
                                .then(
                                  (_) => context.router.push(
                                    QrProviderRoute(
                                      type: 'coffee',
                                      isSubscribed: context
                                                  .read<ProfileVm>()
                                                  .user
                                                  ?.data
                                                  ?.subscription ==
                                              null
                                          ? false
                                          : true,
                                    ),
                                  ),
                                ),
                          ),
                        ),
                      ),
              child: Padding(
                padding: AppPaddings.horizontal16,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(
                            stops: [0.1, 0.85],
                            colors: [
                              Color.fromRGBO(197, 120, 33, 1),
                              Color.fromRGBO(149, 11, 46, 1)
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 16, top: 18, bottom: 18, left: 90),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      subscription?.isOrder ?? false
                                          ? LocaleKeys.drinkReceived.tr()
                                          : LocaleKeys.drinkWaiting.tr(),
                                      style: AppTextStyles.bodyXlStrong
                                          .copyWith(
                                              color: AppComponents
                                                  .tileTitleColorDefault),
                                    ),
                                    const ColumnSpacer(0.6),
                                    Text(
                                      subscription?.isOrder ?? false
                                          ? LocaleKeys.comeBackTomorrow.tr()
                                          : LocaleKeys.getFreeDrink.tr(),
                                      style: AppTextStyles.bodyS.copyWith(
                                          color: AppComponents
                                              .tileTitleColorDefault),
                                    ),
                                  ],
                                ),
                              ),
                              subscription?.isOrder ?? false
                                  ? const SizedBox.shrink()
                                  : SvgPicture.asset(
                                      AppSvgImages.chevronForward),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 12,
                      bottom: 12,
                      child: Image.asset(
                        subscription?.isOrder ?? false
                            ? AppWebpImages.backgroundSquareCheck
                            : AppWebpImages.backgroundSquare,
                        height: 98,
                        width: 74,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
