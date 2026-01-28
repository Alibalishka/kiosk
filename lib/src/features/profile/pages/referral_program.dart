import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/extensions/analytics.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:share_plus/share_plus.dart';

class ReferralProgram extends StatefulWidget {
  const ReferralProgram({
    super.key,
    required this.promocode,
    required this.userId,
  });
  final String promocode;
  final int userId;
  @override
  State<ReferralProgram> createState() => _ReferralProgramState();
}

class _ReferralProgramState extends State<ReferralProgram> {
  TextEditingController promocodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.referralProgram.tr(),
        hasLeading: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ColumnSpacer(9),
                Image.asset(
                  AppWebpImages.handshake,
                  height: 210,
                ),
                const ColumnSpacer(0.8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    LocaleKeys.bonusesForFriend.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headingH1
                        .copyWith(color: AppColors.semanticFgDefault),
                  ),
                ),
                const ColumnSpacer(0.8),
                Padding(
                  padding: AppPaddings.horizontal12,
                  child: Text(
                    LocaleKeys.sendBonuses.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyL.copyWith(
                        color: AppComponents
                            .modalModalcontentSubtitleColorDefault),
                  ),
                ),
                const ColumnSpacer(1.6),
                Padding(
                  padding: AppPaddings.horizontal12,
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                        color: AppComponents.inputPrimaryBgColorDefault,
                        borderRadius: BorderRadius.circular(12)),
                    padding: AppPaddings.horizontal12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Text(
                          widget.promocode,
                          style: AppTextStyles.bodyL.copyWith(
                              color: AppComponents
                                  .inputPrimaryInputtextColorDefault),
                        ),
                        GestureDetector(
                            onTap: () {
                              Clipboard.setData(
                                  ClipboardData(text: widget.promocode));

                              showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.success(
                                  textAlign: TextAlign.start,
                                  message: LocaleKeys.promocodeCopied.tr(),
                                ),
                                dismissType: DismissType.onSwipe,
                              );
                            },
                            child: SvgPicture.asset(AppSvgImages.copy))
                      ],
                    ),
                  ),
                ),
                const ColumnSpacer(1.6),
                Padding(
                  padding: AppPaddings.horizontal12,
                  child: CustomButton(
                    text: LocaleKeys.sharePromoCode.tr(),
                    onPressed: () {
                      AnalyticsService.shareReferralCode(
                          id: widget.userId, code: widget.promocode);
                      final text =
                          'Получите 1 000 бонусов в ${context.read<ProfileVm>().configuration?.data?.organizationName}.\nСкачайте приложение ${context.read<ProfileVm>().configuration?.data?.organizationName}, при первой оплате через приложение введите промокод ${widget.promocode} и получите 1 000 бонусов после оплаты заказа!\nСкачать приложение по ссылке: ';
                      Share.share('$text https://chayla.go.qrpay.kz/');
                    },
                    buttonColor: AppColors.primitiveBrand500,
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 20),
          //   child: Align(
          //       alignment: Alignment.bottomCenter,
          //       child: Padding(
          //           padding: AppPaddings.all,
          //           child: Container(
          //             padding: AppPaddings.all,
          //             width: double.infinity,
          //             decoration: BoxDecoration(
          //                 color: AppComponents.tabbarBgColorDefault,
          //                 borderRadius: BorderRadius.circular(12)),
          //             child: Row(
          //               children: [
          //                 Expanded(
          //                   child: Text(
          //                     LocaleKeys.refProgramConditions.tr(),
          //                     style: AppTextStyles.bodyM.copyWith(
          //                       color: AppComponents
          //                           .functionbuttonPrimaryTextColorDefault,
          //                     ),
          //                     overflow: TextOverflow.ellipsis,
          //                   ),
          //                 ),
          //                 SvgPicture.asset(
          //                   AppSvgImages.chevronForward,
          //                   height: 16,
          //                   width: 16,
          //                   color: AppComponents
          //                       .functionbuttonPrimaryIconColorDefault,
          //                 )
          //               ],
          //             ),
          //           ))),
          // )
        ],
      ),
    );
  }
}
