part of 'reserv_bloc.dart';

@freezed
class ReservEvent with _$ReservEvent {
  const factory ReservEvent.fetchTimes({required AvailableTimesRequest body}) =
      _FetchTimes;
  const factory ReservEvent.reserv({required ReservRequest body}) = _Reserv;
  const factory ReservEvent.fetchReserv() = _FetchReserv;
}
