import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:flutter_svg/svg.dart';

class ListItem1 extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? leftIcon;
  final String? rightIcon;
  final bool? hasRigftIcon;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final bool isOn;
  const ListItem1({
    super.key,
    required this.title,
    this.subtitle,
    this.leftIcon,
    this.rightIcon,
    this.onTap,
    this.padding,
    this.hasRigftIcon = true,
    this.isOn = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.semanticBgSurface1,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        hoverColor: AppColors.semanticBgSurface1,
        splashColor: AppColors.semanticBgSurface1,
        child: Container(
          decoration: const BoxDecoration(
              // color: AppColors.semanticBgSurface1,
              // borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
          child: Padding(
            padding: padding ?? AppPaddings.sym16x12,
            child: Row(
              children: [
                leftIcon?.contains('svg') ?? false
                    ? SvgPicture.asset(leftIcon ?? AppSvgImages.location)
                    : Image.asset(
                        leftIcon ?? '',
                        width: 24,
                      ),
                const RowSpacer(1.2),
                Text(
                  title,
                  style: AppTextStyles.bodyL
                      .copyWith(color: AppComponents.navbarTitleColorDefault),
                ),
                const Spacer(),
                hasRigftIcon == true
                    ? SvgPicture.asset(
                        rightIcon ?? AppSvgImages.chevronForward,
                        color: AppComponents
                            .navmenuNavmenuelementIconrightColorDefault,
                      )
                    : const SizedBox(),
                isOn
                    ? SvgPicture.asset(
                        AppSvgImages.radiobuttonOn,
                        height: 24,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListItem2 extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool? divider;
  final Function()? onTap;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final bool? color;
  final EdgeInsetsGeometry? padding;

  const ListItem2({
    super.key,
    required this.title,
    required this.subtitle,
    this.divider = true,
    this.onTap,
    this.titleStyle,
    this.subtitleStyle,
    this.color = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color == true ? AppColors.semanticBgSurface1 : null,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Padding(
              padding: padding ?? AppPaddings.sym16x12,
              child: Row(
                children: [
                  Text(
                    title,
                    style: titleStyle ??
                        AppTextStyles.bodyL.copyWith(
                            color: AppComponents.listitemBodytextColorDefault),
                  ),
                  const Spacer(),
                  Text(
                    subtitle,
                    style: subtitleStyle ??
                        AppTextStyles.bodyLStrong.copyWith(
                            color: AppComponents.listitemBodytextColorDefault),
                  ),
                ],
              ),
            ),
            divider == true
                ? const CustomDivider(
                    horizontalPadding: 16,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
