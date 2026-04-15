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
      temperatureC: (json['temperature_c'] as num?)?.toDouble(),
      ramTotalMb: (json['ram_total_mb'] as num?)?.toInt(),
      ramAvailableMb: (json['ram_available_mb'] as num?)?.toInt(),
      ramUsedMb: (json['ram_used_mb'] as num?)?.toInt(),
      uptimeSec: (json['uptime_sec'] as num?)?.toInt(),
    );

Map<String, dynamic> _$KioskStatusRequestToJson(KioskStatusRequest instance) =>
    <String, dynamic>{
      'battery_level': instance.batteryLevel,
      'battery_status': instance.batteryStatus,
      'network_level': instance.networkLevel,
      'network_type': instance.networkType,
      'screen_status': instance.screenStatus,
      'status': instance.status,
      'temperature_c': instance.temperatureC,
      'ram_total_mb': instance.ramTotalMb,
      'ram_available_mb': instance.ramAvailableMb,
      'ram_used_mb': instance.ramUsedMb,
      'uptime_sec': instance.uptimeSec,
    };
