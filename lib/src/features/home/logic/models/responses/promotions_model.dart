import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotions_model.g.dart';

class GotoType {
  static const String url = 'url';
  static const String itemId = 'item';
}

@JsonSerializable()
class Promotions extends BaseModel<Promotions> {
  List<PromotionsData>? data;

  Promotions({
    this.data,
  });

  factory Promotions.fromJson(Map<String, dynamic> json) =>
      _$PromotionsFromJson(json);

  @override
  Promotions fromJson(Map<String, dynamic> json) => Promotions.fromJson(json);
}

@JsonSerializable()
class PromotionsData extends BaseModel<PromotionsData> {
  int? id;
  String? name;
  String? minDescription;
  String? description;
  String? image;
  Goto? goto;

  PromotionsData({
    this.id,
    this.name,
    this.minDescription,
    this.description,
    this.image,
    this.goto,
  });

  factory PromotionsData.fromJson(Map<String, dynamic> json) =>
      _$PromotionsDataFromJson(json);

  @override
  PromotionsData fromJson(Map<String, dynamic> json) =>
      PromotionsData.fromJson(json);
}

@JsonSerializable()
class Goto extends BaseModel<Goto> {
  String? type;
  String? url;
  String? itemId;
  TextBtn? text;

  Goto({
    this.type,
    this.url,
    this.itemId,
    this.text,
  });

  factory Goto.fromJson(Map<String, dynamic> json) => _$GotoFromJson(json);

  @override
  Goto fromJson(Map<String, dynamic> json) => Goto.fromJson(json);
}

@JsonSerializable()
class TextBtn extends BaseModel<TextBtn> {
  String? ru;
  String? en;
  String? kk;

  TextBtn({
    this.ru,
    this.en,
    this.kk,
  });

  factory TextBtn.fromJson(Map<String, dynamic> json) =>
      _$TextBtnFromJson(json);

  @override
  TextBtn fromJson(Map<String, dynamic> json) => TextBtn.fromJson(json);
}
