import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/vibration.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/profile/widgets/profile_button_widget.dart';
import 'package:provider/provider.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileVm>(
      builder: (context, value, child) {
        return Column(
          children: [
            ProfileButton(
              text: LocaleKeys.about.tr(),
              onTap: () => context.router.push(const CompanyInfoRoute()),

              //     =>
              //     showCustomSheet(
              //   context,
              //   child: const CompanyInfo(),
              // ),
              imagePath: AppSvgImages.informationCircle,
            ),
            if (value.configuration?.data?.privacyPolicyFile != null)
              const CustomDivider(),
            if (value.configuration?.data?.privacyPolicyFile != null)
              ProfileButton(
                text: LocaleKeys.privacyPolicy.tr(),
                onTap: () {
                  Vibration.vibrate();
                  context.router.push(WebViewPageRoute(
                    url: value.configuration?.data?.privacyPolicyFile ?? '',
                    scrollY: 50,
                  ));
                },
                imagePath: AppSvgImages.documentText,
              ),
            if (value.configuration?.data?.termsOfServiceFile != null)
              const CustomDivider(horizontalPadding: 16),
            if (value.configuration?.data?.termsOfServiceFile != null)
              ProfileButton(
                text: LocaleKeys.sandyqPrimePublicAgreement.tr(),
                onTap: () {
                  Vibration.vibrate();
                  context.router.push(WebViewPageRoute(
                    url: value.configuration?.data?.termsOfServiceFile ?? '',
                    scrollY: 50,
                  ));
                },
                imagePath: AppSvgImages.documentText,
              ),
          ],
        );
      },
    );

    //  Container(
    //   padding: const EdgeInsets.symmetric(vertical: 16),
    //   decoration: const BoxDecoration(
    //     color: AppComponents.blockBgColorDefault,
    //     borderRadius:
    //         BorderRadius.all(Radius.circular(AppComponents.blockBorderradius)),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       InkWell(
    //         onTap: () => showCustomSheet(
    //           context,
    //           child: const CompanyInfo(),
    //         ),
    //         child: Padding(
    //           padding: AppPaddings.horizontal16,
    //           child: Row(
    //             children: [
    //               Expanded(
    //                 child: Text(
    //                   LocaleKeys.about.tr(),
    //                   style: AppTextStyles.bodyM.copyWith(
    //                     color:
    //                         AppComponents.functionbuttonPrimaryTextColorDefault,
    //                   ),
    //                 ),
    //               ),
    //               SvgPicture.asset(
    //                 AppSvgImages.chevronForward,
    //                 height: 16,
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //       const ColumnSpacer(1.7),
    //       Container(
    //         height: 1,
    //         color: AppComponents.functionbuttonPrimaryTextColorDefault
    //             .withOpacity(0.2),
    //       ),
    //       const ColumnSpacer(1.6),
    //       InkWell(
    //         onTap: () {
    //           Vibration.vibrate();
    //           LaunchInBrowserUtil.launchUrl(
    //               'https://minio.daladev.kz/tenant-sandyq/terms/Политика_конфиденциальности_Sandyq_prime.pdf');
    //         },
    //         child: Padding(
    //           padding: AppPaddings.horizontal16,
    //           child: Row(
    //             children: [
    //               Expanded(
    //                 child: Text(
    //                   LocaleKeys.privacyPolicy.tr(),
    //                   style: AppTextStyles.bodyM.copyWith(
    //                     color:
    //                         AppComponents.functionbuttonPrimaryTextColorDefault,
    //                   ),
    //                 ),
    //               ),
    //               SvgPicture.asset(
    //                 AppSvgImages.chevronForward,
    //                 height: 16,
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //       const ColumnSpacer(1.7),
    //       Container(
    //         height: 1,
    //         color: AppComponents.functionbuttonPrimaryTextColorDefault
    //             .withOpacity(0.2),
    //       ),
    //       const ColumnSpacer(1.7),
    //       InkWell(
    //         onTap: () {
    //           Vibration.vibrate();
    //           LaunchInBrowserUtil.launchUrl(
    //               'https://minio.daladev.kz/tenant-sandyq/terms/%D0%9F%D1%83%D0%B1%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D0%B8%CC%86%20%D0%B4%D0%BE%D0%B3%D0%BE%D0%B2%D0%BE%D1%80%20SANDYQ%20PRIME.pdf');
    //         },
    //         child: Padding(
    //           padding: AppPaddings.horizontal16,
    //           child: Row(
    //             children: [
    //               Expanded(
    //                 child: Text(
    //                   LocaleKeys.sandyqPrimePublicAgreement.tr(),
    //                   style: AppTextStyles.bodyM.copyWith(
    //                     color:
    //                         AppComponents.functionbuttonPrimaryTextColorDefault,
    //                   ),
    //                 ),
    //               ),
    //               SvgPicture.asset(
    //                 AppSvgImages.chevronForward,
    //                 height: 16,
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
