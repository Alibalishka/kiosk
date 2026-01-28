import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'result_bonus.g.dart';

@JsonSerializable()
class ResultBonus extends BaseModel<ResultBonus> {
  ResultBonusDatum? data;

  ResultBonus({this.data});

  factory ResultBonus.fromJson(Map<String, dynamic> json) =>
      _$ResultBonusFromJson(json);

  @override
  ResultBonus fromJson(Map<String, dynamic> json) => ResultBonus.fromJson(json);
}

@JsonSerializable()
class ResultBonusDatum extends BaseModel<ResultBonusDatum> {
  int? id;
  String? tableId;
  String? iikoOrderId;

  ResultBonusDatum({
    this.id,
    this.tableId,
    this.iikoOrderId,
  });

  factory ResultBonusDatum.fromJson(Map<String, dynamic> json) =>
      _$ResultBonusDatumFromJson(json);

  @override
  ResultBonusDatum fromJson(Map<String, dynamic> json) =>
      ResultBonusDatum.fromJson(json);
}
