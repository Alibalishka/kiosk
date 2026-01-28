part of 'history_order_bloc.dart';

@freezed
class HistoryOrderEvent with _$HistoryOrderEvent {
  const factory HistoryOrderEvent.fetchHistoryOrder() = _FetchHistoryOrder;
  const factory HistoryOrderEvent.fetchHistoryDetailOrder({required int id}) =
      _FetchHistoryDetailOrder;
}
