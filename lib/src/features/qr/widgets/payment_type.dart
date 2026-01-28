import 'package:easy_localization/easy_localization.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentType extends StatefulWidget {
  const PaymentType({super.key});

  @override
  State<PaymentType> createState() => _PaymentTypeState();
}

class _PaymentTypeState extends State<PaymentType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.vertical12,
      decoration: const BoxDecoration(
        color: AppColors.semanticBgSurface1,
        borderRadius: BorderRadius.all(
          Radius.circular(AppComponents.blockBorderradius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppPaddings.horizontal16,
            child: Text(
              LocaleKeys.paymentMethod.tr(),
              style: AppTextStyles.headingH4.copyWith(
                  color: AppComponents.blockBlocktitleHeadingColorDefault),
            ),
          ),
          const ColumnSpacer(1.6),
          Padding(
            padding: AppPaddings.horizontal16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppSvgImages.cash),
                const RowSpacer(0.8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Оплата',
                        style: AppTextStyles.bodyLStrong.copyWith(
                            color: AppComponents
                                .blockBlocktitleHeadingColorDefault),
                      ),
                      Text(
                        'Наличными',
                        style: AppTextStyles.bodyM.copyWith(
                            color: AppComponents.listitemSubtitleColorDefault),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  AppSvgImages.radiobuttonOn,
                ),
              ],
            ),
          ),
          const ColumnSpacer(1.6),
        ],
      ),
    );
  }
}
