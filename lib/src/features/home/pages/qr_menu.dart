import 'dart:async';
import 'dart:developer';
import 'dart:io' show Platform;
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/inactivity_watcher.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/qr_menu/qr_menu_bloc.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/vm/service/menu_service.dart';
import 'package:qr_pay_app/src/features/home/widgets/ad_fulll_screen.dart';
import 'package:qr_pay_app/src/features/home/widgets/ad_logo_coin_shine.dart';
import 'package:qr_pay_app/src/features/home/widgets/category_header.dart';
import 'package:qr_pay_app/src/features/home/widgets/device_info_dialog.dart';
import 'package:qr_pay_app/src/features/home/widgets/entrance_fade.dart';
import 'package:qr_pay_app/src/features/home/widgets/grid_menu.dart';
import 'package:qr_pay_app/src/features/home/widgets/item_menu.dart';
import 'package:qr_pay_app/src/features/home/widgets/kiosk_table_badge.dart';
import 'package:qr_pay_app/src/features/home/widgets/language_popup_dialog.dart';
import 'package:qr_pay_app/src/features/home/widgets/powered_by_footer.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_bottom_bar.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_header.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_layout.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_sliver_app_bar.dart';
import 'package:qr_pay_app/src/features/home/widgets/shimmer_qr_menu.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/bloc/kiosk_bloc/kiosk_bloc.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';
import 'package:qr_pay_app/src/features/kiosk/service/device_id_service.dart';
import 'package:qr_pay_app/src/features/kiosk/widgets/kiosk_Interaction_listener.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/bank_cart_bloc/bank_cart_bloc.dart';

/// Причина, по которой меню закрыто заглушкой.
enum _OutageKind {
  /// Сервер сам объявил технические работы.
  techWork,

  /// Серия запросов не ушла вовсе — нет сети.
  network,

  /// Сервер отвечает ошибкой.
  server,
}

@immutable
class _Outage {
  const _Outage.techWork()
      : kind = _OutageKind.techWork,
        code = null;

  const _Outage.network()
      : kind = _OutageKind.network,
        code = null;

  const _Outage.server(this.code) : kind = _OutageKind.server;

  final _OutageKind kind;

  /// Числовой хвост для экрана: первая цифра — источник
  /// ([_statusSource] / [_menuSource]), дальше HTTP-код.
  /// Только цифры — персонал диктует его в поддержку как есть.
  final String? code;

