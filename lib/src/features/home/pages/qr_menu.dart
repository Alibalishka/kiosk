import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/features/home/vm/service/menu_service.dart';
import 'package:qr_pay_app/src/features/home/widgets/ad_fulll_screen.dart';
import 'package:qr_pay_app/src/features/home/widgets/category_header.dart';
import 'package:qr_pay_app/src/features/home/widgets/grid_menu.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_category_tabs.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_header.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/bloc/kiosk_bloc/kiosk_bloc.dart';
import 'package:qr_pay_app/src/features/kiosk/widgets/kiosk_Interaction_listener.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/bank_cart_bloc/bank_cart_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/qr_menu/qr_menu_bloc.dart';
import 'package:qr_pay_app/src/features/home/widgets/item_menu.dart';
import 'package:qr_pay_app/src/features/home/widgets/order_interruption.dart';
import 'package:qr_pay_app/src/features/home/widgets/shimmer_qr_menu.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/language_bloc/language_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/language.dart';
import 'package:sizer/sizer.dart';
import 'package:package_info_plus/package_info_plus.dart';

class QrMenuPage extends StatefulWidget {
  const QrMenuPage({
    super.key,
    required this.viewModel,
  });

  final QrMenuVm viewModel;

  @override
  State<QrMenuPage> createState() => QrMenuPageState();
}

