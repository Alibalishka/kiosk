import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool chevron;
  final bool padding;
  final bool blac;
  final Widget? child;
  final Function()? onTap;
  const SectionTitle({
    super.key,
    required this.title,
    this.onTap,
    this.chevron = false,
    this.padding = true,
    this.child,
    this.blac = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.semanticBgSurface1,
      splashColor: AppColors.semanticBgSurface1,
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Padding(
        padding: padding ? AppPaddings.horizontal16 : const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.headingH2.copyWith(
                  color: blac
                      ? AppColors.semanticFgDefault
                      : AppColors.semanticFgDefault),
            ),
            chevron
                ? SvgPicture.asset(
                    AppSvgImages.chevronForward,
                    height: 24,
                  )
                : child ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
