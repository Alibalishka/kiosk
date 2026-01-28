// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_fcm_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendFcmRequest _$SendFcmRequestFromJson(Map<String, dynamic> json) =>
    SendFcmRequest(
      token: json['token'] as String,
      platform: json['platform'] as String,
      deviceName: json['device_name'] as String,
    );

Map<String, dynamic> _$SendFcmRequestToJson(SendFcmRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
      'platform': instance.platform,
      'device_name': instance.deviceName,
    };
