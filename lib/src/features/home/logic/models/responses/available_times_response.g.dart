// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_times_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableTimesResponse _$AvailableTimesResponseFromJson(
        Map<String, dynamic> json) =>
    AvailableTimesResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AvailableTimesDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvailableTimesResponseToJson(
        AvailableTimesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AvailableTimesDatum _$AvailableTimesDatumFromJson(Map<String, dynamic> json) =>
    AvailableTimesDatum(
      startStamp: (json['start_stamp'] as num?)?.toInt(),
      endStamp: (json['end_stamp'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      startDatetime: json['start_datetime'] == null
          ? null
          : DateTime.parse(json['start_datetime'] as String),
      endDatetime: json['end_datetime'] == null
          ? null
          : DateTime.parse(json['end_datetime'] as String),
      isFree: json['is_free'] as bool?,
      tablesCount: (json['tables_count'] as num?)?.toInt(),
      tablesIds: (json['tables_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$AvailableTimesDatumToJson(
        AvailableTimesDatum instance) =>
    <String, dynamic>{
      'start_stamp': instance.startStamp,
      'end_stamp': instance.endStamp,
      'duration': instance.duration,
      'start_datetime': instance.startDatetime?.toIso8601String(),
      'end_datetime': instance.endDatetime?.toIso8601String(),
      'is_free': instance.isFree,
      'tables_count': instance.tablesCount,
      'tables_ids': instance.tablesIds,
    };
