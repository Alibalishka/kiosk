import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_content.dart';

class SubscriptionCanceled extends StatelessWidget {
  const SubscriptionCanceled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.semanticBgSurface1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      child: BottomSheetContent(
        title: LocaleKeys.subscriptionCanceled.tr(),
        text: LocaleKeys.thanksForUsingPrime.tr(),
        buttonText: LocaleKeys.close.tr(),
        icon: AppWebpImages.subscriptionCanceled,
      ),
    );
  }
}
