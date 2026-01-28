import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  final Function() onPressed;
  const CustomSearchBar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.sym16x12,
      decoration: const BoxDecoration(
        color: AppColors.semanticBgSurface1,
      ),
      child: Row(
        children: [
          Flexible(
            child: CupertinoSearchTextField(
              prefixInsets: const EdgeInsets.only(left: 16),
              suffixMode: OverlayVisibilityMode.editing,
              onTap: () {},
              suffixInsets: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 8),
              prefixIcon: SvgPicture.asset(
                AppSvgImages.search,
                color: AppColors.semanticFgSoft,
              ),
              placeholder: 'Введите адрес',
              placeholderStyle:
                  Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        color: AppColors.primitiveNeutral300,
                      ),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 16,
                  ),
              decoration: BoxDecoration(
                color: AppColors.semanticBgSurface1,
                border: Border.all(color: AppColors.semanticFgSoft),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchBar2 extends StatelessWidget {
  final Function()? onPressed;
  final Function(String)? onChanged;
  final String? text;
  final TextEditingController? controller;
  const CustomSearchBar2({
    super.key,
    this.onPressed,
    this.onChanged,
    this.text,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.sym16x12,
      decoration: const BoxDecoration(
          color: AppColors.semanticBgSurface1,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      child: Row(
        children: [
          Flexible(
            child: CupertinoSearchTextField(
              controller: controller,
              onChanged: onChanged,
              prefixInsets: const EdgeInsets.only(left: 16),
              suffixMode: OverlayVisibilityMode.editing,
              onTap: onPressed,
              suffixInsets: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 8),
              prefixIcon: SvgPicture.asset(
                AppSvgImages.search,
                color: AppColors.semanticFgSoft,
              ),
              placeholder: text ?? 'Введите адрес',
              placeholderStyle:
                  Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        color: AppColors.primitiveNeutral300,
                      ),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 16,
                  ),
              decoration: BoxDecoration(
                color: AppColors.semanticBgSurface1,
                border: Border.all(color: AppColors.primitiveNeutral25),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
