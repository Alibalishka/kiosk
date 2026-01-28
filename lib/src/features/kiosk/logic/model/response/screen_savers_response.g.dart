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
    );

Map<String, dynamic> _$ScreenSaversResponseToJson(
        ScreenSaversResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'idle_timeout': instance.idleTimeout,
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
