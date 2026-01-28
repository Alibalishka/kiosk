part of 'subscription_bloc.dart';

@freezed
class SubscriptionEvent with _$SubscriptionEvent {
  const factory SubscriptionEvent.fetchSubscription() = _FetchSubscription;
  const factory SubscriptionEvent.paySubscription({
    required SubscriptionPayRequest payRequest,
    required int id,
  }) = _PaySubscription;
  const factory SubscriptionEvent.cancelSubscription({required int id}) =
      _CancelSubscription;
}
