import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:qr_pay_app/src/core/server/layers/network_executer.dart';
import 'package:qr_pay_app/src/core/server/result.dart';
import 'package:qr_pay_app/src/core/server/retry_after.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/kiosk_api.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/requests/kiosk_request.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/requests/kiosk_status_request.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kaspi_status_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_status.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/screen_savers_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/table_orders_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/tech_work_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/table_orders_poll.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/pay_model.dart';

abstract class KioskRepository {
  Future<Result<KioskResponse>> register({required KioskRequest body});
  Future<Result<KioskResponse>> checkKiosk({required String deviceId});
  Future<Result<KioskStatus>> sendStatusKiosk({
    required KioskStatusRequest body,
    required String deviceId,
  });
  Future<Result<KioskResponse>> disconnectKiosk({required String deviceId});
  Future<Result<PayModel>> payKaspi({required MenuCheckoutRequest body});
  Future<Result<KaspiStatus>> checkKapiPayStatus({required int orderId});
  Future<Result<ScreenSaversResponse>> fetchScreenSavers(
      {required String deviceId});
  Future<Result<TechWorkResponse>> techWork();
  Future<TableOrdersPoll> fetchTableOrders({
    required int venueId,
    required String tableId,
    String? etag,
  });
}

class KioskRepositoryImpl implements KioskRepository {
  final NetworkExecuter client;

  KioskRepositoryImpl({required this.client});

  @override
  Future<Result<KioskResponse>> register({required KioskRequest body}) async {
    return await client.execute(
      route: KioskApi.register(body: body),
      responseType: KioskResponse(),
    );
  }

  @override
  Future<Result<KioskResponse>> checkKiosk({required String deviceId}) async {
    return await client.execute(
      route: KioskApi.checkKiosk(deviceId: deviceId),
      responseType: KioskResponse(),
    );
  }

  @override
  Future<Result<KioskStatus>> sendStatusKiosk({
    required KioskStatusRequest body,
    required String deviceId,
  }) async {
    return await client.execute(
      route: KioskApi.sendStatusKiosk(body: body, deviceId: deviceId),
      responseType: KioskStatus(),
    );
  }

  @override
  Future<Result<KioskResponse>> disconnectKiosk(
      {required String deviceId}) async {
    return await client.execute(
      route: KioskApi.disconnectKiosk(deviceId: deviceId),
      responseType: KioskResponse(),
    );
  }

  @override
  Future<Result<PayModel>> payKaspi({required MenuCheckoutRequest body}) async {
    return await client.execute(
      route: KioskApi.payKaspi(body: body),
      responseType: PayModel(),
    );
  }

  @override
  Future<Result<KaspiStatus>> checkKapiPayStatus({required int orderId}) async {
    return await client.execute(
      route: KioskApi.checkKapiPayStatus(orderId: orderId),
      responseType: KaspiStatus(),
    );
  }

  @override
  Future<Result<ScreenSaversResponse>> fetchScreenSavers(
      {required String deviceId}) async {
    return await client.execute(
      route: KioskApi.fetchScreenSavers(deviceId: deviceId),
      responseType: ScreenSaversResponse(),
    );
  }

  @override
  Future<Result<TechWorkResponse>> techWork() async {
    return await client.execute(
      route: const KioskApi.techWork(),
      responseType: TechWorkResponse(),
    );
  }

  @override
  Future<TableOrdersPoll> fetchTableOrders({
    required int venueId,
    required String tableId,
    String? etag,
  }) async {
    final result = await client.executeRaw(
      route: KioskApi.tableOrders(
        venueId: venueId,
        tableId: tableId,
        etag: etag,
      ),
    );
    return result.when(
      success: _tableOrdersResponse,
      failure: (error) => error.maybeWhen(
        request: (error) => _tableOrdersFailure(error.response),
        orElse: () => const TableOrdersPoll.failed(),
      ),
    );
  }

  TableOrdersPoll _tableOrdersResponse(Response<dynamic> response) {
    if (response.statusCode == HttpStatus.notModified) {
      return const TableOrdersPoll.notModified();
    }
    final body = response.data;
    if (body is! Map<String, dynamic>) return const TableOrdersPoll.failed();
    try {
      final data = TableOrdersResponse.fromJson(body).data;
      if (data == null) return const TableOrdersPoll.failed();
      return TableOrdersPoll.loaded(
        data: data,
        etag: response.headers['etag']?.firstOrNull,
      );
    } on Object catch (e) {
      log('table orders: unexpected body: $e');
      return const TableOrdersPoll.failed();
    }
  }

  TableOrdersPoll _tableOrdersFailure(Response<dynamic>? response) {
    switch (response?.statusCode) {
      case HttpStatus.tooManyRequests:
        return TableOrdersPoll.rateLimited(
          retryAfter: parseRetryAfter(
            response?.headers['retry-after']?.firstOrNull,
          ),
        );
      case HttpStatus.forbidden:
        return const TableOrdersPoll.forbidden();
      case HttpStatus.badRequest:
        return const TableOrdersPoll.invalidTable();
      default:
        return const TableOrdersPoll.failed();
    }
  }
}
