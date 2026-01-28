part of 'promo_code_bloc.dart';

@freezed
class PromoCodeEvent with _$PromoCodeEvent {
  const factory PromoCodeEvent.checkPromoCode(
      {required CheckPromoRequest body}) = _CheckPromoCode;
}
