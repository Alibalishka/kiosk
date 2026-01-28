part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.loading() = _Loading;
  const factory NewsState.success({required NewsModel newsModel}) = _Success;
  const factory NewsState.failed(
      {@Default('Произошла ошибка') String message}) = _Failed;
}
