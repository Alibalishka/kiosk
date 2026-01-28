import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/history_order.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/order_detail.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';

part 'history_order_event.dart';
part 'history_order_state.dart';
part 'history_order_bloc.freezed.dart';

class HistoryOrderBloc extends Bloc<HistoryOrderEvent, HistoryOrderState> {
  final AuthRepository _authRepository;
  HistoryOrderBloc({required final AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const _Initial()) {
    on<HistoryOrderEvent>(
      (event, emit) => event.map(
        fetchHistoryOrder: (event) => _fetchHistoryOrder(event, emit),
        fetchHistoryDetailOrder: (event) =>
            _fetchHistoryDetailOrder(event, emit),
      ),
    );
  }

  Future<void> _fetchHistoryOrder(
    _FetchHistoryOrder event,
    Emitter<HistoryOrderState> emit,
  ) async {
    emit(const HistoryOrderState.loading());
    try {
      final result = await _authRepository.fetchHistoryOrder();
      result.when(
        success: (response) {
          final groupedOrders = groupOrdersByDate(response);
          emit(HistoryOrderState.success(data: groupedOrders));
        },
        failure: (error) => emit(HistoryOrderState.failed(
            message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const HistoryOrderState.failed());
    }
  }

  Future<void> _fetchHistoryDetailOrder(
    _FetchHistoryDetailOrder event,
    Emitter<HistoryOrderState> emit,
  ) async {
    emit(const HistoryOrderState.loading());
    try {
      final result =
          await _authRepository.fetchHistoryDetailOrder(id: event.id);
      result.when(
        success: (response) =>
            emit(HistoryOrderState.successDetail(data: response)),
        failure: (error) => emit(HistoryOrderState.failed(
            message: error.msg ?? 'Ошибка загрузки данных')),
      );
    } on Object {
      emit(const HistoryOrderState.failed());
    }
  }
}

Map<String, List<HistoryOrderDatum>> groupOrdersByDate(
    HistoryOrderEntity entity) {
  // Проверяем, что data не null
  if (entity.data == null) return {};

  // Функция для получения строки даты (YYYY-MM-DD)
  String getDate(DateTime? dateTime) {
    if (dateTime == null) return 'Unknown';
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }

  // Группировка
  Map<String, List<HistoryOrderDatum>> groupedByDate = {};

  for (var order in entity.data!) {
    String dateKey = getDate(order.createdAt);
    if (!groupedByDate.containsKey(dateKey)) {
      groupedByDate[dateKey] = [];
    }
    groupedByDate[dateKey]!.add(order);
  }

  return groupedByDate;
}
