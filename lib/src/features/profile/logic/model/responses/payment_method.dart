import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'payment_method.g.dart';

@JsonSerializable()
class PaymentMethod extends BaseModel<PaymentMethod> {
  List<PaymentMethodDatum>? data;

  PaymentMethod({this.data});

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  @override
  PaymentMethod fromJson(Map<String, dynamic> json) =>
      PaymentMethod.fromJson(json);
}

@JsonSerializable()
class PaymentMethodDatum extends BaseModel<PaymentMethodDatum> {
  int? id;
  String? name;
  String? provider;

  PaymentMethodDatum({
    this.id,
    this.name,
    this.provider,
  });

  factory PaymentMethodDatum.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodDatumFromJson(json);

  @override
  PaymentMethodDatum fromJson(Map<String, dynamic> json) =>
      PaymentMethodDatum.fromJson(json);
}
