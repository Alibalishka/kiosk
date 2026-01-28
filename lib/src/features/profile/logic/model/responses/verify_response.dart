import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'verify_response.g.dart';

@JsonSerializable()
class VerifyResponse extends BaseModel<VerifyResponse> {
  VerifyDatum? data;

  VerifyResponse({this.data});

  factory VerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseFromJson(json);

  @override
  VerifyResponse fromJson(Map<String, dynamic> json) =>
      VerifyResponse.fromJson(json);
}

@JsonSerializable()
class VerifyDatum extends BaseModel<VerifyDatum> {
  String? token;

  VerifyDatum({this.token});

  factory VerifyDatum.fromJson(Map<String, dynamic> json) =>
      _$VerifyDatumFromJson(json);

  @override
  VerifyDatum fromJson(Map<String, dynamic> json) => VerifyDatum.fromJson(json);
}
