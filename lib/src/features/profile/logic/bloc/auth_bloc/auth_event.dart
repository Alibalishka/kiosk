part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(String phone) = _LoginEvent;
  const factory AuthEvent.pinCode({required RegisterRequest request}) = _PinCodeEvent;
}
