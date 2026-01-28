// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) =>
    SubscriptionModel(
      data: json['data'] == null
          ? null
          : SubscriptionData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubscriptionModelToJson(SubscriptionModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

SubscriptionData _$SubscriptionDataFromJson(Map<String, dynamic> json) =>
    SubscriptionData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      text: json['text'] as String?,
      color: json['color'] as String?,
      bgImage: json['bg_image'] as String?,
      image: json['image'] as String?,
      termInfos: (json['term_infos'] as List<dynamic>?)
          ?.map((e) => TermInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      prices: (json['prices'] as List<dynamic>?)
          ?.map((e) => Price.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubscriptionDataToJson(SubscriptionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'text': instance.text,
      'color': instance.color,
      'bg_image': instance.bgImage,
      'image': instance.image,
      'term_infos': instance.termInfos,
      'prices': instance.prices,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      price: (json['price'] as num?)?.toInt(),
      activeMonth: (json['active_month'] as num?)?.toInt(),
      isGoodDeal: json['is_good_deal'] as bool?,
      activeMonthText: json['active_month_text'] as String?,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'price': instance.price,
      'active_month': instance.activeMonth,
      'is_good_deal': instance.isGoodDeal,
      'active_month_text': instance.activeMonthText,
    };

TermInfo _$TermInfoFromJson(Map<String, dynamic> json) => TermInfo(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      bgImage: json['bg_image'] as String?,
    );

Map<String, dynamic> _$TermInfoToJson(TermInfo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'bg_image': instance.bgImage,
    };
