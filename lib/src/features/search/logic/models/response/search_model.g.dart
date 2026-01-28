// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      data: json['data'] == null
          ? null
          : SearchData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

SearchData _$SearchDataFromJson(Map<String, dynamic> json) => SearchData(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchDataToJson(SearchData instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      slug: json['slug'] as String?,
      catalog: json['catalog'] == null
          ? null
          : Catalog.fromJson(json['catalog'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'slug': instance.slug,
      'catalog': instance.catalog,
      'name': instance.name,
    };

Catalog _$CatalogFromJson(Map<String, dynamic> json) => Catalog(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'],
      type: json['type'],
      slug: json['slug'] as String?,
      image: json['image'],
    );

Map<String, dynamic> _$CatalogToJson(Catalog instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'slug': instance.slug,
      'image': instance.image,
    };
