part of 'pay_bloc.dart';

@freezed
class PayEvent with _$PayEvent {
  const factory PayEvent.payByCart({required PayRequest body}) = _PayByCart;
  const factory PayEvent.payBonus({required BonusRequest body}) = _PayBonus;
  const factory PayEvent.payMenu({required MenuCheckoutRequest body}) =
      _PayMenu;
}
