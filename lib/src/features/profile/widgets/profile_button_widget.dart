import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final String? count;
  final String? countAfterTitle;
  final String imagePath;
  final Color color;
  final bool chevron;
  final bool icon;
  final EdgeInsetsGeometry padding;

  const ProfileButton({
    super.key,
    required this.text,
    required this.onTap,
    this.count,
    this.countAfterTitle,
    required this.imagePath,
    this.color = AppColors.primitiveNeutral300,
    this.chevron = false,
    this.icon = true,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(24)),
      child: Container(
        padding: padding,
        child: Row(
          children: [
            icon ? SvgPicture.asset(imagePath) : const SizedBox(),
            icon ? const RowSpacer(0.8) : const SizedBox(),
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodyL.copyWith(
                          color: AppComponents
                              .navmenuNavmenuelementLabelColorDefault),
                    ),
                  ),
                  const RowSpacer(0.8),
                  countAfterTitle != null
                      ? const Text(
                          '10',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            count != null
                ? Container(
                    decoration: BoxDecoration(
                        color: AppComponents.badgePrimaryStatus05BgColorDefault,
                        borderRadius: BorderRadius.circular(100)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      '$count+',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodyM.copyWith(
                          color: AppComponents
                              .navmenuNavmenuelementLabelColorDefault),
                    ),
                  )
                : const SizedBox.shrink(),
            chevron
                ? SvgPicture.asset(
                    AppSvgImages.chevronForward,
                    color: AppComponents
                        .navmenuNavmenuelementIconrightColorDefault,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
