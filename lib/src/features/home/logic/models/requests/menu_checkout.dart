import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_checkout.g.dart';

@JsonSerializable()
class MenuCheckoutRequest {
  String? organizationId;
  String? tableId;
  int? subscriptionId;
  List<MenuCheckoutItem>? items;
  bool? isUsedBonus;
  int? bankcardId;
  int? paymentMethodId;
  bool? isFastpay;
  bool? isKaspipay;
  Map<String, String>? raw;
  DeliveryType? deliveryType;
  int? addressId;
  String? token;
  String? fullName;

  MenuCheckoutRequest({
    this.organizationId,
    this.tableId,
    this.subscriptionId,
    this.items,
    this.isUsedBonus,
    this.bankcardId,
    this.paymentMethodId,
    this.isFastpay,
    this.isKaspipay,
    this.raw,
    this.deliveryType,
    this.addressId,
    this.token,
    this.fullName,
  });

  Map<String, dynamic> toJson() => _$MenuCheckoutRequestToJson(this);
}

@JsonSerializable()
class MenuCheckoutItem {
  int? itemId;
  int? amount;
  List<MenuCheckoutItemModif>? modifiers;

  MenuCheckoutItem({
    this.itemId,
    this.amount,
    this.modifiers,
  });

  Map<String, dynamic> toJson() => _$MenuCheckoutItemToJson(this);

  factory MenuCheckoutItem.fromJson(Map<String, dynamic> json) =>
      _$MenuCheckoutItemFromJson(json);
}

@JsonSerializable()
class MenuCheckoutItemModif {
  int? itemId;
  String? itemGroupId;
  int? amount;

  MenuCheckoutItemModif({
    this.itemId,
    this.itemGroupId,
    this.amount,
  });

  Map<String, dynamic> toJson() => _$MenuCheckoutItemModifToJson(this);

  factory MenuCheckoutItemModif.fromJson(Map<String, dynamic> json) =>
      _$MenuCheckoutItemModifFromJson(json);
}

@JsonEnum(alwaysCreate: true)
enum DeliveryType {
  @JsonValue('pickup')
  pickup,

  @JsonValue('delivery')
  delivery,

  @JsonValue('order')
  order,
}
