import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/bloc/kiosk_bloc/kiosk_bloc.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/requests/kiosk_request.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';
import 'package:qr_pay_app/src/features/kiosk/service/device_id_service.dart';

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

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
    // connectivity показывает “есть ли сеть”, но не гарантирует интернет.
    final ok = await InternetConnectionChecker.instance.hasConnection;
    hasInternet.value = ok;
    log('Internet: $ok');
  }

  // 2) Инициализация как у тебя в initState, но “умная”
  Future<void> runInitFlowIfPossible() async {
    if (_initFlowDone) return; // уже делали (в этой сессии)
    if (!hasInternet.value) return;

    // device info можно получить и без интернета, но делаем аккуратно один раз
    if (!_deviceInfoReady) {
      await initDeviceInfo();
      _deviceInfoReady = true;
    }

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
      model = androidInfo.model;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      model = iosInfo.name;
    }

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

  Future<void> register() async {
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
      return;
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
    } else {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          textAlign: TextAlign.start,
          message: 'Неправильный формат',
        ),
        dismissType: DismissType.onSwipe,
      );
    }
  }

  void disposeVm() {
    _debounce?.cancel();
    _connSub?.cancel();
    hasInternet.dispose();
    kioskNameController.dispose();
  }
}
