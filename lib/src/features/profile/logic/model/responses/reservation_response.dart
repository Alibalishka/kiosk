import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'reservation_response.g.dart';

@JsonSerializable()
class ReservationResponse extends BaseModel<ReservationResponse> {
  List<ReservationDatum>? data;

  ReservationResponse({this.data});

  factory ReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$ReservationResponseFromJson(json);

  @override
  ReservationResponse fromJson(Map<String, dynamic> json) =>
      ReservationResponse.fromJson(json);
}

@JsonSerializable()
class ReservationDatum extends BaseModel<ReservationDatum> {
  int? id;
  String? itemName;
  String? itemAddress;
  int? userId;
  int? itemId;
  int? remarkedReserveId;
  int? remarkedTableId;
  DateTime? date;
  String? time;
  String? guestsCount;
  int? duration;
  int? status;
  String? comment;
  dynamic iikoTableName;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? statusRaw;
  String? statusText;

  ReservationDatum({
    this.id,
    this.itemName,
    this.itemAddress,
    this.userId,
    this.itemId,
    this.remarkedReserveId,
    this.remarkedTableId,
    this.date,
    this.time,
    this.guestsCount,
    this.duration,
    this.status,
    this.comment,
    this.iikoTableName,
    this.createdAt,
    this.updatedAt,
    this.statusRaw,
    this.statusText,
  });

  factory ReservationDatum.fromJson(Map<String, dynamic> json) =>
      _$ReservationDatumFromJson(json);

  @override
  ReservationDatum fromJson(Map<String, dynamic> json) =>
      ReservationDatum.fromJson(json);
}
