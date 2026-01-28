import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class AppNumUnreaded extends StatelessWidget {
  final int num;
  const AppNumUnreaded({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.tag,
      decoration: const BoxDecoration(
          color: AppComponents.badgePrimaryStatus05BgColorDefault,
          shape: BoxShape.circle),
      child: Text(
        '$num',
        style: AppTextStyles.bodyS.copyWith(
            color: AppComponents.badgePrimaryStatus05LabelColorDefault),
      ),
    );
  }
}
