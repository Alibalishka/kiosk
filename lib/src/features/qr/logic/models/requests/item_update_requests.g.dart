// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_update_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemRequests _$ItemRequestsFromJson(Map<String, dynamic> json) => ItemRequests(
      id: (json['id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      organizationId: (json['organization_id'] as num).toInt(),
    );

Map<String, dynamic> _$ItemRequestsToJson(ItemRequests instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'organization_id': instance.organizationId,
    };
