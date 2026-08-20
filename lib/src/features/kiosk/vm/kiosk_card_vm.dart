import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/bloc/kiosk_bloc/kiosk_bloc.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kaspi_status_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/history_order_bloc/history_order_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/order_detail.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/pay_model.dart';

class KioskCardVm extends ViewModel {
  final BuildContext context;
  final MenuCheckoutRequest request;
  final int orderWaitTime;

  KioskCardVm({
    required this.context,
    required this.request,
    required this.orderWaitTime,
  });

  late KioskBloc kioskBloc;
  late HistoryOrderBloc historyOrderBloc;
  PayModel payData = PayModel();
  KaspiStatus payStatus = KaspiStatus();

  Timer? _checkTimer;
  bool _isPaymentCompleted = false;

  @override
  void init() {
    super.init();
    kioskBloc = KioskBloc(kioskRepository: sl<KioskRepository>())
      ..add(KioskEvent.payKaspi(body: request));
    historyOrderBloc = HistoryOrderBloc(authRepository: sl<AuthRepository>());
  }

  @override
  void dispose() {
    _checkTimer?.cancel();
    historyOrderBloc.close();
    super.dispose();
  }

  Future<void> saveData(PayModel payData) async {
    this.payData = payData;
    payStatus = KaspiStatus(
      data: KaspiStatusDatum(status: 'QrTokenCreated'),
    );
    _startOrderStatusPolling();
    notifyListeners();
  }

  void _startOrderStatusPolling() {
    _checkTimer?.cancel();
    checkOrderStatus();
    _checkTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!_isPaymentCompleted) {
        checkOrderStatus();
      } else {
        _checkTimer?.cancel();
      }
    });
  }

  void checkOrderStatus() {
    final orderId = payData.orderId;
    if (orderId == null) return;
    historyOrderBloc.add(
      HistoryOrderEvent.fetchHistoryDetailOrder(id: orderId),
    );
  }

  void markPaymentCompleted() {
    _isPaymentCompleted = true;
    _checkTimer?.cancel();
  }

  Future<void> saveOrderDetail(
    BuildContext context,
    OrderDetailEntity orderDetail,
  ) async {
    final paymentStatus = orderDetail.data?.paymentStatus;

    if (paymentStatus == 2) {
      payStatus = KaspiStatus(
        data: KaspiStatusDatum(status: 'Processed'),
      );
      markPaymentCompleted();
      notifyListeners();
      Future.delayed(const Duration(seconds: 2), () {
        if (context.mounted) {
          context.router.replace(KioskSuccessPageRoute(
            id: payData.orderId!,
            orderWaitTime: orderWaitTime,
          ));
        }
      });
      return;
    }

    if (paymentStatus == 1) {
      payStatus = KaspiStatus(
        data: KaspiStatusDatum(status: 'QrTokenCreated'),
      );
      notifyListeners();
      return;
    }

    payStatus = KaspiStatus(
      data: KaspiStatusDatum(status: 'Error'),
    );
    markPaymentCompleted();
    notifyListeners();
  }
}
