import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/features/home/widgets/cash_payment_confirm_dialog.dart';

void main() {
  /// Открывает диалог и складывает его результат в [result].
  Future<void> openDialog(
    WidgetTester tester,
    ValueNotifier<bool?> result, {
    Duration? autoCancelAfter,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () async =>
                  result.value = await CashPaymentConfirmDialog.show(
                context,
                totalPrice: 12500,
                autoCancelAfter: autoCancelAfter,
              ),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  // Без инициализации easy_localization `.tr()` отдаёт сам ключ.
  testWidgets('показывает сообщение и сумму, подтверждение возвращает true',
      (tester) async {
    final result = ValueNotifier<bool?>(null);
    await openDialog(tester, result);

    expect(find.text(LocaleKeys.payWithCash), findsOneWidget);
    expect(find.text(LocaleKeys.cashPaymentConfirmMessage), findsOneWidget);
    expect(find.text('12 500 ₸'), findsOneWidget);

    await tester.tap(find.text(LocaleKeys.cashPaymentConfirm));
    await tester.pumpAndSettle();

    expect(result.value, isTrue);
    expect(find.text(LocaleKeys.payWithCash), findsNothing);
  });

  testWidgets('отмена возвращает false', (tester) async {
    final result = ValueNotifier<bool?>(null);
    await openDialog(tester, result);

    await tester.tap(find.text(LocaleKeys.cancel));
    await tester.pumpAndSettle();

    expect(result.value, isFalse);
  });

  testWidgets('тап мимо карточки — отказ', (tester) async {
    final result = ValueNotifier<bool?>(null);
    await openDialog(tester, result);

    await tester.tapAt(const Offset(2, 2));
    await tester.pumpAndSettle();

    expect(result.value, isFalse);
    expect(find.text(LocaleKeys.payWithCash), findsNothing);
  });

  testWidgets('двойной тап по «Подтвердить» не закрывает страницу под диалогом',
      (tester) async {
    final result = ValueNotifier<bool?>(null);
    await openDialog(tester, result);

    await tester.tap(find.text(LocaleKeys.cashPaymentConfirm));
    await tester.pump(const Duration(milliseconds: 50));
    await tester.tap(
      find.text(LocaleKeys.cashPaymentConfirm),
      warnIfMissed: false,
    );
    await tester.pumpAndSettle();

    expect(result.value, isTrue);
    expect(find.text('open'), findsOneWidget);
  });

  testWidgets('без ответа закрывается отказом, касания продлевают таймер',
      (tester) async {
    final result = ValueNotifier<bool?>(null);
    await openDialog(
      tester,
      result,
      autoCancelAfter: const Duration(seconds: 10),
    );

    await tester.pump(const Duration(seconds: 8));
    // Касание карточки, не кнопки, — гость ещё читает.
    await tester.tap(find.text(LocaleKeys.cashPaymentConfirmMessage));
    await tester.pump(const Duration(seconds: 8));
    expect(find.text(LocaleKeys.payWithCash), findsOneWidget);
    expect(result.value, isNull);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(result.value, isFalse);
    expect(find.text(LocaleKeys.payWithCash), findsNothing);
  });
}
