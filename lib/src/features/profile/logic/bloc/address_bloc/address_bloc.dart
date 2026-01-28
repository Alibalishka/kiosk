import 'package:bloc/bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/address_request.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/address_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_event.dart';
part 'address_state.dart';
part 'address_bloc.freezed.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AuthRepository _authRepository;
  AddressBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const _LoadingAddress()) {
    on<AddressEvent>(
      (event, emit) => event.map(
        fetchAddress: (event) => _fetchAddress(event, emit),
        saveAddress: (event) => _saveAddress(event, emit),
        deleteAddress: (event) => _deleteAddress(event, emit),
        selectAddress: (event) => _selectAddress(event, emit),
        refreshAddress: (event) => _refreshAddress(event, emit),
      ),
    );
  }

  bool isLoading = true;

  Future<void> _fetchAddress(
    _FetchAddress event,
    Emitter<AddressState> emit,
  ) async {
    emit(const AddressState.loading());
    try {
      final result = await _authRepository.fetchAddress();

      result.when(
        success: (response) =>
            emit(AddressState.success(addressResponseModel: response)),
        failure: (error) => emit(AddressState.failed(
            message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const AddressState.failed());
    }
  }

  Future<void> _refreshAddress(
    _RefreshAddress event,
    Emitter<AddressState> emit,
  ) async {
    try {
      final result = await _authRepository.fetchAddress();
      isLoading = false;
      result.when(
        success: (response) =>
            emit(AddressState.success(addressResponseModel: response)),
        failure: (error) => emit(AddressState.failed(
            message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const AddressState.failed());
    }
  }

  Future<void> _saveAddress(
    _SaveAddress event,
    Emitter<AddressState> emit,
  ) async {
    emit(const AddressState.saveLoading());
    try {
      final result = await _authRepository.saveAddress(body: event.body);
      result.when(
        success: (response) => emit(const AddressState.saveSuccess()),
        failure: (error) => emit(AddressState.saveFailed(
            message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const AddressState.saveFailed());
    }
  }

  Future<void> _deleteAddress(
    _DeleteAddress event,
    Emitter<AddressState> emit,
  ) async {
    try {
      final result = await _authRepository.deleteAddress(id: event.id);
      result.when(
        success: (response) => emit(const AddressState.deleteSuccess()),
        failure: (error) => emit(AddressState.failed(
            message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const AddressState.failed());
    }
  }

  Future<void> _selectAddress(
    _SelectAddress event,
    Emitter<AddressState> emit,
  ) async {
    try {
      final result = await _authRepository.selectAddress(id: event.id);
      result.when(
        success: (response) => emit(const AddressState.selectSuccess()),
        failure: (error) => emit(AddressState.failed(
            message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const AddressState.failed());
    }
  }
}
