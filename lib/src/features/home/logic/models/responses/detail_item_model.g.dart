// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailItemModel _$DetailItemModelFromJson(Map<String, dynamic> json) =>
    DetailItemModel(
      data: json['data'] == null
          ? null
          : DetailItemDatum.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailItemModelToJson(DetailItemModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DetailItemDatum _$DetailItemDatumFromJson(Map<String, dynamic> json) =>
    DetailItemDatum(
      id: (json['id'] as num?)?.toInt(),
      posOrgId: json['pos_org_id'] as String?,
      type: json['type'] as String?,
      catalog: json['catalog'] == null
          ? null
          : CatalogDatum.fromJson(json['catalog'] as Map<String, dynamic>),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => NewsDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewsAvg: json['reviews_avg'] as String?,
      reviewsCount: (json['reviews_count'] as num?)?.toInt(),
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      hasMenu: json['has_menu'] as bool?,
      orgId: json['org_id'] as String?,
      menuLink: json['menu_link'] as String?,
      isReady: json['is_ready'] as bool?,
      canReserve: json['can_reserve'] as bool?,
      graphicWorks: (json['graphic_works'] as List<dynamic>?)
          ?.map((e) => GraphicWorkDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailItemDatumToJson(DetailItemDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pos_org_id': instance.posOrgId,
      'type': instance.type,
      'catalog': instance.catalog,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'images': instance.images,
      'reviews_avg': instance.reviewsAvg,
      'reviews_count': instance.reviewsCount,
      'address': instance.address,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'lat': instance.lat,
      'lng': instance.lng,
      'has_menu': instance.hasMenu,
      'org_id': instance.orgId,
      'menu_link': instance.menuLink,
      'is_ready': instance.isReady,
      'can_reserve': instance.canReserve,
      'graphic_works': instance.graphicWorks,
    };

GraphicWorkDatum _$GraphicWorkDatumFromJson(Map<String, dynamic> json) =>
    GraphicWorkDatum(
      isClosed: json['is_closed'] as bool?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      dayRaw: json['day_raw'] as String?,
      day: (json['day'] as num?)?.toInt(),
      isAllDay: json['is_all_day'] as bool?,
    );

Map<String, dynamic> _$GraphicWorkDatumToJson(GraphicWorkDatum instance) =>
    <String, dynamic>{
      'is_closed': instance.isClosed,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'day_raw': instance.dayRaw,
      'day': instance.day,
      'is_all_day': instance.isAllDay,
    };
