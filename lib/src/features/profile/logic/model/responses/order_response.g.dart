// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponseModel _$OrderResponseModelFromJson(Map<String, dynamic> json) =>
    OrderResponseModel(
      data: json['data'] == null
          ? null
          : OrderData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderResponseModelToJson(OrderResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

OrderData _$OrderDataFromJson(Map<String, dynamic> json) => OrderData(
      id: (json['id'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num?)?.toInt(),
      paymentMethod: json['payment_method'] == null
          ? null
          : PaymentMethod.fromJson(
              json['payment_method'] as Map<String, dynamic>),
      comment: json['comment'] as String?,
      userAddress: json['user_address'],
      status: (json['status'] as num?)?.toInt(),
      statusRaw: json['status_raw'] as String?,
      statusText: json['status_text'] as String?,
    );

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'id': instance.id,
      'total_price': instance.totalPrice,
      'payment_method': instance.paymentMethod,
      'comment': instance.comment,
      'user_address': instance.userAddress,
      'status': instance.status,
      'status_raw': instance.statusRaw,
      'status_text': instance.statusText,
    };

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'slug': instance.slug,
    };
