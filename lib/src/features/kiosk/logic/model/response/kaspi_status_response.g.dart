// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kaspi_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KaspiStatus _$KaspiStatusFromJson(Map<String, dynamic> json) => KaspiStatus(
      data: json['data'] == null
          ? null
          : KaspiStatusDatum.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KaspiStatusToJson(KaspiStatus instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

KaspiStatusDatum _$KaspiStatusDatumFromJson(Map<String, dynamic> json) =>
    KaspiStatusDatum(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$KaspiStatusDatumToJson(KaspiStatusDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
    };
