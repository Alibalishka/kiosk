import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/bloc/kiosk_bloc/kiosk_bloc.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/requests/kiosk_status_request.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/screen_savers_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';

import 'dart:async';
import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/features/kiosk/service/device_id_service.dart';

class KioskService {
  final void Function() notifyUi;
  final KioskBloc kioskBloc;

  /// ✅ UUID сервис (можно внедрять через sl, но так тоже ок)
  final DeviceIdService _deviceIdService;

  /// ✅ кешируем один раз
  String? _deviceId;

  /// периодическая отправка статуса киоска
  Timer? _statusTimer;
  Timer? _timerTechWork;

  /// таймер простоя
  Timer? _idleTimer;

  /// таймер показа конкретной рекламы
  Timer? _adTimer;

  ScreenSaversResponse? _screenSavers;
  ScreenSaversDatum? _currentScreenSaver;
  bool _isAdVisible = false;
  int _currentScreenSaverIndex = -1;

  Duration idleDuration = const Duration(minutes: 2);

  bool _isTextInputActive = false;

  KioskService({
    required this.notifyUi,
    KioskBloc? kioskBloc,
    DeviceIdService? deviceIdService,
  })  : kioskBloc =
            kioskBloc ?? KioskBloc(kioskRepository: sl<KioskRepository>()),
        _deviceIdService = deviceIdService ?? const DeviceIdService();

  // ==== public getters для VM/UI ====
  ScreenSaversResponse? get screenSavers => _screenSavers;
  ScreenSaversDatum? get currentScreenSaver => _currentScreenSaver;
  bool get isAdVisible => _isAdVisible;

  // чтобы в UI можно было использовать BlocListener
  KioskBloc get bloc => kioskBloc;

  // ================== DEVICE ID ===================

  Future<void> _ensureDeviceId() async {
    _deviceId ??= await _deviceIdService.getOrCreate();
  }

  Future<String> _getDeviceId() async {
    await _ensureDeviceId();
    return _deviceId!;
  }

  // ================== ЖИЗНЕННЫЙ ЦИКЛ ===================

  /// вызывать из VM, когда включён kioskMode
  Future<void> initKiosk() async {
    // ✅ важно: заранее получить UUID (чтобы таймеры не гоняли async)
    await _ensureDeviceId();

    sendStatusKioskPeriodically();
    fetchScreenSavers();
    _startIdleTimer();
    sendTechWork();
  }

  /// вызывать из dispose VM
  void dispose() {
    _statusTimer?.cancel();
    _timerTechWork?.cancel();
    _idleTimer?.cancel();
    _adTimer?.cancel();
  }

  void updateToken(
    BuildContext context,
    KioskResponse response,
  ) {
    context.router.replaceAll([
      QrMenuProviderRoute(
        menuId: response.data!.connection!.itemId!,
        isKiosk: true,
      )
    ]);
  }

  // ================= ОТПРАВКА СТАТУСА ==================

