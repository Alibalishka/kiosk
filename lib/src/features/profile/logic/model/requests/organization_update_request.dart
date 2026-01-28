import 'package:json_annotation/json_annotation.dart';

part 'organization_update_request.g.dart';

@JsonSerializable()
class OrganizationUpdateRequest {
  String? name;
  String? typeOrganizationId;
  String? binIin;

  OrganizationUpdateRequest({
    this.name,
    this.typeOrganizationId,
    this.binIin,
  });

  Map<String, dynamic> toJson() => _$OrganizationUpdateRequestToJson(this);

  @override
  String toString() =>
      'OrganizationUpdateRequest(name: $name, typeOrganizationId: $typeOrganizationId, binIin: $binIin)';
}
