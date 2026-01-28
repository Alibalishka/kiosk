import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_response.g.dart';

@JsonSerializable()
class OrderResponseModel extends BaseModel<OrderResponseModel> {
  OrderData? data;

  OrderResponseModel({this.data});

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseModelFromJson(json);

  @override
  OrderResponseModel fromJson(Map<String, dynamic> json) =>
      OrderResponseModel.fromJson(json);
}

@JsonSerializable()
class OrderData extends BaseModel<OrderData> {
  int? id;
  int? totalPrice;
  PaymentMethod? paymentMethod;
  String? comment;
  dynamic userAddress;
  int? status;
  String? statusRaw;
  String? statusText;
  // List<Item>? items;

  OrderData({
    this.id,
    this.totalPrice,
    this.paymentMethod,
    this.comment,
    this.userAddress,
    this.status,
    this.statusRaw,
    this.statusText,
    // this.items,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);

  @override
  OrderData fromJson(Map<String, dynamic> json) => OrderData.fromJson(json);
}

@JsonSerializable()
class PaymentMethod extends BaseModel<PaymentMethod> {
  int? id;
  String? name;
  String? description;
  String? slug;

  PaymentMethod({
    this.id,
    this.name,
    this.description,
    this.slug,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  @override
  PaymentMethod fromJson(Map<String, dynamic> json) =>
      PaymentMethod.fromJson(json);
}
