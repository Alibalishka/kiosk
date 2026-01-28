// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardsModel _$CardsModelFromJson(Map<String, dynamic> json) => CardsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CardsDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CardsModelToJson(CardsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CardsDatum _$CardsDatumFromJson(Map<String, dynamic> json) => CardsDatum(
      id: (json['id'] as num?)?.toInt(),
      provider: json['provider'] as String?,
      number: json['number'] as String?,
      bank: json['bank'] as String?,
      cardId: json['card_id'] as String?,
      cardType: json['card_type'] as String?,
    );

Map<String, dynamic> _$CardsDatumToJson(CardsDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provider': instance.provider,
      'number': instance.number,
      'bank': instance.bank,
      'card_id': instance.cardId,
      'card_type': instance.cardType,
    };
