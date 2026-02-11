import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'kiosk_status.g.dart';

@JsonSerializable()
class KioskStatus extends BaseModel<KioskStatus> {
  final KioskStatusDatum? data;

  KioskStatus({this.data});

  factory KioskStatus.fromJson(Map<String, dynamic> json) =>
      _$KioskStatusFromJson(json);

  @override
  KioskStatus fromJson(Map<String, dynamic> json) => KioskStatus.fromJson(json);
}

@JsonSerializable()
class KioskStatusDatum extends BaseModel<KioskStatusDatum> {
  final String? version;

  KioskStatusDatum({this.version});

  factory KioskStatusDatum.fromJson(Map<String, dynamic> json) =>
      _$KioskStatusDatumFromJson(json);

  @override
  KioskStatusDatum fromJson(Map<String, dynamic> json) =>
      KioskStatusDatum.fromJson(json);
}
