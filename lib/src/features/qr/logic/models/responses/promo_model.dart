import 'package:json_annotation/json_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'promo_model.g.dart';

@JsonSerializable()
class PromoModel extends BaseModel<PromoModel> {
  PromoData? data;

  PromoModel({this.data});

  factory PromoModel.fromJson(Map<String, dynamic> json) =>
      _$PromoModelFromJson(json);

  @override
  PromoModel fromJson(Map<String, dynamic> json) => PromoModel.fromJson(json);
}

@JsonSerializable()
class PromoData extends BaseModel<PromoData> {
  bool? success;
  String? type;
  String? code;
  String? bonus;

  PromoData({
    this.success,
    this.type,
    this.code,
    this.bonus,
  });

  factory PromoData.fromJson(Map<String, dynamic> json) =>
      _$PromoDataFromJson(json);

  @override
  PromoData fromJson(Map<String, dynamic> json) => PromoData.fromJson(json);
}
