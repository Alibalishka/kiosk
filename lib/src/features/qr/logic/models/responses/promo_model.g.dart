// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromoModel _$PromoModelFromJson(Map<String, dynamic> json) => PromoModel(
      data: json['data'] == null
          ? null
          : PromoData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PromoModelToJson(PromoModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

PromoData _$PromoDataFromJson(Map<String, dynamic> json) => PromoData(
      success: json['success'] as bool?,
      type: json['type'] as String?,
      code: json['code'] as String?,
      bonus: json['bonus'] as String?,
    );

Map<String, dynamic> _$PromoDataToJson(PromoData instance) => <String, dynamic>{
      'success': instance.success,
      'type': instance.type,
      'code': instance.code,
      'bonus': instance.bonus,
    };
