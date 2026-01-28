import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/subscription_pay.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/subs_pay_model.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/subscription_model.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';

part 'subscription_event.dart';
part 'subscription_state.dart';
part 'subscription_bloc.freezed.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  final AuthRepository _authRepository;
  SubscriptionBloc({required final AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const _Initial()) {
    on<SubscriptionEvent>(
      (event, emit) => event.map(
        fetchSubscription: (event) => _fetchSubscription(event, emit),
        paySubscription: (event) => _paySubscription(event, emit),
        cancelSubscription: (event) => _cancelSubscription(event, emit),
      ),
    );
  }

  Future<void> _fetchSubscription(
    _FetchSubscription event,
    Emitter<SubscriptionState> emit,
  ) async {
    emit(const SubscriptionState.loading());
    try {
      final result = await _authRepository.fetchSubscription();
      result.when(
        success: (response) =>
            emit(SubscriptionState.success(subscription: response)),
        failure: (error) => emit(
          SubscriptionState.failed(
              message: error.msg ?? 'Ошибка загурзки данных'),
        ),
      );
    } on Object {
      emit(const SubscriptionState.failed());
    }
  }

  Future<void> _paySubscription(
    _PaySubscription event,
    Emitter<SubscriptionState> emit,
  ) async {
    emit(const SubscriptionState.loading());
    try {
      final result = await _authRepository.paySubscription(
          payRequest: event.payRequest, id: event.id);
      result.when(
        success: (response) =>
            emit(SubscriptionState.paySuccess(subsPayModel: response)),
        failure: (error) => SubscriptionState.failed(
            message: error.msg ?? 'Ошибка загурзки данных'),
      );
    } on Object {
      emit(const SubscriptionState.failed());
    }
  }

  Future<void> _cancelSubscription(
    _CancelSubscription event,
    Emitter<SubscriptionState> emit,
  ) async {
    emit(const SubscriptionState.loading());
    try {
      final result = await _authRepository.cancelSubscription(id: event.id);
      result.when(
        success: (response) => emit(const SubscriptionState.cancelSuccess()),
        failure: (error) => emit(
          SubscriptionState.failed(
              message: error.msg ?? 'Ошибка загрузки данных'),
        ),
      );
    } on Object {
      emit(const SubscriptionState.failed());
    }
  }
}
