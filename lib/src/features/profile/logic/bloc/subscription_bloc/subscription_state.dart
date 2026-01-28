part of 'subscription_bloc.dart';

@freezed
class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState.initial() = _Initial;
  const factory SubscriptionState.loading() = _Loading;
  const factory SubscriptionState.success(
      {required SubscriptionModel subscription}) = _Success;
  const factory SubscriptionState.paySuccess(
      {required SubsPayModel subsPayModel}) = _PaySuccess;
  const factory SubscriptionState.cancelSuccess() = _CancelSuccess;
  const factory SubscriptionState.failed(
      {@Default('Произошла ошибка') String message}) = _Failed;
}
