import 'package:easy_localization/easy_localization.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_content.dart';

import 'package:flutter/material.dart';

class AppBottomSheet {
  static Future<dynamic> sendSupport(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      builder: (context) => Container(
        decoration: const BoxDecoration(
            color: AppColors.semanticBgSurface1,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
        child: BottomSheetContent(
          title: LocaleKeys.requestSent.tr(),
          text: LocaleKeys.requestSentDesc.tr(),
          buttonText: LocaleKeys.close.tr(),
          icon: AppWebpImages.airplane,
        ),
      ),
    );
  }
}
