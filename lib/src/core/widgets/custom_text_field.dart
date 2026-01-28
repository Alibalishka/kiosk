import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String placeholder;
  final TextEditingController controller;
  final bool hasBorderColor;
  final Color backgroundColor;
  final TextAlign textAlign;
  final bool isStyleParagraph1;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final bool autoFocus;
  final double? fontSize;

  const CustomTextField({
    super.key,
    required this.placeholder,
    required this.controller,
    this.hasBorderColor = true,
    this.backgroundColor = AppColors.semanticBgSurface1,
    this.textAlign = TextAlign.start,
    this.isStyleParagraph1 = false,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.readOnly = false,
    this.autoFocus = false,
    this.fontSize,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      autofocus: widget.autoFocus,
      readOnly: widget.readOnly,
      textAlign: widget.textAlign,
      controller: widget.controller,
      placeholder: widget.placeholder,
      keyboardType: widget.textInputType,
      cursorColor: AppComponents.inputPrimaryPlaceholdertextColorDefault,
      placeholderStyle: widget.isStyleParagraph1
          ? AppTextStyles.bodyL.copyWith(
              fontSize: widget.fontSize,
              color: AppComponents.inputPrimaryPlaceholdertextColorDefault)
          : AppTextStyles.bodyM.copyWith(
              fontSize: widget.fontSize,
              color: AppComponents.inputPrimaryPlaceholdertextColorDefault),
      style: widget.isStyleParagraph1
          ? AppTextStyles.bodyL.copyWith(
              fontSize: widget.fontSize, color: AppColors.semanticFgDefault)
          : AppTextStyles.bodyM.copyWith(
              fontSize: widget.fontSize, color: AppColors.semanticFgDefault),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: widget.hasBorderColor
              ? Border.all(
                  width: 1.5,
                  color: AppComponents.inputSecondaryBorderColorFocus,
                )
              : null),
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
    );
  }
}

class CustomTextField2 extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final bool hasBorderColor;
  final Color backgroundColor;
  final TextAlign textAlign;
  final TextInputType textInputType;
  final bool readOnly;
  final bool autoFocus;
  final bool isBorder;
  final Function(String)? onChanged;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final int minLines;
  final int maxLines;
  final bool isValid;

  const CustomTextField2({
    super.key,
    required this.placeholder,
    required this.controller,
    this.hasBorderColor = false,
    this.backgroundColor = AppColors.semanticBgSurface1,
    this.textAlign = TextAlign.start,
    this.textInputType = TextInputType.text,
    this.readOnly = false,
    this.autoFocus = false,
    this.onChanged,
    this.onTap,
    this.isBorder = true,
    this.inputFormatters,
    this.minLines = 1,
    this.maxLines = 2,
    this.isValid = true,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      onChanged: onChanged,
      onTap: onTap,
      textCapitalization: TextCapitalization.sentences,
      textAlign: textAlign,
      readOnly: readOnly,
      maxLines: maxLines,
      minLines: minLines,
      controller: controller,
      placeholder: placeholder,
      keyboardType: textInputType,
      autofocus: autoFocus,
      cursorColor: AppColors.semanticFgDefault,
      inputFormatters: inputFormatters,
      placeholderStyle: AppTextStyles.bodyL.copyWith(
          color: AppComponents.inputPrimaryPlaceholdertextColorDefault),
      style: AppTextStyles.bodyL
          .copyWith(color: AppComponents.inputPrimaryInputtextColorDefault),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: isBorder
            ? Border.all(
                color: hasBorderColor
                    ? AppComponents.inputPrimaryBorderColorError
                    : AppComponents.inputSecondaryBorderColorDefault)
            : null,
      ),
    );
  }
}
