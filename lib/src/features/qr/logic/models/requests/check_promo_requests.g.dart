// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_promo_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckPromoRequest _$CheckPromoRequestFromJson(Map<String, dynamic> json) =>
    CheckPromoRequest(
      discountCode: json['discount_code'] as String?,
      dishes: (json['dishes'] as List<dynamic>?)
          ?.map((e) => DishesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckPromoRequestToJson(CheckPromoRequest instance) =>
    <String, dynamic>{
      'discount_code': instance.discountCode,
      'dishes': instance.dishes,
    };

DishesData _$DishesDataFromJson(Map<String, dynamic> json) => DishesData(
      id: (json['id'] as num?)?.toInt(),
      totalPrice: json['total_price'] as String?,
    );

Map<String, dynamic> _$DishesDataToJson(DishesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total_price': instance.totalPrice,
    };
