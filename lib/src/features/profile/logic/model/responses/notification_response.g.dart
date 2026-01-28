// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifResponse _$NotifResponseFromJson(Map<String, dynamic> json) =>
    NotifResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotifResponseToJson(NotifResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

NotificationDatum _$NotificationDatumFromJson(Map<String, dynamic> json) =>
    NotificationDatum(
      id: (json['id'] as num?)?.toInt(),
      icon: json['icon'],
      subject: json['subject'] as String?,
      text: json['text'] as String?,
      isRead: json['is_read'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$NotificationDatumToJson(NotificationDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'subject': instance.subject,
      'text': instance.text,
      'is_read': instance.isRead,
      'created_at': instance.createdAt?.toIso8601String(),
    };
