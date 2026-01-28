part of 'history_order_bloc.dart';

@freezed
class HistoryOrderState with _$HistoryOrderState {
  const factory HistoryOrderState.initial() = _Initial;
  const factory HistoryOrderState.loading() = _Loading;
  const factory HistoryOrderState.success({required Map<String, List<HistoryOrderDatum>> data}) =
      _Success;
  const factory HistoryOrderState.successDetail(
      {required OrderDetailEntity data}) = _SuccessDetail;
  const factory HistoryOrderState.failed(
      {@Default('Произошла ошибка') String message}) = _Failed;
}
