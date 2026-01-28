part of 'detail_item_bloc.dart';

@freezed
class DetailItemState with _$DetailItemState {
  const factory DetailItemState.initial() = _Initial;
  const factory DetailItemState.successDetailItem({
    required DetailItemModel detailItemModel,
  }) = _SuccessDetailItem;
  const factory DetailItemState.errorDetailItem(
      {@Default('Произошла ошибка') String message}) = _ErrorDetailItem;
}
