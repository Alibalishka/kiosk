part of 'promo_code_bloc.dart';

@freezed
class PromoCodeState with _$PromoCodeState {
  const factory PromoCodeState.initial() = _Initial;
  const factory PromoCodeState.loading() = _Loading;
  const factory PromoCodeState.success({required PromoModel promoModel}) =
      _Success;
  const factory PromoCodeState.failed(
      {@Default('Произошла ошибка') String message}) = _Failed;
}
