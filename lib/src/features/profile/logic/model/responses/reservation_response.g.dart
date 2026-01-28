// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationResponse _$ReservationResponseFromJson(Map<String, dynamic> json) =>
    ReservationResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReservationDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReservationResponseToJson(
        ReservationResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ReservationDatum _$ReservationDatumFromJson(Map<String, dynamic> json) =>
    ReservationDatum(
      id: (json['id'] as num?)?.toInt(),
      itemName: json['item_name'] as String?,
      itemAddress: json['item_address'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      itemId: (json['item_id'] as num?)?.toInt(),
      remarkedReserveId: (json['remarked_reserve_id'] as num?)?.toInt(),
      remarkedTableId: (json['remarked_table_id'] as num?)?.toInt(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      time: json['time'] as String?,
      guestsCount: json['guests_count'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      comment: json['comment'] as String?,
      iikoTableName: json['iiko_table_name'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      statusRaw: json['status_raw'] as String?,
      statusText: json['status_text'] as String?,
    );

Map<String, dynamic> _$ReservationDatumToJson(ReservationDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_name': instance.itemName,
      'item_address': instance.itemAddress,
      'user_id': instance.userId,
      'item_id': instance.itemId,
      'remarked_reserve_id': instance.remarkedReserveId,
      'remarked_table_id': instance.remarkedTableId,
      'date': instance.date?.toIso8601String(),
      'time': instance.time,
      'guests_count': instance.guestsCount,
      'duration': instance.duration,
      'status': instance.status,
      'comment': instance.comment,
      'iiko_table_name': instance.iikoTableName,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'status_raw': instance.statusRaw,
      'status_text': instance.statusText,
    };
