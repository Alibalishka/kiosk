import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_organization_response.g.dart';

@JsonSerializable()
class TypeOrganizationResponse extends BaseModel<TypeOrganizationResponse> {
  List<TypeOrganizationDatum>? data;

  TypeOrganizationResponse({this.data});

  factory TypeOrganizationResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeOrganizationResponseFromJson(json);

  @override
  TypeOrganizationResponse fromJson(Map<String, dynamic> json) =>
      TypeOrganizationResponse.fromJson(json);
}

@JsonSerializable()
class TypeOrganizationDatum extends BaseModel<TypeOrganizationDatum> {
  int? id;
  String? slug;
  String? name;

  TypeOrganizationDatum({
    this.id,
    this.slug,
    this.name,
  });

  factory TypeOrganizationDatum.fromJson(Map<String, dynamic> json) =>
      _$TypeOrganizationDatumFromJson(json);

  @override
  TypeOrganizationDatum fromJson(Map<String, dynamic> json) =>
      TypeOrganizationDatum.fromJson(json);
}
