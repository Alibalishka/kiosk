// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsModel _$ItemsModelFromJson(Map<String, dynamic> json) => ItemsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsModelToJson(ItemsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      currentPage: (json['current_page'] as num?)?.toInt(),
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      path: json['path'] as String?,
      perPage: (json['per_page'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'path': instance.path,
      'per_page': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: (json['id'] as num?)?.toInt(),
      address: json['address'] as String?,
      type: json['type'] as String?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      cityId: (json['city_id'] as num?)?.toInt(),
      catalog: json['catalog'] == null
          ? null
          : CatalogDatum.fromJson(json['catalog'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt(),
      discountPrice: (json['discount_price'] as num?)?.toInt(),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'slug': instance.slug,
      'catalog': instance.catalog,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'address': instance.address,
      'city_id': instance.cityId,
      'price': instance.price,
      'discount_price': instance.discountPrice,
      'options': instance.options,
      'tags': instance.tags,
    };

CatalogDatum _$CatalogDatumFromJson(Map<String, dynamic> json) => CatalogDatum(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$CatalogDatumToJson(CatalogDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'slug': instance.slug,
    };

ImageDatum _$ImageDatumFromJson(Map<String, dynamic> json) => ImageDatum(
      id: (json['id'] as num?)?.toInt(),
      itemId: (json['item_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      path: json['path'] as String?,
      headerTitle: json['header_title'] as String?,
      file: json['file'] as String?,
      filePreview: json['file_preview'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ImageDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..text = json['text'] as String?;

Map<String, dynamic> _$ImageDatumToJson(ImageDatum instance) =>
    <String, dynamic>{
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

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      isRequired: json['is_required'] as bool?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_required': instance.isRequired,
      'products': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: json['price'],
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
    };

TagsData _$TagsDataFromJson(Map<String, dynamic> json) => TagsData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$TagsDataToJson(TagsData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
    };
