part of 'kiosk_bloc.dart';

@freezed
class KioskEvent with _$KioskEvent {
  const factory KioskEvent.register({required KioskRequest body}) = _Register;

  const factory KioskEvent.checkKiosk({required String deviceId}) = _CheckKiosk;

  const factory KioskEvent.sendStatusKiosk({
    required KioskStatusRequest body,
    required String deviceId,
  }) = _SendStatusKiosk;

  const factory KioskEvent.payKaspi({required MenuCheckoutRequest body}) =
      _PayKaspi;
  const factory KioskEvent.checkKapiPayStatus({required int orderId}) =
      _CheckKapiPayStatus;
  const factory KioskEvent.fetchScreenSavers({required String deviceId}) =
      _FetchScreenSavers;

  const factory KioskEvent.techWork() = _TechWork;
}
