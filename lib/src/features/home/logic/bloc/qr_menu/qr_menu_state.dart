part of 'qr_menu_bloc.dart';

@freezed
class QrMenuState with _$QrMenuState {
  const factory QrMenuState.initial() = _Initial;
  const factory QrMenuState.loading() = _Loading;
  const factory QrMenuState.success({required QrMenuModel qrMenuModel}) =
      _Success;
  const factory QrMenuState.failed({
    @Default('Произошла ошибка') String message,
    int? errorCode,
  }) = _Failed;
}
