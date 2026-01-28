// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReviewDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ReviewDatum _$ReviewDatumFromJson(Map<String, dynamic> json) => ReviewDatum(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
      question: json['question'] as String?,
      slogan: json['slogan'] as String?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewDatumToJson(ReviewDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'question': instance.question,
      'slogan': instance.slogan,
      'messages': instance.messages,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: (json['id'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
    };
