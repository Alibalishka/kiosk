// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserv_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservRequest _$ReservRequestFromJson(Map<String, dynamic> json) =>
    ReservRequest(
      itemId: (json['item_id'] as num).toInt(),
      date: json['date'] as String,
      guestsCount: (json['guests_count'] as num).toInt(),
      time: json['time'] as String,
      tableId: (json['table_id'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$ReservRequestToJson(ReservRequest instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'date': instance.date,
      'guests_count': instance.guestsCount,
      'time': instance.time,
      'table_id': instance.tableId,
      'duration': instance.duration,
      'comment': instance.comment,
    };
