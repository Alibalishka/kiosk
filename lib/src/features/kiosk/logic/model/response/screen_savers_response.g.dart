// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_savers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenSaversResponse _$ScreenSaversResponseFromJson(
        Map<String, dynamic> json) =>
    ScreenSaversResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ScreenSaversDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      idleTimeout: (json['idle_timeout'] as num?)?.toInt(),
      advertisementVersion: (json['advertisement_version'] as num?)?.toInt(),
      advertisementEtag: json['advertisement_etag'] as String?,
      advertisementLastModified: json['advertisement_last_modified'] == null
          ? null
          : DateTime.parse(json['advertisement_last_modified'] as String),
    );

Map<String, dynamic> _$ScreenSaversResponseToJson(
        ScreenSaversResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'idle_timeout': instance.idleTimeout,
      'advertisement_version': instance.advertisementVersion,
      'advertisement_etag': instance.advertisementEtag,
      'advertisement_last_modified':
          instance.advertisementLastModified?.toIso8601String(),
    };

ScreenSaversDatum _$ScreenSaversDatumFromJson(Map<String, dynamic> json) =>
    ScreenSaversDatum(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      video: json['video'] as String?,
      displayDuration: (json['display_duration'] as num?)?.toInt(),
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ScreenSaversDatumToJson(ScreenSaversDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'video': instance.video,
      'display_duration': instance.displayDuration,
      'order': instance.order,
    };
