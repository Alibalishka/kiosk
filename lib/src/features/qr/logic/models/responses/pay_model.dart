import 'package:json_annotation/json_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/order_response.dart';

part 'pay_model.g.dart';

@JsonSerializable()
class PayModel extends BaseModel<PayModel> {
  int? orderId;
  double? totalPrice;
  String? redirectUrl;
  PayDatum? data;

  PayModel({
    this.orderId,
    this.totalPrice,
    this.redirectUrl,
  });

  factory PayModel.fromJson(Map<String, dynamic> json) =>
      _$PayModelFromJson(json);

  @override
  PayModel fromJson(Map<String, dynamic> json) => PayModel.fromJson(json);
}

@JsonSerializable()
class PayDatum extends BaseModel<PayDatum> {
  int? id;
  PaymentMethod? paymentMethod;
  String? redirectUrl;

  PayDatum({
    this.id,
    this.paymentMethod,
    this.redirectUrl,
  });

  factory PayDatum.fromJson(Map<String, dynamic> json) =>
      _$PayDatumFromJson(json);

  @override
  PayDatum fromJson(Map<String, dynamic> json) => PayDatum.fromJson(json);
}
