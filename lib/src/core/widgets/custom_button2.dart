import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton2 extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final bool isButtonText;
  final Color textColor;
  final Color? backgroundColor;
  final bool hasIcon;
  final String? icon;
  final bool hasBorder;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final double? fontSize;

  const CustomButton2({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderColor = AppComponents.buttongroupButtonGrayTextColorDefault,
    this.borderRadius = 8,
    this.borderWidth = 1,
    this.isButtonText = false,
    this.hasIcon = false,
    this.icon,
    this.textColor = AppComponents.buttongroupButtonGrayTextColorDefault,
    this.backgroundColor,
    this.hasBorder = true,
    this.disabledColor,
    this.disabledTextColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    bool isDisabled = onPressed == null;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: disabledColor ??
            AppComponents.buttongroupButtonPrimaryBgColorDisabled,
        backgroundColor: backgroundColor ??
            AppComponents.buttongroupButtonPrimaryBgColorDefault,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: hasBorder
            ? BorderSide(color: borderColor, width: borderWidth)
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: hasIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(icon ?? AppSvgImages.addCircle),
                  const RowSpacer(0.8),
                  Text(
                    text,
                    style: isButtonText
                        ? AppTextStyles.bodyLStrong.copyWith(
                            color: isDisabled
                                ? disabledTextColor ?? Colors.grey
                                : textColor)
                        : AppTextStyles.bodyL.copyWith(
                            color: isDisabled
                                ? disabledTextColor ?? Colors.grey
                                : textColor),
                  ),
                ],
              )
            : Text(
                text,
                style: isButtonText
                    ? AppTextStyles.bodyLStrong.copyWith(
                        fontSize: fontSize,
                        color: isDisabled
                            ? disabledTextColor ?? Colors.grey
                            : textColor)
                    : AppTextStyles.bodyL.copyWith(
                        fontSize: fontSize,
                        color: isDisabled
                            ? disabledTextColor ?? Colors.grey
                            : textColor),
              ),
      ),
    );
  }
}
