part of 'history_bloc.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = _Initial;
  const factory HistoryState.loading() = _Loading;
  const factory HistoryState.success({required HistoryModel historyData}) =
      _Success;
  const factory HistoryState.failed(
      {@Default('Произошла ошибка') String message}) = _Failed;
}
