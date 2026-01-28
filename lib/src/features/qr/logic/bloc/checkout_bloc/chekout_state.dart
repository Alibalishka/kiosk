part of 'chekout_bloc.dart';

@freezed
class ChekoutState with _$ChekoutState {
  const factory ChekoutState.initial() = _Initial;
  const factory ChekoutState.loading() = _Loading;
  const factory ChekoutState.success({required ChekoutModel chekoutModel}) =
      _Success;
  const factory ChekoutState.failed(
      {@Default('Произошла ошибка') String message}) = _Failed;
}
