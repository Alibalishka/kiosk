import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/core/utils/device_display_name.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/bloc/kiosk_bloc/kiosk_bloc.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/requests/kiosk_request.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';
import 'package:qr_pay_app/src/features/kiosk/service/device_id_service.dart';

class KioskVm extends ViewModel {
  final BuildContext context;
  KioskVm({required this.context});

  final kioskNameController = TextEditingController();
  final kioskBloc = KioskBloc(kioskRepository: sl<KioskRepository>());

  final deviceInfo = DeviceInfoPlugin();
  String deviceId = '';
  String model = '';

  // ✅ интернет состояние
  final ValueNotifier<bool> hasInternet = ValueNotifier<bool>(false);
  StreamSubscription? _connSub;
  Timer? _debounce;
  final InternetConnectionChecker _internetChecker =
      InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 2),
    checkInterval: const Duration(seconds: 5),
    addresses: [
      AddressCheckOption(
        uri: Uri.parse('http://1.1.1.1'),
      ),
      AddressCheckOption(
        uri: Uri.parse('http://8.8.8.8'),
      ),
      AddressCheckOption(
        uri: Uri.parse('http://9.9.9.9'),
      ),
    ],
  );

  bool _deviceInfoReady = false;
  bool _initFlowDone = false; // чтобы init flow не запускался 100 раз

  // 1) Это вызываем из initState
  Future<void> initAndWatchInternet() async {
    // первое состояние
    await _updateInternetNow();

    // слушаем изменения сети
    _connSub = Connectivity().onConnectivityChanged.listen((_) {
      // небольшая задержка, чтобы сеть успела подняться
      _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 800), () async {
        await _updateInternetNow();
        // если интернет появился — попробуем выполнить init flow
        if (hasInternet.value) {
          await runInitFlowIfPossible();
        }
      });
    });

    // запускаем init flow сразу, если уже есть интернет
    if (hasInternet.value) {
      await runInitFlowIfPossible();
    }
  }

  Future<void> _updateInternetNow() async {
    // Важно: сначала deviceId/model, потом hasInternet — иначе слушатель в UI
    // успевает вызвать register() с пустыми полями.
    await _ensureDeviceInfoReady();
    final ok = await _logInternetProbe();
    hasInternet.value = ok;
    log('Internet: $ok');
  }

  Future<void> _ensureDeviceInfoReady() async {
    if (_deviceInfoReady) return;
    await initDeviceInfo();
    _deviceInfoReady = true;
  }

  Future<bool> _logInternetProbe() async {
    final hosts = <String>['1.1.1.1', '8.8.8.8', '9.9.9.9'];
    var anyOk = false;
    for (final host in hosts) {
      try {
        final socket = await Socket.connect(
          host,
          53,
          timeout: const Duration(seconds: 2),
        );
        socket.destroy();
        log('Internet probe OK: $host:53');
        anyOk = true;
      } catch (e) {
        log('Internet probe FAIL: $host:53 -> $e');
      }
    }
    return anyOk;
  }

  // 2) Инициализация как у тебя в initState, но “умная”
  Future<void> runInitFlowIfPossible() async {
    if (_initFlowDone) return; // уже делали (в этой сессии)
    if (!hasInternet.value) return;

    await _ensureDeviceInfoReady();

    // checkKiosk делаем только если есть host (как у тебя)
    await checkKiosk();

    _initFlowDone = true;
  }

  Future<void> checkKiosk() async {
    log('Check kiosk');
    if (!hasInternet.value) return; // ✅ важное: без интернета не шлём

    if (sl<HostStorage>().hasHost()) {
      kioskBloc.add(KioskEvent.checkKiosk(deviceId: deviceId));
    }
  }

  Future<void> initDeviceInfo() async {
    deviceId = await const DeviceIdService().getOrCreate();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      model = await androidDeviceDisplayNameResolved(androidInfo);
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      model = iosDeviceDisplayName(iosInfo);
    } else {
      model = 'kiosk';
    }
    if (model.isEmpty) model = 'unknown';

    log('Device UUID: $deviceId');
    log('Device Model: $model');
  }

  Future<void> initData(KioskResponse response, bool save) async {
    log('Init Data: ${response.data?.token}');
    if (save) {
      await sl<KTokenStorage>().saveToken(response.data?.token ?? '');
    }

    context.router.replaceAll([
      QrMenuProviderRoute(
        menuId: response.data!.connection!.itemId!,
        isKiosk: true,
      )
    ]);
  }

  void clearData() {
    kioskNameController.clear();
    sl<KTokenStorage>().deleteToken();
    sl<HostStorage>().deleteHost();
    // разрешаем повторный init flow (если вернутся на этот экран)
    _initFlowDone = false;
  }

  /// `true` — событие регистрации отправлено в bloc; иначе пользователю показана ошибка.
  Future<bool> register() async {
    // ✅ не шлём запросы без интернета
    if (!hasInternet.value) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          textAlign: TextAlign.start,
          message: 'Нет интернета. Подключите Wi-Fi.',
        ),
        dismissType: DismissType.onSwipe,
      );
      return false;
    }

    await _ensureDeviceInfoReady();
    if (deviceId.isEmpty) {
      log('register: deviceId пуст после initDeviceInfo');
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          textAlign: TextAlign.start,
          message: 'Не удалось получить ID устройства. Повторите попытку.',
        ),
        dismissType: DismissType.onSwipe,
      );
      return false;
    }

    final text = kioskNameController.text.trim();

    if (text.contains('_')) {
      final parts = text.split('_');
      await sl<HostStorage>().saveHost(parts[0]);

      kioskBloc.add(
        KioskEvent.register(
          body: KioskRequest(
            deviceId: deviceId,
            model: model,
            connectionCode: parts[1],
          ),
        ),
      );
      return true;
    } else {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          textAlign: TextAlign.start,
          message: 'Неправильный формат',
        ),
        dismissType: DismissType.onSwipe,
      );
      return false;
    }
  }

  void disposeVm() {
    _debounce?.cancel();
    _connSub?.cancel();
    _internetChecker.dispose();
    hasInternet.dispose();
    kioskNameController.dispose();
  }
}
