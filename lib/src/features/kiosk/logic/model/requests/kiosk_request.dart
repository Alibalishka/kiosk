import 'package:json_annotation/json_annotation.dart';

part 'kiosk_request.g.dart';

@JsonSerializable()
class KioskRequest {
  String deviceId;
  String model;
  String connectionCode;

  KioskRequest({
    required this.deviceId,
    required this.model,
    required this.connectionCode,
  });

  Map<String, dynamic> toJson() => _$KioskRequestToJson(this);
}
