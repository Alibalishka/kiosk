part of 'item_bloc.dart';

@freezed
class ItemState with _$ItemState {
  const factory ItemState.initial() = _Initial;
  const factory ItemState.loading() = _Loading;
  const factory ItemState.success({required ItemsModel items}) = _Success;
  const factory ItemState.failed(
      {@Default('Произошла ошибка') String message}) = _Failed;
}
