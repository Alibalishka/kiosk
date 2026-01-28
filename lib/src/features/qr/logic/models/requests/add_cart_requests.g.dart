// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCartRequest _$AddCartRequestFromJson(Map<String, dynamic> json) =>
    AddCartRequest(
      quantity: json['quantity'] as String,
      organizationId: json['organization_id'] as String,
    );

Map<String, dynamic> _$AddCartRequestToJson(AddCartRequest instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'organization_id': instance.organizationId,
    };
