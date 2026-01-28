import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class NotAutorizedView extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String buttonText;
  final Function()? onPressed;
  final bool button;
  final String image;
  const NotAutorizedView({
    super.key,
    required this.title,
    this.subtitle,
    required this.buttonText,
    required this.image,
    this.onPressed,
    this.button = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          image,
          height: 210,
        ),
        const ColumnSpacer(0.8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.headingH1
              .copyWith(color: AppColors.semanticFgDefault),
        ),
        const ColumnSpacer(0.8),
        Text(
          subtitle ?? '',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyL.copyWith(
              color: AppComponents.modalModalcontentSubtitleColorDefault),
        ),
        const ColumnSpacer(1.6),
        button
            ? Padding(
                padding: AppPaddings.horizontal12,
                child: CustomButton(
                  text: buttonText,
                  onPressed: onPressed,
                  buttonColor: AppColors.primitiveBrand500,
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
