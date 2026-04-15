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
  final SectionData? section;

  KioskStatusDatum({
    this.version,
    this.section,
  });

  factory KioskStatusDatum.fromJson(Map<String, dynamic> json) =>
      _$KioskStatusDatumFromJson(json);

  @override
  KioskStatusDatum fromJson(Map<String, dynamic> json) =>
      KioskStatusDatum.fromJson(json);
}

@JsonSerializable()
class SectionData extends BaseModel<SectionData> {
  final int? id;
  final int? itemId;
  final String? number;
  final dynamic tableId;
  final dynamic terminalGroupId;
  final String? groupName;
  final String? posId;

  SectionData({
    this.id,
    this.itemId,
    this.number,
    this.tableId,
    this.terminalGroupId,
    this.groupName,
    this.posId,
  });

  factory SectionData.fromJson(Map<String, dynamic> json) =>
      _$SectionDataFromJson(json);

  @override
  SectionData fromJson(Map<String, dynamic> json) => SectionData.fromJson(json);
}