  void sendStatusKioskPeriodically() {
    _statusTimer?.cancel();
    sendStatusKiosk();
    _statusTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      sendStatusKiosk();
    });
  }

  void sendTechWork() {
    _timerTechWork?.cancel();
    kioskBloc.add(const KioskEvent.techWork());
    _timerTechWork = Timer.periodic(const Duration(seconds: 30), (_) {
      kioskBloc.add(const KioskEvent.techWork());
    });
  }

  void stopSendingStatusKiosk() {
    _statusTimer?.cancel();
    _statusTimer = null;
  }

  Future<void> sendStatusKiosk() async {
    final connectivityInstance = Connectivity();
    final result = await connectivityInstance.checkConnectivity();

    final battery = Battery();
    final state = await battery.batteryState;

    // 🔋 уровень батареи (0–100)
    // final int level = 100;
    final int level = await battery.batteryLevel;

    // ✅ UUID из secure storage
    final deviceId = await _getDeviceId();

    kioskBloc.add(
      KioskEvent.sendStatusKiosk(
        body: KioskStatusRequest(
          batteryLevel: level,
          batteryStatus: _getBatteryStatus(state),
          networkLevel: 100,
          // ⚠️ зависит от версии connectivity_plus:
          // если у тебя возвращается List — оставь result[0]
          // если один ConnectivityResult — используй result
          networkType: _getNetworkType(result is List ? result[0] : result),
          screenStatus: 'active',
          status: 'online',
        ),
        deviceId: deviceId,
      ),
    );
  }

  Future<void> checkKiosk() async {
    final deviceId = await _getDeviceId();
    kioskBloc.add(KioskEvent.checkKiosk(deviceId: deviceId));
  }

  String _getBatteryStatus(BatteryState state) {
    switch (state) {
      case BatteryState.charging:
        return "charging";
      case BatteryState.full:
        return "full";
      case BatteryState.discharging:
        return "discharging";
      case BatteryState.connectedNotCharging:
        return "connectedNotCharging";
      case BatteryState.unknown:
        return "unknown";
    }
  }

  String _getNetworkType(dynamic result) {
    // result может быть ConnectivityResult
    if (result is ConnectivityResult) {
      switch (result) {
        case ConnectivityResult.mobile:
          return "Mobile";
        case ConnectivityResult.wifi:
          return "Wi-Fi";
        case ConnectivityResult.ethernet:
          return "Ethernet";
        case ConnectivityResult.bluetooth:
          return "Bluetooth";
        case ConnectivityResult.vpn:
          return "VPN";
        case ConnectivityResult.none:
          return "None";
        case ConnectivityResult.other:
          return "Другое";
      }
    }
    return "Unknown";
  }

  // ================= СКРИНСЕЙВЕР / РЕКЛАМА =================

  Future<void> fetchScreenSavers() async {
    final deviceId = await _getDeviceId();

    kioskBloc.add(
      KioskEvent.fetchScreenSavers(deviceId: deviceId),
    );
  }

  /// вызывай из BlocListener, когда придёт успешный стейт
  void saveScreenSavers(ScreenSaversResponse response) {
    _screenSavers = response;
    idleDuration = Duration(
      seconds: response.idleTimeout ?? 10,
    );

    _startIdleTimer();
    notifyUi();
  }

  void _startIdleTimer() {
    _idleTimer?.cancel();

    if (!(_screenSavers?.data?.isNotEmpty ?? false)) return;

    _idleTimer = Timer(idleDuration, _showNextAd);
  }

  void _showNextAd() {
    final list = (_screenSavers?.data ?? [])
        .where((e) =>
            (e.image?.isNotEmpty ?? false) || (e.video?.isNotEmpty ?? false))
        .toList();

    if (list.isEmpty) return;

    _currentScreenSaverIndex = (_currentScreenSaverIndex + 1) % list.length;

    _currentScreenSaver = list[_currentScreenSaverIndex];
    _isAdVisible = true;
    notifyUi();

    final seconds = _currentScreenSaver?.displayDuration ?? 10;
    _adTimer?.cancel();
    _adTimer = Timer(Duration(seconds: seconds), () {
      if (_isAdVisible) {
        _showNextAd();
      }
    });
  }

  void _hideAd() {
    _isAdVisible = false;
    _currentScreenSaver = null;
    _adTimer?.cancel();
    notifyUi();
  }

  /// вызывать при ЛЮБОМ действии пользователя
  void onUserInteraction() {
    if (_isAdVisible) {
      _hideAd();
    }

    if (_isTextInputActive) return;
    _startIdleTimer();
  }

  void startTextInput() {
    _isTextInputActive = true;
    _idleTimer?.cancel();
  }

  void stopTextInput() {
    _isTextInputActive = false;
    _startIdleTimer();
  }
}

// class KioskService {
//   final void Function() notifyUi;
//   final KioskBloc kioskBloc;

//   /// периодическая отправка статуса киоска
//   Timer? _statusTimer;
//   // Timer? _timerScreenSaver;
//   Timer? _timerTechWork;

