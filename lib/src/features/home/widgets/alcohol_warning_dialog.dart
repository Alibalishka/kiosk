import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/widgets/custom_button2.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

/// Предупреждение при добавлении алкоголя в заказ: возраст и ответственность.
///
/// Возвращает `true`, только если гость явно подтвердил. Закрыть диалог тапом
/// мимо нельзя — молчание не считается согласием.
class AlcoholWarningDialog {
  const AlcoholWarningDialog._();

  static Future<bool> show(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      // Блюр рисуем сами, как в диалоге бездействия, поэтому барьер прозрачный.
      barrierColor: Colors.transparent,
      builder: (_) => BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: ColoredBox(
          color: Colors.black.withValues(alpha: 0.35),
          child: const _AlcoholWarningCard(),
        ),
      ),
    );
    return confirmed ?? false;
  }
}

class _AlcoholWarningCard extends StatelessWidget {
  const _AlcoholWarningCard();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
        child: ConstrainedBox(
          // В альбоме экран широкий — карточка не должна растягиваться.
          constraints: const BoxConstraints(maxWidth: 640),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.alcoholWarningTitle.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headingH1.copyWith(fontSize: 28),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    LocaleKeys.alcoholWarningMessage.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyL.copyWith(
                      fontSize: 20,
                      height: 1.4,
                      color: AppColors.semanticFgDefault,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton2(
                          text: LocaleKeys.cancel.tr(),
                          fontSize: 18,
                          backgroundColor: AppColors.none,
                          borderRadius: 16,
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CustomButton(
                          text: LocaleKeys.alcoholWarningConfirm.tr(),
                          fontSize: 18,
                          borderRadius: 16,
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
