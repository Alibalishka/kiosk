// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressResponseModel _$AddressResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddressResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AddressResponseDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressResponseModelToJson(
        AddressResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AddressResponseDatum _$AddressResponseDatumFromJson(
        Map<String, dynamic> json) =>
    AddressResponseDatum(
      id: (json['id'] as num?)?.toInt(),
      cityId: (json['city_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      address: json['address'] as String?,
      house: json['house'] as String?,
      floor: json['floor'] as String?,
      apartment: json['apartment'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      isTypeStore: json['is_type_store'] as bool?,
      isMain: json['is_main'] as bool?,
    );

Map<String, dynamic> _$AddressResponseDatumToJson(
        AddressResponseDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city_id': instance.cityId,
      'user_id': instance.userId,
      'name': instance.name,
      'address': instance.address,
      'house': instance.house,
      'floor': instance.floor,
      'apartment': instance.apartment,
      'lat': instance.lat,
      'lng': instance.lng,
      'is_type_store': instance.isTypeStore,
      'is_main': instance.isMain,
    };