  /// Заглушка показана из-за серии неудачных запросов, а не по флагу сервера.
  bool get fromFailures => kind != _OutageKind.techWork;
}

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
  static const MethodChannel _dpc = MethodChannel('dpc');

  /// Источники ошибок в коде для поддержки: статус киоска и меню.
  static const int _statusSource = 1;
  static const int _menuSource = 2;

  /// Сколько первых элементов списка появляются с анимацией. Остальные
  /// строятся уже во время прокрутки и должны показываться сразу.
  static const int _animatedEntranceCount = 8;

  @override
  QrMenuVm get viewModel => widget.viewModel;

  String? _appVersion;
  int _secretTapCount = 0;
  Timer? _secretTapResetTimer;
  final TextEditingController _exitConfirmController = TextEditingController();
  bool _exitInProgress = false;
  bool _lastAdVisible = false;
  bool _managedKioskDisableHandled = false;

  /// Текущая заглушка поверх меню (null — меню доступно).
  _Outage? _outage;

  /// Счётчик подряд идущих ошибок (HTTP и сетевых)
  int _consecutiveFailCount = 0;

  /// Ориентация прошлого кадра. Поворот меняет раскладку целиком, поэтому
  /// таблицу офсетов категорий нужно пересчитать — см. [_syncOrientation].
  Orientation? _lastOrientation;

  /// Порог: 10 попыток × 30 сек ≈ 5 минут
  static const int _maxFailsBeforeError = 10;

  @override
  void initState() {
    super.initState();
    _dpc.setMethodCallHandler(_onNativeCall);
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

  /// Поворот: пересчитываем офсеты категорий под новую раскладку.
  void _syncOrientation(Orientation orientation) {
    final previous = _lastOrientation;
    _lastOrientation = orientation;
    if (previous == null || previous == orientation) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) viewModel.relayoutForOrientation();
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
    _dpc.setMethodCallHandler(null);
    _secretTapResetTimer?.cancel();
    _exitConfirmController.dispose();
    viewModel.clearSubscription();
    super.dispose();
  }

  Future<dynamic> _onNativeCall(MethodCall call) async {
    if (call.method != 'managedConfigChanged') return null;
    final args = call.arguments;
    if (args is! Map) return null;
    final config = Map<String, dynamic>.from(args);
    final kioskDisable = config['kiosk_disable'] == true;
    if (!kioskDisable) {
      _managedKioskDisableHandled = false;
      return null;
    }
    if (_managedKioskDisableHandled) return null;
    _managedKioskDisableHandled = true;

    if (_exitInProgress) return null;
    setState(() => _exitInProgress = true);
    try {
      final deviceId = await const DeviceIdService().getOrCreate();
      await sl<KioskRepository>().disconnectKiosk(deviceId: deviceId);
      await _dpc.invokeMethod('clearDeviceOwner');
    } catch (e) {
      log('kiosk_disable flow failed: $e');
      try {
        await _dpc.invokeMethod('clearDeviceOwner');
      } catch (_) {}
    } finally {
      if (mounted) setState(() => _exitInProgress = false);
    }
    return null;
  }

  /// Запрос не удался. Пока ошибок меньше порога — молчим, меню остаётся
  /// на экране; на пороге показываем заглушку.
  void _registerFailure({required int source, int? errorCode}) {
    _consecutiveFailCount++;
    log('outage source: $source, errorCode: $errorCode, '
        'failCount: $_consecutiveFailCount/$_maxFailsBeforeError');
    if (_consecutiveFailCount < _maxFailsBeforeError) return;

    setState(() {
      _outage = errorCode == null
          ? const _Outage.network()
          : _Outage.server('$source$errorCode');
    });
  }

  /// Сервер снова ответил — снимаем заглушку, если она была показана
  /// из-за серии ошибок (флаг техработ снимает только сам сервер).
  void _registerSuccess() {
    _consecutiveFailCount = 0;
    if (_outage?.fromFailures != true) return;
    setState(() => _outage = null);
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

  Future<void> _openWifiPanel() async {
    try {
      await _dpc.invokeMethod('openWifi');
    } catch (e) {
      log('Wi-Fi panel error: $e');
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

  bool get _adOverlayVisible =>
      viewModel.isKioskMode &&
      viewModel.kioskService.isAdVisible &&
      viewModel.kioskService.currentScreenSaver != null;

  @override
  Widget build(BuildContext context) {
    final layout = QrMenuLayout.of(
      context,
      hasRecommend: viewModel.menuData?.effectiveRecommend.isNotEmpty ?? false,
    );
    _syncOrientation(
      layout.isLandscape ? Orientation.landscape : Orientation.portrait,
    );
    // В альбоме док заказа переезжает под витрину в левую панель, чтобы
    // кнопка не растягивалась на всю ширину экрана.
    final dockInScaffold = layout.showcaseWidth <= 0;

    return KioskInteractionListener(
      kioskService: viewModel.kioskService,
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
            Scaffold(
              backgroundColor: AppComponents.buttondockBgColorDefault,
              bottomNavigationBar:
                  dockInScaffold ? QrMenuBottomBar(viewModel: viewModel) : null,
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
                        _registerSuccess();

                        viewModel.setKioskSection(response.data?.section);
                        final serverVersion = response.data?.version;
                        if (!Platform.isIOS) {
                          viewModel.checkAndUpdateIfNeeded(serverVersion);
                        }

                        if (response.data?.menuEtag !=
                            viewModel.menuData?.organization?.menuEtag) {
                          viewModel.fetchMenu();
                        }

                        if (response.data?.advertisementEtag !=
                            viewModel
                                .kioskService.screenSavers?.advertisementEtag) {
                          viewModel.kioskService.fetchScreenSavers();
                        }
                        return null;
                      },
                      successTechWork: (response) {
                        // techWork ответил — сервер доступен
                        _consecutiveFailCount = 0;
                        final active = response.data?.active ?? false;

                        if (active) {
                          if (_outage?.kind != _OutageKind.techWork) {
                            setState(() => _outage = const _Outage.techWork());
                          }
                        } else if (_outage != null) {
                          setState(() => _outage = null);
                          context.read<QrMenuVm>().clearBasket();
                          context.read<QrMenuVm>().fetchMenu();
                        }
                        return null;
                      },
                      failed: (_, errorCode) {
                        if (errorCode == 422) {
                          viewModel.kioskService.stopSendingStatusKiosk();
                          sl<KTokenStorage>().deleteToken();
                          sl<HostStorage>().deleteHost();
                          context.router
                              .replaceAll([const KioskProviderRoute()]);
                        } else {
                          _registerFailure(
                            source: _statusSource,
                            errorCode: errorCode,
                          );
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

                      _registerFailure(
                        source: _menuSource,
                        errorCode: errorCode,
                      );
                      return null;
                    },
                    success: (responseData) {
                      _registerSuccess();
                      viewModel.syncData(responseData);
                      return null;
                    },
                  ),
                  builder: (context, state) => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    child: state.maybeWhen(
                      loading: () => ShimmerQrMenu(
                        key: const ValueKey('shimmer'),
                        isLandscape: layout.isLandscape,
                      ),
                      orElse: () => viewModel.menuData != null
                          ? _MenuBody(
                              key: const ValueKey('content'),
                              viewModel: viewModel,
                              layout: layout,
                              slivers: _buildSlivers(context),
                            )
                          : const SizedBox.shrink(key: ValueKey('empty')),
                    ),
                  ),
                ),
              ),
            ),

            // --- ПОЛНОЭКРАННАЯ РЕКЛАМА НАД ВСЕМ ---
            if (_outage != null || _adOverlayVisible)
              Positioned.fill(
                // Пока идёт techWork/сеть — оверлей статичный (как раньше).
                // Обычную рекламу пользователь может смахнуть вверх, чтобы
                // увидеть меню под ней — как штору.
                child: _outage != null
                    ? _buildAdOverlayStack()
                    : _AdSwipeUpReveal(
                        onDismissed: viewModel.kioskService.onUserInteraction,
                        child: _buildAdOverlayStack(),
                      ),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSlivers(BuildContext context) {
    return [
      QrMenuSliverAppBar(
        viewModel: viewModel,
        currentLanguageCode: getCurrentLanguageCode(context),
        onLanguageTap: () {
          // context.router.replace(KioskSuccessPageRoute(
          //   id: 150660,
          //   orderWaitTime: 2,
          // ));
          viewModel.kioskService.onUserInteraction();
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
            final item = viewModel.flattenedItems[index];

            Widget? child;
            if (item is CategoryTitle) {
              child = CategoryHeaderWidget(
                title: item.title,
                recommend: item.recommend,
                items: item.items,
                viewModel: viewModel,
              );
            } else if (item is GridMenuItems) {
              child = GridMenuWidget(
                items: item.items,
                viewModel: viewModel,
              );
            } else if (item is SingleMenuItem) {
              child = ItemMenu(
                key: ValueKey(item.item.id),
                item: item.item,
                viewModel: viewModel,
              );
            }

            if (child == null) {
              return const SizedBox.shrink();
            }

            // Появление анимируем только на первом экране: элементы, которые
            // строятся лениво уже во время прокрутки, должны быть видны сразу,
            // иначе список моргает на каждом новом ряду.
            if (index >= _animatedEntranceCount) return child;

            return EntranceFade(
              delay: Duration(milliseconds: 30 * index),
              child: child,
            );
          },
          childCount: viewModel.flattenedItems.length,
        ),
      ),
      const SliverToBoxAdapter(child: ColumnSpacer(4)),
      PoweredByFooter(appVersion: _appVersion),
      // Когда корзина пуста, боттом-бар схлопнут и футер оказывается под
      // системной полосой — добавляем её высоту вручную.
      SliverToBoxAdapter(
        child: SizedBox(height: 8 + MediaQuery.viewPaddingOf(context).bottom),
      ),
    ];
  }

  Widget _buildAdOverlayStack() {
    return Stack(
      fit: StackFit.expand,
      children: [
        IgnorePointer(
          ignoring: _outage != null,
          child: AdFullScreen(
            items: viewModel.kioskService.screenSavers?.data ?? [],
            onTap: viewModel.kioskService.onUserInteraction,
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          child: SafeArea(
            minimum: EdgeInsets.fromLTRB(24, 24, 0, 0),
            child: IgnorePointer(
              child: AdLogoCoinShine(height: 24),
            ),
          ),
        ),
        // Номер стола — крупно в правом нижнем углу, с градиентом на всю
        // ширину. Не перехватывает касания: тап по нему закрывает рекламу
        // так же, как тап по ролику.
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: IgnorePointer(
            child: KioskTableOverlayBadge(
              groupName: viewModel.kioskSection?.groupName,
              number: viewModel.kioskSection?.number,
            ),
          ),
        ),
        if (_outage != null)
          Positioned.fill(
            child: _OutageMessage(
              key: ValueKey('outage_${_outage!.kind}_${_outage!.code}'),
              outage: _outage!,
              onWifiTap: _openWifiPanel,
            ),
          ),
      ],
    );
  }
}

