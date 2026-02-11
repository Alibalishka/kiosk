import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/utils/version_compare.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/features/home/vm/service/basket_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/kiosk_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/menu_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/scroll_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/video_service.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_response.dart';
import 'package:qr_pay_app/src/features/kiosk/service/ota_update.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/bank_cart_bloc/bank_cart_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/payment_method.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_content.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/qr_menu/qr_menu_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/home_repository.dart';
import 'package:qr_pay_app/src/features/home/vm/detail_vm.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class QrMenuVm extends ViewModel {
  final BuildContext context;
  // final bool isTabletMode;
  final BasketService basketService;
  final ScrollService scrollService;
  final VideoPreviewService videoService;
  final MenuDataService menuDataService;

  QrMenuVm({
    required this.context,
    // required this.isTabletMode,
    required this.basketService,
    required this.scrollService,
    required this.videoService,
    required this.menuDataService,
  });

  Timer? _statusTimer; // можешь удалить, если больше нигде не нужен
  Timer? _menuTimer;

  // ======= КИОСК / РЕКЛАМА В СЕРВИСЕ =======
  late final KioskService kioskService = KioskService(
    notifyUi: notifyListeners,
  );
  // =========================================

  bool isAtStart = true;
  DetailVm? detailVm;
  int? menuId;
  late QrMenuBloc bloc;
  late BankCartBloc bankCartBloc;
  QrMenuModel? menuData;

  bool qrError = false;
  String organizationId = '';
  String tableId = '';
  bool isGridView = false;

  bool isTablet = false;
  bool isKioskMode = false;
  bool isTechWork = false;
  bool _adWasVisible = false;

  PaymentMethod paymentMethodData = PaymentMethod();
  TextEditingController nameController = TextEditingController();

  /// Флаг, что мы уже запрашиваем / скачиваем OTA (анти-спам)
  bool otaChecking = false;

  String? lastServerVersionTried;

  @override
  void init() {
    super.init();
    // clearData();
    // kioskBloc = KioskBloc(kioskRepository: sl<KioskRepository>());
    bankCartBloc = BankCartBloc(authRepository: sl<AuthRepository>());

    // kioskService = KioskService(
    //   notifyUi: notifyListeners,
    // );

    isTablet = context.mediaQuery.size.width > 600 ? true : false;
    // isTablet = isTabletMode;
    // context.mediaQuery.size.width > 600 ? true : false;
    scrollService.setListener(notifyListeners);
    bloc = QrMenuBloc(homeRepository: sl<HomeRepository>());
    detailVm?.menuData == null
        ? fetchMenu()
        // bloc.add(QrMenuEvent.fetchQrMenu(menuId!))
        : syncData(detailVm!.menuData!);
    scrollService.init(context);

    if (isKioskMode) {
      kioskService.initKiosk(); // статус + скринсейвер
      fetchPaymentMethods(); // как и раньше
    }
    isGridView = isTablet ? true : false;
  }

  @override
  void dispose() {
    scrollService.dispose();
    _statusTimer?.cancel();
    _menuTimer?.cancel();

    kioskService.dispose();
    super.dispose();
  }

  Future<void> checkAndUpdateIfNeeded(String? serverVersion) async {
    if (serverVersion == null || serverVersion.trim().isEmpty) return;
    if (otaChecking) return;

    // анти-спам: если уже пытались обновиться на эту версию — не повторяем
    if (lastServerVersionTried == serverVersion) return;

    otaChecking = true;
    try {
      final info = await PackageInfo.fromPlatform();
      final current = info.version; // например "2.7.5"

      final cmp = compareSemver(current, serverVersion);
      // cmp < 0 => текущая меньше => надо обновиться
      if (cmp < 0) {
        log('[OTA] current=$current server=$serverVersion -> starting update');
        await sl<OtaUpdateService>().downloadAndInstall();
        lastServerVersionTried = serverVersion;
      }
    } catch (e) {
      log('[OTA] update failed: $e');
    } finally {
      otaChecking = false;
    }
  }

  bool get adVisible =>
      isKioskMode &&
      kioskService.isAdVisible &&
      kioskService.currentScreenSaver != null;

  Future<void> syncAdVisibility(bool isVisible) async {
    if (_adWasVisible == isVisible) return;
    _adWasVisible = isVisible;

    if (isVisible) {
      await videoService.suspend(); // освобождаем decoder
    } else {
      await videoService.resume(); // вернём видео (из кеша)
    }

    notifyListeners(); // важно: после resume/suspend
  }

  void fetchMenu() {
    bloc.add(QrMenuEvent.fetchQrMenu(menuId!));
    // _menuTimer?.cancel();
    if (isKioskMode) {
      _menuTimer = Timer.periodic(const Duration(hours: 10), (_) {
        bloc.add(QrMenuEvent.fetchQrMenu(menuId!));
      });
    }
  }

  void fetchPaymentMethods() => bankCartBloc.add(
        const BankCartEvent.fetchPaymentMethods(),
      );

  void clearData() {
    scrollService.reset();
    basketService.clear();
    organizationId = '';
    tableId = '';
    qrError = false;
  }

  void clearSubscription() {
    detailVm = null;
    videoService.disposeService();
  }

  Future<void> syncData(QrMenuModel menuData) async {
    this.menuData = menuData;
    await videoService.init(menuData);
    menuDataService.setMenuData(menuData);
    if (context.mounted) {
      scrollService.syncWithMenu(context, menuData, isGridView, isTablet);
    }
    if (detailVm != null) detailVm?.syncMenu(menuData);
    notifyListeners();
  }

  void savePaymentMethod(PaymentMethod paymentMethod) {
    paymentMethodData = paymentMethod;
  }

  Future<void> switchView() async {
    isGridView = !isGridView;
    scrollService.syncWithMenu(context, menuData!, isGridView, isTablet);
    await Future.delayed(const Duration(milliseconds: 100));
    notifyListeners();
  }

  Future<void> checkOrganization() async {
    qrError = organizationId.isEmpty || tableId.isEmpty;
    if (qrError) {
      Vibration.vibrate(preset: VibrationPreset.dramaticNotification);
      notifyListeners();
    }
  }

  Future<void> checkQrCode(BuildContext context, int index) async {
    qrError = index == 0 ? organizationId.isEmpty || tableId.isEmpty : false;
    if (qrError) {
      Vibration.vibrate(preset: VibrationPreset.dramaticNotification);
      notifyListeners();
      return;
    }

    final request = basketService.buildCheckoutRequest(
      // detailVm?.data.data?.orgId ?? organizationId,
      // index == 0 ? tableId : null,
      organizationId: menuData?.organization?.posOrgId ?? '',
      // detailVm?.data.data?.orgId ?? organizationId,
      tableId: index == 0 ? tableId : null,
      indexType: index,
      addressId: null,
    );

    if (request.items!.isNotEmpty) {
      context.router
          .push(CheckoutProviderRoute(
            isMenuRequest: true,
            menuRequest: request,
          ))
          .then((value) => showBottomSheetIfNeeded(context, value));
    }

    await Future.delayed(const Duration(milliseconds: 200));
    notifyListeners();
  }

  Future<void> tabletCheckout(BuildContext context) async {
    // final orgId = menuData?.organization?.iikoOrgId;
    final orgId = menuData?.organization?.posOrgId;

    if (orgId == null) {
      log('❌ iikoOrgId is null, checkout blocked');
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          textAlign: TextAlign.start,
          message:
              'Пожалуйста, обратитесь к менеджеру, чтобы уведомить организацию о проблеме',
        ),
        dismissType: DismissType.onSwipe,
      );
      return;
    }

    if (paymentMethodData.data == null || paymentMethodData.data!.isEmpty) {
      log('❌ paymentMethodData is empty, checkout blocked');
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          textAlign: TextAlign.start,
          message: 'Не найдены способы оплаты. Обратитесь к менеджеру.',
        ),
        dismissType: DismissType.onSwipe,
      );
      return;
    }

    log('✅ iikoOrgId: $orgId');

    final request = basketService.buildCheckoutRequest(
      // orgId,
      // null,
      organizationId: orgId,
      // detailVm?.data.data?.orgId ?? organizationId,
      tableId: null,
      indexType: 1,
      addressId: null,
    );
    request.paymentMethodId = paymentMethodData.data![0].id;
    request.isFastpay = false;
    request.isKaspipay = true;
    request.fullName = nameController.text;

    if (request.items?.isNotEmpty ?? false) {
      context.router
          .push(KioskKaspiProviderRoute(request: request))
          .then((value) => showBottomSheetIfNeeded(context, value));
    }
  }

  void showBottomSheetIfNeeded(BuildContext context, dynamic value) {
    if (value != null) {
      showCustomSheet(
        context,
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.semanticBgSurface1,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: BottomSheetContent(
            title: LocaleKeys.noBillsPay.tr(),
            text: value.toString(),
            buttonText: LocaleKeys.close.tr(),
            icon: AppWebpImages.noOrder,
          ),
        ),
      );
    }
  }

  List<FlattenedMenuItem> get flattenedItems =>
      menuDataService.flattenedItems(menuData, isGridView);

  Future<void> scrollByCategory(String category, int index) async {
    scrollService.scrollToCategory(category, index);
    notifyListeners();
  }

  double getTotalPrice() => basketService.getTotalPrice();
  int getItemCount(int id) => basketService.getCount(id);
  int getItemTotalPrice(Items item) => basketService.getItemTotalPrice(item);
  String getModifiers(List<Modifier> data) => basketService.getModifiers(data);
  List<Items> getRecommended() => basketService.returnRecommended(menuData);
  int getModifierTotalSum() => basketService.getTotalSum();
  bool isItemInBasket(Items item) => basketService.containInBasket(item);

  Future<void> clearBasket() async {
    basketService.clear();
    nameController.clear();
    notifyListeners();
  }

  Future<void> addToBasket(BuildContext context, Items data, int count) async {
    await basketService.add(context, data, count);
    notifyListeners();
  }

  Future<bool> addComboBasket(
      BuildContext context, Items data, int count) async {
    bool success = await basketService.addCombo(context, data, count);
    notifyListeners();
    return success;
  }

  Future<void> removeFromBasket(Items item) async {
    await basketService.remove(item);
    notifyListeners();
  }

  Future<void> saveModifier(Modifier modifier) async {
    basketService.saveModifier(modifier);
  }
}
