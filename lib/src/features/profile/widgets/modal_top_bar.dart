import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/features/home/widgets/section_title.dart';

class ModalTopBar extends StatelessWidget {
  const ModalTopBar({
    super.key,
    required this.title,
    this.onTap,
    this.hasIcon,
  });

  final String? title;
  final Function()? onTap;
  final bool? hasIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        hasIcon == true
            ? GestureDetector(
                onTap: () =>
                    context.router.pop().then((value) => onTap?.call()),
                child: SvgPicture.asset(
                  AppSvgImages.arrowLeft,
                ),
              )
            : const SizedBox(),
        SectionTitle(title: title ?? ''),
        const SizedBox(),
      ],
    );
  }
}
