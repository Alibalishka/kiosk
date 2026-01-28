part of 'bonus_bloc.dart';

@freezed
class BonusState with _$BonusState {
  const factory BonusState.initial() = _Initial;
  const factory BonusState.loading() = _Loading;
  const factory BonusState.success({required ItemsModel items}) = _Success;
  const factory BonusState.successOrder({required ChekoutModel model}) =
      _SuccessOrder;
  const factory BonusState.failed(
      {@Default('Произошла ошибка') String message}) = _Failed;
}
