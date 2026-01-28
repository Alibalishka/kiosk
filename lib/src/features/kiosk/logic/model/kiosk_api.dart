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

  const factory KioskApi.payKaspi({required MenuCheckoutRequest body}) =
      _PayKaspi;

  const factory KioskApi.checkKapiPayStatus({required int orderId}) =
      _CheckKapiPayStatus;

  const factory KioskApi.fetchScreenSavers({required String deviceId}) =
      _FetchScreenSavers;

  const factory KioskApi.techWork() = _TechWork;

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
      );

  /// Пути всех запросов (после [kBaseUrl])
  @override
  String get path => when(
        register: (_) => '/kiosks/connect',
        checkKiosk: (deviceId) => '/kiosks/$deviceId',
        sendStatusKiosk: (_, deviceId) => '/kiosks/$deviceId/status',
        payKaspi: (_) => '/orders/pay-order',
        checkKapiPayStatus: (orderId) => '/orders/$orderId/kaspi',
        fetchScreenSavers: (deviceId) => '/kiosks/$deviceId/screensavers',
        techWork: () => '/tech-works',
      );

  /// Параметры запросов
  @override
  Map<String, dynamic>? get queryParameters => whenOrNull();
}
