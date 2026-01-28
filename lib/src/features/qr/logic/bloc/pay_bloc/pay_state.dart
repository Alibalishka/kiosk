part of 'pay_bloc.dart';

@freezed
class PayState with _$PayState {
  const factory PayState.initial() = _Initial;
  const factory PayState.loading() = _Loading;
  const factory PayState.success({required PayModel payModel}) = _Success;
  const factory PayState.failed({@Default('Произошла ошибка') String message}) =
      _Failed;
}