/// Тело экрана меню: слева панель-витрина, справа прокручиваемое меню.
///
/// В портрете витрина нулевой ширины — рекомендации там живут в раскрытом
/// SliverAppBar, как раньше. В альбоме такая шапка (`width / 1.3`) выше
/// самого экрана, поэтому она переезжает в закреплённую левую панель, а
/// меню занимает правую.
///
/// Панель не убирается из дерева условно, а схлопывается до нулевой ширины:
/// иначе при повороте [_MenuContent] меняет место в дереве, пересоздаётся —
/// и общий `scrollService.scrollController` успевает оказаться прицепленным
/// сразу к двум вьюпортам.
class _MenuBody extends StatelessWidget {
  const _MenuBody({
    super.key,
    required this.viewModel,
    required this.layout,
    required this.slivers,
  });

  final QrMenuVm viewModel;
  final QrMenuLayout layout;
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    final hasShowcase = layout.showcaseWidth > 0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: layout.showcaseWidth,
          child: hasShowcase ? _Showcase(viewModel: viewModel) : null,
        ),
        Expanded(
          child: _MenuContent(
            viewModel: viewModel,
            slivers: slivers,
            // Верх без скругления: карточка примыкает к краю экрана, и
            // аппбар внутри неё не срезается по углам. В альбоме остаётся
            // только нижний левый — он смотрит на панель витрины.
            borderRadius: hasShowcase
                ? const BorderRadius.only(bottomLeft: Radius.circular(28))
                : BorderRadius.zero,
          ),
        ),
      ],
    );
  }
}

