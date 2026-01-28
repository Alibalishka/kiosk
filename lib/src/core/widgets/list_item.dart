import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListItem extends StatelessWidget {
  final String category;
  final String? icon;
  final bool rightIcon;
  final Function()? onTap;
  const ListItem({
    super.key,
    required this.category,
    this.icon,
    this.onTap,
    this.rightIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: AppPaddings.sym16x20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category,
              style: AppTextStyles.bodyL
                  .copyWith(color: AppComponents.listitemBodytextColorDefault),
            ),
            rightIcon ? SvgPicture.asset(icon ?? '') : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
