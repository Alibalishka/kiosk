import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/bonus_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/home_repository.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/checkout_model.dart';

part 'bonus_event.dart';
part 'bonus_state.dart';
part 'bonus_bloc.freezed.dart';

class BonusBloc extends Bloc<BonusEvent, BonusState> {
  final HomeRepository _homeRepository;
  BonusBloc({required final HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const _Initial()) {
    on<BonusEvent>(
      (event, emit) => event.map(
        fetchSubscriptionItems: (event) => _fetchSubscriptionItems(event, emit),
        orderSubscription: (event) => _orderSubscription(event, emit),
      ),
    );
  }

  Future<void> _fetchSubscriptionItems(
    _FetchSubscriptionItems event,
    Emitter<BonusState> emit,
  ) async {
    emit(const BonusState.loading());
    try {
      final result = await _homeRepository.fetchSubscriptionItems(id: event.id);
      result.when(
        success: (response) => emit(BonusState.success(items: response)),
        failure: (error) => emit(
            BonusState.failed(message: error.msg ?? 'Ошибка загрузки данных')),
      );
    } on Object {
      emit(const BonusState.failed());
    }
  }

  Future<void> _orderSubscription(
    _OrderSubscription event,
    Emitter<BonusState> emit,
  ) async {
    emit(const BonusState.loading());
    try {
      final result = await _homeRepository.orderSubscription(body: event.body);
      result.when(
        success: (response) => emit(BonusState.successOrder(model: response)),
        failure: (error) => emit(
            BonusState.failed(message: error.msg ?? 'Ошибка загрузки данных')),
      );
    } on Object {
      emit(const BonusState.failed());
    }
  }
}
