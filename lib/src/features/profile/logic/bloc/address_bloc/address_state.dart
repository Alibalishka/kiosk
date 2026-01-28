part of 'address_bloc.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState.loading() = _LoadingAddress;
  const factory AddressState.success({required AddressResponseModel addressResponseModel}) = _SuccessAddress;
  const factory AddressState.failed({@Default('Произошла ошибка') String message}) = _FailedAddress;

  const factory AddressState.saveLoading() = _SaveLoadingAddress;
  const factory AddressState.saveSuccess() = _SaveSuccessAddress;
  const factory AddressState.saveFailed({@Default('Произошла ошибка') String message}) = _SaveFailedAddress;

  const factory AddressState.deleteLoading() = _DeleteLoading;
  const factory AddressState.deleteSuccess() = _DeleteSuccess;

  const factory AddressState.selectLoading() = _SelectLoading;
  const factory AddressState.selectSuccess() = _SelectSuccess;
}
