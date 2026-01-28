import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InputField extends StatelessWidget {
  final String title;
  final String placeholder;
  final Function()? onTap;
  const InputField({
    super.key,
    required this.title,
    required this.placeholder,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style:
            AppTextStyles.bodyM.copyWith(color: AppColors.primitiveNeutral300),
      ),
      const ColumnSpacer(0.8),
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.primitiveNeutral10,
              borderRadius: BorderRadius.circular(12)),
          padding: AppPaddings.sym16x12,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(placeholder,
                style: AppTextStyles.bodyL
                    .copyWith(color: AppColors.primitiveNeutral300)),
            SvgPicture.asset(
              AppSvgImages.chevronForward,
              color: AppColors.primitiveNeutral300,
            )
          ]),
        ),
      ),
    ]);
  }
}
