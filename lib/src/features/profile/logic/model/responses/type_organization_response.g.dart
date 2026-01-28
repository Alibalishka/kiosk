// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_organization_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeOrganizationResponse _$TypeOrganizationResponseFromJson(
        Map<String, dynamic> json) =>
    TypeOrganizationResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => TypeOrganizationDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TypeOrganizationResponseToJson(
        TypeOrganizationResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

TypeOrganizationDatum _$TypeOrganizationDatumFromJson(
        Map<String, dynamic> json) =>
    TypeOrganizationDatum(
      id: (json['id'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TypeOrganizationDatumToJson(
        TypeOrganizationDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
    };
