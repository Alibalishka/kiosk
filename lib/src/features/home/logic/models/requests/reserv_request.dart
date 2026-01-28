import 'package:freezed_annotation/freezed_annotation.dart';

part 'reserv_request.g.dart';

@JsonSerializable()
class ReservRequest {
  final int itemId;
  final String date;
  final int guestsCount;
  final String time;
  final int tableId;
  final int duration;
  final String comment;

  ReservRequest({
    required this.itemId,
    required this.date,
    required this.guestsCount,
    required this.time,
    required this.tableId,
    required this.duration,
    required this.comment,
  });

  Map<String, dynamic> toJson() => _$ReservRequestToJson(this);
}
