part of 'free_bloc.dart';

@freezed
class FreeEvent with _$FreeEvent {
  const factory FreeEvent.fetchFreeItems({
    required int idSubscription,
    required String idItem,
  }) = _FetchFreeItems;
}
