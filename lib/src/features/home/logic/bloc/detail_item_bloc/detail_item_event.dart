part of 'detail_item_bloc.dart';

@freezed
class DetailItemEvent with _$DetailItemEvent {
  const factory DetailItemEvent.fetchDetailItem({required final int itemId}) =
      _FetchDetailItem;
}
