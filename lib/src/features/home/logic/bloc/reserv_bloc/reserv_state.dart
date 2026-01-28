part of 'reserv_bloc.dart';

@freezed
class ReservState with _$ReservState {
  const factory ReservState.initial() = _Initial;
  const factory ReservState.loading() = _Loading;
  const factory ReservState.successFetchTimes(
      {required AvailableTimesResponse response}) = _SuccessFetchTimes;
  const factory ReservState.successReserv() = _SuccessReserv;
  const factory ReservState.successFetchReserv(
      {required ReservationResponse response}) = _SuccessFetchReserv;
  const factory ReservState.failed(
      {@Default('Произошла ошибка') String message}) = _Failed;
}
