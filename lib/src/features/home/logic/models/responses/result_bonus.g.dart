// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_bonus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultBonus _$ResultBonusFromJson(Map<String, dynamic> json) => ResultBonus(
      data: json['data'] == null
          ? null
          : ResultBonusDatum.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultBonusToJson(ResultBonus instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ResultBonusDatum _$ResultBonusDatumFromJson(Map<String, dynamic> json) =>
    ResultBonusDatum(
      id: (json['id'] as num?)?.toInt(),
      tableId: json['table_id'] as String?,
      iikoOrderId: json['iiko_order_id'] as String?,
    );

Map<String, dynamic> _$ResultBonusDatumToJson(ResultBonusDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'table_id': instance.tableId,
      'iiko_order_id': instance.iikoOrderId,
    };
