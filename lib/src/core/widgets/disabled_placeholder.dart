import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DisabledPlaceholder extends StatelessWidget {
  final String title;
  final String placeholder;
  final bool chevron;
  const DisabledPlaceholder({
    super.key,
    required this.title,
    required this.placeholder,
    this.chevron = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyM
              .copyWith(color: AppComponents.inputPrimaryLabeltextColorDefault),
        ),
        const ColumnSpacer(0.8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1.5,
              color: AppComponents.inputSecondaryBorderColorDisabled,
            ),
          ),
          padding: AppPaddings.sym16x12,
          child: chevron
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      placeholder,
                      style: AppTextStyles.bodyL.copyWith(
                        color: AppComponents.inputPrimaryInputtextColorDisabled,
                      ),
                    ),
                    SvgPicture.asset(AppSvgImages.chevronForwardDisable)
                  ],
                )
              : Text(
                  placeholder,
                  style: AppTextStyles.bodyL.copyWith(
                    color: AppComponents.inputPrimaryInputtextColorDisabled,
                  ),
                ),
        ),
      ],
    );
  }
}
