// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_times_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableTimesRequest _$AvailableTimesRequestFromJson(
        Map<String, dynamic> json) =>
    AvailableTimesRequest(
      itemId: (json['item_id'] as num).toInt(),
      date: json['date'] as String,
      guestsCount: (json['guests_count'] as num).toInt(),
    );

Map<String, dynamic> _$AvailableTimesRequestToJson(
        AvailableTimesRequest instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'date': instance.date,
      'guests_count': instance.guestsCount,
    };
