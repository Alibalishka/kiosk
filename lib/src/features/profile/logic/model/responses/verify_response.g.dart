// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResponse _$VerifyResponseFromJson(Map<String, dynamic> json) =>
    VerifyResponse(
      data: json['data'] == null
          ? null
          : VerifyDatum.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyResponseToJson(VerifyResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

VerifyDatum _$VerifyDatumFromJson(Map<String, dynamic> json) => VerifyDatum(
      token: json['token'] as String?,
    );

Map<String, dynamic> _$VerifyDatumToJson(VerifyDatum instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