/// Левая панель альбома: карусель рекомендаций на всю высоту и док заказа
/// под ней. Док здесь, а не в скаффолде, чтобы кнопка «Заказать» не
/// растягивалась полосой во всю ширину альбомного экрана.
class _Showcase extends StatelessWidget {
  const _Showcase({required this.viewModel});

  final QrMenuVm viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SafeArea(
            right: false,
            minimum: const EdgeInsets.fromLTRB(16, 16, 0, 16),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              child: ColoredBox(
                color: Colors.black,
                child: RepaintBoundary(
                  child: QrMenuHeaderBackground(
                    viewModel: viewModel,
                    context: context,
                  ),
                ),
              ),
            ),
          ),
        ),
        QrMenuBottomBar(viewModel: viewModel),
      ],
    );
  }
}

/// Прокручиваемое меню: «карточка» поверх фона скаффолда.
class _MenuContent extends StatelessWidget {
  const _MenuContent({
    required this.viewModel,
    required this.slivers,
    this.borderRadius = BorderRadius.zero,
  });

  final QrMenuVm viewModel;
  final List<Widget> slivers;

  /// Сверху скругления нет — иначе оно срезает углы аппбара внутри
  /// карточки. В альбоме скругляется только нижний левый угол, обращённый
  /// к панели витрины.
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Без clipBehavior декорация не обрезает детей: тёмная подложка
      // хедера с рекомендациями рисует квадратные углы поверх скругления.
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.semanticBgSurface1,
        borderRadius: borderRadius,
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
            controller: viewModel.scrollService.scrollController,
            slivers: slivers,
          ),
        ),
      ),
    );
  }
}

/// Заглушка поверх меню: техработы, ошибка сервера или пропавшая сеть.
class _OutageMessage extends StatelessWidget {
  const _OutageMessage({
    super.key,
    required this.outage,
    required this.onWifiTap,
  });

  final _Outage outage;
  final VoidCallback onWifiTap;

  static const Color _white = AppColors.primitiveNeutralcold0;
  static const Color _black = AppColors.primitiveNeutralcold1000;

  bool get _isNetwork => outage.kind == _OutageKind.network;

