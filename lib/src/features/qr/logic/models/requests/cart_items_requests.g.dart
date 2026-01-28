// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_items_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemsRequests _$CartItemsRequestsFromJson(Map<String, dynamic> json) =>
    CartItemsRequests(
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItemsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartItemsRequestsToJson(CartItemsRequests instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

CartItemsData _$CartItemsDataFromJson(Map<String, dynamic> json) =>
    CartItemsData(
      id: (json['id'] as num).toInt(),
      organizationId: (json['organization_id'] as num).toInt(),
    );

Map<String, dynamic> _$CartItemsDataToJson(CartItemsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
    };
