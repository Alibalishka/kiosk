import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

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
  dynamic inHall;

  /// Заголовок Idempotency-Key для pay-order. Один на объект запроса: на
  /// каждую попытку оплаты запрос собирается заново и получает новый ключ,
  /// а повтор той же отправки (ретрай при обрыве связи) идёт с прежним —
  /// сервер не создаст второй заказ. В тело запроса не входит.
  @JsonKey(includeFromJson: false, includeToJson: false)
  late final String idempotencyKey = const Uuid().v4();

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
    this.inHall,
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
