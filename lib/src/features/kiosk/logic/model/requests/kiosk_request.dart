import 'package:json_annotation/json_annotation.dart';

part 'kiosk_request.g.dart';

@JsonSerializable()
class KioskRequest {
  String deviceId;
  String model;
  String connectionCode;
  String name;
  dynamic sectionId;

  KioskRequest({
    required this.deviceId,
    required this.model,
    required this.connectionCode,
    required this.name,
    this.sectionId,
  });

  Map<String, dynamic> toJson() => _$KioskRequestToJson(this);
}