//   /// таймер простоя
//   Timer? _idleTimer;

//   /// таймер показа конкретной рекламы
//   Timer? _adTimer;

//   ScreenSaversResponse? _screenSavers;
//   ScreenSaversDatum? _currentScreenSaver;
//   bool _isAdVisible = false;
//   int _currentScreenSaverIndex = -1;

//   Duration idleDuration = const Duration(minutes: 2);

//   bool _isTextInputActive = false;

//   KioskService({
//     required this.notifyUi,
//     KioskBloc? kioskBloc,
//   }) : kioskBloc =
//             kioskBloc ?? KioskBloc(kioskRepository: sl<KioskRepository>());

//   // ==== public getters для VM/UI ====
//   ScreenSaversResponse? get screenSavers => _screenSavers;
//   ScreenSaversDatum? get currentScreenSaver => _currentScreenSaver;
//   bool get isAdVisible => _isAdVisible;

//   // чтобы в UI можно было использовать BlocListener
//   KioskBloc get bloc => kioskBloc;

//   // ================== ЖИЗНЕННЫЙ ЦИКЛ ===================

//   /// вызывать из VM, когда включён kioskMode
//   Future<void> initKiosk() async {
//     sendStatusKioskPeriodically();
//     fetchScreenSavers();
//     _startIdleTimer();
//     sendTechWork();
//     // Надо написать tech work запрос
//     // kioskBloc.add(KioskEvent.techWork());
//   }

//   /// вызывать из dispose VM
//   void dispose() {
//     _statusTimer?.cancel();
//     _timerTechWork?.cancel();
//     // _timerScreenSaver?.cancel();
//     _idleTimer?.cancel();
//     _adTimer?.cancel();
//   }

//   void updateToken(
//     BuildContext context,
//     KioskResponse response,
//   ) {
//     // List<String> parts = kioskNameController.text.split('_');
//     // log(kioskNameController.text);
//     // sl<KTokenStorage>().saveToken(response.data?.token ?? '');
//     // sl<HostStorage>().saveHost(parts[0]);
//     context.router.replaceAll([
//       QrMenuProviderRoute(
//         menuId: response.data!.connection!.itemId!,
//         isKiosk: true,
//       )
//     ]);
//   }

//   // ================= ОТПРАВКА СТАТУСА ==================

//   void sendStatusKioskPeriodically() {
//     _statusTimer?.cancel();
//     sendStatusKiosk();
//     _statusTimer = Timer.periodic(const Duration(minutes: 1), (_) {
//       sendStatusKiosk();
//     });
//   }

//   void sendTechWork() {
//     _timerTechWork?.cancel();
//     kioskBloc.add(const KioskEvent.techWork());
//     _timerTechWork = Timer.periodic(const Duration(minutes: 2), (_) {
//       kioskBloc.add(const KioskEvent.techWork());
//     });
//   }

//   void stopSendingStatusKiosk() {
//     _statusTimer?.cancel();
//     _statusTimer = null;
//   }

//   Future<void> sendStatusKiosk() async {
//     final connectivityInstance = Connectivity();
//     final result = await connectivityInstance.checkConnectivity();
//     final deviceInfo = DeviceInfoPlugin();
//     final battery = Battery();
//     final state = await battery.batteryState;

//     // 🔋 уровень батареи (0–100)
//     final int level = 100;
//     // final int level = await battery.batteryLevel;

//     String deviceId = '';
//     if (Platform.isAndroid) {
//       final androidInfo = await deviceInfo.androidInfo;
//       deviceId = androidInfo.id;
//     } else if (Platform.isIOS) {
//       final iosInfo = await deviceInfo.iosInfo;
//       deviceId = iosInfo.identifierForVendor ?? '';
//     }

//     kioskBloc.add(
//       KioskEvent.sendStatusKiosk(
//         body: KioskStatusRequest(
//           batteryLevel: level,
//           // 100,
//           // level,
//           // 100,

