import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/bonus_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/pay_request.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/pay_model.dart';
import 'package:qr_pay_app/src/features/qr/logic/repository/cart_repository.dart';

part 'pay_event.dart';
part 'pay_state.dart';
part 'pay_bloc.freezed.dart';

class PayBloc extends Bloc<PayEvent, PayState> {
  final CartRepository _cartRepository;
  PayBloc({required final CartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(const _Initial()) {
    on<PayEvent>(
      (event, emit) => event.map(
        payByCart: (event) => _payByCart(event, emit),
        payBonus: (event) => _payBonus(event, emit),
        payMenu: (event) => _payMenu(event, emit),
      ),
    );
  }

  Future<void> _payMenu(
    _PayMenu event,
    Emitter<PayState> emit,
  ) async {
    emit(const PayState.loading());
    try {
      final result = await _cartRepository.payMenu(body: event.body);
      result.when(
        success: (response) => emit(PayState.success(payModel: response)),
        failure: (error) => emit(
            PayState.failed(message: error.msg ?? 'Ошибка загрузки данных')),
      );
    } on Object {
      emit(const PayState.failed());
    }
  }

  Future<void> _payByCart(
    _PayByCart event,
    Emitter<PayState> emit,
  ) async {
    emit(const PayState.loading());
    try {
      final result = await _cartRepository.payByCart(body: event.body);
      result.when(
        success: (response) => emit(PayState.success(payModel: response)),
        failure: (error) => emit(
            PayState.failed(message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const PayState.failed());
    }
  }

  Future<void> _payBonus(
    _PayBonus event,
    Emitter<PayState> emit,
  ) async {
    emit(const PayState.loading());
    try {
      final result = await _cartRepository.payBonus(body: event.body);
      result.when(
        success: (response) => emit(PayState.success(payModel: response)),
        failure: (error) => emit(
            PayState.failed(message: error.msg ?? 'Ошибка загрузки данных')),
      );
    } on Object {
      emit(const PayState.failed());
    }
  }
}
