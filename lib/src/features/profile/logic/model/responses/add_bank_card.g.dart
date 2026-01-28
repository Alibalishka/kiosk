// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_bank_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBankCardResponse _$AddBankCardResponseFromJson(Map<String, dynamic> json) =>
    AddBankCardResponse(
      data: json['data'] == null
          ? null
          : AddBankCardDatum.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddBankCardResponseToJson(
        AddBankCardResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AddBankCardDatum _$AddBankCardDatumFromJson(Map<String, dynamic> json) =>
    AddBankCardDatum(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$AddBankCardDatumToJson(AddBankCardDatum instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
