import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

/// Размеры экрана меню под текущую ориентацию.
///
/// Единственный источник правды и для вёрстки, и для ScrollService: офсеты
/// перехода по категориям считаются по тем же числам, которые рисуют виджеты.
/// Любая правка высот карточек живёт здесь, иначе табы начнут промахиваться.
///
/// Портрет повторяет формулы, которые раньше были зашиты прямо в виджетах, —
/// цифры не изменились ни на пиксель.
///
/// Альбом — отдельная раскладка в две панели: слева закреплённая витрина
/// рекомендаций на всю высоту, справа меню со своей полосой категорий и
/// скроллом. Раскрытого хедера в скролле нет — он и не поместился бы:
/// `width / 1.3` в альбоме выше самого экрана.
@immutable
class QrMenuLayout {
  const QrMenuLayout._({
    required this.isLandscape,
    required this.showcaseWidth,
    required this.menuWidth,
    required this.gridColumns,
    required this.gridTileHeight,
    required this.gridImageHeight,
    required this.catalogImageHeight,
    required this.listTileHeight,
    required this.basketButtonHeight,
    required this.headerExpandedHeight,
    required this.productMediaWidth,
    required this.checkoutPanelWidth,
  });

  /// Горизонтальные отступы контента меню (AppPaddings.horizontal16).
  static const double contentPadding = 16;

  /// Зазор между колонками сетки (GridMenuWidget).
  static const double gridSpacing = 12;

  /// Высота карусели рекомендаций внутри категории (ItemCatalog).
  static const double catalogHeight = 475;

  /// Зазор между главной карточкой каталога и боковой (RowSpacer(1.2)).
  static const double _catalogGap = 12;

  /// Ширина, к которой стремится карточка сетки. По ней выбирается число
  /// колонок, когда витрины нет и меню занимает весь экран.
  static const double _targetTileWidth = 280;

  /// Доля ширины экрана под левую панель-витрину в альбоме.
  static const double _showcaseFraction = 0.4;

  /// Доля ширины под медиа-панель карточки товара в альбоме. Фото там —
  /// герой экрана, поэтому панель шире витрины меню.
  static const double _productMediaFraction = 0.46;

  /// Доля ширины под панель оплаты в корзине. Она узкая: там только итоги
  /// и кнопки, а место нужно списку блюд.
  static const double _checkoutPanelFraction = 0.36;

  /// Запас высоты карточки в альбоме. Текстовый блок набран в `.sp` и при
  /// повороте не сжимается, а системные инсеты по бокам чуть отличаются от
  /// портретных — без запаса карточка иногда уходит в overflow на пиксель.
  static const double _tileSlack = 16;

  /// Альбомная ориентация: раскладка в две панели.
  final bool isLandscape;

  /// Ширина левой панели-витрины. 0 в портрете и в альбоме без рекомендаций.
  final double showcaseWidth;

  /// Ширина панели с меню: весь экран в портрете, остаток в альбоме.
  final double menuWidth;

  final int gridColumns;

  /// Фиксированная высота карточки сетки.
  final double gridTileHeight;

  /// Высота картинки в карточке сетки. `null` в портрете — там ItemRecomended
  /// считает её сам, ровно как раньше.
  final double? gridImageHeight;

  /// Высота картинки в боковой карточке ItemCatalog. `null` в портрете.
  final double? catalogImageHeight;

  /// Высота строки списка (ItemMenu) без вертикальных отступов.
  final double listTileHeight;

  /// Высота кнопки «в корзину» на карточке.
  final double basketButtonHeight;

  /// Раскрытая высота хедера с рекомендациями. `null` — хедера в скролле нет.
  final double? headerExpandedHeight;

  /// Ширина медиа-панели на карточке товара. 0 в портрете — там фото живёт
  /// в сворачивающейся шапке, а не в отдельной панели.
  final double productMediaWidth;

  /// Ширина панели с итогами и оплатой в корзине. 0 в портрете — там это
  /// нижний док во всю ширину.
  final double checkoutPanelWidth;

