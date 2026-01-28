part of 'bank_cart_bloc.dart';

@freezed
class BankCartState with _$BankCartState {
  const factory BankCartState.initial() = _Initial;
  const factory BankCartState.loading() = _Loading;
  const factory BankCartState.successPaymentMehods(
      {required PaymentMethod paymentMethod}) = _SuccessPaymentMehods;
  const factory BankCartState.successAdd({required AddBankCardResponse data}) =
      _SuccessAdd;
  const factory BankCartState.successCards({required CardsModel cards}) =
      _SuccessCards;
  const factory BankCartState.loadingRemove() = _LoadingRemove;
  const factory BankCartState.successRemove() = _SuccessRemove;
  const factory BankCartState.updateData() = _UpdateData;
  const factory BankCartState.failed(
      {@Default('Произошла ошибка') String message}) = _Failed;
}
