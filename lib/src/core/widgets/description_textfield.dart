import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:flutter/cupertino.dart';

class DescriptionTextfield extends StatelessWidget {
  final String title;
  final String placeholder;
  const DescriptionTextfield({
    super.key,
    required this.controller,
    required this.title,
    required this.placeholder,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: AppTextStyles.bodyM
              .copyWith(color: AppComponents.inputPrimaryLabeltextColorDefault),
        ),
        const ColumnSpacer(0.8),
        CupertinoTextField(
          placeholder: placeholder,
          placeholderStyle: AppTextStyles.bodyL
              .copyWith(color: AppColors.primitiveNeutral300),
          controller: controller,
          maxLines: 6,
          cursorColor: AppColors.semanticFgDefault,
          style:
              AppTextStyles.bodyL.copyWith(color: AppColors.semanticFgDefault),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
            color: AppColors.primitiveNeutral10,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ],
    );
  }
}
