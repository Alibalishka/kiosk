import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kaspi_status_response.g.dart';

@JsonSerializable()
class KaspiStatus extends BaseModel<KaspiStatus> {
  KaspiStatusDatum? data;

  KaspiStatus({this.data});

  factory KaspiStatus.fromJson(Map<String, dynamic> json) =>
      _$KaspiStatusFromJson(json);

  @override
  KaspiStatus fromJson(Map<String, dynamic> json) => KaspiStatus.fromJson(json);
}

@JsonSerializable()
class KaspiStatusDatum extends BaseModel<KaspiStatusDatum> {
  int? id;
  String? status;

  KaspiStatusDatum({
    this.id,
    this.status,
  });

  factory KaspiStatusDatum.fromJson(Map<String, dynamic> json) =>
      _$KaspiStatusDatumFromJson(json);

  @override
  KaspiStatusDatum fromJson(Map<String, dynamic> json) =>
      KaspiStatusDatum.fromJson(json);
}
