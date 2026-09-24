import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/features/kiosk/widgets/payment_status_views.dart';
import 'package:sizer/sizer.dart';

/// Док живёт в `Scaffold.bottomNavigationBar`, где высота приходит свободной
/// (loose) констрейнтой до высоты экрана. Любой виджет, который «разворачива-
/// ется на максимум» — Center без heightFactor, Column без mainAxisSize.min —
/// заставит док занять весь экран и выдавить body.
Future<void> pumpDock(WidgetTester tester, Size size) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    Sizer(
      builder: (context, orientation, screenType) => const MaterialApp(
        home: Scaffold(
          bottomNavigationBar: PaymentErrorDock(),
          body: SizedBox.expand(key: Key('body')),
        ),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  const landscape = Size(1280, 800);
  const portrait = Size(800, 1280);

  for (final entry in {'альбом': landscape, 'портрет': portrait}.entries) {
    testWidgets('док ошибки не съедает экран: ${entry.key}', (tester) async {
      await pumpDock(tester, entry.value);

      final dock = tester.getSize(find.byType(PaymentErrorDock));
      final body = tester.getSize(find.byKey(const Key('body')));

      // Док — это строка из двух кнопок, а не пол-экрана.
      expect(dock.height, lessThan(200));
      // И body остаётся место под содержимое экрана оплаты.
      expect(body.height, greaterThan(entry.value.height / 2));
    });
  }

  testWidgets('кнопки в альбоме не растягиваются на всю ширину',
      (tester) async {
    await pumpDock(tester, landscape);

    final buttons = tester.getSize(
      find
          .descendant(
            of: find.byType(PaymentErrorDock),
            matching: find.byType(Row),
          )
          .first,
    );

    expect(buttons.width, lessThanOrEqualTo(720));
    expect(buttons.width, lessThan(landscape.width));
  });
}
