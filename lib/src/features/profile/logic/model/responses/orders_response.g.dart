// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersResponseModel _$OrdersResponseModelFromJson(Map<String, dynamic> json) =>
    OrdersResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OrderDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrdersResponseModelToJson(
        OrdersResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

OrderDatum _$OrderDatumFromJson(Map<String, dynamic> json) => OrderDatum(
      id: (json['id'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num?)?.toInt(),
      comment: json['comment'] as String?,
      status: (json['status'] as num?)?.toInt(),
      statusRaw: json['status_raw'] as String?,
      statusText: json['status_text'] as String?,
    );

Map<String, dynamic> _$OrderDatumToJson(OrderDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total_price': instance.totalPrice,
      'comment': instance.comment,
      'status': instance.status,
      'status_raw': instance.statusRaw,
      'status_text': instance.statusText,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      currentPage: (json['current_page'] as num?)?.toInt(),
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };
