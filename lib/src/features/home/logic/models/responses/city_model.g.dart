// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CityDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'data': instance.data,
    };

CityDatum _$CityDatumFromJson(Map<String, dynamic> json) => CityDatum(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CityDatumToJson(CityDatum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
