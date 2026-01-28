import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/user_update_request.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/check_subs_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/configuration_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/type_organization_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/user_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthRepository _authRepository;
  UserBloc({required final AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const _InitialUser()) {
    on<UserEvent>(
      (event, emit) => event.map(
        fetchUser: (event) => _fetchUser(event, emit),
        updateUser: (event) => _updateUser(event, emit),
        deleteUser: (event) => _deleteUser(event, emit),
        checkSubscripton: (event) => _checkSubscripton(event, emit),
        fetchConfiguration: (event) => _fetchConfiguration(event, emit),
      ),
    );
  }

  Future<void> _fetchUser(
    _FetchUser event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.initial());
    try {
      final result = await _authRepository.fetchUser();
      result.when(
        success: (response) => emit(UserState.success(user: response)),
        failure: (error) => emit(
            UserState.error(message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const UserState.error());
      rethrow;
    }
  }

  Future<void> _updateUser(
    _UpdateUser event,
    Emitter<UserState> emit,
  ) async {
    // emit(const UserState.initial());
    try {
      final result = await _authRepository.updateUser(body: event.body);
      result.when(
          success: (response) {
            log('SUCCCESSS ALI');
            emit(const UserState.updateSuccess());
          },
          failure: (error) => emit(
              UserState.error(message: error.msg ?? 'Ошибка загурзки данных')));
    } on Object {
      emit(const UserState.error());
      rethrow;
    }
  }

  Future<void> _deleteUser(
    _DeleteUser event,
    Emitter<UserState> emit,
  ) async {
    try {
      final result = await _authRepository.deleteUser();
      result.when(
          success: (response) => emit(const UserState.deleteSuccess()),
          failure: (error) => emit(
              UserState.error(message: error.msg ?? 'Ошибка загурзки данных')));
    } on Object {
      emit(const UserState.error());
      rethrow;
    }
  }

  Future<void> _checkSubscripton(
    _CheckSubscripton event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.checkSubsLoading());
    try {
      final result = await _authRepository.checkSubscripton(
        idSubscroption: event.idSubscroption,
        userSubId: event.userSubId,
      );
      result.when(
          success: (response) =>
              emit(UserState.checkSubsSuccess(checkSubsModel: response)),
          failure: (error) => emit(
              UserState.error(message: error.msg ?? 'Ошибка загурзки данных')));
    } on Object {
      emit(const UserState.error());
      rethrow;
    }
  }

  Future<void> _fetchConfiguration(
    _FetchConfiguration event,
    Emitter<UserState> emit,
  ) async {
    try {
      final result = await _authRepository.fetchConfiguration();
      result.when(
        success: (response) {
          log('ALI SUCCESSS');
          emit(UserState.configurationSuccess(response: response));
        },
        failure: (error) => emit(
            UserState.error(message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const UserState.error());
      rethrow;
    }
  }
}
