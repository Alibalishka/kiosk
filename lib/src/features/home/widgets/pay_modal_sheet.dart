import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_appbar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/list_item1.dart';

class PayModalSheet extends StatelessWidget {
  const PayModalSheet({
    super.key,
  });

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
            title: LocaleKeys.selectPaymentMethod.tr(),
            isIcon: false,
            svg: AppSvgImages.addCircle,
          ),
          const ColumnSpacer(3.2),
          Column(
            children: [
              ListItem1(
                title: Platform.isIOS ? 'Apple Pay' : 'Google Pay',
                leftIcon: Platform.isIOS
                    ? AppWebpImages.logoApple
                    : AppWebpImages.logoGooglePay,
                hasRigftIcon: false,
                isOn: true,
              ),
              Padding(
                padding: AppPaddings.horizontal16,
                child: const CustomDivider(),
              ),
              ListItem1(
                title: LocaleKeys.addCards.tr(),
                leftIcon: AppSvgImages.addCircle,
                onTap: () {},
              ),
            ],
          ),
          Padding(
            padding: AppPaddings.all,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'К оплате',
                  style: AppTextStyles.headingH4
                      .copyWith(color: AppComponents.listitemTitleColorDefault),
                ),
                Text(
                  ' 10000 ₸',
                  style: AppTextStyles.bodyLStrong.copyWith(
                      color: AppComponents.listitemPricetextColorDefault),
                )
              ],
            ),
          ),
          const ColumnSpacer(2.4),
        ],
      ),
    );
  }
}
