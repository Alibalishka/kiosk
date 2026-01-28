// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonus_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BonusRequest _$BonusRequestFromJson(Map<String, dynamic> json) => BonusRequest(
      itemId: json['item_id'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => BonusItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      tableId: json['table_id'] as String?,
      bankcardId: (json['bankcard_id'] as num?)?.toInt(),
      paymentMethodId: (json['payment_method_id'] as num?)?.toInt(),
      isFastpay: json['is_fastpay'] as bool?,
      isKaspipay: json['is_kaspipay'] as bool?,
    );

Map<String, dynamic> _$BonusRequestToJson(BonusRequest instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'table_id': instance.tableId,
      'items': instance.items,
      'bankcard_id': instance.bankcardId,
      'payment_method_id': instance.paymentMethodId,
      'is_fastpay': instance.isFastpay,
      'is_kaspipay': instance.isKaspipay,
    };

BonusItem _$BonusItemFromJson(Map<String, dynamic> json) => BonusItem(
      id: (json['id'] as num?)?.toInt(),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => BonusOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BonusItemToJson(BonusItem instance) => <String, dynamic>{
      'id': instance.id,
      'options': instance.options,
    };

BonusOption _$BonusOptionFromJson(Map<String, dynamic> json) => BonusOption(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BonusOptionToJson(BonusOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
    };
