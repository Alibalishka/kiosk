// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryOrderEntity _$HistoryOrderEntityFromJson(Map<String, dynamic> json) =>
    HistoryOrderEntity(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => HistoryOrderDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryOrderEntityToJson(HistoryOrderEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

HistoryOrderDatum _$HistoryOrderDatumFromJson(Map<String, dynamic> json) =>
    HistoryOrderDatum(
      id: (json['id'] as num?)?.toInt(),
      isUsedBonus: json['is_used_bonus'] as bool?,
      bonus: (json['bonus'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num?)?.toInt(),
      bonusAccured: json['bonus_accured'],
      iikoOrderId: json['iiko_order_id'] as String?,
      serviceSum: (json['service_sum'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      item: json['item'] == null
          ? null
          : HistoryOrderItem.fromJson(json['item'] as Map<String, dynamic>),
      statusRaw: json['status_raw'] as String?,
      statusText: json['status_text'] as String?,
      paymentStatus: (json['payment_status'] as num?)?.toInt(),
      paymentStatusText: json['payment_status_text'],
    );

Map<String, dynamic> _$HistoryOrderDatumToJson(HistoryOrderDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_used_bonus': instance.isUsedBonus,
      'bonus': instance.bonus,
      'total_price': instance.totalPrice,
      'bonus_accured': instance.bonusAccured,
      'iiko_order_id': instance.iikoOrderId,
      'service_sum': instance.serviceSum,
      'created_at': instance.createdAt?.toIso8601String(),
      'item': instance.item,
      'status_raw': instance.statusRaw,
      'status_text': instance.statusText,
      'payment_status': instance.paymentStatus,
      'payment_status_text': instance.paymentStatusText,
    };

HistoryOrderItem _$HistoryOrderItemFromJson(Map<String, dynamic> json) =>
    HistoryOrderItem(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      address: json['address'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$HistoryOrderItemToJson(HistoryOrderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'type': instance.type,
    };
