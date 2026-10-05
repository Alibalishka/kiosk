import 'dart:async';
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/custom_button2.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

/// Подтверждение оплаты наличными: после него заказ сразу уходит в заведение.
///
/// Возвращает `true`, только если гость нажал «Подтвердить». Тап мимо
/// карточки, «Отмена» и автозакрытие — это отказ: заказ не отправляется.
class CashPaymentConfirmDialog {
  const CashPaymentConfirmDialog._();

  static Future<bool> show(
    BuildContext context, {
    required int totalPrice,
    Duration? autoCancelAfter,
  }) async {
    final confirmed = await showGeneralDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withValues(alpha: 0.35),
      transitionDuration: const Duration(milliseconds: 260),
      pageBuilder: (_, __, ___) => _CashPaymentConfirmCard(
        totalPrice: totalPrice,
        autoCancelAfter: autoCancelAfter,
      ),
      transitionBuilder: (context, animation, _, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );
        // Блюр нарастает вместе с затемнением барьера, а карточка чуть
        // «подъезжает» масштабом — без рывка, как у диалога бездействия.
        return AnimatedBuilder(
          animation: curved,
          builder: (context, child) => BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 8 * curved.value,
              sigmaY: 8 * curved.value,
            ),
            child: child,
          ),
          child: FadeTransition(
            opacity: curved,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.94, end: 1).animate(curved),
              child: child,
            ),
          ),
        );
      },
    );
    return confirmed ?? false;
  }
}

class _CashPaymentConfirmCard extends StatefulWidget {
  const _CashPaymentConfirmCard({
    required this.totalPrice,
    this.autoCancelAfter,
  });

  final int totalPrice;

  /// Киоск: гость ушёл, не ответив, — диалог закрывается отказом. Иначе
  /// следующий гость увидит чужой заказ с кнопкой «Подтвердить».
  final Duration? autoCancelAfter;

  @override
  State<_CashPaymentConfirmCard> createState() =>
      _CashPaymentConfirmCardState();
}

class _CashPaymentConfirmCardState extends State<_CashPaymentConfirmCard> {
  Timer? _autoCancelTimer;

  /// Двойной тап по «Подтвердить» во время анимации закрытия снял бы со
  /// стека ещё и страницу корзины.
  bool _closed = false;

  @override
  void initState() {
    super.initState();
    _restartAutoCancel();
  }

  @override
  void dispose() {
    _autoCancelTimer?.cancel();
    super.dispose();
  }

  void _restartAutoCancel() {
    final duration = widget.autoCancelAfter;
    if (duration == null) return;
    _autoCancelTimer?.cancel();
    _autoCancelTimer = Timer(duration, () => _close(false));
  }

  void _close(bool confirmed) {
    if (_closed || !mounted) return;
    _closed = true;
    _autoCancelTimer?.cancel();
    Navigator.of(context).pop(confirmed);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
        child: ConstrainedBox(
          // В альбоме экран широкий — карточка не должна растягиваться.
          constraints: const BoxConstraints(maxWidth: 560),
          child: Listener(
            onPointerDown: (_) => _restartAutoCancel(),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(32, 36, 32, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Container(
                        width: 96,
                        height: 96,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color:
                              AppComponents.buttongroupButtonGrayBgColorDefault,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          AppSvgImages.cash,
                          height: 44,
                          color: AppComponents
                              .buttongroupButtonGrayTextColorDefault,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      LocaleKeys.payWithCash.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headingH1.copyWith(fontSize: 28),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      LocaleKeys.cashPaymentConfirmMessage.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyL.copyWith(
                        fontSize: 20,
                        height: 1.4,
                        color: AppComponents.listitemBodytextColorDefault,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _TotalRow(totalPrice: widget.totalPrice),
                    const SizedBox(height: 28),
                    SizedBox(
                      height: 64,
                      child: CustomButton(
                        text: LocaleKeys.cashPaymentConfirm.tr(),
                        fontSize: 20,
                        borderRadius: 16,
                        padding: 16,
                        onPressed: () => _close(true),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 64,
                      child: CustomButton2(
                        text: LocaleKeys.cancel.tr(),
                        fontSize: 20,
                        backgroundColor: AppColors.none,
                        hasBorder: false,
                        borderRadius: 16,
                        onPressed: () => _close(false),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Сумма к оплате: гость должен знать, сколько наличных приготовить.
class _TotalRow extends StatelessWidget {
  const _TotalRow({required this.totalPrice});

  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.semanticBgSurface3,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(
            LocaleKeys.total.tr(),
            style: AppTextStyles.bodyL.copyWith(
              fontSize: 20,
              color: AppComponents.listitemBodytextColorDefault,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              '${priceFormat(totalPrice.toString())} ₸',
              textAlign: TextAlign.end,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.headingH3.copyWith(
                fontSize: 24,
                color: AppComponents.blockBlocktitleHeadingColorDefault,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
