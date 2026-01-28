// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) => HistoryModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => HistoryDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryModelToJson(HistoryModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

HistoryDatum _$HistoryDatumFromJson(Map<String, dynamic> json) => HistoryDatum(
      id: (json['id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      bonus: (json['bonus'] as num?)?.toInt(),
      isMoney: json['is_money'] as bool?,
      isReplenish: json['is_replenish'] as bool?,
      createdAt: json['created_at'] as String?,
      slug: json['slug'] as String?,
      typeId: json['type_id'],
      text: json['text'] as String?,
      orderId: json['order_id'],
    );

Map<String, dynamic> _$HistoryDatumToJson(HistoryDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'bonus': instance.bonus,
      'is_money': instance.isMoney,
      'is_replenish': instance.isReplenish,
      'created_at': instance.createdAt,
      'slug': instance.slug,
      'type_id': instance.typeId,
      'text': instance.text,
      'order_id': instance.orderId,
    };
