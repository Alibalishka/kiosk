import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_lottie.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_layout.dart';

/// Общие состояния экранов оплаты — карта и Kaspi отличаются только блоком
/// с QR, остальное у них совпадало слово в слово.

/// Центрирует содержимое и даёт прокрутить, если оно не помещается.
///
/// В альбоме высоты вдвое меньше, а блоки на этих экранах крупные и
/// фиксированные: без прокрутки вместо контента был бы полосатый overflow.
class PaymentCenteredScroll extends StatelessWidget {
  const PaymentCenteredScroll({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(child: child),
          ),
        ),
      );
}

/// Крутилка ожидания — один размер на всех экранах оплаты.
class PaymentSpinner extends StatelessWidget {
  const PaymentSpinner({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox(
        height: 64,
        width: 64,
        child: CircularProgressIndicator(
          color: Color(0xffF14635),
          strokeWidth: 4,
        ),
      );
}

/// «Готовимся принять оплату» и крутилка под ней.
class PaymentLoadingView extends StatelessWidget {
  const PaymentLoadingView({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LocaleKeys.preparingToAcceptPayment.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.headingH3.copyWith(fontSize: 36),
          ),
          const ColumnSpacer(3),
          const PaymentSpinner(),
        ],
      );
}

/// Оплата не прошла.
class PaymentErrorView extends StatelessWidget {
  const PaymentErrorView({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppSvgImages.okError, height: 250),
          const ColumnSpacer(4),
          Text(
            LocaleKeys.purchaseCancellationTitle.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.headingH3.copyWith(fontSize: 32),
          ),
          Text(
            LocaleKeys.youDidNotConfirm.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyM.copyWith(fontSize: 24),
          ),
        ],
      );
}

/// Оплата принята.
class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key, required this.totalPrice});

  final int totalPrice;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            AppLottie.success,
            // 30.h — процент высоты экрана: в альбоме анимация ужималась
            // почти вдвое. longSide держит тот же размер при повороте.
            height: QrMenuLayout.longSide(context, 30),
            repeat: false,
          ),
          Text(
            LocaleKeys.paymentAccepted.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.headingH3.copyWith(fontSize: 32),
          ),
          Text(
            '${priceFormat(totalPrice.toString())} ₸',
            style: AppTextStyles.headingH3.copyWith(fontSize: 52),
          ),
        ],
      );
}

/// Док под неудачной оплатой: «Отменить покупку» и «Повторить».
class PaymentErrorDock extends StatelessWidget {
  const PaymentErrorDock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppComponents.buttondockBgColorDefault,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: SafeArea(
        // В альбоме две кнопки на всю ширину экрана выглядят полосами —
        // держим док в читаемой ширине по центру.
        //
        // heightFactor обязателен: без него Center разворачивается на всю
        // доступную высоту, док занимает весь экран и выдавливает body.
        child: Center(
          heightFactor: 1,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context.read<QrMenuVm>().clearBasket();
                      context.router.popUntil((route) =>
                          route.settings.name == QrMenuProviderRoute.name);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 18,
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(
                          color: Color(0xFFE2E2E2),
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: Text(
                      LocaleKeys.cancelPurchaseButton.tr(),
                      style: AppTextStyles.bodyM.copyWith(
                        fontSize: 18,
                        color: AppColors.primitiveNeutralcold1000,
                      ),
                    ),
                  ),
                ),
                const RowSpacer(2),
                Expanded(
                  child: CupertinoButton(
                    borderRadius: BorderRadius.circular(16),
                    onPressed: () => context.router.pop(),
                    color: AppColors.primitiveNeutralcold1000,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      child: Text(
                        LocaleKeys.tryAgainButton.tr(),
                        style: AppTextStyles.bodyM.copyWith(
                          fontSize: 18,
                          color: AppComponents
                              .buttongroupButtonPrimaryTextColorDefault,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
