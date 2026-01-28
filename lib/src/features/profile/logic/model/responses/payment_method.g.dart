// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PaymentMethodDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

PaymentMethodDatum _$PaymentMethodDatumFromJson(Map<String, dynamic> json) =>
    PaymentMethodDatum(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      provider: json['provider'] as String?,
    );

Map<String, dynamic> _$PaymentMethodDatumToJson(PaymentMethodDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'provider': instance.provider,
    };
