// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableOrdersResponse _$TableOrdersResponseFromJson(Map<String, dynamic> json) =>
    TableOrdersResponse(
      data: json['data'] == null
          ? null
          : TableOrdersData.fromJson(json['data'] as Map<String, dynamic>),
    );

TableOrdersData _$TableOrdersDataFromJson(Map<String, dynamic> json) =>
    TableOrdersData(
      pollAfter: (json['poll_after'] as num?)?.toInt(),
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => TableOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

TableOrder _$TableOrderFromJson(Map<String, dynamic> json) => TableOrder(
      id: (json['id'] as num?)?.toInt(),
      posNumber: (json['pos_number'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      status: $enumDecodeNullable(_$TableOrderStatusEnumMap, json['status'],
          unknownValue: TableOrderStatus.unknown),
      paid: json['paid'] as bool?,
      paymentMethod: $enumDecodeNullable(
          _$OrderPaymentMethodEnumMap, json['payment_method'],
          unknownValue: OrderPaymentMethod.unknown),
      total: (json['total'] as num?)?.toInt(),
      stage: $enumDecodeNullable(_$OrderStageEnumMap, json['stage'],
          unknownValue: OrderStage.unknown),
      rounds: (json['rounds'] as List<dynamic>?)
          ?.map((e) => TableOrderRound.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$TableOrderStatusEnumMap = {
  TableOrderStatus.open: 'open',
  TableOrderStatus.bill: 'bill',
  TableOrderStatus.error: 'error',
  TableOrderStatus.unknown: 'unknown',
};

const _$OrderPaymentMethodEnumMap = {
  OrderPaymentMethod.payAtVenue: 'pay_at_venue',
  OrderPaymentMethod.online: 'online',
  OrderPaymentMethod.unknown: 'unknown',
};

const _$OrderStageEnumMap = {
  OrderStage.accepted: 'new',
  OrderStage.cooking: 'cooking',
  OrderStage.ready: 'ready',
  OrderStage.issued: 'issued',
  OrderStage.unknown: 'unknown',
};

TableOrderRound _$TableOrderRoundFromJson(Map<String, dynamic> json) =>
    TableOrderRound(
      at: json['at'] == null ? null : DateTime.parse(json['at'] as String),
      source: $enumDecodeNullable(_$OrderRoundSourceEnumMap, json['source'],
          unknownValue: OrderRoundSource.unknown),
      stage: $enumDecodeNullable(_$OrderStageEnumMap, json['stage'],
          unknownValue: OrderStage.unknown),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => TableOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$OrderRoundSourceEnumMap = {
  OrderRoundSource.guest: 'guest',
  OrderRoundSource.waiter: 'waiter',
  OrderRoundSource.unknown: 'unknown',
};

TableOrderItem _$TableOrderItemFromJson(Map<String, dynamic> json) =>
    TableOrderItem(
      name: json['name'] as String?,
      amount: json['amount'] as num?,
      sum: (json['sum'] as num?)?.toInt(),
      stage: $enumDecodeNullable(_$OrderStageEnumMap, json['stage'],
          unknownValue: OrderStage.unknown),
      modifiers: (json['modifiers'] as List<dynamic>?)
          ?.map((e) => TableOrderModifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

TableOrderModifier _$TableOrderModifierFromJson(Map<String, dynamic> json) =>
    TableOrderModifier(
      name: json['name'] as String?,
      amount: json['amount'] as num?,
    );
