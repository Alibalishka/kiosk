part of 'free_bloc.dart';

@freezed
class FreeState with _$FreeState {
  const factory FreeState.initial() = _Initial;
  const factory FreeState.loading() = _Loading;
  const factory FreeState.success({required FreeModel items}) = _Success;
  const factory FreeState.failed(
      {@Default('Произошла ошибка') String message}) = _Failed;
}
