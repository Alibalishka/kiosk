import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/features/home/widgets/shimmer_qr_menu.dart';
import 'package:sizer/sizer.dart';

/// Шиммер альбома строится по QrMenuLayout, а высота карточки там —
/// вычисляемая. Проверяем, что скелет карточки помещается в неё на разных
/// экранах: overflow в RenderFlex прилетает исключением на первом же кадре.
Future<void> pumpShimmer(
  WidgetTester tester,
  Size size, {
  required bool isLandscape,
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    Sizer(
      builder: (context, orientation, screenType) => MaterialApp(
        home: Scaffold(body: ShimmerQrMenu(isLandscape: isLandscape)),
      ),
    ),
  );
  // Без pumpAndSettle: мерцание шиммера — бесконечная анимация.
  await tester.pump(const Duration(milliseconds: 16));
}

void main() {
  const sizes = <String, Size>{
    'планшет 1280x800': Size(1280, 800),
    'планшет 1024x768': Size(1024, 768),
    'телефон 844x390': Size(844, 390),
  };

  sizes.forEach((name, size) {
    testWidgets('альбомный шиммер не переполняется: $name', (tester) async {
      await pumpShimmer(tester, size, isLandscape: true);
      expect(tester.takeException(), isNull);
    });
  });

  testWidgets('портретный шиммер не переполняется', (tester) async {
    await pumpShimmer(tester, const Size(800, 1280), isLandscape: false);
    expect(tester.takeException(), isNull);
  });
}
