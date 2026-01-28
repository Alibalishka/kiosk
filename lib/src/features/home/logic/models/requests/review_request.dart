import 'package:json_annotation/json_annotation.dart';

part 'review_request.g.dart';

@JsonSerializable()
class ReviewRequest {
  final int rating;
  final List<int> ratingMessages;
  final String comment;

  ReviewRequest({
    required this.rating,
    required this.ratingMessages,
    required this.comment,
  });

  Map<String, dynamic> toJson() => _$ReviewRequestToJson(this);
}
