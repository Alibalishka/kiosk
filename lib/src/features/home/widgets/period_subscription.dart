import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/subscription_model.dart';

class PeriodSubscription extends StatelessWidget {
  const PeriodSubscription({
    super.key,
    required this.prices,
    required this.value,
    required this.groupValue,
    this.onChanged,
  });

  final Price? prices;
  final int value;
  final int groupValue;
  final Function(int?, int?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            bool selected = value != groupValue;
            if (selected) {
              onChanged!(value, prices?.activeMonth ?? 0);
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8),

            //  child: Container(
            //     decoration: BoxDecoration(
            //       gradient: value == groupValue
            //           ? const LinearGradient(
            //               colors: [
            //                 Color.fromRGBO(202, 160, 33, 1),
            //                 Color.fromRGBO(158, 30, 44, 1),
            //               ],
            //               begin: Alignment.topLeft,
            //               end: Alignment.bottomRight,
            //             )
            //           : null,
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 2,
                    color: value == groupValue
                        ? const Color.fromRGBO(202, 160, 95, 1)
                        : AppComponents.tileNotselectedBorderColorDefault,
                  )),
              child: Padding(
                padding: AppPaddings.sym16x28,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          prices?.activeMonthText ?? '',
                          style: AppTextStyles.bodyLStrong.copyWith(
                              color: AppComponents.tileTitleColorDefault),
                        ),
                        const ColumnSpacer(0.4),
                        Text(
                          '${priceFormat((prices?.price ?? 0).toString())} ₸',
                          style: AppTextStyles.headingH3.copyWith(
                              color: AppComponents.tileTitleColorDefault),
                        )
                      ],
                    ),
                    const Spacer(),
                    value == groupValue
                        ? SvgPicture.asset(AppSvgImages.radiobuttonOn)
                        : SvgPicture.asset(AppSvgImages.radiobuttonOff),
                  ],
                ),
              ),
            ),
            //),
          ),
        ),
        prices?.isGoodDeal ?? false
            ? Positioned(
                right: 12,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(202, 160, 33, 1),
                          Color.fromRGBO(158, 102, 25, 1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: AppPaddings.symmetric10x4,
                    child: Text(
                      LocaleKeys.greatOffer.tr(),
                      style: AppTextStyles.bodyM.copyWith(
                          color: AppComponents
                              .badgePrimaryWarningLabelColorDefault),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
