import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/server/api_error_codes.dart';
import 'package:qr_pay_app/src/core/server/exceptions/network_exception.dart';
import 'package:qr_pay_app/src/core/server/result.dart';
import 'package:qr_pay_app/src/core/utils/qr_pay_image_url.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/utils/version_compare.dart';
import 'package:qr_pay_app/src/core/widgets/safe_network_image.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/features/home/vm/service/alcohol_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/basket_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/kiosk_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/menu_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/scroll_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/table_orders_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/video_service.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_status.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';
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
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/home_repository.dart';
import 'package:qr_pay_app/src/features/home/vm/detail_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/alcohol_warning_dialog.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/checkout_model.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/pay_model.dart';
import 'package:qr_pay_app/src/features/qr/logic/repository/cart_repository.dart';
import 'package:video_player/video_player.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class QrMenuVm extends ViewModel {
  static const String kaspiPayProvider = 'kaspi_pay';
  static const String airbaPayProvider = 'airba_pay';

  /// status_raw, при которых заказ за наличные дошёл до кассы.
  static const Set<String> _payAtVenueAcceptedStatuses = {'new', 'inprogress'};

  final BuildContext context;
  // final bool isTabletMode;
  final BasketService basketService;
  final ScrollService scrollService;
  final VideoPreviewService videoService;
  final MenuDataService menuDataService;
  final AlcoholService _alcoholService = const AlcoholService();

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

  /// Опрос заказов стола (GET /orders/table). Запускает и останавливает его
  /// страница меню; стол и заведение — те же, что уходят в pay-order.
  late final TableOrdersService tableOrders = TableOrdersService();

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
  bool isKioskMode = true;
  bool isTechWork = false;
  bool _adWasVisible = false;
  SectionData? kioskSection;

  /// Кэш предзагруженных видео для ProductPage (по item.id). Таймеры очистки через 2 мин.
  final Map<int, VideoPlayerController> _videoControllerCache = {};
  final Map<int, Timer> _videoCacheTimers = {};

  /// Локальные файлы видео, уже скачанные в дисковый кеш в этой сессии (по URL).
  final Map<String, File> _videoFileCache = {};

  /// Потолок карты локальных видеофайлов.
  static const int _kMaxVideoFileCacheEntries = 60;

  PaymentMethod paymentMethodData = PaymentMethod();
  TextEditingController nameController = TextEditingController();

  // ======= ПРЕДРАСЧЁТ ЗАКАЗА (POST /orders/checkout) =======
  /// Ответ предрасчёта для планшетной корзины: сумма, обслуживание, итого.
  /// null, если нет table_id или запрос не удался — UI работает как раньше.
  ChekoutDatum? checkoutPreview;
  bool checkoutPreviewLoading = false;

  /// Предрасчёт не удался — текст для гостя (400 «Заведение закрыто», нет
  /// связи…). Пока он есть, способов оплаты нет.
  String? checkoutPreviewError;

  /// Ошибка не от сервера (связь, 5xx) — предрасчёт можно повторить.
  bool checkoutPreviewRetryable = false;

  /// pay-order за Kaspi или картой ответил online_payment_disabled, пока
  /// гость был в корзине: эти кнопки убраны до выхода из неё.
  bool _onlinePaymentDisabled = false;

  bool _checkoutPreviewActive = false;
  int _checkoutPreviewIndexType = 1;
  int _checkoutPreviewSeq = 0;
  Timer? _checkoutPreviewDebounce;
  // =========================================================

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
    _checkoutPreviewDebounce?.cancel();

    kioskService.dispose();
    tableOrders.dispose();
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

  void setKioskSection(SectionData? section) {
    final previousTableId = effectiveTableId;
    kioskSection = section;
    // Стол закрепили, сменили или сняли, пока гость в корзине: предрасчёт,
    // а с ним наличные и обслуживание, посчитан для прежнего стола. Опрос
    // статуса с тем же столом заново ничего не запрашивает.
    if (effectiveTableId != previousTableId) _refreshCheckoutPreviewIfActive();
    _syncTableOrdersTable();
    notifyListeners();
  }

  /// `i` и `t` опроса — те же, что в pay-order: `raw.i` и `table_id`. Пока
  /// меню не пришло, заведение — из подключения планшета: заказы стола
  /// зависят только от того, есть ли стол.
  void _syncTableOrdersTable() => tableOrders.setTable(
        venueId: menuData?.organization?.id ?? menuId,
        tableId: effectiveTableId,
      );

  /// Экран «Заказы стола» есть только у киоска, закреплённого за столом.
  bool get hasTableOrders => isKioskMode && effectiveTableId != null;

  /// table_id для pay-order: из QR-параметров, иначе из секции киоска
  /// (kiosk-status → section.tableId). null, если нигде нет.
  String? get effectiveTableId {
    if (tableId.isNotEmpty) return tableId;
    final sectionTableId = kioskSection?.tableId?.toString();
    return (sectionTableId?.isNotEmpty ?? false) ? sectionTableId : null;
  }

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
    bloc.add(QrMenuEvent.fetchQrMenu(menuId!, 'kiosk'));
    // _menuTimer?.cancel();
    if (isKioskMode) {
      _menuTimer = Timer.periodic(const Duration(hours: 5), (_) {
        bloc.add(QrMenuEvent.fetchQrMenu(menuId!, 'kiosk'));
      });
    }
  }

  /// Рефреш только меню (для pull-to-refresh). Ждёт завершения загрузки.
  Future<void> refreshMenu() async {
    if (menuId == null) return;
    bloc.add(QrMenuEvent.fetchQrMenu(menuId!, 'kiosk'));
    await bloc.stream
        .where((s) => s.when(
            initial: () => false,
            loading: () => false,
            success: (_) => true,
            failed: (_, __) => true))
        .first
        .timeout(const Duration(seconds: 30));
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
    _syncTableOrdersTable();
  }

  void clearSubscription() {
    detailVm = null;
    videoService.disposeService();
  }

  Future<void> syncData(QrMenuModel menuData) async {
    this.menuData = menuData;
    _syncTableOrdersTable();
    await videoService.init(menuData);
    menuDataService.setMenuData(menuData);
    if (context.mounted) {
      scrollService.syncWithMenu(context, menuData, isGridView, isTablet);
    }

    if (detailVm != null) detailVm?.syncMenu(menuData);
    notifyListeners();

    // Начинаем прогрев картинок ПОСЛЕ notifyListeners(), чтобы UI
    // сначала построился и видимые виджеты начали грузить свои картинки
    // через высокоприоритетный пул. Prefetch идёт через отдельный
    // низкоприоритетный пул и не блокирует видимые картинки.
    // ignore: unawaited_futures
    Future.delayed(const Duration(milliseconds: 500), () {
      _precacheMenuImages(menuData);
    });
  }

  /// Отменяет прогрев предыдущего меню, когда приходит новое.
  int _precacheGeneration = 0;

  /// Предзагружает изображения блюд в кэш (kioskCacheManager).
  ///
  /// Две фазы, и это принципиально:
  ///   1. лёгкие превью для сетки меню (~33 КБ, отдаются imgproxy мгновенно);
  ///   2. только после них — тяжёлые hero-варианты для ProductPage
  ///      (~220 КБ, imgproxy генерирует их «на холодную» по 5 секунд).
  ///
  /// Раньше обе фазы шли вперемешку и вставали в общую очередь загрузок
  /// вместе с картинками, которые пользователь видит прямо сейчас, — из-за
  /// чего сетка подолгу оставалась пустой.
  Future<void> _precacheMenuImages(QrMenuModel menu) async {
    final generation = ++_precacheGeneration;

    final menuUrls = <String>{};
    final heroUrls = <String>{};

    int? targetW;
    int? targetH;
    if (context.mounted) {
      final px = qrPayHeroImageProxyPixels(context);
      targetW = px.widthPx;
      targetH = px.heightPx;
    }

    void collectFromItems(List<Items>? items) {
      if (items == null) return;
      for (final item in items) {
        final images = item.image;
        if (images == null || images.isEmpty) continue;

        final img = images.first;

        // 1. Для меню: path-first
        final menuUrl = resolveImageDatumUrl(img);
        if (menuUrl.isNotEmpty) {
          menuUrls.add(menuUrl);
        }

        // 2. Для ProductPage: file-first + proxy params
        final rawProductUrl = img.file?.trim() ?? img.path?.trim() ?? '';
        if (rawProductUrl.isNotEmpty) {
          heroUrls.add(normalizeQrPayInsecureImageUrl(
            rawProductUrl,
            targetWidthPx: targetW,
            targetHeightPx: targetH,
          ));
        }
        final previewUrl = img.filePreview;
        if (previewUrl != null && previewUrl.isNotEmpty) {
          heroUrls.add(previewUrl);
          heroUrls.add(normalizeQrPayInsecureImageUrl(
            previewUrl,
            targetWidthPx: targetW,
            targetHeightPx: targetH,
          ));
        }
      }
    }

    // Топовые подборки
    collectFromItems(menu.featured);
    collectFromItems(menu.effectiveRecommend);

    // Категории
    for (final cat in menu.data ?? const <QrMenuDatum>[]) {
      collectFromItems(cat.items);
      collectFromItems(cat.featured);
      collectFromItems(cat.recommend);
    }

    // Один и тот же URL не качаем дважды.
    heroUrls.removeAll(menuUrls);

    await _precacheBatch(menuUrls.toList(), generation);

    // Пауза перед тяжёлой фазой: даём сетке дорисоваться на «холодном» старте.
    await Future<void>.delayed(const Duration(seconds: 2));
    if (generation != _precacheGeneration) return;

    await _precacheBatch(heroUrls.toList(), generation);
  }

  /// Качает список URL пачками. `precacheUrl` сам сидит в низкоприоритетном
  /// пуле, поэтому видимые картинки всегда идут вперёд.
  Future<void> _precacheBatch(List<String> urls, int generation) async {
    const kBatchSize = 12;
    for (var i = 0; i < urls.length; i += kBatchSize) {
      if (generation != _precacheGeneration) return;
      final batch = urls.skip(i).take(kBatchSize).map(precacheUrl);
      await Future.wait(batch);
    }
  }

  /// Предзагрузка видео для item (по тапу). Контроллер кладётся в кэш по item.id.
  void preloadVideoForItem(Items item) {
    final id = item.id;
    if (id == null) return;

    // Если пользователь повторно открыл товар, отменяем таймер удаления
    _videoCacheTimers[id]?.cancel();
    _videoCacheTimers.remove(id);

    if (_videoControllerCache.containsKey(id)) return;
    final images = item.image;
    if (images == null || images.isEmpty) return;
    final file = images.first.file;
    if (file == null || file.isEmpty) return;
    if (!file.toLowerCase().contains('.mp4')) return;

    try {
      // Если этот URL уже качался в фоне в этой сессии — играем локальный
      // файл сразу же, без похода в сеть.
      //
      // Проверяем существование: периодическая чистка кэша
      // (ImageCacheMaintenance) могла удалить файл по сроку хранения, пока
      // ссылка на него ещё лежит в _videoFileCache.
      var localFile = _videoFileCache[file];
      if (localFile != null && !localFile.existsSync()) {
        _videoFileCache.remove(file);
        localFile = null;
      }
      final ctrl = localFile != null
          ? VideoPlayerController.file(localFile)
          : VideoPlayerController.networkUrl(Uri.parse(file));

      // Синхронно кладём в кэш, чтобы ProductPage — который читает
      // getCachedVideoController() сразу следом за preloadVideoForItem() в
      // том же синхронном вызове — точно успел его забрать до конца
      // инициализации. Это даёт ProductPage начать с opacity 0.0 и плавно
      // анимировать появление
      _videoControllerCache[id] = ctrl;

      ctrl.initialize().then((_) async {
        await ctrl.setVolume(0.0);
        await ctrl.setLooping(true);
        notifyListeners();
      }).catchError((_) {
        _videoControllerCache.remove(id);
        ctrl.dispose();
      });

      // Если файла ещё не было локально — тихо докачиваем в фоне (низкий
      // приоритет), чтобы при следующем открытии этого товара видео
      // стартовало мгновенно.
      if (localFile == null) {
        videoCacheThrottled(() async {
          final info = await kioskCacheManager
              .getSingleFile(file)
              .timeout(kVideoFetchTimeout);
          // Карта не должна расти бесконечно на киоске, который не
          // перезапускают неделями.
          if (_videoFileCache.length >= _kMaxVideoFileCacheEntries) {
            _videoFileCache.remove(_videoFileCache.keys.first);
          }
          _videoFileCache[file] = info;
        }).catchError((_) {});
      }
    } catch (_) {}
  }

  /// Возвращает предзагруженный контроллер для item (если есть). Не удаляет из кэша.
  VideoPlayerController? getCachedVideoController(int? itemId) {
    if (itemId == null) return null;
    return _videoControllerCache[itemId];
  }

  /// Вызвать при закрытии ProductPage: запускает таймер 2 мин, после чего контроллер удаляется и диспозится.
  void returnVideoController(int? itemId) {
    if (itemId == null) return;
    _videoCacheTimers[itemId]?.cancel();
    _videoCacheTimers[itemId] = Timer(const Duration(minutes: 2), () {
      final ctrl = _videoControllerCache.remove(itemId);
      _videoCacheTimers.remove(itemId);
      ctrl?.dispose();
    });
  }

  void savePaymentMethod(PaymentMethod paymentMethod) {
    paymentMethodData = paymentMethod;
  }

  Future<void> switchView() async {
    isGridView = !isGridView;

    // Grid и список — принципиально разная раскладка (ряды по 3 карточки
    // против одной карточки на ряд). Если переключать вид, оставаясь
    // прокрученным в середину, SliverList пытается сопоставить старые
    // построенные элементы с новыми на том же пиксельном offset — и его
    // внутренний учёт индексов/офсетов расходится с нашей теоретической
    // таблицей categoryOffsets (чинится только после полного прохода
    // слайвера от начала, например при скролле к первой категории).
    // Поэтому сбрасываем скролл в начало перед пересчётом офсетов — новая
    // раскладка всегда строится с нуля, однозначно.
    if (scrollService.scrollController.hasClients) {
      scrollService.scrollController.jumpTo(0);
    }

    scrollService.syncWithMenu(context, menuData!, isGridView, isTablet);
    await Future.delayed(const Duration(milliseconds: 100));
    notifyListeners();
  }

  /// Поворот экрана: раскладка меняется целиком (две панели вместо одной
  /// колонки, другие размеры карточек), поэтому таблицу офсетов надо
  /// пересчитать. Скролл сбрасываем в начало по той же причине, что и в
  /// [switchView]: сливер иначе сопоставляет старые построенные элементы с
  /// новой раскладкой на том же пиксельном offset.
  Future<void> relayoutForOrientation() async {
    final data = menuData;
    if (data == null) return;

    if (scrollService.scrollController.hasClients) {
      scrollService.scrollController.jumpTo(0);
    }

    scrollService.syncWithMenu(context, data, isGridView, isTablet);
    notifyListeners();

    // Размеры hero-картинки входят в URL прокси, то есть в ключ кеша, и в
    // альбоме они другие. Прогретые до поворота ссылки больше не совпадут с
    // тем, что запросит карточка товара, — греем заново под новую
    // ориентацию, иначе первое открытие каждого товара идёт по сети.
    // ignore: unawaited_futures
    Future.delayed(const Duration(milliseconds: 500), () {
      _precacheMenuImages(data);
    });
  }

  Future<void> checkOrganization() async {
    qrError = organizationId.isEmpty || tableId.isEmpty;
    if (qrError) {
      Vibration.vibrate(preset: VibrationPreset.dramaticNotification);
      notifyListeners();
    }
  }

  Future<void> checkQrCode(BuildContext context, int index) async {
    qrError =
        index == 0 ? organizationId.isEmpty || effectiveTableId == null : false;
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
      organizationSecondId: menuData?.organization?.id,
      tableId: index == 0 ? effectiveTableId : null,
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

  /// Организация работает «в зале» (in_hall приходит как bool / 1 / '1').
  bool get organizationInHall {
    final raw = menuData?.organization?.inHall;
    return raw == true || raw == 1 || raw == '1';
  }

  // ======= ПРЕДРАСЧЁТ ЗАКАЗА (POST /orders/checkout) =======

  /// Включает предрасчёт на время жизни TabletCheckoutPage и сразу запрашивает.
  void startCheckoutPreview({int indexType = 1}) {
    _checkoutPreviewActive = true;
    _checkoutPreviewIndexType = indexType;
    _onlinePaymentDisabled = false;
    fetchCheckoutPreview();
  }

  /// Выключает предрасчёт (при уходе со страницы). Ответы в полёте отбрасываются.
  void stopCheckoutPreview() {
    _checkoutPreviewActive = false;
    _checkoutPreviewDebounce?.cancel();
    _checkoutPreviewSeq++;
    checkoutPreview = null;
    checkoutPreviewLoading = false;
    checkoutPreviewError = null;
    _onlinePaymentDisabled = false;
  }

  /// Смена таба «В зале / С собой» — пересчитываем сразу.
  void setCheckoutPreviewIndexType(int indexType) {
    if (_checkoutPreviewIndexType == indexType) return;
    _checkoutPreviewIndexType = indexType;
    fetchCheckoutPreview();
  }

  /// Идёт пересчёт (ждём дебаунс или ответ сервера) — оплата недоступна,
  /// чтобы не уйти на оплату с устаревшей суммой.
  bool get checkoutPreviewPending =>
      checkoutPreviewLoading || (_checkoutPreviewDebounce?.isActive ?? false);

  /// Дебаунс, чтобы не слать запрос на каждый тап +/− в корзине.
  void _refreshCheckoutPreviewIfActive() {
    if (!_checkoutPreviewActive) return;
    _checkoutPreviewDebounce?.cancel();
    _checkoutPreviewDebounce = Timer(
      const Duration(milliseconds: 350),
      fetchCheckoutPreview,
    );
  }

  /// Запрашивает предрасчёт. Какими способами можно заплатить, решает только
  /// он, поэтому запрос идёт и без стола — тогда заказ навынос.
  Future<void> fetchCheckoutPreview() async {
    _checkoutPreviewDebounce?.cancel();
    if (!_checkoutPreviewActive) return;

    final orgId = menuData?.organization?.posOrgId;
    if (orgId == null || basketService.basket.isEmpty) {
      // Без организации на кассе заказ не рассчитать — и не оплатить.
      final error = orgId == null ? LocaleKeys.checkoutFailed.tr() : null;
      if (checkoutPreview != null ||
          checkoutPreviewLoading ||
          checkoutPreviewError != error) {
        checkoutPreview = null;
        checkoutPreviewLoading = false;
        checkoutPreviewError = error;
        checkoutPreviewRetryable = false;
        notifyListeners();
      }
      return;
    }

    final request = basketService.buildCheckoutRequest(
      organizationId: orgId,
      organizationSecondId: menuData?.organization?.id,
      tableId: effectiveTableId,
      indexType: _checkoutPreviewIndexType,
      addressId: null,
      inHall: organizationInHall && _checkoutPreviewIndexType == 0,
    );
    if (request.items?.isEmpty ?? true) return;

    final seq = ++_checkoutPreviewSeq;
    checkoutPreviewLoading = true;
    notifyListeners();

    try {
      final result = await sl<CartRepository>().fetchChekoutMenu(body: request);
      if (seq != _checkoutPreviewSeq) return; // устаревший ответ
      result.when(
        success: (response) {
          // Пустой ответ — как сбой: способов оплаты из него не узнать.
          final data = response.data;
          checkoutPreview = data;
          checkoutPreviewError =
              data == null ? LocaleKeys.checkoutFailed.tr() : null;
          checkoutPreviewRetryable = data == null;
        },
        failure: (error) {
          log('❌ checkout preview failed: ${error.msg}');
          checkoutPreview = null;
          // 4xx — ответ заведения («Заведение скоро закрывается»): его текст
          // и показываем. Связь и 5xx — наша беда, её можно повторить.
          final status = error.errorCode;
          final rejected = status != null && status >= 400 && status < 500;
          checkoutPreviewError = rejected
              ? _guestErrorText(error, LocaleKeys.checkoutFailed.tr())
              : LocaleKeys.checkoutFailed.tr();
          checkoutPreviewRetryable = !rejected;
        },
      );
    } on Object catch (e) {
      if (seq != _checkoutPreviewSeq) return;
      log('❌ checkout preview error: $e');
      checkoutPreview = null;
      checkoutPreviewError = LocaleKeys.checkoutFailed.tr();
      checkoutPreviewRetryable = true;
    }
    checkoutPreviewLoading = false;
    notifyListeners();
  }

  /// Способы оплаты в корзине — ровно те, что разрешил предрасчёт.
  bool get canPayByKaspi =>
      !_onlinePaymentDisabled && checkoutPreview?.kaspiPayReady == true;

  bool get canPayByCard =>
      !_onlinePaymentDisabled && checkoutPreview?.cardPayReady == true;

  bool get hasAnyPaymentMethod =>
      canPayByKaspi || canPayByCard || hasPayAtVenue;

  /// pay-order за Kaspi или картой ответил online_payment_disabled: обе
  /// кнопки уходят, пока гость не выйдет из корзины.
  void disableOnlinePayments() {
    if (_onlinePaymentDisabled) return;
    _onlinePaymentDisabled = true;
    notifyListeners();
  }

  /// Текст ошибки от сервера (`data.message`), если это не голый машинный
  /// код, — иначе [fallback].
  static String _guestErrorText(NetworkException error, String fallback) {
    final message = error.msg?.trim();
    if (message == null || message.isEmpty || ApiErrorCodes.isKnown(message)) {
      return fallback;
    }
    return message;
  }
  // =========================================================

  List<String> get availablePayments =>
      menuData?.organization?.availablePayments ?? [];

  /// Гостю есть чем заплатить — только тогда показываем «Добавить», иначе
  /// он соберёт заказ и упрётся в корзину без кнопок оплаты. Считаем то,
  /// для чего в корзине есть кнопка: Kaspi, карта и наличные на кассе.
  /// Наличные — только за столом: без стола заказ некуда нести.
  ///
  /// Это лишь прогноз до корзины: какие кнопки в ней показать, решает
  /// предрасчёт ([canPayByKaspi], [canPayByCard], [hasPayAtVenue]).
  bool get hasAvailablePayments =>
      hasKaspiPay || hasAirbaPay || effectiveTableId != null;

  /// Только для прогноза в [hasAvailablePayments], не для кнопок корзины.
  bool get hasKaspiPay => availablePayments.contains(kaspiPayProvider);

  /// Только для прогноза в [hasAvailablePayments], не для кнопок корзины.
  bool get hasAirbaPay => availablePayments.contains(airbaPayProvider);

  int? paymentMethodIdFor(String provider) {
    final methods = paymentMethodData.data;
    if (methods == null) return null;
    for (final method in methods) {
      if (method.provider == provider) return method.id;
    }
    return null;
  }

  int? _paymentMethodIdByProviderContains(String value) {
    final methods = paymentMethodData.data;
    if (methods == null) return null;
    for (final method in methods) {
      if (method.provider?.contains(value) == true) return method.id;
    }
    return null;
  }

  int? resolveTabletPaymentMethodId({required bool isKaspiPay}) {
    final methods = paymentMethodData.data;
    if (methods == null || methods.isEmpty) return null;

    if (isKaspiPay) {
      final nonAirbaMethods =
          methods.where((m) => m.provider != airbaPayProvider);
      return paymentMethodIdFor(kaspiPayProvider) ??
          _paymentMethodIdByProviderContains('kaspi') ??
          (nonAirbaMethods.isNotEmpty
              ? nonAirbaMethods.first.id
              : methods.first.id);
    }

    return paymentMethodIdFor(airbaPayProvider) ??
        _paymentMethodIdByProviderContains('airba');
  }

  Future<void> tabletCheckout(
    BuildContext context, {
    int indexType = 1,
    bool isKaspiPay = true,
  }) async {
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

    final provider = isKaspiPay ? kaspiPayProvider : airbaPayProvider;
    if (isKaspiPay ? !canPayByKaspi : !canPayByCard) {
      log('❌ $provider is not allowed by checkout');
      return;
    }

    final paymentMethodId =
        resolveTabletPaymentMethodId(isKaspiPay: isKaspiPay);
    if (paymentMethodId == null) {
      log('❌ payment method not found for provider: $provider');
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

    final inHall = organizationInHall && indexType == 0;

    final request = basketService.buildCheckoutRequest(
      // orgId,
      // null,
      organizationId: orgId,
      organizationSecondId: menuData?.organization?.id,
      // detailVm?.data.data?.orgId ?? organizationId,
      tableId: effectiveTableId,
      indexType: indexType,
      addressId: null,
      inHall: inHall,
    );
    request.paymentMethodId = paymentMethodId;
    request.isFastpay = !isKaspiPay;
    request.isKaspipay = isKaspiPay;
    request.fullName = nameController.text;

    // Логируем request в формате JSON для удобного чтения
    // log('📦 Request JSON:\n${const JsonEncoder.withIndent('  ').convert(request.toJson())}');

    if (request.items?.isNotEmpty ?? false) {
      if (isKaspiPay) {
        context.router
            .push(KioskKaspiProviderRoute(
              request: request,
              orderWaitTime: menuData?.organization?.orderWaitTime ?? 0,
            ))
            .then((value) => showBottomSheetIfNeeded(context, value));
      } else {
        context.router
            .push(KioskCardProviderRoute(
              request: request,
              orderWaitTime: menuData?.organization?.orderWaitTime ?? 0,
            ))
            .then((value) => showBottomSheetIfNeeded(context, value));
      }
    }
  }

  // ======= ОПЛАТА НА МЕСТЕ (у официанта) =======

  /// pay_at_venue_busy: касса занята заказом этого же стола. Повторяем с тем
  /// же Idempotency-Key через 2–3 с — но не бесконечно.
  static const Duration _payAtVenueBusyDelay = Duration(milliseconds: 2500);
  static const int _payAtVenueBusyRetries = 10;

  /// Ответа нет: связь оборвалась, а заказ мог и создаться. Повтор с тем же
  /// Idempotency-Key — второго заказа сервер не создаст.
  static const Duration _payAtVenueNetworkDelay = Duration(seconds: 3);
  static const int _payAtVenueNetworkRetries = 3;

  /// Доступность и payment_method_id приходят в предрасчёте: в
  /// [paymentMethodData] этого способа может не быть. null — кнопку не
  /// показываем.
  int? get payAtVenuePaymentMethodId {
    // Без стола оплаты у официанта нет: заказ некуда нести. Секция киоска
    // может потерять стол, пока гость в корзине, — старый ответ ещё лежит,
    // а заказ ушёл бы без table_id.
    if (effectiveTableId == null) return null;
    final preview = checkoutPreview;
    if (preview?.payAtVenueReady != true) return null;
    return preview?.payAtVenuePaymentMethodId;
  }

  bool get hasPayAtVenue => payAtVenuePaymentMethodId != null;

  /// Идёт pay-order за наличные. Кнопки оплаты недоступны, чтобы повторный
  /// тап не создал второй заказ.
  bool payAtVenueLoading = false;

  /// Создаёт заказ с оплатой на месте и сразу ведёт на билет с номером:
  /// ждать оплату здесь нечего — гость платит официанту. Успех решает
  /// status_raw в ответе: new / inprogress — заказ принят, иначе он не
  /// дошёл до кассы, и гостю нужен официант.
  ///
  /// Каждый вызов — новое нажатие «Заказать», а значит новый запрос с новым
  /// Idempotency-Key. Повторы внутри вызова идут с тем же ключом.
  Future<void> tabletPayAtVenue(
    BuildContext context, {
    int indexType = 1,
  }) async {
    if (payAtVenueLoading) return;

    final orgId = menuData?.organization?.posOrgId;
    final paymentMethodId = payAtVenuePaymentMethodId;
    if (orgId == null || paymentMethodId == null) {
      log('❌ pay at venue blocked: orgId=$orgId, '
          'paymentMethodId=$paymentMethodId');
      _showPaymentError(
        context,
        'Пожалуйста, обратитесь к менеджеру, чтобы уведомить организацию о проблеме',
      );
      return;
    }

    final request = basketService.buildCheckoutRequest(
      organizationId: orgId,
      organizationSecondId: menuData?.organization?.id,
      tableId: effectiveTableId,
      indexType: indexType,
      addressId: null,
      inHall: organizationInHall && indexType == 0,
    );
    if (request.items?.isEmpty ?? true) return;
    request.paymentMethodId = paymentMethodId;
    request.isFastpay = false;
    request.isKaspipay = false;
    request.fullName = nameController.text;

    payAtVenueLoading = true;
    notifyListeners();

    Result<PayModel>? result;
    try {
      result = await _sendPayAtVenue(
        request,
        isActive: () => context.mounted,
      );
    } on Object catch (e) {
      log('❌ pay at venue error: $e');
    } finally {
      payAtVenueLoading = false;
      notifyListeners();
    }
    if (!context.mounted) return;

    final response = result?.whenOrNull(success: (response) => response);
    if (response == null) {
      final error = result?.whenOrNull(failure: (error) => error);
      log('❌ pay at venue failed: ${error?.msg}, reason: ${error?.reason}');
      _showPaymentError(context, _payAtVenueErrorText(error));
      return;
    }

    // Здесь, в отличие от Kaspi, order_id в корне нет: заказ целиком
    // приходит в data.
    final status = response.data?.statusRaw?.toLowerCase();
    final orderId = response.data?.id;
    if (orderId == null || !_payAtVenueAcceptedStatuses.contains(status)) {
      log('❌ pay at venue not accepted: status=$status, orderId=$orderId');
      _showPaymentError(context, LocaleKeys.payAtVenueCallWaiter.tr());
      return;
    }

    context.router.push(KioskSuccessPageRoute(
      id: orderId,
      orderWaitTime: menuData?.organization?.orderWaitTime ?? 0,
    ));
  }

  /// Шлёт один и тот же [request] — с тем же Idempotency-Key, — пока касса
  /// занята или нет связи. Гость ушёл из корзины ([isActive]) — не повторяем.
  Future<Result<PayModel>> _sendPayAtVenue(
    MenuCheckoutRequest request, {
    required bool Function() isActive,
  }) async {
    var busyRetries = 0;
    var networkRetries = 0;
    while (true) {
      final result = await sl<KioskRepository>().payKaspi(body: request);
      final error = result.whenOrNull(failure: (error) => error);
      if (error == null || !isActive()) return result;

      final Duration delay;
      if (error.reason == ApiErrorCodes.payAtVenueBusy &&
          busyRetries < _payAtVenueBusyRetries) {
        busyRetries++;
        delay = _payAtVenueBusyDelay;
      } else if (error.isNoResponse &&
          networkRetries < _payAtVenueNetworkRetries) {
        networkRetries++;
        delay = _payAtVenueNetworkDelay;
      } else {
        return result;
      }

      log('pay at venue: ${error.reason ?? 'no response'}, '
          'retrying with the same Idempotency-Key');
      await Future<void>.delayed(delay);
      if (!isActive()) return result;
    }
  }

  String _payAtVenueErrorText(NetworkException? error) {
    if (error == null) return LocaleKeys.orderNotPlaced.tr();
    switch (error.reason) {
      case ApiErrorCodes.payAtVenuePosFailed:
      case ApiErrorCodes.payAtVenueRoundUnknown:
        return LocaleKeys.payAtVenueCallWaiter.tr();
      case ApiErrorCodes.payAtVenueBusy:
        // Касса так и не освободилась.
        return _guestErrorText(error, LocaleKeys.payAtVenueCallWaiter.tr());
    }
    // Заказ мог создаться — пусть гость проверит «Заказы стола».
    if (error.isNoResponse) return LocaleKeys.payAtVenueNoConnection.tr();
    return _guestErrorText(error, LocaleKeys.orderNotPlaced.tr());
  }

  void _showPaymentError(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        textAlign: TextAlign.start,
        message: message,
      ),
      dismissType: DismissType.onSwipe,
    );
  }
  // =========================================================

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
  String getModifiers(List<Modifier> data, int itemCount) =>
      basketService.getModifiers(data, itemCount: itemCount);
  List<Items> getRecommended() => basketService.returnRecommended(menuData);
  int getModifierTotalSum() => basketService.getTotalSum();
  bool isItemInBasket(Items item) => basketService.containInBasket(item);

  Future<void> clearBasket() async {
    basketService.clear();
    nameController.clear();
    _refreshCheckoutPreviewIfActive();
    notifyListeners();
  }

  /// Алкоголь, которого ещё нет в заказе, добавляется только после явного
  /// подтверждения возраста. Если товар уже в корзине, гость подтвердил его
  /// раньше — «+» в корзине и на карточке больше не переспрашивает.
  Future<bool> _confirmAlcoholIfNeeded(BuildContext context, Items data) async {
    if (basketService.containInBasket(data)) return true;
    if (!_alcoholService.isAlcoholItem(menuData, data)) return true;

    final confirmed = await AlcoholWarningDialog.show(context);
    // Диалог лежит над страницей и касаний в слушатель киоска не пропускает.
    kioskService.onUserInteraction();
    return confirmed && context.mounted;
  }

  /// `false` — гость отказался подтвердить возраст, товар не добавлен.
  Future<bool> addToBasket(BuildContext context, Items data, int count) async {
    if (!await _confirmAlcoholIfNeeded(context, data)) return false;
    if (!context.mounted) return false;

    await basketService.add(context, data, count);
    _refreshCheckoutPreviewIfActive();
    notifyListeners();
    return true;
  }

  Future<bool> addComboBasket(
      BuildContext context, Items data, int count) async {
    if (!await _confirmAlcoholIfNeeded(context, data)) return false;
    if (!context.mounted) return false;

    bool success = await basketService.addCombo(context, data, count);
    if (success) _refreshCheckoutPreviewIfActive();
    notifyListeners();
    return success;
  }

  Future<void> removeFromBasket(Items item) async {
    await basketService.remove(item);
    _refreshCheckoutPreviewIfActive();
    notifyListeners();
  }

  Future<void> saveModifier(Modifier modifier) async {
    basketService.saveModifier(modifier);
  }
}
