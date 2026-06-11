import 'dart:async';
import 'dart:convert';
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
import 'package:qr_pay_app/src/core/mqtt/mqtt_service.dart';

class KioskVm extends ViewModel {
  final BuildContext context;
  KioskVm({required this.context});

  final kioskNameController = TextEditingController();
  final kioskBloc = KioskBloc(kioskRepository: sl<KioskRepository>());

  final deviceInfo = DeviceInfoPlugin();
  String deviceId = '';
  String model = '';
  String deviceName = '';

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
  StreamSubscription? _orphanConfigSub;

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

    _orphanConfigSub ??=
        sl<MqttService>().orphanConfigStream.listen((data) async {
      log('KioskVm: Received orphan config data: $data');
      if (data['registered'] == true) {
        final tenantId = data['tenant_id'];
        final token = data['token'];
        final config = data['config'] ?? {};
        final itemId =
            data['item_id'] ?? config['item_id']; // Handle both just in case

        if (tenantId != null)
          await sl<HostStorage>().saveHost(tenantId.toString());
        if (token != null)
          await sl<KTokenStorage>().saveToken(token.toString());

        try {
          if (deviceId.isNotEmpty) {
            sl<MqttService>().publish(
              'kiosks/orphans/$deviceId',
              '',
              retain: true,
            );
            sl<MqttService>().publish(
              'kiosks/orphans/$deviceId/config',
              '',
              retain: true,
            );
            sl<MqttService>().unsubscribe('kiosks/orphans/$deviceId/config');
            log('KioskVm: Cleared orphan message and config, and unsubscribed');
          }
        } catch (e) {
          log('mqtt clear/unsubscribe error: $e');
        }

        if (itemId != null) {
          if (context.mounted) {
            context.router.replaceAll([
              QrMenuProviderRoute(
                menuId: itemId is int ? itemId : int.parse(itemId.toString()),
                isKiosk: true,
              )
            ]);
          } else {
            log('KioskVm: context is not mounted, skipping navigation');
          }
        } else {
          log('KioskVm: Orphan config has no item_id');
        }
      }
    });
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
    log('Check kiosk. Has internet: ${hasInternet.value}, Device ID: $deviceId');
    if (!hasInternet.value) {
      log('Check kiosk aborted: no internet');
      return; // ✅ важное: без интернета не шлём
    }

    final hasHost = sl<HostStorage>().hasHost();
    log('Check kiosk. Has host: $hasHost');

    if (hasHost) {
      kioskBloc.add(KioskEvent.checkKiosk(deviceId: deviceId));
    } else {
      log('Check kiosk. No host, publishing to orphans topic');
      try {
        if (deviceId.isNotEmpty) {
          sl<MqttService>().publish(
            'kiosks/orphans/$deviceId',
            jsonEncode({
              'ts': DateTime.now().millisecondsSinceEpoch,
              'error': 'no host (new device)',
            }),
            retain: true,
          );
          log('Check kiosk. Publish called');
        } else {
          log('Check kiosk. Device ID is empty!');
        }
      } catch (e) {
        log('mqtt publish error: $e');
      }
    }
  }

  Future<void> initDeviceInfo() async {
    deviceId = await const DeviceIdService().getOrCreate();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceName = await androidDeviceDisplayNameResolved(androidInfo);
      model = androidBuildPropModel(androidInfo);
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceName = iosDeviceDisplayName(iosInfo);
      model = iosInfo.utsname.machine;
    } else {
      deviceName = 'kiosk';
      model = 'kiosk';
    }
    if (deviceName.isEmpty) deviceName = 'unknown';
    if (model.isEmpty) model = 'unknown';

    log('Device UUID: $deviceId');
    log('Device Name: $deviceName');
    log('Device Model: $model');
  }

  Future<void> initData(KioskResponse response, bool save) async {
    log('Init Data: ${response.data?.token}');
    if (save) {
      await sl<KTokenStorage>().saveToken(response.data?.token ?? '');
    }

    try {
      if (deviceId.isNotEmpty) {
        sl<MqttService>().publish(
          'kiosks/orphans/$deviceId',
          '',
          retain: true,
        );
        sl<MqttService>().publish(
          'kiosks/orphans/$deviceId/config',
          '',
          retain: true,
        );
        sl<MqttService>().unsubscribe('kiosks/orphans/$deviceId/config');
        log('KioskVm: Cleared orphan message and config in initData, and unsubscribed');
      }
    } catch (e) {
      log('mqtt clear/unsubscribe error: $e');
    }

    if (context.mounted) {
      context.router.replaceAll([
        QrMenuProviderRoute(
          menuId: response.data!.connection!.itemId!,
          isKiosk: true,
        )
      ]);
    } else {
      log('KioskVm: context is not mounted, skipping navigation in initData');
    }
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
            name: deviceName,
            sectionId: sl<SectionStorage>().hasSectionId()
                ? sl<SectionStorage>().getSectionId()
                : null,
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
    _orphanConfigSub?.cancel();
    _debounce?.cancel();
    _connSub?.cancel();
    _internetChecker.dispose();
    hasInternet.dispose();
    kioskNameController.dispose();
  }
}
