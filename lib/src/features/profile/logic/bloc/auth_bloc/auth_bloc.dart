import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:qr_pay_app/src/core/logic/token_storage.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/register_request.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final ITokenStorage _localStorage;
  AuthBloc({
    required final AuthRepository authRepository,
    required final ITokenStorage localStorage,
  })  : _authRepository = authRepository,
        _localStorage = localStorage,
        super(const _InitialAuth()) {
    on<AuthEvent>(
      (event, emit) => event.map(
        login: (event) => _login(event, emit),
        pinCode: (event) => _pinCode(event, emit),
      ),
    );
  }

  Future<void> _login(
    _LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.initial());
    try {
      final result = await _authRepository.login(phone: event.phone);
      result.when(
        success: (response) async => emit(const AuthState.success()),
        failure: (error) => emit(
            AuthState.error(message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const AuthState.error());
      rethrow;
    }
  }

  Future<void> _pinCode(
    _PinCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.initial());
    try {
      final result = await _authRepository.pinCode(body: event.request);
      result.when(
        success: (response) async {
          _localStorage.saveToken(response.data?.token ?? '');
          log('BEARER TOKEN ${_localStorage.getToken()}');
          emit(const AuthState.success());
        },
        failure: (error) => emit(
            AuthState.error(message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const AuthState.error());
      rethrow;
    }
  }
}
