import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.horizontalPadding = 0});
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: const Divider(
            thickness: 1, color: AppComponents.dividerColorDefault),
      );
}
