import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'cards_response.g.dart';

@JsonSerializable()
class CardsModel extends BaseModel<CardsModel> {
  List<CardsDatum>? data;

  CardsModel({this.data});

  factory CardsModel.fromJson(Map<String, dynamic> json) =>
      _$CardsModelFromJson(json);

  @override
  CardsModel fromJson(Map<String, dynamic> json) => CardsModel.fromJson(json);
}

@JsonSerializable()
class CardsDatum extends BaseModel<CardsDatum> {
  int? id;
  String? provider;
  String? number;
  String? bank;
  String? cardId;
  String? cardType;

  CardsDatum({
    this.id,
    this.provider,
    this.number,
    this.bank,
    this.cardId,
    this.cardType,
  });

  factory CardsDatum.fromJson(Map<String, dynamic> json) =>
      _$CardsDatumFromJson(json);

  @override
  CardsDatum fromJson(Map<String, dynamic> json) => CardsDatum.fromJson(json);
}
