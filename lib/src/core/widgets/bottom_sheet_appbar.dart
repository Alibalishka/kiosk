import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetAppBar extends StatelessWidget {
  final String title;
  final String? svg;
  final bool isIcon;
  const BottomSheetAppBar({
    super.key,
    required this.title,
    this.svg,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ColumnSpacer(0.8),
        const CustomBar(),
        const ColumnSpacer(1.6),
        Padding(
          padding: AppPaddings.horizontal16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isIcon
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () => context.router.pop(),
                      child: SvgPicture.asset(
                        svg ?? AppSvgImages.addCircle,
                        color: AppComponents.modalBgColorDefault,
                      ),
                    ),
              Text(
                title,
                style: AppTextStyles.headingH3
                    .copyWith(color: AppColors.semanticFgDefault),
              ),
              const SizedBox(
                height: 24,
                width: 24,
              )
            ],
          ),
        ),
      ],
    );
  }
}
