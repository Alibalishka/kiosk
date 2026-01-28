// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tech_work_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechWorkResponse _$TechWorkResponseFromJson(Map<String, dynamic> json) =>
    TechWorkResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : TechWorkDatum.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TechWorkResponseToJson(TechWorkResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

TechWorkDatum _$TechWorkDatumFromJson(Map<String, dynamic> json) =>
    TechWorkDatum(
      header: json['header'] as String?,
      example: json['example'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$TechWorkDatumToJson(TechWorkDatum instance) =>
    <String, dynamic>{
      'header': instance.header,
      'example': instance.example,
      'active': instance.active,
    };
