import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_layout.dart';
import 'package:sizer/sizer.dart';

class TabbarWidget extends StatefulWidget {
  const TabbarWidget({
    super.key,
    required this.tabController,
    this.isTablet = false,
  });

  final TabController tabController;
  final bool isTablet;

  @override
  State<TabbarWidget> createState() => _TabbarWidgetState();
}

class _TabbarWidgetState extends State<TabbarWidget> {
  late int index;

  @override
  void initState() {
    super.initState();
    // Не 0: при повороте виджет пересоздаётся (табы переезжают из шапки
    // списка в панель корзины), и выбранная вкладка должна остаться
    // подсвеченной, а не сброситься на «В зале».
    index = widget.tabController.index;
    widget.tabController.addListener(_onControllerChanged);
  }

  @override
  void didUpdateWidget(covariant TabbarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tabController == widget.tabController) return;

    oldWidget.tabController.removeListener(_onControllerChanged);
    widget.tabController.addListener(_onControllerChanged);
    index = widget.tabController.index;
  }

  @override
  void dispose() {
    // Контроллер принадлежит родителю и переживает этот виджет: без отписки
    // он продолжает дёргать setState на уничтоженном стейте.
    widget.tabController.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _onControllerChanged() {
    // Слушателя могли уже снять, но notifyListeners идёт по копии списка —
    // вызов всё равно долетит.
    if (!mounted) return;

    final next = widget.tabController.index;
    // Контроллер уведомляет и о начале, и о конце перехода; подсветка
    // зависит только от индекса.
    if (next == index) return;

    setState(() => index = next);
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.isTablet ? 16.0 : 12.0;
    // `.sh` — процент высоты экрана: в альбоме таб и иконка ужимались почти
    // вдвое. safeLongSide держит тот же размер в обеих ориентациях.
    final iconHeight =
        widget.isTablet ? QrMenuLayout.safeLongSide(context, 2.2) : null;
    final fontSize = widget.isTablet ? 14.5.sp : 14.sp;
    final tabHeight =
        widget.isTablet ? QrMenuLayout.safeLongSide(context, 4.5) : null;
    final tabPadding = widget.isTablet
        ? const EdgeInsets.symmetric(horizontal: 12, vertical: 6)
        : AppPaddings.all4;
    final iconSpacer = widget.isTablet ? 1.0 : 0.8;

    return Padding(
      padding: AppPaddings.horizontal12,
      child: Container(
        decoration: BoxDecoration(
          color: AppComponents.buttongroupButtonGrayBgColorDefault,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          boxShadow: widget.isTablet
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: TabBar(
          tabAlignment: TabAlignment.fill,
          padding: tabPadding,
          controller: widget.tabController,
          unselectedLabelColor:
              AppComponents.buttongroupButtonGrayTextColorDefault,
          unselectedLabelStyle: AppTextStyles.bodyLStrong.copyWith(
            fontSize: fontSize,
          ),
          labelColor: AppComponents.buttongroupButtonPrimaryTextColorDefault,
          labelStyle: AppTextStyles.bodyLStrong.copyWith(
            fontSize: fontSize,
          ),
          indicatorWeight: 0,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: AppColors.none,
          indicator: BoxDecoration(
            color: AppComponents.buttongroupButtonPrimaryBgColorDefault,
            borderRadius: BorderRadius.all(Radius.circular(radius - 2)),
            boxShadow: widget.isTablet
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 6,
                      offset: const Offset(0, 1),
                    ),
                  ]
                : null,
          ),
          tabs: [
            _tab(
              asset: AppSvgImages.restaurantWhite,
              label: LocaleKeys.inTheHall.tr(),
              selected: index == 0,
              iconHeight: iconHeight,
              height: tabHeight,
              spacer: iconSpacer,
            ),
            _tab(
              asset: AppSvgImages.walk,
              label: LocaleKeys.takeaway.tr(),
              selected: index == 1,
              iconHeight: iconHeight,
              height: tabHeight,
              spacer: iconSpacer,
            ),
          ],
        ),
      ),
    );
  }

  /// Подпись таба не обрезаем по ширине.
  ///
  /// В альбоме табы живут в узкой панели корзины, и на половину её ширины
  /// «Өзіңізбен бірге» не помещается — Tab не ужимает содержимое сам и
  /// уходит в overflow. FittedBox масштабирует иконку с подписью целиком и
  /// только когда места действительно не хватает: в портрете ширины хватает
  /// и ничего не меняется.
  Widget _tab({
    required String asset,
    required String label,
    required bool selected,
    required double? iconHeight,
    required double? height,
    required double spacer,
  }) {
    return Tab(
      height: height,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          // FittedBox отдаёт неограниченную ширину — Row обязан сжиматься
          // по содержимому, иначе RenderFlex падает.
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                begin: selected
                    ? AppColors.primitiveNeutralcold1000
                    : AppColors.primitiveNeutralcold0,
                end: selected
                    ? AppColors.primitiveNeutralcold0
                    : AppColors.primitiveNeutralcold1000,
              ),
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              builder: (context, color, _) => SvgPicture.asset(
                asset,
                height: iconHeight,
                color: color ?? AppColors.primitiveNeutralcold1000,
              ),
            ),
            RowSpacer(spacer),
            Text(label),
          ],
        ),
      ),
    );
  }
}
