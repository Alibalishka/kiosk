import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
part 'kiosk_response.g.dart';

@JsonSerializable()
class KioskResponse extends BaseModel<KioskResponse> {
  String? message;
  KioskDatum? data;

  KioskResponse({
    this.message,
    this.data,
  });

  factory KioskResponse.fromJson(Map<String, dynamic> json) =>
      _$KioskResponseFromJson(json);

  @override
  KioskResponse fromJson(Map<String, dynamic> json) =>
      KioskResponse.fromJson(json);
}

@JsonSerializable()
class KioskDatum extends BaseModel<KioskDatum> {
  Kiosk? kiosk;
  int? idleTimeout;
  Connection? connection;
  String? token;

  KioskDatum({
    this.kiosk,
    this.idleTimeout,
    this.connection,
    this.token,
  });

  factory KioskDatum.fromJson(Map<String, dynamic> json) =>
      _$KioskDatumFromJson(json);

  @override
  KioskDatum fromJson(Map<String, dynamic> json) => KioskDatum.fromJson(json);
}

@JsonSerializable()
class Connection extends BaseModel<Connection> {
  int? kioskId;
  int? itemId;
  DateTime? connectedAt;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  KioskItem? item;

  Connection({
    this.kioskId,
    this.itemId,
    this.connectedAt,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.item,
  });

  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);

  @override
  Connection fromJson(Map<String, dynamic> json) => Connection.fromJson(json);
}

@JsonSerializable()
class KioskItem extends BaseModel<KioskItem> {
  int? id;
  Address? name;
  Address? description;
  dynamic userId;
  dynamic reasonId;
  int? organizationId;
  dynamic userAddressId;
  Address? address;
  String? lat;
  String? lng;
  int? catalogId;
  int? gotN8N;
  String? slug;
  dynamic reviewAvg;
  int? type;
  String? source;
  dynamic publishedAt;
  int? status;
  bool? isActive;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? cityId;
  int? position;
  int? maxKioskConnections;

  KioskItem({
    this.id,
    this.name,
    this.description,
    this.userId,
    this.reasonId,
    this.organizationId,
    this.userAddressId,
    this.address,
    this.lat,
    this.lng,
    this.catalogId,
    this.gotN8N,
    this.slug,
    this.reviewAvg,
    this.type,
    this.source,
    this.publishedAt,
    this.status,
    this.isActive,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.cityId,
    this.position,
    this.maxKioskConnections,
  });

  factory KioskItem.fromJson(Map<String, dynamic> json) =>
      _$KioskItemFromJson(json);

  @override
  KioskItem fromJson(Map<String, dynamic> json) => KioskItem.fromJson(json);
}

@JsonSerializable()
class Address extends BaseModel<Address> {
  String? ru;
  String? en;
  String? kk;

  Address({
    this.ru,
    this.en,
    this.kk,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  @override
  Address fromJson(Map<String, dynamic> json) => Address.fromJson(json);
}

@JsonSerializable()
class Kiosk extends BaseModel<Kiosk> {
  int? id;
  String? deviceId;
  dynamic name;
  String? model;
  dynamic batteryLevel;
  dynamic batteryStatus;
  dynamic networkLevel;
  dynamic networkType;
  dynamic screenStatus;
  String? status;
  dynamic image;
  DateTime? createdAt;
  DateTime? updatedAt;

  Kiosk({
    this.id,
    this.deviceId,
    this.name,
    this.model,
    this.batteryLevel,
    this.batteryStatus,
    this.networkLevel,
    this.networkType,
    this.screenStatus,
    this.status,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Kiosk.fromJson(Map<String, dynamic> json) => _$KioskFromJson(json);

  @override
  Kiosk fromJson(Map<String, dynamic> json) => Kiosk.fromJson(json);
}
