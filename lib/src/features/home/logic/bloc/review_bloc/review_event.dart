part of 'review_bloc.dart';

@freezed
class ReviewEvent with _$ReviewEvent {
  const factory ReviewEvent.fetchRatings() = _FetchRatings;
  const factory ReviewEvent.sendReview({
    required ReviewRequest body,
    required int id,
  }) = _SendReview;
}
