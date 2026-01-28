import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_appbar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/list_item1.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/features/home/vm/home_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/subscription_payment.dart';
import 'package:qr_pay_app/src/features/profile/vm/subscription_vm.dart';

class ChoosePaymentSubscription extends StatelessWidget {
  const ChoosePaymentSubscription({super.key, required this.viewModel});
  final SubscriptionVm viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: AppColors.semanticBgSurface1,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BottomSheetAppBar(
              title: LocaleKeys.paymentMethod.tr(),
              svg: AppSvgImages.iconLeft,
            ),
            const ColumnSpacer(2.8),
            ListView.separated(
              padding: AppPaddings.empty,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    viewModel.swaithCart(viewModel.dataCarts[index]);
                    context.router.pop().then((_) => showCustomSheet(context,
                        child: SubscriptionPayment(viewModel: viewModel)));
                  },
                  child: ListItem1(
                    title: viewModel.dataCarts[index].number ?? '',
                    leftIcon: AppSvgImages.logoVisa,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Padding(
                padding: AppPaddings.horizontal16,
                child: const CustomDivider(),
              ),
              itemCount: viewModel.dataCarts.length,
            ),
            viewModel.dataCarts.isEmpty
                ? const SizedBox.shrink()
                : Padding(
                    padding: AppPaddings.horizontal16,
                    child: const CustomDivider(),
                  ),
            // ListItem1(
            //   title: Platform.isIOS ? 'Apple Pay' : 'Google Pay',
            //   leftIcon: Platform.isIOS
            //       ? AppWebpImages.logoApple
            //       : AppWebpImages.logoGooglePay,
            //   onTap: () {
            //     viewModel.currentCredit = CardsDatum();
            //     context.read<HomeVm>().isApplePay = true;
            //     context.router.pop().then((_) => showCustomSheet(context,
            //         child: SubscriptionPayment(viewModel: viewModel)));
            //   },
            // ),
            // Padding(
            //   padding: AppPaddings.horizontal16,
            //   child: const CustomDivider(),
            // ),
            Padding(
              padding: AppPaddings.all,
              child: GestureDetector(
                onTap: () {
                  context.read<HomeVm>().isApplePay = false;
                  LaunchInBrowserUtil.launchUrl(
                          viewModel.addCardData?.data?.url ?? '')
                      .then((_) => context.router.pop());
                },
                // context.router.pop(context).then(
                //       (_) => showCustomSheet(
                //         context,
                //         child: PaymentMethods(
                //             paymentMethod: viewModel.paymentMethod),
                //       ),
                //     ),
                child: Container(
                  color: AppColors.none,
                  child: Row(
                    children: [
                      SvgPicture.asset(AppSvgImages.addCircle),
                      const RowSpacer(1.2),
                      Text(
                        LocaleKeys.addCards.tr(),
                        style: AppTextStyles.bodyLStrong.copyWith(
                            color: AppComponents.listitemTitleColorDefault),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const ColumnSpacer(3.2),
          ],
        ));
  }
}
