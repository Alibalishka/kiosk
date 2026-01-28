import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';

part 'free_model.g.dart';

@JsonSerializable()
class FreeModel extends BaseModel<FreeModel> {
  List<FreeDatum>? data;

  FreeModel({this.data});

  factory FreeModel.fromJson(Map<String, dynamic> json) =>
      _$FreeModelFromJson(json);

  @override
  FreeModel fromJson(Map<String, dynamic> json) => FreeModel.fromJson(json);
}

@JsonSerializable()
class FreeDatum extends BaseModel<FreeDatum> {
  int? id;
  String? name;
  List<Item>? items;

  FreeDatum({
    this.id,
    this.name,
    this.items,
  });

  factory FreeDatum.fromJson(Map<String, dynamic> json) =>
      _$FreeDatumFromJson(json);

  @override
  FreeDatum fromJson(Map<String, dynamic> json) => FreeDatum.fromJson(json);
}
