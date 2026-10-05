import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/features/home/widgets/alcohol_warning_dialog.dart';

void main() {
  /// Открывает диалог и складывает его результат в [result].
  Future<void> openDialog(
    WidgetTester tester,
    ValueNotifier<bool?> result,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () async =>
                  result.value = await AlcoholWarningDialog.show(context),
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
  testWidgets('показывает предупреждение, подтверждение возвращает true',
      (tester) async {
    final result = ValueNotifier<bool?>(null);
    await openDialog(tester, result);

    expect(find.text(LocaleKeys.alcoholWarningTitle), findsOneWidget);
    expect(find.text(LocaleKeys.alcoholWarningMessage), findsOneWidget);

    await tester.tap(find.text(LocaleKeys.alcoholWarningConfirm));
    await tester.pumpAndSettle();

    expect(result.value, isTrue);
    expect(find.text(LocaleKeys.alcoholWarningTitle), findsNothing);
  });

  testWidgets('отмена возвращает false', (tester) async {
    final result = ValueNotifier<bool?>(null);
    await openDialog(tester, result);

    await tester.tap(find.text(LocaleKeys.cancel));
    await tester.pumpAndSettle();

    expect(result.value, isFalse);
  });

  testWidgets('тап мимо карточки не закрывает диалог', (tester) async {
    final result = ValueNotifier<bool?>(null);
    await openDialog(tester, result);

    await tester.tapAt(const Offset(2, 2));
    await tester.pumpAndSettle();

    expect(find.text(LocaleKeys.alcoholWarningTitle), findsOneWidget);
    expect(result.value, isNull);
  });
}
