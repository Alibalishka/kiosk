import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'subscription_model.g.dart';

@JsonSerializable()
class SubscriptionModel extends BaseModel<SubscriptionModel> {
  SubscriptionData? data;

  SubscriptionModel({this.data});

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);

  @override
  SubscriptionModel fromJson(Map<String, dynamic> json) =>
      SubscriptionModel.fromJson(json);
}

@JsonSerializable()
class SubscriptionData extends BaseModel<SubscriptionData> {
  int? id;
  String? name;
  String? description;
  String? text;
  String? color;
  String? bgImage;
  String? image;
  List<TermInfo>? termInfos;
  List<Price>? prices;

  SubscriptionData({
    this.id,
    this.name,
    this.description,
    this.text,
    this.color,
    this.bgImage,
    this.image,
    this.termInfos,
    this.prices,
  });

  factory SubscriptionData.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDataFromJson(json);

  @override
  SubscriptionData fromJson(Map<String, dynamic> json) =>
      SubscriptionData.fromJson(json);
}

@JsonSerializable()
class Price extends BaseModel<Price> {
  int? price;
  int? activeMonth;
  bool? isGoodDeal;
  String? activeMonthText;

  Price({
    this.price,
    this.activeMonth,
    this.isGoodDeal,
    this.activeMonthText,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  @override
  Price fromJson(Map<String, dynamic> json) => Price.fromJson(json);
}

@JsonSerializable()
class TermInfo extends BaseModel<TermInfo> {
  int? id;
  String? name;
  String? description;
  String? bgImage;

  TermInfo({
    this.id,
    this.name,
    this.description,
    this.bgImage,
  });

  factory TermInfo.fromJson(Map<String, dynamic> json) =>
      _$TermInfoFromJson(json);

  @override
  TermInfo fromJson(Map<String, dynamic> json) => TermInfo.fromJson(json);
}
