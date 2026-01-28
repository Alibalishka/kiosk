import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/features/profile/widgets/powered_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/profile/widgets/enter_phone_bottom_sheet.dart';
import 'package:qr_pay_app/src/features/profile/widgets/privacy_policy.dart';
import 'package:qr_pay_app/src/features/profile/widgets/profile_button_widget.dart';
import 'package:flutter/material.dart';

class NotAutorizedProfileWidget extends StatelessWidget {
  const NotAutorizedProfileWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                //const SubscriptionWidget(),
                const ColumnSpacer(1.6),
                ProfileButton(
                  text: LocaleKeys.login.tr(),
                  onTap: () => showCustomSheet(
                    context,
                    child: const EnterPhoneBottomSheet(),
                  ),
                  imagePath: AppSvgImages.enter,
                ),
                const CustomDivider(horizontalPadding: 16),
                ProfileButton(
                  text: LocaleKeys.support.tr(),
                  onTap: () =>
                      context.router.push(const SupportProviderRoute()),
                  imagePath: AppSvgImages.earphones,
                ),
                const CustomDivider(horizontalPadding: 16),
                ProfileButton(
                  text: LocaleKeys.language.tr(),
                  onTap: () =>
                      context.router.push(const ChooseLanguagePageRoute()),
                  imagePath: AppSvgImages.language,
                ),
                const SeparatorContainer(),
                const PrivacyPolicy(),
                ProfileButton(
                  text: 'Киоск',
                  onTap: () async {
                    context.router.push(const KioskProviderRoute());
                  },
                  imagePath: AppSvgImages.iconKiosk,
                ),
                // SizedBox(
                //   height:
                //       MediaQuery.of(context).size.height * 0.18, // Регулируй значение
                // ),
                //const Spacer(),
                // const SeparatorContainer(),
                // Align(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         'Powered by',
                //         style: AppTextStyles.bodyM
                //             .copyWith(color: AppColors.semanticFgSoft),
                //       ),
                //       const RowSpacer(0.8),
                //       Image.asset(
                //         AppWebpImages.logo,
                //         width: 76,
                //         height: 16,
                //       )
                //     ],
                //   ),
                // ),
                // const ColumnSpacer(3.4),

                // Row(
                //   children: [
                //     Text(
                //       'Версия ${viewModel.version}',
                //       style: AppTextStyles.bodyM.copyWith(
                //           color: AppComponents.listitemSubtitleColorDefault),
                //     ),
                //   ],
                // ),
                // const ColumnSpacer(4),
              ],
            ),
          ),
          // ProfileButton(
          //   text: 'Киоск',
          //   onTap: () => context.router.push(const KioskProviderRoute()),
          //   imagePath: AppSvgImages.userPlus,
          // ),
          const SeparatorContainer(),
          const PoweredWidget(),
          const ColumnSpacer(2.4),
        ],
      );
}

class SeparatorContainer extends StatelessWidget {
  const SeparatorContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: AppComponents.buttongroupButtonGrayBgColorDisabled,
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(50),
        //   bottomLeft: Radius.circular(50),
        //   bottomRight: Radius.circular(20),
        // ),
      ),
      child: Column(
        children: [
          Container(
            height: 21,
            decoration: const BoxDecoration(
              color: AppComponents.navmenuNavmenuelementBgColorDefault,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
          ),
          const ColumnSpacer(0.8),
          Container(
            height: 21,
            decoration: const BoxDecoration(
              color: AppComponents.navmenuNavmenuelementBgColorDefault,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
