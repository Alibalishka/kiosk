// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'free_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeModel _$FreeModelFromJson(Map<String, dynamic> json) => FreeModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FreeDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FreeModelToJson(FreeModel instance) => <String, dynamic>{
      'data': instance.data,
    };

FreeDatum _$FreeDatumFromJson(Map<String, dynamic> json) => FreeDatum(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FreeDatumToJson(FreeDatum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'items': instance.items,
    };
