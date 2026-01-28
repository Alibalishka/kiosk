import 'package:freezed_annotation/freezed_annotation.dart';

part 'bonus_request.g.dart';

@JsonSerializable()
class BonusRequest {
  String? itemId;
  String? tableId;
  List<BonusItem>? items;
  int? bankcardId;
  int? paymentMethodId;
  bool? isFastpay;
  bool? isKaspipay;

  BonusRequest({
    this.itemId,
    this.items,
    this.tableId,
    this.bankcardId,
    this.paymentMethodId,
    this.isFastpay,
    this.isKaspipay,
  });

  Map<String, dynamic> toJson() => _$BonusRequestToJson(this);
}

@JsonSerializable()
class BonusItem {
  int? id;
  List<BonusOption>? options;

  BonusItem({
    this.id,
    this.options,
  });

  Map<String, dynamic> toJson() => _$BonusItemToJson(this);

  factory BonusItem.fromJson(Map<String, dynamic> json) =>
      _$BonusItemFromJson(json);
}

@JsonSerializable()
class BonusOption {
  int? id;
  int? productId;

  BonusOption({
    this.id,
    this.productId,
  });

  Map<String, dynamic> toJson() => _$BonusOptionToJson(this);

  factory BonusOption.fromJson(Map<String, dynamic> json) =>
      _$BonusOptionFromJson(json);
}
