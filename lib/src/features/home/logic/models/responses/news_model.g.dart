// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NewsDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'data': instance.data,
    };

NewsDatum _$NewsDatumFromJson(Map<String, dynamic> json) => NewsDatum(
      id: (json['id'] as num?)?.toInt(),
      itemId: (json['item_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      path: json['path'] as String?,
      headerTitle: json['header_title'] as String?,
      file: json['file'] as String?,
      filePreview: json['file_preview'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => NewsDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..text = json['text'] as String?;

Map<String, dynamic> _$NewsDatumToJson(NewsDatum instance) => <String, dynamic>{
      'id': instance.id,
      'item_id': instance.itemId,
      'name': instance.name,
      'image': instance.image,
      'path': instance.path,
      'text': instance.text,
      'header_title': instance.headerTitle,
      'file': instance.file,
      'file_preview': instance.filePreview,
      'items': instance.items,
    };
