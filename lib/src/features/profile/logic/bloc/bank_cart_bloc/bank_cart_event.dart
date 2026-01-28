part of 'bank_cart_bloc.dart';

@freezed
class BankCartEvent with _$BankCartEvent {
  const factory BankCartEvent.fetchPaymentMethods() = _FetchPaymentMethods;
  const factory BankCartEvent.addBankCard({required int id}) = _AddBankCard;
  const factory BankCartEvent.fetchCards() = _FetchCards;
  const factory BankCartEvent.removeCard({required int id}) = _RemoveCard;
}
