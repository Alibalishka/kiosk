part of 'support_bloc.dart';

@freezed
class SupportState with _$SupportState {
  const factory SupportState.initial() = _Initial;
  const factory SupportState.loading() = _Loading;
  const factory SupportState.success() = _Success;
  const factory SupportState.failed(
      {@Default('Произошла ошибка') String message}) = _Failed;
}
