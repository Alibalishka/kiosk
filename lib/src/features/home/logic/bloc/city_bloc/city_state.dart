part of 'city_bloc.dart';

@freezed
class CityState with _$CityState {
  const factory CityState.initial() = _Initial;
  const factory CityState.loading() = _Loading;
  const factory CityState.success({required CityModel cityModel}) = _Success;
  const factory CityState.failed(
      {@Default('Произошла ошибка') String message}) = _Failed;
}
