// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrMenuModel _$QrMenuModelFromJson(Map<String, dynamic> json) => QrMenuModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => QrMenuDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      featured: (json['featured'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommend: (json['recommend'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      organization: json['organization'] == null
          ? null
          : DetailItemDatum.fromJson(
              json['organization'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QrMenuModelToJson(QrMenuModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'featured': instance.featured,
      'recommend': instance.recommend,
      'organization': instance.organization,
    };

QrMenuDatum _$QrMenuDatumFromJson(Map<String, dynamic> json) => QrMenuDatum(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      recommend: (json['recommend'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      featured: (json['featured'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QrMenuDatumToJson(QrMenuDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'recommend': instance.recommend,
      'featured': instance.featured,
      'items': instance.items,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      id: (json['id'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => ImageDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toInt(),
      iikoId: json['iiko_id'] as String?,
      code: json['code'] as String?,
      modifiers: (json['modifiers'] as List<dynamic>?)
          ?.map((e) => Modifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      characteristics: (json['characteristics'] as List<dynamic>?)
          ?.map((e) => Characteristic.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultSelect: json['default'] as bool?,
      requiredSelect: json['required'] as bool?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'price': instance.price,
      'iiko_id': instance.iikoId,
      'code': instance.code,
      'modifiers': instance.modifiers,
      'characteristics': instance.characteristics,
      'default': instance.defaultSelect,
      'required': instance.requiredSelect,
    };

Modifier _$ModifierFromJson(Map<String, dynamic> json) => Modifier(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
      required: json['required'] as bool?,
      multiple: json['multiple'] as bool?,
      iikoId: json['iiko_id'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModifierToJson(Modifier instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'min': instance.min,
      'max': instance.max,
      'required': instance.required,
      'multiple': instance.multiple,
      'iiko_id': instance.iikoId,
      'items': instance.items,
    };

Characteristic _$CharacteristicFromJson(Map<String, dynamic> json) =>
    Characteristic(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      textValue: json['text_value'] as String?,
    );

Map<String, dynamic> _$CharacteristicToJson(Characteristic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'text_value': instance.textValue,
    };
