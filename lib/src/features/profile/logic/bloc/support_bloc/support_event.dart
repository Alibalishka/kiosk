part of 'support_bloc.dart';

@freezed
class SupportEvent with _$SupportEvent {
  const factory SupportEvent.sendSupport({required FormData body}) =
      _SendSupport;
}
