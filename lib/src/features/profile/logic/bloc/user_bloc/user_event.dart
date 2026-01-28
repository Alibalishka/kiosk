part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.fetchUser() = _FetchUser;
  const factory UserEvent.updateUser({required UserUpdateRequest body}) =
      _UpdateUser;
  const factory UserEvent.deleteUser() = _DeleteUser;
  const factory UserEvent.checkSubscripton({
    required int idSubscroption,
    required int userSubId,
  }) = _CheckSubscripton;
  const factory UserEvent.fetchConfiguration() = _FetchConfiguration;
}
