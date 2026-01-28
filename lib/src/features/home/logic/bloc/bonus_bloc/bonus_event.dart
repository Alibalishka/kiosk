part of 'bonus_bloc.dart';

@freezed
class BonusEvent with _$BonusEvent {
  const factory BonusEvent.fetchSubscriptionItems({required int id}) =
      _FetchSubscriptionItems;
  const factory BonusEvent.orderSubscription({required BonusRequest body}) =
      _OrderSubscription;
}
