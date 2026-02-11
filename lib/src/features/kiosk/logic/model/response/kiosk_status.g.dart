// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kiosk_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KioskStatus _$KioskStatusFromJson(Map<String, dynamic> json) => KioskStatus(
      data: json['data'] == null
          ? null
          : KioskStatusDatum.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KioskStatusToJson(KioskStatus instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

KioskStatusDatum _$KioskStatusDatumFromJson(Map<String, dynamic> json) =>
    KioskStatusDatum(
      version: json['version'] as String?,
    );

Map<String, dynamic> _$KioskStatusDatumToJson(KioskStatusDatum instance) =>
    <String, dynamic>{
      'version': instance.version,
    };
