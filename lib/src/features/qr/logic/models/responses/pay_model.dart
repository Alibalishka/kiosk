import 'package:json_annotation/json_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'pay_model.g.dart';

@JsonSerializable()
class PayModel extends BaseModel<PayModel> {
  int? orderId;
  double? totalPrice;
  String? redirectUrl;

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
