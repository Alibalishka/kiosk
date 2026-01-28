import 'package:json_annotation/json_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'tech_work_request.g.dart';

@JsonSerializable()
class TechWorkResponse extends BaseModel<TechWorkResponse> {
  String? message;
  TechWorkDatum? data;

  TechWorkResponse({this.message, this.data});

  factory TechWorkResponse.fromJson(Map<String, dynamic> json) =>
      _$TechWorkResponseFromJson(json);

  @override
  TechWorkResponse fromJson(Map<String, dynamic> json) =>
      TechWorkResponse.fromJson(json);
}

@JsonSerializable()
class TechWorkDatum extends BaseModel<TechWorkDatum> {
  String? header;
  String? example;
  bool? active;

  TechWorkDatum({
    this.header,
    this.example,
    this.active,
  });

  factory TechWorkDatum.fromJson(Map<String, dynamic> json) =>
      _$TechWorkDatumFromJson(json);

  @override
  TechWorkDatum fromJson(Map<String, dynamic> json) =>
      TechWorkDatum.fromJson(json);
}
