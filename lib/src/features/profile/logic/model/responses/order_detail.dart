import 'package:json_annotation/json_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/checkout_model.dart';

part 'order_detail.g.dart';

@JsonSerializable()
class OrderDetailEntity extends BaseModel<OrderDetailEntity> {
  OrderDetailData? data;

  OrderDetailEntity({this.data});

  factory OrderDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailEntityFromJson(json);

  @override
  OrderDetailEntity fromJson(Map<String, dynamic> json) =>
      OrderDetailEntity.fromJson(json);
}

@JsonSerializable()
class OrderDetailData extends BaseModel<OrderDetailData> {
  int? id;
  bool? isUsedBonus;
  int? bonus;
  String? statusRaw;
  String? statusText;
  String? paymentStatusText;
  int? bonusAccured;
  int? paymentStatus;
  int? guestsCount;
  int? totalPrice;
  int? deliveryPrice;
  dynamic deliveryCode;
  dynamic deliveryType;
  DateTime? readyAt;
  String? fullName;
  int? number;
  dynamic numberGenerated;
  String? tableId;
  String? iikoOrderId;
  int? serviceSum;
  DateTime? createdAt;
  Item? item;
  List<Dish>? dishes;

  OrderDetailData({
    this.id,
    this.isUsedBonus,
    this.bonus,
    this.statusRaw,
    this.statusText,
    this.paymentStatusText,
    this.bonusAccured,
    this.paymentStatus,
    this.guestsCount,
    this.totalPrice,
    this.deliveryCode,
    this.deliveryType,
    this.readyAt,
    this.fullName,
    this.number,
    this.numberGenerated,
    this.tableId,
    this.iikoOrderId,
    this.serviceSum,
    this.createdAt,
    this.item,
    this.dishes,
    this.deliveryPrice,
  });

  factory OrderDetailData.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailDataFromJson(json);

  @override
  OrderDetailData fromJson(Map<String, dynamic> json) =>
      OrderDetailData.fromJson(json);
}
