import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_layout.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerQrMenu extends StatelessWidget {
  const ShimmerQrMenu({
    super.key,
    this.height = 150,
    this.isLandscape = false,
  });

  final double height;

  /// Альбом: те же две панели, что и у настоящего меню, иначе контент
  /// «прыгает» в момент подмены шиммера.
  final bool isLandscape;

  @override
  Widget build(BuildContext context) =>
      isLandscape ? _buildLandscape(context) : _buildPortrait(context);

  // ---------------------------------------------------------------- альбом

  Widget _buildLandscape(BuildContext context) {
    final layout = QrMenuLayout.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: layout.showcaseWidth,
          child: SafeArea(
            right: false,
            minimum: const EdgeInsets.fromLTRB(16, 16, 0, 16),
            child: _showcaseSkeleton(),
          ),
        ),
        Expanded(
          child: DecoratedBox(
            // Та же форма, что у настоящей карточки меню (_MenuContent):
            // сверху без скругления, в альбоме скруглён только низ слева.
            decoration: const BoxDecoration(
              color: AppColors.semanticBgSurface1,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _toolbar(),
                const ColumnSpacer(0.8),
                _categoryChips(),
                const ColumnSpacer(1),
                Padding(
                  padding: AppPaddings.horizontal16,
                  child: _block(
                    width: 120,
                    height: 34,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const ColumnSpacer(1),
                // Ряды карточек уходят за нижний край, как настоящая сетка.
                // Ровно обрезанный ряд читается как «дальше есть контент», а
                // не как пустая полоса под тремя прямоугольниками.
                Expanded(
                  child: ClipRect(
                    child: OverflowBox(
                      alignment: Alignment.topCenter,
                      maxHeight: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(2, (_) => _cardRow(layout)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Тулбар меню: переключатель вида, бейдж стола, выбор языка.
  Widget _toolbar() => SizedBox(
        height: kToolbarHeight,
        child: Padding(
          padding: AppPaddings.horizontal16,
          child: Row(
            children: [
              _block(
                width: 32,
                height: 32,
                borderRadius: BorderRadius.circular(8),
              ),
              const Spacer(),
              _block(
                width: 132,
                height: 40,
                borderRadius: BorderRadius.circular(14),
              ),
              const RowSpacer(1.2),
              _block(
                width: 32,
                height: 32,
                borderRadius: BorderRadius.circular(8),
              ),
            ],
          ),
        ),
      );

  Widget _cardRow(QrMenuLayout layout) => Padding(
        padding: AppPaddings.horizontal16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            layout.gridColumns,
            (index) => Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: index == layout.gridColumns - 1
                      ? 0
                      : QrMenuLayout.gridSpacing,
                ),
                child: _cardSkeleton(layout),
              ),
            ),
          ),
        ),
      );

  /// Скелет карточки сетки: повторяет порядок блоков ItemRecomended —
  /// картинка, цена, название в две строки, описание, кнопка снизу.
  Widget _cardSkeleton(QrMenuLayout layout) {
    // gridImageHeight задан только в альбоме; фолбэк на случай, если
    // раскладка и флаг ориентации разойдутся на кадре поворота.
    final imageHeight = layout.gridImageHeight ?? layout.gridTileHeight * 0.5;

    return SizedBox(
      height: layout.gridTileHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ColumnSpacer(1.6),
          _block(
            height: imageHeight,
            borderRadius: BorderRadius.circular(16),
          ),
          const ColumnSpacer(0.8),
          _line(width: 110, height: 26),
          const ColumnSpacer(0.6),
          _line(height: 20),
          const ColumnSpacer(0.4),
          _line(width: 140, height: 20),
          const ColumnSpacer(0.6),
          _line(height: 16),
          const ColumnSpacer(0.4),
          _line(width: 120, height: 16),
          const Spacer(),
          _block(
            height: layout.basketButtonHeight,
            borderRadius: BorderRadius.circular(16),
          ),
        ],
      ),
    );
  }

  /// Витрина рекомендаций: фото во всю панель, снизу тот же градиент и те
  /// же подписи, что рисует RecomendedWidget. Без них панель — просто
  /// большой серый прямоугольник на пол-экрана.
  Widget _showcaseSkeleton() => ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _block(borderRadius: BorderRadius.zero),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.primitiveNeutralwarm1000,
                    AppColors.primitiveNeutralwarm1000.withValues(alpha: 0.1),
                    AppColors.none,
                  ],
                  stops: const [0, 0.35, 1.0],
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _ghost(width: 110, height: 24, radius: 8),
                  const ColumnSpacer(0.8),
                  _ghost(width: 220, height: 26, radius: 6),
                  const ColumnSpacer(0.6),
                  _ghost(width: 280, height: 18, radius: 6),
                  const ColumnSpacer(1.2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _ghost(width: 120, height: 26, radius: 6),
                      _ghost(width: 160, height: 44, radius: 16),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  /// Подписи поверх витрины не мерцают: на тёмном градиенте шиммер того же
  /// цвета, что и фото под ним, просто не виден.
  Widget _ghost({
    required double width,
    required double height,
    required double radius,
  }) =>
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.primitiveNeutralcold0.withValues(alpha: 0.22),
          borderRadius: BorderRadius.circular(radius),
        ),
      );

  // --------------------------------------------------------------- портрет

  Widget _buildPortrait(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Та же высота и скругление, что у настоящего хедера
            // (QrMenuSliverAppBar.expandedHeight), иначе контент
            // «прыгает» в момент подмены шиммера.
            _block(
              height: context.mediaQuery.size.width / 1.3,
              borderRadius: BorderRadius.zero,
            ),
            const ColumnSpacer(1.2),
            _categoryChips(),
            const ColumnSpacer(1),
            Row(
              children: [
                Padding(
                  padding: AppPaddings.horizontal16,
                  child: _block(
                    width: 120,
                    height: 34,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
            const ColumnSpacer(1),
            ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const ColumnSpacer(1.2),
              itemBuilder: (context, index) => Padding(
                padding: AppPaddings.horizontal16,
                child: Row(
                  children: [
                    _block(
                      width: 130,
                      height: 130,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    const RowSpacer(1.2),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _block(
                            width: 240,
                            height: 48,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          const ColumnSpacer(0.4),
                          _block(
                            width: 240,
                            height: 30,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          const ColumnSpacer(1.2),
                          _block(
                            width: 107,
                            height: 40,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------- общее

  /// Высота чипа в настоящей полосе категорий.
  static const double _chipHeight = 45;

  Widget _categoryChips() => SizedBox(
        height: _chipHeight,
        child: ListView.separated(
          padding: AppPaddings.horizontal16,
          itemCount: 12,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const RowSpacer(1),
          itemBuilder: (context, index) => _block(
            width: 85,
            height: _chipHeight,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      );

  /// Полоска текста. Без ширины — во всю ширину родителя.
  Widget _line({double? width, required double height}) {
    final bar = _block(
      width: width,
      height: height,
      borderRadius: BorderRadius.circular(6),
    );
    return width == null
        ? bar
        : Align(alignment: Alignment.centerLeft, child: bar);
  }

  Widget _block({
    double? width,
    double? height,
    required BorderRadius borderRadius,
  }) =>
      Shimmer.fromColors(
        baseColor: AppComponents.shimmerBase,
        highlightColor: AppComponents.shimmerHighlight,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: AppColors.primitiveNeutral0,
          ),
        ),
      );
}
