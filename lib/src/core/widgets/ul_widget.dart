import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';

class UlWidget extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final List<LiWidget> children;
  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  final double verticalSpacing;

  const UlWidget({
    super.key,
    this.text,
    this.textStyle,
    this.padding,
    this.contentPadding,
    this.verticalSpacing = 8.0,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (text != null)
            Text(
              text!,
              style: textStyle ??
                  const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          if (text != null)
            const SizedBox(
              height: 12,
            ),
          Padding(
            padding: contentPadding ??
                const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children
                  .expand((element) => [
                        element,
                        SizedBox(
                          height: verticalSpacing,
                        ),
                      ])
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class LiWidget extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final double dotSize;
  final Color? dotColor;

  const LiWidget({
    super.key,
    required this.data,
    this.style,
    this.dotColor,
    this.dotSize = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Icon(
            Icons.circle,
            size: dotSize,
            color: dotColor ?? AppColors.primitiveNeutral300,
          ),
        ),
        const RowSpacer(0.6),
        Expanded(
          child: Text(
            data,
            style: AppTextStyles.bodyL
                .copyWith(color: AppColors.primitiveNeutral300),
          ),
        ),
      ],
    );
  }
}
