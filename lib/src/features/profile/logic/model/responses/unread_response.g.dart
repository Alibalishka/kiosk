// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unread_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnreadResponse _$UnreadResponseFromJson(Map<String, dynamic> json) =>
    UnreadResponse(
      data: json['data'] == null
          ? null
          : UnreadData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnreadResponseToJson(UnreadResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UnreadData _$UnreadDataFromJson(Map<String, dynamic> json) => UnreadData(
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UnreadDataToJson(UnreadData instance) =>
    <String, dynamic>{
      'count': instance.count,
    };
