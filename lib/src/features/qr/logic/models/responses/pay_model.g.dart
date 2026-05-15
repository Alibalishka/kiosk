// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayModel _$PayModelFromJson(Map<String, dynamic> json) => PayModel(
      orderId: (json['order_id'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num?)?.toDouble(),
      redirectUrl: json['redirect_url'] as String?,
    )..data = json['data'] == null
        ? null
        : PayDatum.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$PayModelToJson(PayModel instance) => <String, dynamic>{
      'order_id': instance.orderId,
      'total_price': instance.totalPrice,
      'redirect_url': instance.redirectUrl,
      'data': instance.data,
    };

PayDatum _$PayDatumFromJson(Map<String, dynamic> json) => PayDatum(
      id: (json['id'] as num?)?.toInt(),
      paymentMethod: json['payment_method'] == null
          ? null
          : PaymentMethod.fromJson(
              json['payment_method'] as Map<String, dynamic>),
      redirectUrl: json['redirect_url'] as String?,
    );

Map<String, dynamic> _$PayDatumToJson(PayDatum instance) => <String, dynamic>{
      'id': instance.id,
      'payment_method': instance.paymentMethod,
      'redirect_url': instance.redirectUrl,
    };
