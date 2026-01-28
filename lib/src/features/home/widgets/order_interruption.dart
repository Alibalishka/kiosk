import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_button2.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

class FlowInterruption extends StatelessWidget {
  const FlowInterruption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: AppColors.semanticBgSurface1,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
        child: Padding(
          padding: AppPaddings.horizontal16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ColumnSpacer(0.8),
              const CustomBar(),
              // BottomSheetAppBar(
              //   title:
              //       LocaleKeys.paymentMethod.tr(),
              //   svg: AppSvgImages.iconLeft,
              // ),
              const ColumnSpacer(2),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     GestureDetector(
              //       onTap: () => context.router.pop(),
              //       child: SvgPicture.asset(
              //         AppSvgImages.chevronBack,
              //         // color: AppComponents
              //         //     .modalBgColorDefault,
              //       ),
              //     ),
              //   ],
              // ),
              // const ColumnSpacer(2.8),
              // Image.asset(
              //   AppWebpImages.flowInterruption,
              //   height: 128,
              // ),
              // const ColumnSpacer(1.6),
              Text(
                ' ${LocaleKeys.logOut.tr()} ?',
                textAlign: TextAlign.center,
                style: AppTextStyles.headingH2.copyWith(
                    color: AppComponents
                        .modalModalcontentTextcontentTitleColorDefault),
              ),
              const ColumnSpacer(0.8),
              Text(
                LocaleKeys.dishesWillRemoved.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyL.copyWith(
                    color: AppComponents
                        .modalModalcontentTextcontentSubtitleColorDefault),
              ),
              const ColumnSpacer(1.6),
              CustomButton(
                  text: LocaleKeys.logOut.tr(),
                  onPressed: () {
                    context.router.pop();

                    Future.delayed(
                      Duration.zero,
                      () => context.router.pop(),
                    );
                  }),
              const ColumnSpacer(1.2),
              CustomButton2(
                  text: LocaleKeys.stay.tr(),
                  backgroundColor: Colors.transparent,
                  borderRadius: 12,
                  borderColor: AppComponents
                      .buttongroupButtonSecondaryBorderColorDefault,
                  onPressed: () {
                    context.router.pop();
                  }),

              const ColumnSpacer(3.2),
            ],
          ),
        ));
  }
}
