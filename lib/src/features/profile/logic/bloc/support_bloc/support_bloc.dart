import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';

part 'support_event.dart';
part 'support_state.dart';
part 'support_bloc.freezed.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final AuthRepository _authRepository;
  SupportBloc({required final AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const _Initial()) {
    on<SupportEvent>(
      (event, emit) => event.map(
        sendSupport: (event) => _sendSupport(event, emit),
      ),
    );
  }

  Future<void> _sendSupport(
    _SendSupport event,
    Emitter<SupportState> emit,
  ) async {
    emit(const SupportState.loading());
    try {
      final result = await _authRepository.sendSupport(body: event.body);
      result.when(
        success: (_) => emit(const SupportState.success()),
        failure: (error) => emit(SupportState.failed(
            message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const SupportState.failed());
    }
  }
}