  @override
  Widget build(BuildContext context) {
    final title = _isNetwork
        ? LocaleKeys.noInternetConnection.tr()
        : LocaleKeys.kioskUnavailableTitle.tr();
    final description = _isNetwork
        ? LocaleKeys.noInternetDescription.tr()
        : LocaleKeys.kioskUnavailableDescription.tr();
    final code = outage.code;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      builder: (context, t, child) => Opacity(
        opacity: t,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8 * t, sigmaY: 8 * t),
          child: Transform.translate(
            offset: Offset(0, (1 - t) * 24),
            child: child,
          ),
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          color: _black.withValues(alpha: 0.2),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          // В альбоме экран ниже, а строка описания — шире. Держим текст в
          // колонке ограниченной ширины, по центру пока он помещается, и
          // даём прокрутить, если перевод окажется длиннее экрана.
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 760),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.headingH1.copyWith(
                            fontSize: 48,
                            color: _white,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyL.copyWith(
                            fontSize: 28,
                            color: _white.withValues(alpha: 0.8),
                            height: 1.4,
                          ),
                        ),
                        if (_isNetwork || code != null) ...[
                          const SizedBox(height: 48),
                          _GlassPanel(
                            child: Text(
                              _isNetwork
                                  ? LocaleKeys.networkError.tr()
                                  : '${LocaleKeys.errorCode.tr()}: 64${code}19',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.headingH1.copyWith(
                                fontSize: 32,
                                color: _white.withValues(alpha: 0.9),
                              ),
                            ),
                          ),
                        ],
                        if (_isNetwork && Platform.isAndroid) ...[
                          const SizedBox(height: 24),
                          _WifiSettingsButton(onTap: onWifiTap),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Полупрозрачная плашка на тёмном фоне заглушки.
class _GlassPanel extends StatelessWidget {
  const _GlassPanel({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.primitiveNeutralcold0.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primitiveNeutralcold0.withValues(alpha: 0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: child,
      ),
    );
  }
}

class _WifiSettingsButton extends StatelessWidget {
  const _WifiSettingsButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: _GlassPanel(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.wifi,
                color: AppColors.primitiveNeutralcold0,
                size: 28,
              ),
              const SizedBox(width: 12),
              Text(
                LocaleKeys.wifiSettings.tr(),
                style: AppTextStyles.headingH1.copyWith(
                  fontSize: 24,
                  color: AppColors.primitiveNeutralcold0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Обычная реклама (не techWork) — пользователь может смахнуть её вверх,
/// чтобы увидеть меню под ней, как штору. Тап по рекламе (см. AdFullScreen)
/// по-прежнему закрывает её мгновенно — свайп добавляет альтернативный,
/// анимированный способ сделать то же самое.
class _AdSwipeUpReveal extends StatefulWidget {
  const _AdSwipeUpReveal({
    required this.onDismissed,
    required this.child,
  });

  final VoidCallback onDismissed;
  final Widget child;

  @override
  State<_AdSwipeUpReveal> createState() => _AdSwipeUpRevealState();
}

class _AdSwipeUpRevealState extends State<_AdSwipeUpReveal>
    with SingleTickerProviderStateMixin {
  /// 0 — реклама на месте, 1 — полностью ушла вверх за экран.
  late final AnimationController _progress = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 220),
  );

  /// Доля высоты экрана, после которой отпускание пальца доводит рекламу
  /// до конца, а не возвращает на место.
  static const double _dismissThreshold = 0.28;

  /// Скорость свайпа (px/s), достаточная, чтобы закрыть рекламу даже если
  /// палец не дошёл до порога — обычный жест "смахнул".
  static const double _flingVelocity = 700;

  bool _dismissing = false;

  @override
  void dispose() {
    _progress.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_dismissing) return;
    final height = MediaQuery.of(context).size.height;
    if (height <= 0) return;

    // Тянем вверх (delta.dy < 0) — прогресс растёт; вниз — можно вернуть.
    final delta = -details.delta.dy / height;
    _progress.value = (_progress.value + delta).clamp(0.0, 1.0);
  }

  void _onDragEnd(DragEndDetails details) {
    if (_dismissing) return;

    final flungUp = (details.primaryVelocity ?? 0) < -_flingVelocity;
    final pastThreshold = _progress.value > _dismissThreshold;

    if (flungUp || pastThreshold) {
      _dismissing = true;
      _progress.animateTo(1.0, curve: Curves.easeOutCubic).whenComplete(() {
        if (mounted) widget.onDismissed();
      });
    } else {
      _progress.animateTo(0.0, curve: Curves.easeOutCubic);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragUpdate: _onDragUpdate,
      onVerticalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _progress,
        child: widget.child,
        builder: (context, child) {
          final height = MediaQuery.of(context).size.height;
          return Transform.translate(
            offset: Offset(0, -_progress.value * height),
            child: child,
          );
        },
      ),
    );
  }
}
