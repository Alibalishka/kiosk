import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/bloc/kiosk_bloc/kiosk_bloc.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kaspi_status_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/pay_model.dart';
import 'package:flutter/material.dart';

class KioskKaspiVm extends ViewModel {
  final BuildContext context;
  final MenuCheckoutRequest request;

  KioskKaspiVm({
    required this.context,
    required this.request,
  });

  late KioskBloc kioskBloc;
  PayModel payData = PayModel();
  KaspiStatus payStatus = KaspiStatus();

  Timer? _checkTimer;
  bool _isPaymentCompleted = false;

  // Когда Создал Токен
  // 1. QrTokenCreated
  // Когда открыл Каспи сканировал QR
  // 2. Wait
  // Не оплатил закрыл модалку Каспи
  // 3. Error
  // Когда оплатил
  // 4. Processed

// Response
  // "data": {
  //   "id": 226,
  //   "status": "Error"
  // }

  @override
  void init() {
    super.init();
    kioskBloc = KioskBloc(kioskRepository: sl<KioskRepository>())
      ..add(KioskEvent.payKaspi(body: request));
  }

  @override
  void dispose() {
    _checkTimer?.cancel(); // Остановить таймер при уничтожении VM
    super.dispose();
  }

  Future<void> saveData(PayModel payData) async {
    this.payData = payData;
    _startPeriodicStatusCheck();
    notifyListeners();
  }

  void _startPeriodicStatusCheck() {
    _checkTimer?.cancel(); // Отменить старый таймер, если был

    _checkTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!_isPaymentCompleted) {
        checkKapiPayStatus();
      } else {
        _checkTimer?.cancel();
      }
    });
  }

  void checkKapiPayStatus() {
    if (payData.orderId != null) {
      kioskBloc.add(KioskEvent.checkKapiPayStatus(orderId: payData.orderId!));
    }
  }

  /// Этот метод можно вызвать в BlocListener, когда оплата прошла успешно
  void markPaymentCompleted() {
    _isPaymentCompleted = true;
    _checkTimer?.cancel();
  }

  Future<void> savePayStatus(
      BuildContext context, KaspiStatus payStatus) async {
    this.payStatus = payStatus;
    if (payStatus.data?.status == 'Processed') {
      Future.delayed(const Duration(seconds: 2), () {
        context.router.replace(KioskSuccessPageRoute(id: payData.orderId!));
      });
    }
    notifyListeners();
  }
}