class QrMenuPageState extends State<QrMenuPage>
    with ViewModelMixin<QrMenuPage, QrMenuVm>, SingleTickerProviderStateMixin {
  @override
  QrMenuVm get viewModel => widget.viewModel;

  String? _appVersion;

  @override
  void initState() {
    super.initState();
    try {
      _appVersion = sl<PackageInfo>().version;
    } catch (_) {
      _appVersion = null;
    }
  }

  @override
  void dispose() {
    viewModel.clearSubscription();
    super.dispose();
  }

  String getCurrentLanguageCode(BuildContext context) {
    final code = context.locale.languageCode;

    if (code.contains(AppLanguages.kk)) {
      return AppLanguages.kk;
    } else if (code.contains(AppLanguages.ru)) {
      return AppLanguages.ru;
    } else {
      return AppLanguages.en;
    }
  }

  void showLanguagePopup(BuildContext context) {
    final languages = [
      const Language(languageCode: AppLanguages.kk),
      const Language(languageCode: AppLanguages.ru),
      const Language(languageCode: AppLanguages.en),
    ];

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        final currentCode = ctx.locale.languageCode;

        return Center(
          child: Material(
            color: Colors.transparent,
            child: BlocListener<LanguageBloc, LanguageState>(
              bloc: BlocProvider.of<LanguageBloc>(
                  context), // ВАЖНО: контекст снаружи
              listener: (listenerCtx, state) {
                state.maybeWhen(
                  changeSuccess: () {
                    context.router.pop(true);
                    viewModel.fetchMenu();
                  },
                  orElse: () {},
                );
              },
              child: Container(
                width: MediaQuery.of(ctx).size.width * 0.85,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          LocaleKeys.language.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: languages.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                          itemBuilder: (_, index) {
                            final lang = languages[index];
                            final isSelected =
                                currentCode.contains(lang.languageCode);

                            return InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                // ВАЖНО: здесь НЕ закрываем диалог
                                // просто диспатчим событие
                                BlocProvider.of<LanguageBloc>(context).add(
                                  LanguageEvent.languageChangeTappedMenu(
                                    lang.languageCode,
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 10,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      Language.icons[lang.languageCode] ?? '',
                                      width: 3.h,
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      Language.names[lang.languageCode] ??
                                          'Не определено',
                                      style: AppTextStyles.bodyL.copyWith(
                                        fontSize: 17.sp,
                                        color: AppComponents
                                            .listitemTitleColorDefault,
                                      ),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                      isSelected
                                          ? AppSvgImages.radiobuttonOn
                                          : AppSvgImages.radiobuttonOff,
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () => context.router.pop(),
                        child: SvgPicture.asset(
                          AppSvgImages.closeLarge,
                          height: 3.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final adVisible = viewModel.adVisible;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // игнорируем Future — нам важно просто запустить
      viewModel.syncAdVisibility(adVisible);
    });

    return KioskInteractionListener(
      kioskService: viewModel.kioskService,
      // onPointerDown: (_) {
      //   // любое касание экрана (и по контенту, и по рекламе)
      //   viewModel.kioskService.onUserInteraction();
      // },
      child: Stack(
        children: [
          // --- ВСЁ, ЧТО БЫЛО ВНУТРИ build() РАНЬШЕ: Scaffold ---
          Scaffold(
            backgroundColor: AppComponents.buttondockBgColorDefault,
            bottomNavigationBar: viewModel.basketService.basket.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      color: AppComponents.buttondockBgColorDefault,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
                    child: SafeArea(
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(16),
                        onPressed: () => viewModel.isKioskMode
                            ? context.router
                                .push(const TabletCheckoutPageRoute())
                            : context.router
                                .push(const QrMenuCheckoutPageRoute()),
                        color: AppComponents
                            .buttongroupButtonPrimaryBgColorDefault,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.order.tr(),
                              style: AppTextStyles.bodyLStrong.copyWith(
                                fontSize: viewModel.isTablet ? 15.sp : null,
                                color: AppComponents
                                    .buttongroupButtonPrimaryTextColorDefault,
                              ),
                            ),
                            Text(
                              priceFormat(
                                ' ${priceFormat(viewModel.getTotalPrice().toInt().toString())} ₸',
                              ),
                              style: AppTextStyles.bodyLStrong.copyWith(
                                fontSize: viewModel.isTablet ? 15.sp : null,
                                color: AppComponents
                                    .buttongroupButtonPrimaryTextColorDefault,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            body: MultiBlocListener(
              listeners: [
                BlocListener<BankCartBloc, BankCartState>(
                  bloc: viewModel.bankCartBloc,
                  listener: (context, state) => state.maybeWhen(
                    orElse: () => null,
                    successPaymentMehods: (response) =>
                        viewModel.savePaymentMethod(response),
                  ),
                ),
                BlocListener<KioskBloc, KioskState>(
                  bloc: viewModel.kioskService.kioskBloc,
                  listener: (context, state) => state.maybeWhen(
                    orElse: () => null,
                    checkKioskSuccess: (response) =>
                        viewModel.kioskService.updateToken(context, response),
                    successScreenSavers: (response) =>
                        viewModel.kioskService.saveScreenSavers(response),
                    successKioskStatus: (response) {
                      final serverVersion = response.data?.version;
                      viewModel.checkAndUpdateIfNeeded(serverVersion);
                      return null;

                      // if (context.router.currentPath == 'kiosk-tech-work') {
                      //   context.read<QrMenuVm>().clearBasket();
                      //   context.read<QrMenuVm>().fetchMenu();
                      //   context.router.popUntil((route) =>
                      //       route.settings.name == QrMenuProviderRoute.name);
                      // }
                    },
                    successTechWork: (response) {
                      if ((response.data?.active ?? false) == true) {
                        if (context.router.currentPath != 'kiosk-tech-work') {
                          context.router.push(
                            KioskTechWorkPageRoute(
                                code: response.data?.header ?? ''),
                          );
                        }
                      } else if ((response.data?.active ?? false) == false) {
                        if (context.router.currentPath == 'kiosk-tech-work') {
                          context.read<QrMenuVm>().clearBasket();
                          context.read<QrMenuVm>().fetchMenu();
                          context.router.popUntil((route) =>
                              route.settings.name == QrMenuProviderRoute.name);
                        }
                      }
                      return null;
                    },
                    failed: (_, errorCode) {
                      // if (errorCode == 422 || errorCode == 401)
                      if (errorCode == 422) {
                        viewModel.kioskService.stopSendingStatusKiosk();
                        sl<KTokenStorage>().deleteToken();
                        sl<HostStorage>().deleteHost();
                        context.router.replaceAll([const KioskProviderRoute()]);
                      } else {
                        log('errorCode: $errorCode');
                        if (context.router.currentPath != 'kiosk-tech-work') {
                          context.router.push(
                            KioskTechWorkPageRoute(code: errorCode.toString()),
                          );
                        }
                      }
                      return null;
                    },
                  ),
                )
              ],
              child: BlocConsumer<QrMenuBloc, QrMenuState>(
                bloc: viewModel.bloc,
                listener: (context, state) => state.maybeWhen(
                  orElse: () => null,
                  failed: (error, _) {
                    context.router.pop();
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(
                        textAlign: TextAlign.start,
                        message: error,
                      ),
                      dismissType: DismissType.onSwipe,
                    );
                    return null;
                  },
                  success: (responseData) => viewModel.syncData(responseData),
                ),
                builder: (context, state) => state.maybeWhen(
                  loading: () => const ShimmerQrMenu(),
                  orElse: () => viewModel.menuData != null
                      ? Container(
                          decoration: const BoxDecoration(
                            color: AppColors.semanticBgSurface1,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (notification) {
                              // любой скролл = взаимодействие
                              viewModel.kioskService.onUserInteraction();
                              return false;
                            },
                            child: CustomScrollView(
                              // controller:
                              //     viewModel.scrollService.scrollController,
                              physics: viewModel.isKioskMode
                                  ? const ClampingScrollPhysics()
                                  : null,
                              controller:
                                  viewModel.scrollService.scrollController,

                              slivers: [
                                SliverAppBar(
                                  pinned: true,
                                  floating: false,
                                  stretch: true,
                                  elevation: 0,
                                  scrolledUnderElevation: 0,
                                  shadowColor: Colors.transparent,
                                  shape: const Border(
                                    bottom: BorderSide(
                                      color: AppComponents
                                          .buttongroupButtonWhiteBgColorDefault,
                                      width: 0,
                                    ),
                                  ),
                                  expandedHeight: (viewModel.menuData?.recommend
                                              ?.isNotEmpty ??
                                          false)
                                      ? (viewModel.isTablet
                                          ? context.mediaQuery.size.width / 1.3
                                          : 450)
                                      : null,
                                  surfaceTintColor: Colors.transparent,
                                  backgroundColor: AppColors.semanticBgSurface1,
                                  title: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 500),
                                    opacity: viewModel.isAtStart ? 0 : 1,
                                    child: Text(
                                      viewModel.detailVm?.data.data?.name ??
                                          'Меню',
                                      style: AppTextStyles.headingH3.copyWith(
                                        color: AppColors.semanticFgDefault,
                                      ),
                                    ),
                                  ),
                                  leading: viewModel.isTablet
                                      ? viewModel.isKioskMode
                                          ? InkWell(
                                              radius: 100,
                                              focusColor: AppColors.none,
                                              splashColor: AppColors.none,
                                              highlightColor: AppColors.none,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(100),
                                              ),
                                              onTap: () {
                                                viewModel.kioskService!
                                                    .onUserInteraction();
                                                viewModel.switchView();
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: SvgPicture.asset(
                                                  viewModel.isGridView
                                                      ? AppSvgImages.list
                                                      : AppSvgImages.gridview,
                                                  color: AppColors
                                                      .primitiveNeutralcold1000,
                                                ),
                                              ),
                                            )
                                          : null
                                      : InkWell(
                                          radius: 100,
                                          focusColor: AppColors.none,
                                          splashColor: AppColors.none,
                                          highlightColor: AppColors.none,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(100),
                                          ),
                                          onTap: () {
                                            viewModel.kioskService!
                                                .onUserInteraction();
                                            viewModel.basketService.basket
                                                    .isEmpty
                                                ? context.router.pop()
                                                : showCustomSheet(
                                                    context,
                                                    child:
                                                        const FlowInterruption(),
                                                  );
                                          },
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 16),
                                            height: 40,
                                            width: 40,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppComponents
                                                  .buttongroupButtonWhiteBgColorDefault,
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                AppSvgImages.arrowLeft,
                                              ),
                                            ),
                                          ),
                                        ),
                                  actions: [
                                    if (!viewModel.isTablet)
                                      GestureDetector(
                                        onTap: () {
                                          viewModel.kioskService!
                                              .onUserInteraction();
                                          viewModel.switchView();
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: SvgPicture.asset(
                                              viewModel.isGridView
                                                  ? AppSvgImages.list
                                                  : AppSvgImages.gridview,
                                              color: AppColors
                                                  .primitiveNeutralcold1000,
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (viewModel.isKioskMode)
                                      GestureDetector(
                                        onTap: () {
                                          viewModel.kioskService
                                              .onUserInteraction();
                                          showLanguagePopup(context);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: SvgPicture.asset(
                                            Language.icons[
                                                    getCurrentLanguageCode(
                                                        context)] ??
                                                AppSvgImages.russia,
                                            width: 32,
                                          ),
                                        ),
                                      ),
                                  ],
                                  flexibleSpace: (viewModel.menuData?.recommend
                                              ?.isNotEmpty ??
                                          false)
                                      ? FlexibleSpaceBar(
                                          titlePadding: EdgeInsets.zero,
                                          collapseMode: CollapseMode.parallax,
                                          background: RepaintBoundary(
                                            child: QrMenuHeaderBackground(
                                              viewModel: viewModel,
                                              context: context,
                                            ),
                                          ),
                                        )
                                      : null,
                                  // (viewModel.menuData?.recommend
                                  //             ?.isNotEmpty ??
                                  //         false)
                                  //     ? QrMenuHeaderBackground(
                                  //         viewModel: viewModel,
                                  //         context: context,
                                  //       )
                                  //     : null,
                                  bottom:
                                      QrMenuCategoryTabs(viewModel: viewModel),
                                ),
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      final item =
                                          viewModel.flattenedItems[index];

                                      if (item is CategoryTitle) {
                                        return CategoryHeaderWidget(
                                          title: item.title,
                                          recommend: item.recommend,
                                          items: item.items,
                                          viewModel: viewModel,
                                        );
                                      } else if (item is GridMenuItems) {
                                        return GridMenuWidget(
                                          items: item.items,
                                          viewModel: viewModel,
                                        );
                                      } else if (item is SingleMenuItem) {
                                        return ItemMenu(
                                          key: ValueKey(item.item.id),
                                          item: item.item,
                                          viewModel: viewModel,
                                        );
                                      }

                                      return const SizedBox.shrink();
                                    },
                                    childCount: viewModel.flattenedItems.length,
                                  ),
                                ),
                                const SliverToBoxAdapter(
                                  child: ColumnSpacer(5),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ),
          ),

          // --- ПОЛНОЭКРАННАЯ РЕКЛАМА НАД ВСЕМ ---
          if (viewModel.isKioskMode &&
              viewModel.kioskService!.isAdVisible &&
              viewModel.kioskService!.currentScreenSaver != null)
            Positioned.fill(
              child: AdFullScreen(
                items: viewModel.kioskService.screenSavers?.data ?? [],
                // banner: viewModel.kioskService!.currentScreenSaver!,
                onTap: viewModel.kioskService.onUserInteraction,
              ),
            ),

          if (_appVersion != null)
            Positioned(
              right: 12,
              bottom: 8,
              child: Text(
                'v$_appVersion',
                style: AppTextStyles.bodyS.copyWith(
                  decoration: TextDecoration.none,
                  color: AppColors.semanticFgDefault.withOpacity(0.6),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
