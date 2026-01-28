import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'available_times_response.g.dart';

@JsonSerializable()
class AvailableTimesResponse extends BaseModel<AvailableTimesResponse> {
  List<AvailableTimesDatum>? data;

  AvailableTimesResponse({this.data});

  factory AvailableTimesResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailableTimesResponseFromJson(json);

  @override
  AvailableTimesResponse fromJson(Map<String, dynamic> json) =>
      AvailableTimesResponse.fromJson(json);
}

@JsonSerializable()
class AvailableTimesDatum extends BaseModel<AvailableTimesDatum> {
  int? startStamp;
  int? endStamp;
  int? duration;
  DateTime? startDatetime;
  DateTime? endDatetime;
  bool? isFree;
  int? tablesCount;
  List<int>? tablesIds;

  AvailableTimesDatum({
    this.startStamp,
    this.endStamp,
    this.duration,
    this.startDatetime,
    this.endDatetime,
    this.isFree,
    this.tablesCount,
    this.tablesIds,
  });

  factory AvailableTimesDatum.fromJson(Map<String, dynamic> json) =>
      _$AvailableTimesDatumFromJson(json);

  @override
  AvailableTimesDatum fromJson(Map<String, dynamic> json) =>
      AvailableTimesDatum.fromJson(json);
}
