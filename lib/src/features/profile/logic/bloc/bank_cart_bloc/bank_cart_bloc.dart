import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/add_bank_card.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/cards_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/payment_method.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';

part 'bank_cart_event.dart';
part 'bank_cart_state.dart';
part 'bank_cart_bloc.freezed.dart';

class BankCartBloc extends Bloc<BankCartEvent, BankCartState> {
  final AuthRepository _authRepository;
  BankCartBloc({required final AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const _Initial()) {
    on<BankCartEvent>(
      (event, emit) => event.map(
        fetchPaymentMethods: (event) => _fetchPaymentMethods(event, emit),
        addBankCard: (event) => _addBankCard(event, emit),
        fetchCards: (event) => _fetchCards(event, emit),
        removeCard: (event) => _removeCard(event, emit),
      ),
    );
  }

  Future<void> _fetchCards(
    _FetchCards event,
    Emitter<BankCartState> emit,
  ) async {
    emit(const BankCartState.loading());
    try {
      final result = await _authRepository.fetchCards();
      result.when(
        success: (response) =>
            emit(BankCartState.successCards(cards: response)),
        failure: (error) => emit(BankCartState.failed(
            message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const BankCartState.failed());
    }
  }

  Future<void> _addBankCard(
    _AddBankCard event,
    Emitter<BankCartState> emit,
  ) async {
    // emit(const BankCartState.loading());
    try {
      final result = await _authRepository.addBankCard(id: event.id);
      result.when(
        success: (response) => emit(BankCartState.successAdd(data: response)),
        failure: (error) => emit(BankCartState.failed(
            message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const BankCartState.failed());
    }
  }

  Future<void> _fetchPaymentMethods(
    _FetchPaymentMethods event,
    Emitter<BankCartState> emit,
  ) async {
    emit(const BankCartState.loading());
    try {
      final result = await _authRepository.fetchPaymentMethods();
      result.when(
        success: (response) =>
            emit(BankCartState.successPaymentMehods(paymentMethod: response)),
        failure: (error) => emit(BankCartState.failed(
            message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const BankCartState.failed());
    }
  }

  Future<void> _removeCard(
    _RemoveCard event,
    Emitter<BankCartState> emit,
  ) async {
    emit(const BankCartState.loadingRemove());
    try {
      final result = await _authRepository.removeCard(id: event.id);
      result.when(
        success: (response) => emit(const BankCartState.successRemove()),
        failure: (error) => emit(BankCartState.failed(
            message: error.msg ?? 'Ошибка загрузки данных')),
      );
    } on Object {
      emit(const BankCartState.failed());
    }
  }
}
