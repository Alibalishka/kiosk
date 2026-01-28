part of 'chekout_bloc.dart';

@freezed
class ChekoutEvent with _$ChekoutEvent {
  const factory ChekoutEvent.fetchChekout({required CheckoutRequests body}) =
      _FetchChekout;
  const factory ChekoutEvent.fetchChekoutSubscription({required String id}) =
      _FetchChekoutSubscription;
  const factory ChekoutEvent.fetchChekoutMenu({required MenuCheckoutRequest body}) =
      _FetchChekoutMenu;
}
