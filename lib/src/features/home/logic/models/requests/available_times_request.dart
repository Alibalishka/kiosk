import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_times_request.g.dart';

@JsonSerializable()
class AvailableTimesRequest {
  final int itemId;
  final String date;
  final int guestsCount;

  AvailableTimesRequest({
    required this.itemId,
    required this.date,
    required this.guestsCount,
  });

  Map<String, dynamic> toJson() => _$AvailableTimesRequestToJson(this);
}
