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

class KioskVm extends ViewModel {
  final BuildContext context;

  KioskVm({required this.context});

  TextEditingController kioskNameController = TextEditingController();
  KioskBloc kioskBloc = KioskBloc(kioskRepository: sl<KioskRepository>());
  final deviceInfo = DeviceInfoPlugin();
  String deviceId = '';
  String model = '';

  // @override
  // void init() async {
  //   super.init();
  //   // await initDeviceInfo();
  //   // checkKiosk();
  //   // kioskBloc = KioskBloc(kioskRepository: sl<KioskRepository>());
  //   // if (sl<HostStorage>().hasHost()) {
  //   //   kioskBloc.add(KioskEvent.checkKiosk(deviceId: deviceId));
  //   // }
  // }

  Future<void> checkKiosk() async {
    log('Check kiosk');
    if (sl<HostStorage>().hasHost()) {
      kioskBloc.add(KioskEvent.checkKiosk(deviceId: deviceId));
    }
  }

  // Future<void> initDeviceInfo() async {
  //   if (Platform.isAndroid) {
  //     final androidInfo = await deviceInfo.androidInfo;
  //     deviceId = androidInfo.id;
  //     model = androidInfo.model;
  //   } else if (Platform.isIOS) {
  //     final iosInfo = await deviceInfo.iosInfo;
  //     deviceId = iosInfo.identifierForVendor ?? '';
  //     model = iosInfo.name;
  //   }
  //   log('Device ID: $deviceId');
  //   log('Device Model: $model');
  // }
  Future<void> initDeviceInfo() async {
    // ✅ 1) стабильный уникальный id приложения (UUID)
    deviceId = await const DeviceIdService().getOrCreate();

    // ✅ 2) model оставляем как было (для UI/аналитики)
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

  void initData(KioskResponse response, bool save) {
    // List<String> parts = kioskNameController.text.split('_');
    // log(kioskNameController.text);
    if (save) {
      sl<KTokenStorage>().saveToken(response.data?.token ?? '');
    }

    // sl<HostStorage>().saveHost(parts[0]);
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
  }

// sandyq_E1IM3U
// sandyq_0IAPTR
// MNCDCQ
// sandyq_NU0WRC
// LWJH4E
  Future<void> register() async {
    // sl<KTokenStorage>().deleteToken();
    // sl<HostStorage>().deleteHost();
    if (kioskNameController.text.contains('_')) {
      List<String> parts = kioskNameController.text.split('_');
      await sl<HostStorage>().saveHost(
        // 'sandyq'
        parts[0],
      );
      kioskBloc.add(
        KioskEvent.register(
          body: KioskRequest(
            deviceId: deviceId,
            model: model,
            connectionCode:
                // 'PI3JVP',
                parts[1],
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
}
