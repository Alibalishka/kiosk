import 'dart:io';

import 'package:qr_pay_app/src/core/server/interfaces/base_client_generator.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/requests/kiosk_request.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/requests/kiosk_status_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kiosk_api.freezed.dart';

@freezed
abstract class KioskApi extends BaseClientGenerator with _$KioskApi {
  const KioskApi._() : super();

  const factory KioskApi.register({required KioskRequest body}) = _Register;

  const factory KioskApi.checkKiosk({required String deviceId}) = _CheckKiosk;

  const factory KioskApi.sendStatusKiosk({
    required KioskStatusRequest body,
    required String deviceId,
  }) = _SendStatusKiosk;

  const factory KioskApi.disconnectKiosk({required String deviceId}) =
      _DisconnectKiosk;

  const factory KioskApi.payKaspi({required MenuCheckoutRequest body}) =
      _PayKaspi;

  const factory KioskApi.checkKapiPayStatus({required int orderId}) =
      _CheckKapiPayStatus;

  const factory KioskApi.fetchScreenSavers({required String deviceId}) =
      _FetchScreenSavers;

  const factory KioskApi.techWork() = _TechWork;

  /// Заказы стола. [etag] уходит в If-None-Match.
  const factory KioskApi.tableOrders({
    required int venueId,
    required String tableId,
    String? etag,
  }) = _TableOrders;

  @override
  dynamic get body => whenOrNull(
        register: (body) => body.toJson(),
        payKaspi: (body) => body.toJson(),
      );

  /// Используемые методы запросов, по умолчанию 'POST'
  @override
  String get method => maybeWhen(
        orElse: () => 'GET',
        register: (_) => 'POST',
        sendStatusKiosk: (_, __) => 'POST',
        payKaspi: (_) => 'POST',
        disconnectKiosk: (_) => 'POST',
      );

  /// Пути всех запросов (после [kBaseUrl])
  @override
  String get path => when(
        register: (_) => '/kiosks/connect',
        checkKiosk: (deviceId) => '/kiosks/$deviceId',
        sendStatusKiosk: (_, deviceId) => '/kiosks/$deviceId/status',
        disconnectKiosk: (deviceId) => '/kiosks/$deviceId/disconnect',
        payKaspi: (_) => '/orders/pay-order',
        checkKapiPayStatus: (orderId) => '/orders/$orderId/kaspi',
        fetchScreenSavers: (deviceId) => '/kiosks/$deviceId/screensavers',
        techWork: () => '/tech-works',
        tableOrders: (_, __, ___) => '/orders/table',
      );

  /// Параметры запросов
  @override
  Map<String, dynamic>? get queryParameters => whenOrNull(
        tableOrders: (venueId, tableId, _) => {'i': venueId, 't': tableId},
      );

  @override
  Map<String, dynamic>? get headers => whenOrNull(
        payKaspi: (body) => {'Idempotency-Key': body.idempotencyKey},
        tableOrders: (_, __, etag) =>
            etag == null ? null : {'If-None-Match': etag},
      );

  /// Таймаут по умолчанию — почти три часа. Подвисший опрос заказов стола
  /// остановил бы следующий, а подвисший pay-order — повтор с тем же
  /// Idempotency-Key.
  @override
  int? get receiveTimeOut => maybeWhen(
        tableOrders: (_, __, ___) => 20000,
        payKaspi: (_) => 60000,
        orElse: () => super.receiveTimeOut,
      );

  /// 304 на If-None-Match — не ошибка: данные не изменились.
  @override
  bool isSuccessStatus(int status) => maybeWhen(
        tableOrders: (_, __, ___) =>
            status == HttpStatus.notModified || super.isSuccessStatus(status),
        orElse: () => super.isSuccessStatus(status),
      );
}
