part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _InitialAuth;
  const factory AuthState.success() = _SuccessAuth;
  const factory AuthState.error({@Default('Произошла ошибка') String message}) = _ErrorAuth;
}
