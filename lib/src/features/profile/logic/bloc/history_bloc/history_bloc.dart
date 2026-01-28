import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/history_model.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';

part 'history_event.dart';
part 'history_state.dart';
part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final AuthRepository _authRepository;
  HistoryBloc({required final AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const _Initial()) {
    on<HistoryEvent>(
      (event, emit) => event.map(
        fetchHistory: (event) => _fetchHistory(event, emit),
      ),
    );
  }

  Future<void> _fetchHistory(
    _FetchHistory event,
    Emitter<HistoryState> emit,
  ) async {
    emit(const HistoryState.loading());
    try {
      final result = await _authRepository.fetchHistory();
      result.when(
        success: (reponse) => emit(HistoryState.success(historyData: reponse)),
        failure: (error) => emit(HistoryState.failed(
            message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const HistoryState.failed());
    }
  }
}