  /// Вертикальные отступы вокруг строки списка (AppPaddings.all сверху и снизу).
  static const double listTilePadding = 32;

  /// Процент длинной стороны экрана.
  ///
  /// `3.h` в портрете и `3.w` в альбоме — это один и тот же размер в
  /// пикселях: поворот меняет только то, какая сторона длиннее. Нужно там,
  /// где размер задан через `.h` и при повороте съезжает вдвое.
  static double longSide(BuildContext context, double percent) {
    final size = MediaQuery.sizeOf(context);
    return percent * math.max(size.width, size.height) / 100;
  }

  /// То же для `.sh`: процент безопасной длинной стороны.
  ///
  /// В портрете возвращает ровно `percent.sh`, в альбоме — `percent.sw`.
  /// Нужно там, где через `.sh` задан размер, который при повороте не
  /// должен меняться: кегль, кнопка, высота строки.
  static double safeLongSide(BuildContext context, double percent) {
    final size = MediaQuery.sizeOf(context);
    return size.width > size.height ? percent.sw : percent.sh;
  }

  /// [hasRecommend] влияет только на витрину и число колонок: вызовы, которым
  /// нужны лишь высоты карточек, могут его не передавать.
  factory QrMenuLayout.of(BuildContext context, {bool hasRecommend = true}) {
    final size = MediaQuery.sizeOf(context);

    if (size.width <= size.height) {
      return QrMenuLayout._(
        isLandscape: false,
        showcaseWidth: 0,
        menuWidth: size.width,
        gridColumns: 3,
        gridTileHeight: Platform.isIOS
            ? 50.1.sh
            : size.width > 600
                ? 42.5.sh
                : 51.sh,
        gridImageHeight: null,
        catalogImageHeight: null,
        listTileHeight: 15.sh,
        basketButtonHeight: 4.sh,
        headerExpandedHeight: hasRecommend ? size.width / 1.3 : null,
        productMediaWidth: 0,
        checkoutPanelWidth: 0,
      );
    }

    // Короткая сторона при повороте не меняется, поэтому «портретные»
    // размеры пересчитываются заменой .sh на .sw: 42.5% длинной стороны —
    // это те же пиксели, что и в портрете.
    final portraitTileHeight = Platform.isIOS ? 50.1.sw : 42.5.sw;
    // В портрете картинка карточки — это size.width / 3, а портретная
    // ширина после поворота стала высотой.
    final portraitImageHeight = size.height / 3;

    final showcaseWidth = hasRecommend
        ? (size.width * _showcaseFraction).clamp(340.0, 620.0)
        : 0.0;
    final menuWidth = size.width - showcaseWidth;
    final contentWidth = menuWidth - contentPadding * 2;

    final columns = math.max(
      3,
      ((contentWidth + gridSpacing) / (_targetTileWidth + gridSpacing)).floor(),
    );
    final tileWidth = (contentWidth - gridSpacing * (columns - 1)) / columns;

    // Карточка в альбоме уже портретной, поэтому ужимаем только картинку.
    // Блок под ней (цена, название, описание, кнопка) набран в `.sp` — при
    // повороте он остаётся тех же пикселей, и любое сокращение высоты под
    // ним даёт overflow.
    final gridImageHeight = math.min(tileWidth, portraitImageHeight);
    final catalogSideWidth = (contentWidth - _catalogGap) / 3;

    return QrMenuLayout._(
      isLandscape: true,
      showcaseWidth: showcaseWidth,
      menuWidth: menuWidth,
      gridColumns: columns,
      gridTileHeight: portraitTileHeight -
          (portraitImageHeight - gridImageHeight) +
          _tileSlack,
      gridImageHeight: gridImageHeight,
      catalogImageHeight: math.min(catalogSideWidth, portraitImageHeight),
      listTileHeight: 15.sw,
      basketButtonHeight: 4.sw,
      headerExpandedHeight: null,
      productMediaWidth:
          (size.width * _productMediaFraction).clamp(380.0, 720.0),
      checkoutPanelWidth:
          (size.width * _checkoutPanelFraction).clamp(360.0, 520.0),
    );
  }
}
