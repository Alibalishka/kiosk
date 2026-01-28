// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressRequest _$AddressRequestFromJson(Map<String, dynamic> json) =>
    AddressRequest(
      address: json['address'] as String?,
      house: json['house'] as String?,
      floor: json['floor'] as String?,
      apartment: json['apartment'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$AddressRequestToJson(AddressRequest instance) =>
    <String, dynamic>{
      'address': instance.address,
      'house': instance.house,
      'floor': instance.floor,
      'apartment': instance.apartment,
      'lat': instance.lat,
      'lng': instance.lng,
      'comment': instance.comment,
    };
