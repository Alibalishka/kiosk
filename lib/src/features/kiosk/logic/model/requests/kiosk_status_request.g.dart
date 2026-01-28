// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kiosk_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KioskStatusRequest _$KioskStatusRequestFromJson(Map<String, dynamic> json) =>
    KioskStatusRequest(
      batteryLevel: (json['battery_level'] as num).toInt(),
      batteryStatus: json['battery_status'] as String,
      networkLevel: (json['network_level'] as num).toInt(),
      networkType: json['network_type'] as String,
      screenStatus: json['screen_status'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$KioskStatusRequestToJson(KioskStatusRequest instance) =>
    <String, dynamic>{
      'battery_level': instance.batteryLevel,
      'battery_status': instance.batteryStatus,
      'network_level': instance.networkLevel,
      'network_type': instance.networkType,
      'screen_status': instance.screenStatus,
      'status': instance.status,
    };