//           // level battery battery_plus
//           batteryStatus: _getBatteryStatus(state),
//           networkLevel: 100,
//           networkType: _getNetworkType(result[0]),
//           screenStatus: 'active',
//           status: 'online',
//         ),
//         deviceId: deviceId,
//       ),
//     );
//   }

//   Future<void> checkKiosk() async {
//     final deviceInfo = DeviceInfoPlugin();
//     String deviceId = '';
//     if (Platform.isAndroid) {
//       final androidInfo = await deviceInfo.androidInfo;
//       deviceId = androidInfo.id;
//     } else if (Platform.isIOS) {
//       final iosInfo = await deviceInfo.iosInfo;
//       deviceId = iosInfo.identifierForVendor ?? '';
//     }
//     kioskBloc.add(KioskEvent.checkKiosk(deviceId: deviceId));
//   }

//   String _getBatteryStatus(BatteryState state) {
//     switch (state) {
//       case BatteryState.charging:
//         return "charging";
//       case BatteryState.full:
//         return "full";
//       case BatteryState.discharging:
//         return "discharging";
//       case BatteryState.connectedNotCharging:
//         return "connectedNotCharging";
//       case BatteryState.unknown:
//         return "unknown";
//     }
//   }

//   String _getNetworkType(ConnectivityResult result) {
//     switch (result) {
//       case ConnectivityResult.mobile:
//         return "Mobile";
//       case ConnectivityResult.wifi:
//         return "Wi-Fi";
//       case ConnectivityResult.ethernet:
//         return "Ethernet";
//       case ConnectivityResult.bluetooth:
//         return "Bluetooth";
//       case ConnectivityResult.vpn:
//         return "VPN";
//       case ConnectivityResult.none:
//         return "None";
//       case ConnectivityResult.other:
//         return "Другое";
//     }
//   }

//   // ================= СКРИНСЕЙВЕР / РЕКЛАМА =================

//   Future<void> fetchScreenSavers() async {
//     // чтобы не было двух таймеров одновременно
//     // _timerScreenSaver?.cancel();

//     final deviceInfo = DeviceInfoPlugin();
//     String deviceId = '';

//     if (Platform.isAndroid) {
//       final androidInfo = await deviceInfo.androidInfo;
//       deviceId = androidInfo.id;
//     } else if (Platform.isIOS) {
//       final iosInfo = await deviceInfo.iosInfo;
//       deviceId = iosInfo.identifierForVendor ?? '';
//     }

//     // 🔹 1) первый запрос — сразу
//     kioskBloc.add(
//       KioskEvent.fetchScreenSavers(deviceId: deviceId),
//     );

//     // 🔹 2) последующие запросы — каждые 30 минут
//     // _timerScreenSaver = Timer.periodic(const Duration(minutes: 30), (_) {
//     //   kioskBloc.add(
//     //     KioskEvent.fetchScreenSavers(deviceId: deviceId),
//     //   );
//     // });
//   }

//   /// вызывай из BlocListener, когда придёт успешный стейт
//   void saveScreenSavers(ScreenSaversResponse response) {
//     _screenSavers = response;
//     idleDuration = Duration(
//       seconds: response.idleTimeout ?? 10,
//     );

//     // _cleanupScreenSaverCache(response); // 🔥 ВАЖНО
//     _startIdleTimer();
//     notifyUi();
//   }

//   // void _cleanupScreenSaverCache(ScreenSaversResponse response) {
//   //   // final cache = sl<ScreenSaverVideoCache>();

//   //   final urlsToKeep = <String>{};

//   //   final list = response.data ?? [];
//   //   if (list.isEmpty) return;

//   //   // текущий
//   //   if (_currentScreenSaver?.video?.isNotEmpty == true) {
//   //     urlsToKeep.add(_currentScreenSaver!.video!.trim());
//   //   }

//   //   // следующий
//   //   final nextIndex = (_currentScreenSaverIndex + 1) % list.length;
//   //   final next = list[nextIndex];
//   //   if (next.video?.isNotEmpty == true) {
//   //     urlsToKeep.add(next.video!.trim());
//   //   }

