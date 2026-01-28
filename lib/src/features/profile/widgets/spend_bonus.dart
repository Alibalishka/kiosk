import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

class SpendBonus extends StatelessWidget {
  const SpendBonus({
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
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ColumnSpacer(0.8),
                const CustomBar(),
                const ColumnSpacer(1.6),
                Text(
                  LocaleKeys.howToSpendBonuses.tr(),
                  textAlign: TextAlign.start,
                  style: AppTextStyles.headingH2
                      .copyWith(color: AppColors.semanticFgDefault),
                ),
                const ColumnSpacer(0.8),
                Text(
                  LocaleKeys.howToSpendBonusesDescription.tr(),
                  textAlign: TextAlign.start,
                  style: AppTextStyles.bodyL.copyWith(
                      color: AppComponents
                          .modalModalcontentTextcontentSubtitleColorDefault),
                ),
                const ColumnSpacer(1.6),
                CustomButton(
                    text: LocaleKeys.itsOkay.tr(),
                    onPressed: () {
                      context.router.pop();
                    }),
                const ColumnSpacer(1.6),
              ],
            ),
          ),
        ));
  }
}
