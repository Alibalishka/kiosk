import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/core/utils/qr_pay_image_url.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_layout.dart';
import 'package:sizer/sizer.dart';

/// Размеры hero-картинки попадают в URL прокси, то есть в ключ кеша.
/// Прогрев меню, precache по тапу и сама ProductPage берут их из одной
/// функции — если у кого-то появится своя формула, прогрев начнёт
/// промахиваться и фото будет качаться по сети при каждом открытии.
Future<({int widthPx, int heightPx})> heroPixelsFor(
  WidgetTester tester,
  Size logicalSize,
  double dpr,
) async {
  tester.view.physicalSize = logicalSize * dpr;
  tester.view.devicePixelRatio = dpr;
  addTearDown(tester.view.reset);

  late ({int widthPx, int heightPx}) px;
  await tester.pumpWidget(
    Sizer(
      builder: (context, orientation, screenType) => Builder(
        builder: (context) {
          px = qrPayHeroImageProxyPixels(context);
          return const SizedBox.shrink();
        },
      ),
    ),
  );
  return px;
}

void main() {
  const portrait = Size(800, 1280);
  const landscape = Size(1280, 800);
  const dpr = 2.0;

  testWidgets('портрет просит картинку под шапку в 55% высоты', (tester) async {
    final px = await heroPixelsFor(tester, portrait, dpr);

    expect(px.widthPx, (800 * dpr).round());
    expect(px.heightPx, (1280 * 0.55 * dpr).round());
  });

  testWidgets('альбом просит картинку под медиа-панель во всю высоту',
      (tester) async {
    late double mediaWidth;
    tester.view.physicalSize = landscape * dpr;
    tester.view.devicePixelRatio = dpr;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      Sizer(
        builder: (context, orientation, screenType) => Builder(
          builder: (context) {
            mediaWidth = QrMenuLayout.of(context).productMediaWidth;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    final px = await heroPixelsFor(tester, landscape, dpr);

    // Ширина — по панели, а не по экрану: иначе просим вдвое шире, чем
    // покажем. Высота — полная, а не 55%: шапки в альбоме нет.
    expect(px.widthPx, (mediaWidth * dpr).round());
    expect(px.heightPx, (800 * dpr).round());
  });

  test('размеры подставляются в URL прокси', () {
    const url = 'https://img.qrpay.kz/insecure/h:100/w:100/q:50/plain/x.jpg';

    expect(
      normalizeQrPayInsecureImageUrl(url,
          targetWidthPx: 1178, targetHeightPx: 1600),
      'https://img.qrpay.kz/insecure/h:1600/w:1178/q:90/plain/x.jpg',
    );
    // Разные ориентации дают разные URL — поэтому после поворота прогрев
    // кеша надо запускать заново (QrMenuVm.relayoutForOrientation).
    expect(
      normalizeQrPayInsecureImageUrl(url,
          targetWidthPx: 1600, targetHeightPx: 1408),
      isNot(normalizeQrPayInsecureImageUrl(url,
          targetWidthPx: 1178, targetHeightPx: 1600)),
    );
  });
}
