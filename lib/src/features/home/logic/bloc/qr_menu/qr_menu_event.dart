part of 'qr_menu_bloc.dart';

@freezed
class QrMenuEvent with _$QrMenuEvent {
  const factory QrMenuEvent.fetchQrMenu(
    int id,
    String type,
  ) = _FetchQrMenu;
}
