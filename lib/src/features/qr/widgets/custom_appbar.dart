import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool hasLeading;
  final String? svg;
  final PreferredSizeWidget? bottom;
  final double height;
  final String? rightText;
  final VoidCallback? onRightTap;
  final List<Widget>? actions;
  final bool isTablet;

  const CustomAppBar({
    super.key,
    required this.text,
    this.hasLeading = false,
    this.svg,
    this.bottom,
    this.height = kMinInteractiveDimension,
    this.rightText,
    this.onRightTap,
    this.actions,
    this.isTablet = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      surfaceTintColor: context.theme.scaffoldBackgroundColor,
      centerTitle: true,
      title: Text(
        text,
        style: AppTextStyles.headingH2.copyWith(
          fontSize: isTablet ? 26 : null,
          color: AppColors.semanticFgDefault,
        ),
      ),
      leading: hasLeading
          ? GestureDetector(
              onTap: () => context.router.pop(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SvgPicture.asset(AppSvgImages.arrowLeft),
              ),
            )
          : const SizedBox.shrink(),
      actions: (actions?.isNotEmpty ?? false)
          ? actions
          : rightText != null
              ? [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: onRightTap,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(206, 165, 101, 1),
                                Color.fromRGBO(155, 97, 20, 1),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )),
                        child: Padding(
                          padding: AppPaddings.locationContainer,
                          child: Text(
                            'PRIME',
                            style: AppTextStyles.bodyM.copyWith(
                                color: AppComponents
                                    .navmenuNavmenuelementLabelColorDefault),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              : null,
      bottom: bottom,
    );
  }
}
