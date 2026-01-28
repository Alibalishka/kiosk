// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailEntity _$OrderDetailEntityFromJson(Map<String, dynamic> json) =>
    OrderDetailEntity(
      data: json['data'] == null
          ? null
          : OrderDetailData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDetailEntityToJson(OrderDetailEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

OrderDetailData _$OrderDetailDataFromJson(Map<String, dynamic> json) =>
    OrderDetailData(
      id: (json['id'] as num?)?.toInt(),
      isUsedBonus: json['is_used_bonus'] as bool?,
      bonus: (json['bonus'] as num?)?.toInt(),
      statusRaw: json['status_raw'] as String?,
      statusText: json['status_text'] as String?,
      paymentStatusText: json['payment_status_text'] as String?,
      bonusAccured: (json['bonus_accured'] as num?)?.toInt(),
      paymentStatus: (json['payment_status'] as num?)?.toInt(),
      guestsCount: (json['guests_count'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num?)?.toInt(),
      deliveryCode: json['delivery_code'],
      deliveryType: json['delivery_type'],
      readyAt: json['ready_at'] == null
          ? null
          : DateTime.parse(json['ready_at'] as String),
      fullName: json['full_name'] as String?,
      number: (json['number'] as num?)?.toInt(),
      numberGenerated: json['number_generated'],
      tableId: json['table_id'] as String?,
      iikoOrderId: json['iiko_order_id'] as String?,
      serviceSum: (json['service_sum'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      item: json['item'] == null
          ? null
          : Item.fromJson(json['item'] as Map<String, dynamic>),
      dishes: (json['dishes'] as List<dynamic>?)
          ?.map((e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryPrice: (json['delivery_price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderDetailDataToJson(OrderDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_used_bonus': instance.isUsedBonus,
      'bonus': instance.bonus,
      'status_raw': instance.statusRaw,
      'status_text': instance.statusText,
      'payment_status_text': instance.paymentStatusText,
      'bonus_accured': instance.bonusAccured,
      'payment_status': instance.paymentStatus,
      'guests_count': instance.guestsCount,
      'total_price': instance.totalPrice,
      'delivery_price': instance.deliveryPrice,
      'delivery_code': instance.deliveryCode,
      'delivery_type': instance.deliveryType,
      'ready_at': instance.readyAt?.toIso8601String(),
      'full_name': instance.fullName,
      'number': instance.number,
      'number_generated': instance.numberGenerated,
      'table_id': instance.tableId,
      'iiko_order_id': instance.iikoOrderId,
      'service_sum': instance.serviceSum,
      'created_at': instance.createdAt?.toIso8601String(),
      'item': instance.item,
      'dishes': instance.dishes,
    };
