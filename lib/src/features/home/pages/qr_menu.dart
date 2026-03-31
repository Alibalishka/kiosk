import 'dart:developer';
import 'dart:io' show Platform;

import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/inactivity_watcher.dart';
import 'package:qr_pay_app/src/features/home/vm/service/menu_service.dart';
import 'package:qr_pay_app/src/features/home/widgets/ad_fulll_screen.dart';
import 'package:qr_pay_app/src/features/home/widgets/category_header.dart';
import 'package:qr_pay_app/src/features/home/widgets/grid_menu.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_bottom_bar.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_sliver_app_bar.dart';
import 'package:qr_pay_app/src/features/home/widgets/powered_by_footer.dart';
import 'package:qr_pay_app/src/features/home/widgets/device_info_dialog.dart';
import 'package:qr_pay_app/src/features/home/widgets/language_popup_dialog.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/bloc/kiosk_bloc/kiosk_bloc.dart';
import 'package:qr_pay_app/src/features/kiosk/widgets/kiosk_Interaction_listener.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/bank_cart_bloc/bank_cart_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/qr_menu/qr_menu_bloc.dart';
import 'package:qr_pay_app/src/features/home/widgets/item_menu.dart';
import 'package:qr_pay_app/src/features/home/widgets/shimmer_qr_menu.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:async';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';

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
  int _secretTapCount = 0;
  Timer? _secretTapResetTimer;
  final TextEditingController _exitConfirmController = TextEditingController();
  bool _exitInProgress = false;
  bool _lastAdVisible = false;

  @override
  void initState() {
    super.initState();
    try {
      _appVersion = sl<PackageInfo>().version;
    } catch (_) {
      _appVersion = null;
    }

    _lastAdVisible = viewModel.adVisible;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.syncAdVisibility(_lastAdVisible);
    });
  }

  @override
  void didUpdateWidget(covariant QrMenuPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    final newAdVisible = widget.viewModel.adVisible;
    if (newAdVisible == _lastAdVisible) return;

    _lastAdVisible = newAdVisible;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.syncAdVisibility(newAdVisible);
    });
  }

  @override
  void dispose() {
    _secretTapResetTimer?.cancel();
    _exitConfirmController.dispose();
    viewModel.clearSubscription();
    super.dispose();
  }

  void _handleSecretTap() {
    _secretTapResetTimer?.cancel();
    _secretTapResetTimer = Timer(const Duration(seconds: 2), () {
      _secretTapCount = 0;
    });

    _secretTapCount++;
    if (_secretTapCount >= 10) {
      _secretTapCount = 0;
      _secretTapResetTimer?.cancel();
      DeviceInfoDialog.show(
        context: context,
        viewModel: viewModel,
        appVersion: _appVersion,
        exitInProgress: _exitInProgress,
        exitConfirmController: _exitConfirmController,
        onExitFromKiosk: _exitFromKiosk,
      );
    }
  }

  Future<void> _exitFromKiosk() async {
    if (_exitInProgress) return;
    setState(() => _exitInProgress = true);
    try {
      viewModel.kioskService.stopSendingStatusKiosk();
      sl<KTokenStorage>().deleteToken();
      sl<HostStorage>().deleteHost();
      viewModel.clearBasket();
      if (!mounted) return;
      context.router.replaceAll([const KioskProviderRoute()]);
    } finally {
      if (mounted) setState(() => _exitInProgress = false);
    }
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

  @override
  Widget build(BuildContext context) {
    return KioskInteractionListener(
      kioskService: viewModel.kioskService,
      // onPointerDown: (_) {
      //   // любое касание экрана (и по контенту, и по рекламе)
      //   viewModel.kioskService.onUserInteraction();
      // },
      child: InactivityWatcher(
        isKioskMode: viewModel.isKioskMode,
        inactivityDuration: viewModel.kioskService.idleDuration,
        decisionDuration: const Duration(seconds: 10),
        skipInactivityDialog: viewModel.adVisible,
        onSilentInactivity: () => viewModel.clearBasket(),
        showInactivityDialogIf: () => viewModel.basketService.basket.isNotEmpty,
        onLeave: () {
          viewModel.clearBasket();
          context.router.pop();
        },
        child: Stack(
          children: [
            // --- ВСЁ, ЧТО БЫЛО ВНУТРИ build() РАНЬШЕ: Scaffold ---
            Scaffold(
              backgroundColor: AppComponents.buttondockBgColorDefault,
              bottomNavigationBar: QrMenuBottomBar(viewModel: viewModel),
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
                        if (!Platform.isIOS) {
                          viewModel.checkAndUpdateIfNeeded(serverVersion);
                        }
                        return null;

                        // if (context.router.currentPath == 'kiosk-tech-work') {
                        //   context.read<QrMenuVm>().clearBasket();
                        //   context.read<QrMenuVm>().fetchMenu();
                        //   context.router.popUntil((route) =>
                        //       route.settings.name == QrMenuProviderRoute.name);
                        // }
                      },
                      successTechWork: (response) {
                        // if (context.router.currentPath != 'kiosk-tech-work') {
                        //   context.router.push(
                        //     KioskTechWorkPageRoute(
                        //         code: response.data?.header ?? ''),
                        //   );
                        // }
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
                                route.settings.name ==
                                QrMenuProviderRoute.name);
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
                          context.router
                              .replaceAll([const KioskProviderRoute()]);
                        } else {
                          log('errorCode: $errorCode');
                          if (context.router.currentPath != 'kiosk-tech-work') {
                            context.router.push(
                              KioskTechWorkPageRoute(
                                  code: errorCode.toString()),
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
                    failed: (error, errorCode) {
                      // На экране меню киоска не делаем pop — только показываем ошибку
                      if (context.router.currentPath != 'qr-menu') {
                        context.router.pop();
                      }
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(
                          textAlign: TextAlign.start,
                          message: error,
                        ),
                        dismissType: DismissType.onSwipe,
                      );

                      if (context.router.currentPath != 'kiosk-tech-work') {
                        context.router.push(
                          KioskTechWorkPageRoute(code: 'menu$errorCode'),
                        );
                      }
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
                              child: RefreshIndicator(
                                onRefresh: () => viewModel.refreshMenu(),
                                edgeOffset: 25,
                                color: AppColors.semanticFgDefault,
                                backgroundColor: AppColors.semanticBgSurface1,
                                strokeWidth: 2,
                                elevation: 0,
                                child: CustomScrollView(
                                  physics: viewModel.isKioskMode
                                      ? const AlwaysScrollableScrollPhysics(
                                          parent: ClampingScrollPhysics(),
                                        )
                                      : const AlwaysScrollableScrollPhysics(),
                                  controller:
                                      viewModel.scrollService.scrollController,
                                  slivers: [
                                    QrMenuSliverAppBar(
                                      viewModel: viewModel,
                                      currentLanguageCode:
                                          getCurrentLanguageCode(context),
                                      onLanguageTap: () {
                                        viewModel.kioskService
                                            .onUserInteraction();
                                        LanguagePopupDialog.show(
                                          context: context,
                                          viewModel: viewModel,
                                          onSecretTap: _handleSecretTap,
                                        );
                                      },
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
                                        childCount:
                                            viewModel.flattenedItems.length,
                                      ),
                                    ),
                                    const SliverToBoxAdapter(
                                      child: ColumnSpacer(4),
                                    ),
                                    PoweredByFooter(appVersion: _appVersion),
                                    const SliverToBoxAdapter(
                                      child: ColumnSpacer(2),
                                    ),
                                  ],
                                ),
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
                viewModel.kioskService.isAdVisible &&
                viewModel.kioskService.currentScreenSaver != null)
              Positioned.fill(
                child: AdFullScreen(
                  items: viewModel.kioskService.screenSavers?.data ?? [],
                  // banner: viewModel.kioskService!.currentScreenSaver!,
                  onTap: viewModel.kioskService.onUserInteraction,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
