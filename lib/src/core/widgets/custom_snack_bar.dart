import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum StatusIcon { success, error, warning }

class CustomSnackBar extends StatefulWidget {
  const CustomSnackBar.success({
    Key? key,
    required this.message,
    this.icon = StatusIcon.success,
    this.maxLines = 2,
    this.backgroundColor = AppComponents.toastnotificationInfoBgColorDefault,
    this.borderColor = AppComponents.toastnotificationInfoBgColorDefault,
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  const CustomSnackBar.warning({
    Key? key,
    required this.message,
    this.icon = StatusIcon.warning,
    this.maxLines = 2,
    this.backgroundColor = AppComponents.toastnotificationBgColorDefault,
    this.borderColor = AppComponents.toastnotificationInfoBorderColorDefault,
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  const CustomSnackBar.error({
    Key? key,
    required this.message,
    this.icon = StatusIcon.error,
    this.maxLines = 2,
    this.backgroundColor = AppComponents.toastnotificationErrorBgColorDefault,
    this.borderColor = AppComponents.toastnotificationDangerBorderColorDefault,
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  final String message;
  final StatusIcon icon;
  final Color backgroundColor;
  final Color borderColor;
  final int maxLines;
  final List<BoxShadow> boxShadow;
  final double borderRadius;
  final TextAlign textAlign;

  @override
  CustomSnackBarState createState() => CustomSnackBarState();
}

class CustomSnackBarState extends State<CustomSnackBar> {
  String? iconPath;
  @override
  Widget build(BuildContext context) {
    switch (widget.icon) {
      case StatusIcon.success:
        iconPath = AppSvgImages.checkmarkCircleFill;
      case StatusIcon.error:
        iconPath = AppSvgImages.warningFill;
      case StatusIcon.warning:
        iconPath = AppSvgImages.warning;
      default:
    }
    return Material(
      type: MaterialType.transparency,
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius)),
            boxShadow: widget.boxShadow,
            border: Border.all(
              color: widget.borderColor,
            )),
        width: double.infinity,
        child: Row(
          children: [
            SvgPicture.asset(iconPath!),
            const RowSpacer(0.8),
            Expanded(
              child: Text(
                widget.message,
                style: AppTextStyles.bodyM
                    .copyWith(color: AppColors.primitiveNeutralwarm0),
                textAlign: widget.textAlign,
                overflow: TextOverflow.ellipsis,
                maxLines: widget.maxLines,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const kDefaultBoxShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 8),
    spreadRadius: 1,
    blurRadius: 30,
  ),
];

const kDefaultBorderRadius = AppComponents.toastnotificationBorderradius;
