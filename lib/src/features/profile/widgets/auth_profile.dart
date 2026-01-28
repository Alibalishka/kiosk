import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/features/profile/widgets/powered_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_content.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/profile/widgets/not_auth_profile.dart';
import 'package:qr_pay_app/src/features/profile/widgets/privacy_policy.dart';
import 'package:qr_pay_app/src/features/profile/widgets/profile_button_widget.dart';
import 'package:flutter/material.dart';

class AuthorizedProfileWidget extends StatelessWidget {
  const AuthorizedProfileWidget({
    super.key,
    required this.viewModel,
  });
  final ProfileVm viewModel;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      edgeOffset: 25,
      onRefresh: () => viewModel.fetchUser(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () =>
                  context.router.push(BonusPageRoute(viewModel: viewModel)),
              child: Container(
                color: AppColors.none,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        LocaleKeys.balance.tr(),
                        style: AppTextStyles.bodyM.copyWith(
                            color: AppComponents.tileSubtitleColorDefault),
                      ),
                      const ColumnSpacer(0.4),
                      SizedBox(
                        height: 32,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(AppSvgImages.point),
                            const RowSpacer(0.8),
                            Text(
                              priceFormat(viewModel.user?.data?.balance?.bonus
                                      .toString() ??
                                  '0'),
                              style: AppTextStyles.headingH1,
                            ),
                            const RowSpacer(0.8),
                            Text(
                              LocaleKeys.bonuses.tr(),
                              style: AppTextStyles.bodyLStrong,
                            ),
                            const Spacer(),
                            SvgPicture.asset(AppSvgImages.chevronForward),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // CustomButton(
            //   text: LocaleKeys.leaveFeedback.tr(),
            //   onPressed: () => context.router.push(
            //     ReviewProviderRoute(
            //       id: 1,
            //       showModal: false,
            //     ),
            //   ),
            // ),
            const SeparatorContainer(),
            Column(
              children: [
                ProfileButton(
                  text: LocaleKeys.myDetails.tr(),
                  onTap: () => context.router.push(const MyDetailsPageRoute()),
                  imagePath: AppSvgImages.user,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                ),
                const CustomDivider(horizontalPadding: 16),
                ProfileButton(
                  text: LocaleKeys.orderHistory.tr(),
                  onTap: () =>
                      context.router.push(const OrderHistoryPageRoute()),
                  imagePath: AppSvgImages.history,
                ),
                const CustomDivider(horizontalPadding: 16),
                ProfileButton(
                  text: LocaleKeys.paymentMethods.tr(),
                  onTap: () =>
                      context.router.push(const BankCardProviderRoute()),
                  imagePath: AppSvgImages.wallet,
                ),
                // const ColumnSpacer(0.8),
                // ProfileButton(
                //   text: LocaleKeys.referralProgram.tr(),
                //   onTap: () => context.router.push(
                //     ReferralProgramRoute(
                //       userId: viewModel.user?.data?.id ?? 0,
                //       promocode: viewModel.user?.data?.refCode ?? '',
                //     ),
                //   ),
                //   imagePath: AppSvgImages.userPlus,
                // ),
                const CustomDivider(horizontalPadding: 16),
                ProfileButton(
                  text: LocaleKeys.notifications.tr(),
                  onTap: () =>
                      context.router.push(const MyNotificationsPageRoute()),
                  count: viewModel.countUnreadNotif == 0
                      ? null
                      : viewModel.countUnreadNotif.toString(),
                  imagePath: AppSvgImages.notifications,
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
                const CustomDivider(horizontalPadding: 16),
                ProfileButton(
                  text: LocaleKeys.logOut.tr(),
                  imagePath: AppSvgImages.exit,
                  onTap: () => showCustomSheet(
                    context,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: AppColors.semanticBgSurface1,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12))),
                      child: BottomSheetContentExit(
                        viewModel: viewModel,
                        text: '',
                        title: LocaleKeys.exitAccount.tr(),
                        buttonText1: LocaleKeys.logOut.tr(),
                        buttonText2: LocaleKeys.cancel.tr(),
                        subtitle: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SeparatorContainer(),
            const PrivacyPolicy(),
            const ColumnSpacer(1.2),
            // if (viewModel.user?.data?.email == 'kiosk@gmail.com')
            ProfileButton(
              text: 'Киоск',
              onTap: () => context.router.push(const KioskProviderRoute()),
              imagePath: AppSvgImages.iconKiosk,
            ),
            const SeparatorContainer(),
            const PoweredWidget(),
            const ColumnSpacer(2.4),
          ],
        ),
      ),
    );
  }
}
