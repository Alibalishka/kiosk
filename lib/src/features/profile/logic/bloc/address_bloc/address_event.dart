part of 'address_bloc.dart';

@freezed
class AddressEvent with _$AddressEvent {
  const factory AddressEvent.fetchAddress() = _FetchAddress;
  const factory AddressEvent.refreshAddress() = _RefreshAddress;
  const factory AddressEvent.saveAddress({required AddressRequest body}) = _SaveAddress;
  const factory AddressEvent.deleteAddress({required int id}) = _DeleteAddress;
  const factory AddressEvent.selectAddress({required int id}) = _SelectAddress;
}
