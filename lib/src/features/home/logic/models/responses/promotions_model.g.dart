// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promotions _$PromotionsFromJson(Map<String, dynamic> json) => Promotions(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PromotionsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PromotionsToJson(Promotions instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

PromotionsData _$PromotionsDataFromJson(Map<String, dynamic> json) =>
    PromotionsData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      minDescription: json['min_description'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      goto: json['goto'] == null
          ? null
          : Goto.fromJson(json['goto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PromotionsDataToJson(PromotionsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'min_description': instance.minDescription,
      'description': instance.description,
      'image': instance.image,
      'goto': instance.goto,
    };

Goto _$GotoFromJson(Map<String, dynamic> json) => Goto(
      type: json['type'] as String?,
      url: json['url'] as String?,
      itemId: json['item_id'] as String?,
      text: json['text'] == null
          ? null
          : TextBtn.fromJson(json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GotoToJson(Goto instance) => <String, dynamic>{
      'type': instance.type,
      'url': instance.url,
      'item_id': instance.itemId,
      'text': instance.text,
    };

TextBtn _$TextBtnFromJson(Map<String, dynamic> json) => TextBtn(
      ru: json['ru'] as String?,
      en: json['en'] as String?,
      kk: json['kk'] as String?,
    );

Map<String, dynamic> _$TextBtnToJson(TextBtn instance) => <String, dynamic>{
      'ru': instance.ru,
      'en': instance.en,
      'kk': instance.kk,
    };
