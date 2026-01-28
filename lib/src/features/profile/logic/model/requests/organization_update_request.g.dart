// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationUpdateRequest _$OrganizationUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    OrganizationUpdateRequest(
      name: json['name'] as String?,
      typeOrganizationId: json['type_organization_id'] as String?,
      binIin: json['bin_iin'] as String?,
    );

Map<String, dynamic> _$OrganizationUpdateRequestToJson(
        OrganizationUpdateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type_organization_id': instance.typeOrganizationId,
      'bin_iin': instance.binIin,
    };
