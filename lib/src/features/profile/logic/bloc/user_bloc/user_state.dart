part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _InitialUser;
  const factory UserState.success({required UserResponsesModel user}) =
      _SuccessUser;
  const factory UserState.error({@Default('Произошла ошибка') String message}) =
      _ErrorUser;

  const factory UserState.typeSuccess(
      {required TypeOrganizationResponse type}) = _TypeLoading;
  const factory UserState.updateSuccess() = _UpdateSuccess;
  const factory UserState.deleteSuccess() = _DeleteSuccess;
  const factory UserState.configurationSuccess(
      {required ConfigurationResponse response}) = _ConfigurationSuccess;
  const factory UserState.checkSubsLoading() = _CheckSubsLoading;
  const factory UserState.checkSubsSuccess(
      {required CheckSubsModel checkSubsModel}) = _CheckSubsSuccess;
}
