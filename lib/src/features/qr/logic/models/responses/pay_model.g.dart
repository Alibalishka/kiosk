// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayModel _$PayModelFromJson(Map<String, dynamic> json) => PayModel(
      orderId: (json['order_id'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num?)?.toDouble(),
      redirectUrl: json['redirect_url'] as String?,
    );

Map<String, dynamic> _$PayModelToJson(PayModel instance) => <String, dynamic>{
      'order_id': instance.orderId,
      'total_price': instance.totalPrice,
      'redirect_url': instance.redirectUrl,
    };
