part of 'review_bloc.dart';

@freezed
class ReviewState with _$ReviewState {
  const factory ReviewState.initial() = _Initial;
  const factory ReviewState.loading() = _Loading;
  const factory ReviewState.successFetch({required ReviewModel ratingEntity}) =
      _SuccessFetch;
  const factory ReviewState.successSend() = _SuccessSend;
  const factory ReviewState.sendLoading() = _SendLoading;
  const factory ReviewState.failed(
      {@Default('Произошла ошибка') String message}) = _Failed;
}
