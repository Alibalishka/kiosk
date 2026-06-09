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
      section: json['section'] == null
          ? null
          : SectionData.fromJson(json['section'] as Map<String, dynamic>),
      menuVersion: (json['menu_version'] as num?)?.toInt(),
      menuEtag: json['menu_etag'] as String?,
      menuLastModified: json['menu_last_modified'] == null
          ? null
          : DateTime.parse(json['menu_last_modified'] as String),
      advertisementVersion: (json['advertisement_version'] as num?)?.toInt(),
      advertisementEtag: json['advertisement_etag'] as String?,
      advertisementLastModified: json['advertisement_last_modified'] == null
          ? null
          : DateTime.parse(json['advertisement_last_modified'] as String),
    );

Map<String, dynamic> _$KioskStatusDatumToJson(KioskStatusDatum instance) =>
    <String, dynamic>{
      'version': instance.version,
      'section': instance.section,
      'menu_version': instance.menuVersion,
      'menu_etag': instance.menuEtag,
      'menu_last_modified': instance.menuLastModified?.toIso8601String(),
      'advertisement_version': instance.advertisementVersion,
      'advertisement_etag': instance.advertisementEtag,
      'advertisement_last_modified':
          instance.advertisementLastModified?.toIso8601String(),
    };

SectionData _$SectionDataFromJson(Map<String, dynamic> json) => SectionData(
      id: (json['id'] as num?)?.toInt(),
      itemId: (json['item_id'] as num?)?.toInt(),
      number: json['number'] as String?,
      tableId: json['table_id'],
      terminalGroupId: json['terminal_group_id'],
      groupName: json['group_name'] as String?,
      posId: json['pos_id'] as String?,
    );

Map<String, dynamic> _$SectionDataToJson(SectionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_id': instance.itemId,
      'number': instance.number,
      'table_id': instance.tableId,
      'terminal_group_id': instance.terminalGroupId,
      'group_name': instance.groupName,
      'pos_id': instance.posId,
    };
