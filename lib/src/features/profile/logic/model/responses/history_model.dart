import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'history_model.g.dart';

@JsonSerializable()
class HistoryModel extends BaseModel<HistoryModel> {
  List<HistoryDatum>? data;

  HistoryModel({this.data});

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);

  @override
  HistoryModel fromJson(Map<String, dynamic> json) =>
      HistoryModel.fromJson(json);
}

@JsonSerializable()
class HistoryDatum extends BaseModel<HistoryDatum> {
  int? id;
  int? amount;
  int? bonus;
  bool? isMoney;
  bool? isReplenish;
  @JsonKey(name: 'created_at')
  String? createdAt;
  String? slug;
  dynamic typeId;
  String? text;
  dynamic orderId;

  HistoryDatum({
    this.id,
    this.amount,
    this.bonus,
    this.isMoney,
    this.isReplenish,
    this.createdAt,
    this.slug,
    this.typeId,
    this.text,
    this.orderId,
  });

  factory HistoryDatum.fromJson(Map<String, dynamic> json) =>
      _$HistoryDatumFromJson(json);

  @override
  HistoryDatum fromJson(Map<String, dynamic> json) =>
      HistoryDatum.fromJson(json);
}
