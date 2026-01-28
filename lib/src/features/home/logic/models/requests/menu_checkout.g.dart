// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_checkout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuCheckoutRequest _$MenuCheckoutRequestFromJson(Map<String, dynamic> json) =>
    MenuCheckoutRequest(
      organizationId: json['organization_id'] as String?,
      tableId: json['table_id'] as String?,
      subscriptionId: (json['subscription_id'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MenuCheckoutItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      isUsedBonus: json['is_used_bonus'] as bool?,
      bankcardId: (json['bankcard_id'] as num?)?.toInt(),
      paymentMethodId: (json['payment_method_id'] as num?)?.toInt(),
      isFastpay: json['is_fastpay'] as bool?,
      isKaspipay: json['is_kaspipay'] as bool?,
      raw: (json['raw'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      deliveryType:
          $enumDecodeNullable(_$DeliveryTypeEnumMap, json['delivery_type']),
      addressId: (json['address_id'] as num?)?.toInt(),
      token: json['token'] as String?,
      fullName: json['full_name'] as String?,
    );

Map<String, dynamic> _$MenuCheckoutRequestToJson(
        MenuCheckoutRequest instance) =>
    <String, dynamic>{
      'organization_id': instance.organizationId,
      'table_id': instance.tableId,
      'subscription_id': instance.subscriptionId,
      'items': instance.items,
      'is_used_bonus': instance.isUsedBonus,
      'bankcard_id': instance.bankcardId,
      'payment_method_id': instance.paymentMethodId,
      'is_fastpay': instance.isFastpay,
      'is_kaspipay': instance.isKaspipay,
      'raw': instance.raw,
      'delivery_type': _$DeliveryTypeEnumMap[instance.deliveryType],
      'address_id': instance.addressId,
      'token': instance.token,
      'full_name': instance.fullName,
    };

const _$DeliveryTypeEnumMap = {
  DeliveryType.pickup: 'pickup',
  DeliveryType.delivery: 'delivery',
  DeliveryType.order: 'order',
};

MenuCheckoutItem _$MenuCheckoutItemFromJson(Map<String, dynamic> json) =>
    MenuCheckoutItem(
      itemId: (json['item_id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      modifiers: (json['modifiers'] as List<dynamic>?)
          ?.map(
              (e) => MenuCheckoutItemModif.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuCheckoutItemToJson(MenuCheckoutItem instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'amount': instance.amount,
      'modifiers': instance.modifiers,
    };

MenuCheckoutItemModif _$MenuCheckoutItemModifFromJson(
        Map<String, dynamic> json) =>
    MenuCheckoutItemModif(
      itemId: (json['item_id'] as num?)?.toInt(),
      itemGroupId: json['item_group_id'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MenuCheckoutItemModifToJson(
        MenuCheckoutItemModif instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'item_group_id': instance.itemGroupId,
      'amount': instance.amount,
    };
