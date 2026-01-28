part of 'city_bloc.dart';

@freezed
class CityEvent with _$CityEvent {
  const factory CityEvent.fetchCity() = _FetchCity;
}
