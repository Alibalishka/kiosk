import 'package:freezed_annotation/freezed_annotation.dart';

part 'kiosk_status_request.g.dart';

@JsonSerializable()
class KioskStatusRequest {
  final int batteryLevel;
  final String batteryStatus;
  final int networkLevel;
  final String networkType;
  final String screenStatus;
  final String status;
  final double? temperatureC;
  final int? ramTotalMb;
  final int? ramAvailableMb;
  final int? ramUsedMb;
  final int? uptimeSec;

  KioskStatusRequest({
    required this.batteryLevel,
    required this.batteryStatus,
    required this.networkLevel,
    required this.networkType,
    required this.screenStatus,
    required this.status,
    this.temperatureC,
    this.ramTotalMb,
    this.ramAvailableMb,
    this.ramUsedMb,
    this.uptimeSec,
  });

  Map<String, dynamic> toJson() => _$KioskStatusRequestToJson(this);
}
