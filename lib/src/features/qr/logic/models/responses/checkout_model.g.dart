// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChekoutModel _$ChekoutModelFromJson(Map<String, dynamic> json) => ChekoutModel(
      data: json['data'] == null
          ? null
          : ChekoutDatum.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChekoutModelToJson(ChekoutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ChekoutDatum _$ChekoutDatumFromJson(Map<String, dynamic> json) => ChekoutDatum(
      guestsCount: (json['guests_count'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num?)?.toInt(),
      number: (json['number'] as num?)?.toInt(),
      tableId: json['table_id'] as String?,
      iikoOrderId: json['iiko_order_id'] as String?,
      serviceSum: (json['service_sum'] as num?)?.toDouble(),
      discounts: (json['discounts'] as List<dynamic>?)
          ?.map((e) => Discount.fromJson(e as Map<String, dynamic>))
          .toList(),
      vat: json['VAT'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      item: json['item'] == null
          ? null
          : ChekoutItem.fromJson(json['item'] as Map<String, dynamic>),
      dishes: (json['dishes'] as List<dynamic>?)
          ?.map((e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList(),
      section: json['section'] as String?,
      table: json['table'] as String?,
      kaspiPayReady: json['kaspi_pay_ready'] as bool?,
      cardPayReady: json['card_pay_ready'] as bool?,
    );

Map<String, dynamic> _$ChekoutDatumToJson(ChekoutDatum instance) =>
    <String, dynamic>{
      'guests_count': instance.guestsCount,
      'total_price': instance.totalPrice,
      'number': instance.number,
      'table_id': instance.tableId,
      'iiko_order_id': instance.iikoOrderId,
      'service_sum': instance.serviceSum,
      'discounts': instance.discounts,
      'VAT': instance.vat,
      'created_at': instance.createdAt?.toIso8601String(),
      'item': instance.item,
      'dishes': instance.dishes,
      'section': instance.section,
      'table': instance.table,
      'kaspi_pay_ready': instance.kaspiPayReady,
      'card_pay_ready': instance.cardPayReady,
    };

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
      name: json['name'] as String?,
      count: (json['count'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num?)?.toInt(),
      modifiers: (json['modifiers'] as List<dynamic>?)
          ?.map((e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
      'total_price': instance.totalPrice,
      'modifiers': instance.modifiers,
    };

ChekoutItem _$ChekoutItemFromJson(Map<String, dynamic> json) => ChekoutItem(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      address: json['address'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChekoutItemToJson(ChekoutItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'images': instance.images,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: (json['id'] as num?)?.toInt(),
      path: json['path'] as String?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
    };

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
      name: json['name'] as String?,
      sum: (json['sum'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'name': instance.name,
      'sum': instance.sum,
    };
