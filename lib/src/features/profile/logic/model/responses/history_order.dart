import 'package:json_annotation/json_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'history_order.g.dart';

@JsonSerializable()
class HistoryOrderEntity extends BaseModel<HistoryOrderEntity> {
  List<HistoryOrderDatum>? data;

  HistoryOrderEntity({this.data});

  factory HistoryOrderEntity.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderEntityFromJson(json);

  @override
  HistoryOrderEntity fromJson(Map<String, dynamic> json) =>
      HistoryOrderEntity.fromJson(json);
}

@JsonSerializable()
class HistoryOrderDatum extends BaseModel<HistoryOrderDatum> {
  int? id;
  bool? isUsedBonus;
  int? bonus;
  int? totalPrice;
  dynamic bonusAccured;
  String? iikoOrderId;
  int? serviceSum;
  DateTime? createdAt;
  HistoryOrderItem? item;
  String? statusRaw;
  String? statusText;
  int? paymentStatus;
  dynamic paymentStatusText;

  HistoryOrderDatum({
    this.id,
    this.isUsedBonus,
    this.bonus,
    this.totalPrice,
    this.bonusAccured,
    this.iikoOrderId,
    this.serviceSum,
    this.createdAt,
    this.item,
    this.statusRaw,
    this.statusText,
    this.paymentStatus,
    this.paymentStatusText,
  });

  factory HistoryOrderDatum.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderDatumFromJson(json);

  @override
  HistoryOrderDatum fromJson(Map<String, dynamic> json) =>
      HistoryOrderDatum.fromJson(json);
}

@JsonSerializable()
class HistoryOrderItem extends BaseModel<HistoryOrderItem> {
  int? id;
  String? name;
  String? address;
  String? type;

  HistoryOrderItem({this.id, this.name, this.address, this.type});

  factory HistoryOrderItem.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderItemFromJson(json);

  @override
  HistoryOrderItem fromJson(Map<String, dynamic> json) =>
      HistoryOrderItem.fromJson(json);
}
