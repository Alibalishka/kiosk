import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_layout.dart';
import 'package:sizer/sizer.dart';

/// Прогоняет [QrMenuLayout.of] под заданный размер экрана.
Future<QrMenuLayout> layoutFor(
  WidgetTester tester,
  Size size, {
  bool hasRecommend = true,
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  late QrMenuLayout layout;
  await tester.pumpWidget(
    Sizer(
      builder: (context, orientation, screenType) => Builder(
        builder: (context) {
          layout = QrMenuLayout.of(context, hasRecommend: hasRecommend);
          return const SizedBox.shrink();
        },
      ),
    ),
  );
  return layout;
}

void main() {
  const tabletPortrait = Size(800, 1280);
  const tabletLandscape = Size(1280, 800);

  testWidgets('портрет повторяет прежние формулы', (tester) async {
    final layout = await layoutFor(tester, tabletPortrait);

    expect(layout.isLandscape, isFalse);
    expect(layout.showcaseWidth, 0);
    expect(layout.gridColumns, 3);
    // 42.5.sh на Android-планшете шире 600.
    expect(layout.gridTileHeight, closeTo(0.425 * 1280, 0.01));
    expect(layout.listTileHeight, closeTo(0.15 * 1280, 0.01));
    expect(layout.basketButtonHeight, closeTo(0.04 * 1280, 0.01));
    // Раскрытый хедер = width / 1.3, ItemRecomended сам считает картинку.
    expect(layout.headerExpandedHeight, closeTo(800 / 1.3, 0.01));
    expect(layout.gridImageHeight, isNull);
  });

  testWidgets('альбом отдаёт витрине левую панель', (tester) async {
    final layout = await layoutFor(tester, tabletLandscape);

    expect(layout.isLandscape, isTrue);
    expect(layout.showcaseWidth, closeTo(1280 * 0.4, 0.01));
    expect(layout.menuWidth, closeTo(1280 - 1280 * 0.4, 0.01));
    // Раскрытого хедера в скролле нет: width / 1.3 выше самого экрана.
    expect(layout.headerExpandedHeight, isNull);
  });

  testWidgets('альбомная карточка не выше портретной', (tester) async {
    final portrait = await layoutFor(tester, tabletPortrait);
    final landscape = await layoutFor(tester, tabletLandscape);

    // Текстовый блок карточки набран в `.sp` и при повороте не сжимается,
    // поэтому высота карточки уменьшается ровно на столько, на сколько
    // ужалась картинка (плюс запас) — иначе получится overflow.
    final contentWidth = landscape.menuWidth - QrMenuLayout.contentPadding * 2;
    final tileWidth = (contentWidth -
            QrMenuLayout.gridSpacing * (landscape.gridColumns - 1)) /
        landscape.gridColumns;

    expect(landscape.gridColumns, 3);
    expect(landscape.gridImageHeight, closeTo(tileWidth, 0.01));
    expect(
      landscape.gridTileHeight,
      closeTo(portrait.gridTileHeight - (800 / 3 - tileWidth) + 16, 0.01),
    );
    expect(landscape.gridTileHeight, lessThan(portrait.gridTileHeight));
  });

  testWidgets('альбомные высоты совпадают с портретными в пикселях',
      (tester) async {
    final portrait = await layoutFor(tester, tabletPortrait);
    final landscape = await layoutFor(tester, tabletLandscape);

    // Короткая сторона при повороте не меняется, поэтому строка списка и
    // кнопка «в корзину» остаются тех же пикселей: `.sh` заменён на `.sw`.
    expect(landscape.listTileHeight, closeTo(portrait.listTileHeight, 0.01));
    expect(
      landscape.basketButtonHeight,
      closeTo(portrait.basketButtonHeight, 0.01),
    );
  });

  testWidgets('карточка товара получает медиа-панель только в альбоме',
      (tester) async {
    final portrait = await layoutFor(tester, tabletPortrait);
    final landscape = await layoutFor(tester, tabletLandscape);

    expect(portrait.productMediaWidth, 0);
    expect(landscape.productMediaWidth, closeTo(1280 * 0.46, 0.01));
    // Под описание и модификаторы должно остаться больше половины экрана.
    expect(1280 - landscape.productMediaWidth, greaterThan(640));
  });

  testWidgets('корзина получает панель оплаты только в альбоме',
      (tester) async {
    final portrait = await layoutFor(tester, tabletPortrait);
    final landscape = await layoutFor(tester, tabletLandscape);

    expect(portrait.checkoutPanelWidth, 0);
    expect(landscape.checkoutPanelWidth, closeTo(1280 * 0.36, 0.01));
    // Панель узкая — место нужно списку блюд, а не итогам.
    expect(
      landscape.checkoutPanelWidth,
      lessThan(landscape.productMediaWidth),
    );
  });

  testWidgets('safeLongSide не меняет размер при повороте', (tester) async {
    late double portraitValue;
    late double landscapeValue;

    for (final size in [tabletPortrait, tabletLandscape]) {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        Sizer(
          builder: (context, orientation, screenType) => Builder(
            builder: (context) {
              final value = QrMenuLayout.safeLongSide(context, 4);
              if (size == tabletPortrait) {
                portraitValue = value;
              } else {
                landscapeValue = value;
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    }

    // 4.sh крестика на карточке товара: в альбоме это было бы 4% короткой
    // стороны, то есть 32 px вместо 51.
    expect(landscapeValue, closeTo(portraitValue, 0.01));
    expect(landscapeValue, closeTo(0.04 * 1280, 0.01));
  });

  testWidgets('без рекомендаций меню занимает весь альбомный экран',
      (tester) async {
    final layout =
        await layoutFor(tester, tabletLandscape, hasRecommend: false);

    expect(layout.showcaseWidth, 0);
    expect(layout.menuWidth, 1280);
    // Широкая панель — больше колонок, иначе карточки были бы огромными.
    expect(layout.gridColumns, greaterThan(3));
  });
}
