import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel extends BaseModel<CityModel> {
  List<CityDatum>? data;

  CityModel({this.data});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  @override
  CityModel fromJson(Map<String, dynamic> json) => CityModel.fromJson(json);
}

@JsonSerializable()
class CityDatum extends BaseModel<CityDatum> {
  int? id;
  String? name;

  CityDatum({
    this.id,
    this.name,
  });

  factory CityDatum.fromJson(Map<String, dynamic> json) =>
      _$CityDatumFromJson(json);

  @override
  CityDatum fromJson(Map<String, dynamic> json) => CityDatum.fromJson(json);
}
