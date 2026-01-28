import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/available_times_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/reserv_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/available_times_response.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/detail_item_repository.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/reservation_response.dart';

part 'reserv_event.dart';
part 'reserv_state.dart';
part 'reserv_bloc.freezed.dart';

class ReservBloc extends Bloc<ReservEvent, ReservState> {
  final DetailItemRepository _detailItemRepository;
  ReservBloc({required final DetailItemRepository detailItemRepository})
      : _detailItemRepository = detailItemRepository,
        super(const _Initial()) {
    on<ReservEvent>(
      (event, emit) => event.map(
        fetchTimes: (event) => _fetchTimes(event, emit),
        reserv: (event) => _reserv(event, emit),
        fetchReserv: (event) => _fetchReserv(event, emit),
      ),
    );
  }

  Future<void> _fetchTimes(
    _FetchTimes event,
    Emitter<ReservState> emit,
  ) async {
    emit(const ReservState.loading());
    try {
      final result = await _detailItemRepository.fetchTimes(body: event.body);
      result.when(success: (response) {
        emit(ReservState.successFetchTimes(response: response));
      }, failure: (error) {
        emit(
            ReservState.failed(message: error.msg ?? 'Ошибка загурзки данных'));
      });
    } on Object {
      emit(const ReservState.failed());
    }
  }

  Future<void> _reserv(
    _Reserv event,
    Emitter<ReservState> emit,
  ) async {
    emit(const ReservState.loading());
    try {
      final result = await _detailItemRepository.reserv(body: event.body);
      result.when(success: (response) {
        emit(const ReservState.successReserv());
      }, failure: (error) {
        emit(ReservState.failed(message: error.msg ?? 'Ошибка резервирования'));
      });
    } on Object {
      emit(const ReservState.failed());
    }
  }

  Future<void> _fetchReserv(
    _FetchReserv event,
    Emitter<ReservState> emit,
  ) async {
    emit(const ReservState.loading());
    try {
      final result = await _detailItemRepository.fetchReserv();
      result.when(success: (response) {
        emit(ReservState.successFetchReserv(response: response));
      }, failure: (error) {
        emit(
            ReservState.failed(message: error.msg ?? 'Ошибка загрузки данных'));
      });
    } on Object {
      emit(const ReservState.failed());
    }
  }
}
