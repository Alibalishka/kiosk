import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/checkout_requests.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/checkout_model.dart';
import 'package:qr_pay_app/src/features/qr/logic/repository/cart_repository.dart';

part 'chekout_event.dart';
part 'chekout_state.dart';
part 'chekout_bloc.freezed.dart';

class ChekoutBloc extends Bloc<ChekoutEvent, ChekoutState> {
  final CartRepository _cartRepository;
  ChekoutBloc({required final CartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(const _Initial()) {
    on<ChekoutEvent>(
      (event, emit) => event.map(
        fetchChekout: (event) => _fetchChekout(event, emit),
        fetchChekoutSubscription: (event) =>
            _fetchChekoutSubscription(event, emit),
        fetchChekoutMenu: (event) => _fetchChekoutMenu(event, emit),
      ),
    );
  }

  Future<void> _fetchChekoutMenu(
    _FetchChekoutMenu event,
    Emitter<ChekoutState> emit,
  ) async {
    emit(const ChekoutState.loading());
    try {
      final result = await _cartRepository.fetchChekoutMenu(body: event.body);

      result.when(
        success: (response) =>
            emit(ChekoutState.success(chekoutModel: response)),
        failure: (error) => emit(ChekoutState.failed(
            message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const ChekoutState.failed());
    }
  }

  Future<void> _fetchChekout(
    _FetchChekout event,
    Emitter<ChekoutState> emit,
  ) async {
    emit(const ChekoutState.loading());
    try {
      final result = await _cartRepository.fetchChekout(body: event.body);

      result.when(
        success: (response) =>
            emit(ChekoutState.success(chekoutModel: response)),
        failure: (error) => emit(ChekoutState.failed(
            message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const ChekoutState.failed());
    }
  }

  Future<void> _fetchChekoutSubscription(
    _FetchChekoutSubscription event,
    Emitter<ChekoutState> emit,
  ) async {
    emit(const ChekoutState.loading());
    try {
      final result =
          await _cartRepository.fetchChekoutSubscription(id: event.id);
      result.when(
        success: (response) =>
            emit(ChekoutState.success(chekoutModel: response)),
        failure: (error) => emit(ChekoutState.failed(
            message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const ChekoutState.failed());
    }
  }
}
