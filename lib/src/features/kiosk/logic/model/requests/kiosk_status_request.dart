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

  KioskStatusRequest({
    required this.batteryLevel,
    required this.batteryStatus,
    required this.networkLevel,
    required this.networkType,
    required this.screenStatus,
    required this.status,
  });

  Map<String, dynamic> toJson() => _$KioskStatusRequestToJson(this);
}
