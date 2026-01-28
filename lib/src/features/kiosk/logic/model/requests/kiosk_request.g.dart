// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kiosk_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KioskRequest _$KioskRequestFromJson(Map<String, dynamic> json) => KioskRequest(
      deviceId: json['device_id'] as String,
      model: json['model'] as String,
      connectionCode: json['connection_code'] as String,
    );

Map<String, dynamic> _$KioskRequestToJson(KioskRequest instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'model': instance.model,
      'connection_code': instance.connectionCode,
    };
