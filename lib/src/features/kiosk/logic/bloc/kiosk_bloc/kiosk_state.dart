part of 'kiosk_bloc.dart';

@freezed
class KioskState with _$KioskState {
  const factory KioskState.initial() = _Initial;
  const factory KioskState.loading() = _Loading;
  const factory KioskState.loadingPay() = _LoadingPay;
  const factory KioskState.successKioskStatus({required KioskStatus response}) =
      _SuccessKioskStatus;
  const factory KioskState.success({required KioskResponse response}) =
      _Success;
  const factory KioskState.checkKioskSuccess(
      {required KioskResponse response}) = _CheckKioskSuccess;
  const factory KioskState.successPayData({required PayModel response}) =
      _SuccessPayData;
  const factory KioskState.successPay({required KaspiStatus response}) =
      _SuccessPay;
  const factory KioskState.successScreenSavers(
      {required ScreenSaversResponse response}) = _SuccessScreenSavers;

  const factory KioskState.successTechWork(
      {required TechWorkResponse response}) = _SuccessTechWork;

  const factory KioskState.successDisconnectKiosk() = _SuccessDisconnectKiosk;

  /// kiosk-status ответил 422: сервер больше не знает этот планшет. Только
  /// статус — 422 от остальных запросов приходит обычным [failed].
  const factory KioskState.kioskDisconnected({String? message}) =
      _KioskDisconnected;

  const factory KioskState.failed({
    @Default('Произошла ошибка') String message,
    int? errorCode,

    /// Машинный код из тела ответа (`online_payment_disabled` …).
    String? reason,
  }) = _Failed;
}