//   //   // 🔥 чистим всё остальное
//   //   cache.disposeExcept(urlsToKeep);
//   // }

//   void _startIdleTimer() {
//     _idleTimer?.cancel();

//     if (!(_screenSavers?.data?.isNotEmpty ?? false)) return;

//     _idleTimer = Timer(idleDuration, _showNextAd);
//   }

//   void _showNextAd() {
//     final list = (_screenSavers?.data ?? [])
//         .where((e) =>
//             (e.image?.isNotEmpty ?? false) || (e.video?.isNotEmpty ?? false))
//         .toList();

//     if (list.isEmpty) return;

//     _currentScreenSaverIndex = (_currentScreenSaverIndex + 1) % list.length;

//     _currentScreenSaver = list[_currentScreenSaverIndex];
//     _isAdVisible = true;
//     notifyUi();

//     final seconds = _currentScreenSaver?.displayDuration ?? 10;
//     _adTimer?.cancel();
//     _adTimer = Timer(Duration(seconds: seconds), () {
//       if (_isAdVisible) {
//         _showNextAd();
//       }
//     });
//   }

//   // void _showNextAd() {
//   //   final list = (_screenSavers?.data ?? [])
//   //       .where((e) =>
//   //           (e.image?.isNotEmpty ?? false) || (e.video?.isNotEmpty ?? false))
//   //       .toList();

//   //   if (list.isEmpty) return;

//   //   _currentScreenSaverIndex = (_currentScreenSaverIndex + 1) % list.length;

//   //   final current = list[_currentScreenSaverIndex];
//   //   _currentScreenSaver = current;
//   //   _isAdVisible = true;

//   //   // 🔥 PRELOAD NEXT
//   //   final nextIndex = (_currentScreenSaverIndex + 1) % list.length;
//   //   final next = list[nextIndex];

//   //   final cache = sl<ScreenSaverVideoCache>();

//   //   if (current.video != null && current.video!.isNotEmpty) {
//   //     cache.preload(current.video!);
//   //   }

//   //   if (next.video != null && next.video!.isNotEmpty) {
//   //     cache.preload(next.video!);
//   //   }

//   //   // 🧹 чистим старые
//   //   cache.disposeExcept({
//   //     if (current.video != null) current.video!,
//   //     if (next.video != null) next.video!,
//   //   });

//   //   notifyUi();

//   //   final seconds = current.displayDuration ?? 10;
//   //   _adTimer?.cancel();
//   //   _adTimer = Timer(Duration(seconds: seconds), _showNextAd);
//   // }

//   void _hideAd() {
//     _isAdVisible = false;
//     _currentScreenSaver = null;
//     _adTimer?.cancel();
//     notifyUi();
//   }

//   /// вызывать при ЛЮБОМ действии пользователя
//   void onUserInteraction() {
//     if (_isAdVisible) {
//       _hideAd();
//     }

//     // если сейчас активный ввод текста — не трогаем idle-таймер
//     if (_isTextInputActive) return;

//     _startIdleTimer();
//   }

//   /// Вызываем, когда пользователь начал ввод текста (поле получило фокус)
//   void startTextInput() {
//     _isTextInputActive = true;
//     _idleTimer?.cancel(); // пока вводит текст — не считаем простои
//   }

//   /// Вызываем, когда пользователь закончил ввод (фокус ушёл / done)
//   void stopTextInput() {
//     _isTextInputActive = false;
//     _startIdleTimer(); // снова начинаем отсчитывать бездействие
//   }

//   // ScreenSaversDatum? get nextScreenSaver {
//   //   final list = _screenSavers?.data;
//   //   if (list == null || list.isEmpty) return null;
//   //   if (_currentScreenSaverIndex < 0) return null;

//   //   final nextIndex = (_currentScreenSaverIndex + 1) % list.length;
//   //   return list[nextIndex];
//   // }
// }
