import 'dart:math' as math;
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/inactivity_watcher.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/pages/product_page.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/animated_card.dart';
import 'package:qr_pay_app/src/features/home/widgets/in_restaurant_content.dart';
import 'package:qr_pay_app/src/features/home/widgets/item_checkout.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_layout.dart';
import 'package:qr_pay_app/src/features/home/widgets/tabbar_widget.dart';
import 'package:qr_pay_app/src/features/kiosk/widgets/kiosk_Interaction_listener.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TabletCheckoutPage extends StatefulWidget {
  const TabletCheckoutPage({
    super.key,
  });

  @override
  State<TabletCheckoutPage> createState() => _TabletCheckoutPageState();
}

class _TabletCheckoutPageState extends State<TabletCheckoutPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late QrMenuVm _vm;
  bool _pendingKaspiCheckout = true;

  String _capitalizeFirstLetter(String value) {
    if (value.isEmpty) return value;
    final normalized = value.toLowerCase();
    return normalized[0].toUpperCase() + normalized.substring(1);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);
    _vm = context.read<QrMenuVm>();
    // После первого кадра, чтобы notifyListeners не попал в build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _vm.startCheckoutPreview(indexType: _tabController.index);
    });
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    _vm.setCheckoutPreviewIndexType(_tabController.index);
  }

  @override
  void dispose() {
    _vm.stopCheckoutPreview();
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vmQrMenu = context.read<QrMenuVm>();
    final layout = QrMenuLayout.of(context);
    // В альбоме итоги и оплата уезжают в правую панель, а список блюд
    // занимает левую: иначе кнопка оплаты растягивается на всю ширину, а
    // строки заказа — на 1280 px.
    final isLandscape = layout.isLandscape;

    return KioskInteractionListener(
      kioskService: context.read<QrMenuVm>().kioskService,
      child: InactivityWatcher(
        isKioskMode: context.read<QrMenuVm>().isKioskMode,
        inactivityDuration: context.read<QrMenuVm>().kioskService.idleDuration,
        decisionDuration: const Duration(seconds: 10),
        onLeave: () {
          context.read<QrMenuVm>().clearBasket();
          context.router.pop();
        },
        child: Scaffold(
          appBar: CustomAppBar(
            text: LocaleKeys.yourOrder.tr(),
            height: 80,
            isTablet: true,
            hasLeading: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: AnimatedCard(
                  child: GestureDetector(
                    onTap: () => context.read<QrMenuVm>().clearBasket(),
                    child: SvgPicture.asset(
                      AppSvgImages.trash,
                      height: QrMenuLayout.safeLongSide(context, 3),
                      color: AppColors.semanticErrorDefault,
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: isLandscape
              ? null
              : _CheckoutSummaryPanel(
                  isLandscape: false,
                  onKaspiPay: () =>
                      _onCheckoutPressed(context, isKaspiPay: true),
                  onCardPay: () =>
                      _onCheckoutPressed(context, isKaspiPay: false),
                ),
          body: Consumer<QrMenuVm>(
            builder: (context, value, state) {
              final basket = value.basketService.basket;

              if (basket.isEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (context.mounted) context.router.pop();
                });
              }

              // Табы «В зале / С собой» не нужны, если стол уже известен
              // (table_id из QR или секции киоска): индекс остаётся 0 —
              // заказ уходит как «в зале».
              final showInHallTabs =
                  value.organizationInHall && value.effectiveTableId == null;

              final list = CustomScrollView(
                slivers: [
                  // В альбоме табы живут в правой панели, рядом с оплатой.
                  if (showInHallTabs && !isLandscape) ...[
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _TabBarSliverDelegate(
                        child: TabbarWidget(
                          tabController: _tabController,
                          isTablet: true,
                        ),
                        height: 70,
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  ],

                  // Основной список заказов
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Column(
                          children: [
                            ItemCheckout(
                              item: basket[index],
                              removeTap: () =>
                                  value.removeFromBasket(basket[index]),
                              addTap: () =>
                                  value.addToBasket(context, basket[index], 1),
                            ),
                            if (index != basket.length - 1)
                              Padding(
                                padding: AppPaddings.horizontal12,
                                child: const CustomDivider(),
                              ),
                          ],
                        );
                      },
                      childCount: basket.length,
                    ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 32)),

                  // Рекомендованные товары
                  if (value.getRecommended().isNotEmpty)
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: AppPaddings.horizontal12,
                            child: Text(
                              LocaleKeys.anythingElse.tr(),
                              style: AppTextStyles.headingH3.copyWith(
                                fontSize: vmQrMenu.isTablet ? 16.sp : null,
                                color: AppComponents
                                    .blockBlocktitleHeadingColorDefault,
                              ),
                            ),
                          ),
                          const ColumnSpacer(1.6),
                          SizedBox(
                            // Та же карточка, что в сетке меню. Своя копия
                            // формулы в альбоме давала 340 px под картинку
                            // высотой 427 — карточка уходила в overflow.
                            height: layout.gridTileHeight,
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: AppPaddings.horizontal12,
                              scrollDirection: Axis.horizontal,
                              itemCount: value.getRecommended().length,
                              separatorBuilder: (_, __) => const RowSpacer(1.2),
                              itemBuilder: (context, index) {
                                final recommended =
                                    value.getRecommended()[index];
                                final count =
                                    value.getItemCount(recommended.id ?? 0);
                                final hasModifiers =
                                    recommended.modifiers?.isNotEmpty == true;

                                return ItemRecomended(
                                  item: recommended,
                                  imageHeight: layout.gridImageHeight,
                                  bottom: count == 0
                                      ? AnimatedCard(
                                          child: GestureDetector(
                                            onTap: () => hasModifiers
                                                ? context.router.push(
                                                    ProductPageRoute(
                                                      item: recommended,
                                                    ),
                                                  )
                                                // showCustomSheet(
                                                //     context,
                                                //     child: ProductPage(
                                                //         item: recommended),
                                                //   )
                                                // context.router.push(
                                                //     ProductPageRoute(
                                                //       item: recommended,
                                                //     ),
                                                //   )
                                                //  showCustomSheet(
                                                //     context,
                                                //     child: ProductPage(
                                                //         item: recommended),
                                                //   )
                                                : value.addToBasket(
                                                    context, recommended, 1),
                                            child: Container(
                                              height: vmQrMenu.isTablet
                                                  ? layout.basketButtonHeight
                                                  : 40,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: AppComponents
                                                    .buttongroupButtonGrayBgColorDefault,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    AppSvgImages.plus,
                                                    height: vmQrMenu.isTablet
                                                        ? 14.sp
                                                        : 16,
                                                    color: AppComponents
                                                        .buttongroupButtonGrayTextColorDefault,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: AppColors.semanticBgSurface3,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: AnimatedCard(
                                                  child: GestureDetector(
                                                    onTap: () =>
                                                        value.removeFromBasket(
                                                            recommended),
                                                    child: Container(
                                                      height: 40,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 12,
                                                          horizontal: 16),
                                                      color: AppColors.none,
                                                      child: SvgPicture.asset(
                                                        AppSvgImages.minus,
                                                        color: AppComponents
                                                            .buttongroupButtonGrayIconColorDefault,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              AnimatedSwitcher(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                transitionBuilder:
                                                    (child, animation) =>
                                                        ScaleTransition(
                                                  scale: animation,
                                                  child: child,
                                                ),
                                                child: Text(
                                                  count.toString(),
                                                  key: ValueKey(count),
                                                  style: AppTextStyles
                                                      .bodyLStrong
                                                      .copyWith(
                                                    color: AppComponents
                                                        .buttongroupButtonGrayIconColorDefault,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: AnimatedCard(
                                                  child: GestureDetector(
                                                    onTap: () => hasModifiers
                                                        ? context.router.push(
                                                            ProductPageRoute(
                                                              item: recommended,
                                                            ),
                                                          )
                                                        // showCustomSheet(
                                                        //     context,
                                                        //     child: ProductPage(
                                                        //         item:
                                                        //             recommended),
                                                        //   )
                                                        //  context.router.push(
                                                        //     ProductPageRoute(
                                                        //       item: recommended,
                                                        //     ),
                                                        //   )
                                                        // showCustomSheet(
                                                        //     context,
                                                        //     child: ProductPage(
                                                        //         item:
                                                        //             recommended),
                                                        //   )
                                                        : value.addToBasket(
                                                            context,
                                                            recommended,
                                                            1),
                                                    child: Container(
                                                      height: 40,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 12),
                                                      color: AppColors.none,
                                                      child: SvgPicture.asset(
                                                        AppSvgImages.plus,
                                                        color: AppComponents
                                                            .buttongroupButtonGrayIconColorDefault,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );

              if (!isLandscape) return list;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: list),
                  SizedBox(
                    width: layout.checkoutPanelWidth,
                    child: _CheckoutSummaryPanel(
                      isLandscape: true,
                      header: showInHallTabs
                          ? TabbarWidget(
                              tabController: _tabController,
                              isTablet: true,
                            )
                          : null,
                      onKaspiPay: () =>
                          _onCheckoutPressed(context, isKaspiPay: true),
                      onCardPay: () =>
                          _onCheckoutPressed(context, isKaspiPay: false),
                    ),
                  ),
                ],
              );

              // return CustomScrollView(
              //   slivers: [
              //     const SliverToBoxAdapter(child: SizedBox(height: 16)),
              //     SliverList(
              //       delegate: SliverChildBuilderDelegate(
              //         (context, index) {
              //           return Column(
              //             children: [
              //               ItemCheckout(
              //                 item: basket[index],
              //                 removeTap: () =>
              //                     value.removeFromBasket(basket[index]),
              //                 addTap: () => value.addToBasket(basket[index], 1),
              //               ),
              //               if (index != basket.length - 1)
              //                 Padding(
              //                   padding: AppPaddings.horizontal12,
              //                   child: const CustomDivider(),
              //                 ),
              //             ],
              //           );
              //         },
              //         childCount: basket.length,
              //       ),
              //     ),
              //     const SliverToBoxAdapter(child: SizedBox(height: 32)),
              //   ],
              // );
            },
          ),
        ),
      ),
    );
  }

  void _onCheckoutPressed(
    BuildContext context, {
    required bool isKaspiPay,
  }) {
    final viewModel = context.read<QrMenuVm>();

    // Имя спрашиваем только затем, чтобы заказ нашли, когда неизвестно куда
    // его нести. Если стол известен (table_id из QR или секции киоска),
    // спрашивать нечего — сразу к оплате. Там же, где стол известен, не
    // показываются и табы «В зале / С собой»: заказ всегда уходит в зал.
    final needsName = viewModel.effectiveTableId == null &&
        viewModel.nameController.text.trim().isEmpty;

    if (needsName) {
      _pendingKaspiCheckout = isKaspiPay;
      _showNameInputDialog(context);
      return;
    }

    viewModel.tabletCheckout(
      context,
      indexType: _tabController.index,
      isKaspiPay: isKaspiPay,
    );
  }

  void _showNameInputDialog(BuildContext context) {
    final viewModel = context.read<QrMenuVm>();
    final controller = viewModel.nameController;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.2),
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final size = MediaQuery.sizeOf(context);
        // Клавиатура в альбоме занимает больше половины высоты. Диалог
        // центрируется по всему экрану и о ней не знает — кнопки «Сохранить»
        // и «Пропустить» оказывались под ней.
        final keyboard = MediaQuery.viewInsetsOf(context).bottom;
        final available = size.height - keyboard - 24;

        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: FadeTransition(
            opacity: animation,
            // Нижний отступ по высоте клавиатуры — Center центрирует диалог
            // в оставшейся части экрана, а не во всей.
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              padding: EdgeInsets.only(bottom: keyboard),
              child: Center(
                // ValueListenableBuilder вместо StatefulBuilder с ручным
                // слушателем: тот вешал новый addListener на КАЖДУЮ
                // перестройку, а removeListener(() {}) со свежим замыканием не
                // снимал ничего — слушатели копились на nameController,
                // который живёт во вьюмодели и переживает диалог.
                child: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: controller,
                  builder: (context, _, __) {
                    return SizedBox(
                      // В альбоме 1/1.4 ширины — это 900 px под одно поле
                      // ввода.
                      width: math.min(size.width / 1.4, 560),
                      child: ConstrainedBox(
                        // Ограничение по оставшейся высоте включает прокрутку
                        // внутри: SingleChildScrollView сам сжимается до
                        // содержимого и упирается в этот потолок, только когда
                        // места не хватает.
                        constraints: BoxConstraints(
                          maxHeight: available > 160 ? available : size.height,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Stack(
                            children: [
                              Material(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          LocaleKeys.enterYourName.tr(),
                                          textAlign: TextAlign.center,
                                          style:
                                              AppTextStyles.headingH3.copyWith(
                                            // fontSize:
                                            //     viewModel.isTablet ? 16.sp : null,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        const ColumnSpacer(2.4),
                                        CupertinoTextField(
                                          controller: controller,
                                          placeholder: LocaleKeys.yourName.tr(),
                                          autofocus: true,
                                          maxLength: 10,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[a-zA-Zа-яА-Я]')),
                                            TextInputFormatter.withFunction(
                                                (oldValue, newValue) {
                                              final transformed =
                                                  _capitalizeFirstLetter(
                                                      newValue.text);
                                              return newValue.copyWith(
                                                text: transformed,
                                                selection:
                                                    TextSelection.collapsed(
                                                  offset: transformed.length,
                                                ),
                                              );
                                            }),
                                          ],
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 16),
                                          placeholderStyle:
                                              AppTextStyles.bodyM.copyWith(
                                            // fontSize: viewModel.isTablet
                                            //     ? 14.sp
                                            //     : 18,
                                            fontSize: 14.sp,
                                          ),
                                          style: AppTextStyles.bodyM.copyWith(
                                            // fontSize:
                                            // viewModel.isTablet ? 14.sp : 18,
                                            fontSize: 14.sp,
                                          ),
                                          decoration: const BoxDecoration(
                                            color: CupertinoColors
                                                .quaternarySystemFill,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)),
                                          ),
                                        ),
                                        const ColumnSpacer(1.2),
                                        Text(
                                          LocaleKeys.nameRequired.tr(),
                                          style: AppTextStyles.bodyL.copyWith(
                                            // fontSize: viewModel.isTablet ? 13.sp : null,
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        const ColumnSpacer(1.2),
                                        CupertinoButton(
                                          color: controller.text.trim().isEmpty
                                              ? AppComponents
                                                  .inputPrimaryBgColorDefault
                                              : AppComponents
                                                  .buttongroupButtonPrimaryBgColorDefault,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          onPressed: controller.text
                                                  .trim()
                                                  .isEmpty
                                              ? null
                                              : () {
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                  Navigator.of(context).pop();
                                                  viewModel.tabletCheckout(
                                                    context,
                                                    indexType:
                                                        _tabController.index,
                                                    isKaspiPay:
                                                        _pendingKaspiCheckout,
                                                  );
                                                },
                                          child: Text(
                                            'Сохранить',
                                            style: AppTextStyles.bodyM.copyWith(
                                              fontSize: 18,
                                              color: AppColors
                                                  .primitiveNeutralcold0,
                                            ),
                                          ),
                                        ),
                                        const ColumnSpacer(1.2),
                                        CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            viewModel.nameController.clear();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                            Navigator.of(context).pop();
                                            viewModel.tabletCheckout(
                                              context,
                                              indexType: _tabController.index,
                                              isKaspiPay: _pendingKaspiCheckout,
                                            );
                                          },
                                          child: Text(
                                            'Пропустить',
                                            style: AppTextStyles.bodyM.copyWith(
                                              fontSize: 18,
                                              color: AppComponents
                                                  .buttongroupButtonPrimaryBgColorDefault,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 16,
                                child: GestureDetector(
                                  onTap: () {
                                    viewModel.nameController.clear();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    context.router.pop();
                                  },
                                  child: const Icon(Icons.close, size: 32),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}

/// Итоги заказа и кнопки оплаты.
///
/// В портрете это нижний док во всю ширину, в альбоме — правая панель во всю
/// высоту: кнопка оплаты на 1280 px выглядела бы полосой, а списку блюд нужна
/// ширина, а не высота.
class _CheckoutSummaryPanel extends StatelessWidget {
  const _CheckoutSummaryPanel({
    required this.isLandscape,
    required this.onKaspiPay,
    required this.onCardPay,
    this.header,
  });

  final bool isLandscape;
  final VoidCallback onKaspiPay;
  final VoidCallback onCardPay;

  /// Табы «В зале / С собой». В альбоме они переезжают сюда: выбор способа
  /// заказа логичнее держать рядом с оплатой, чем над списком блюд.
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    final isTablet = context.read<QrMenuVm>().isTablet;

    return Container(
      decoration: BoxDecoration(
        color: AppComponents.buttondockBgColorDefault,
        borderRadius: isLandscape
            ? const BorderRadius.horizontal(left: Radius.circular(24))
            : const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 20,
            offset: isLandscape ? const Offset(-2, 0) : const Offset(0, -2),
          ),
        ],
      ),
      padding: AppPaddings.all,
      child: SafeArea(
        // В альбоме панель прижата к правому краю: слева и сверху её инсеты
        // не касаются. В портрете это обычный док — поведение прежнее.
        left: !isLandscape,
        top: !isLandscape,
        child: Consumer<QrMenuVm>(
          builder: (context, value, state) {
            // Предрасчёт с сервера (есть только при table_id),
            // иначе — локальная сумма корзины, как раньше.
            final preview = value.checkoutPreview;
            final serviceSum = preview?.serviceSum?.toInt() ?? 0;
            final totalPrice =
                preview?.totalPrice ?? value.getTotalPrice().toInt();
            final orderAmount = totalPrice - serviceSum;
            // Пока идёт пересчёт — оплата недоступна.
            final pending = value.checkoutPreviewPending;

            final summary = Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (preview != null) ...[
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: pending ? 0.5 : 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _SummaryRow(
                          title: LocaleKeys.orderAmount.tr(),
                          value: '${priceFormat(orderAmount.toString())} ₸',
                          isTablet: isTablet,
                        ),
                        const ColumnSpacer(0.8),
                        _SummaryRow(
                          title: LocaleKeys.serviceFee.tr(),
                          value: '${priceFormat(serviceSum.toString())} ₸',
                          isTablet: isTablet,
                        ),
                      ],
                    ),
                  ),
                  const ColumnSpacer(1.2),
                  const CustomDivider(),
                  const ColumnSpacer(1.2),
                ],
                _total(context, value, totalPrice, pending, isTablet),
                const ColumnSpacer(1.2),
                // IgnorePointer — чтобы AnimatedCard не «нажимался»,
                // пока кнопки недоступны.
                IgnorePointer(
                  ignoring: pending,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: pending ? 0.5 : 1,
                    child: _payButtons(context, value, pending, isTablet),
                  ),
                ),
              ],
            );

            if (!isLandscape) return summary;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (header != null) ...[
                  header!,
                  const ColumnSpacer(2.4),
                ],
                // reverse прижимает итоги к низу панели, как в портретном
                // доке, и заодно даёт прокрутку, если на коротком альбомном
                // экране они не помещаются.
                Expanded(
                  child: SingleChildScrollView(
                    reverse: true,
                    child: summary,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _total(
    BuildContext context,
    QrMenuVm value,
    int totalPrice,
    bool pending,
    bool isTablet,
  ) {
    final count = value.basketService.basket.length;
    final dishes = '$count ${LocaleKeys.dish.tr()}';
    final price = '${priceFormat(totalPrice.toString())} ₸';

    final amount = AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: FadeTransition(opacity: animation, child: child),
      ),
      child: Text(
        isLandscape ? price : '$dishes $price',
        key: ValueKey('$count-$totalPrice'),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.headingH3.copyWith(
          fontSize: isTablet ? 16.sp : null,
          color: AppComponents.blockBlocktitleHeadingColorDefault,
        ),
      ),
    );

    if (!isLandscape) {
      return Row(
        children: [
          Text(
            LocaleKeys.total.tr(),
            style: AppTextStyles.bodyLStrong.copyWith(
              fontSize: isTablet ? 16.sp : null,
            ),
          ),
          const RowSpacer(1.2),
          // Сумму прижимает вправо Expanded с выравниванием по концу, а не
          // Spacer. Spacer — это Expanded с flex 1: рядом с ним Flexible на
          // сумме делил свободную ширину пополам, и сумма не доезжала до
          // края, в отличие от строк предрасчёта выше.
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (pending) ...[
                  const CupertinoActivityIndicator(),
                  const RowSpacer(1.2),
                ],
                Flexible(child: amount),
              ],
            ),
          ),
        ],
      );
    }

    // В узкой панели «Барлығы» + «1 тағам 3 850 ₸» в одну строку не влезают,
    // и обрезалась именно сумма. Количество блюд уходит второй строкой под
    // подпись, а сумме отдаётся вся оставшаяся ширина — Expanded слева
    // ужимается, сумма не сокращается никогда.
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.total.tr(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyLStrong.copyWith(
                  fontSize: isTablet ? 16.sp : null,
                ),
              ),
              Text(
                dishes,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyM.copyWith(
                  fontSize: isTablet ? 13.sp : null,
                  color: AppComponents.listitemBodytextColorDefault,
                ),
              ),
            ],
          ),
        ),
        const RowSpacer(1.2),
        if (pending) ...[
          const CupertinoActivityIndicator(),
          const RowSpacer(1.2),
        ],
        amount,
      ],
    );
  }

  /// В узкой панели две кнопки рядом не помещаются — FittedBox ужимал бы
  /// подписи до нечитаемого. Ставим их в колонку.
  Widget _payButtons(
    BuildContext context,
    QrMenuVm value,
    bool pending,
    bool isTablet,
  ) {
    final buttons = <Widget>[
      if (value.hasKaspiPay) _kaspiButton(context, pending, isTablet),
      if (value.hasAirbaPay) _cardButton(context, pending, isTablet),
    ];

    if (isLandscape) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int i = 0; i < buttons.length; i++) ...[
            if (i > 0) const ColumnSpacer(1.2),
            buttons[i],
          ],
        ],
      );
    }

    return Row(
      children: [
        for (int i = 0; i < buttons.length; i++) ...[
          if (i > 0) const SizedBox(width: 16),
          Expanded(child: buttons[i]),
        ],
      ],
    );
  }

  Widget _kaspiButton(BuildContext context, bool pending, bool isTablet) {
    return AnimatedCard(
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(16),
        onPressed: pending ? null : onKaspiPay,
        color: const Color(0xffF24634),
        disabledColor: const Color(0xffF24634),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.payWith.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMStrong.copyWith(
                    fontSize: isTablet ? 15.sp : null,
                    color:
                        AppComponents.buttongroupButtonPrimaryTextColorDefault,
                  ),
                ),
                const RowSpacer(1.2),
                SvgPicture.asset(
                  AppSvgImages.qrCode,
                  height: QrMenuLayout.safeLongSide(context, 2.5),
                ),
                const RowSpacer(1.2),
                Text(
                  'Kaspi QR',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMStrong.copyWith(
                    fontSize: isTablet ? 15.sp : null,
                    fontWeight: FontWeight.w800,
                    color:
                        AppComponents.buttongroupButtonPrimaryTextColorDefault,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardButton(BuildContext context, bool pending, bool isTablet) {
    final labelStyle = AppTextStyles.bodyMStrong.copyWith(
      fontSize: isTablet ? 15.sp : null,
      color: AppComponents.buttongroupButtonPrimaryTextColorDefault,
    );

    return AnimatedCard(
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(16),
        onPressed: pending ? null : onCardPay,
        color: AppComponents.buttongroupButtonPrimaryBgColorDefault,
        disabledColor: AppComponents.buttongroupButtonPrimaryBgColorDefault,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Оплата картой |',
                    textAlign: TextAlign.center, style: labelStyle),
                SvgPicture.asset(
                  AppSvgImages.gPayLight,
                  height: QrMenuLayout.safeLongSide(context, 2.2),
                ),
                Text('|', textAlign: TextAlign.center, style: labelStyle),
                const RowSpacer(0.8),
                SvgPicture.asset(
                  AppSvgImages.applePayLight,
                  height: QrMenuLayout.safeLongSide(context, 2.2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabBarSliverDelegate extends SliverPersistentHeaderDelegate {
  _TabBarSliverDelegate({
    required this.child,
    required this.height,
  });

  final Widget child;
  final double height;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox(
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primitiveNeutralcold0,
          boxShadow: overlapsContent
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: child,
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate is _TabBarSliverDelegate && oldDelegate.height != height;
}

/// Строка предрасчёта в нижней панели: «Сумма заказа», «Плата за обслуживание».
class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.title,
    required this.value,
    required this.isTablet,
  });

  final String title;
  final String value;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.bodyL.copyWith(
            fontSize: isTablet ? 14.sp : null,
            color: AppComponents.listitemBodytextColorDefault,
          ),
        ),
        const Spacer(),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: Text(
            value,
            key: ValueKey(value),
            style: AppTextStyles.bodyLStrong.copyWith(
              fontSize: isTablet ? 14.sp : null,
              color: AppComponents.listitemBodytextColorDefault,
            ),
          ),
        ),
      ],
    );
  }
}
