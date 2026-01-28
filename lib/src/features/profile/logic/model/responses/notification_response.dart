import 'package:json_annotation/json_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'notification_response.g.dart';

@JsonSerializable()
class NotifResponse extends BaseModel<NotifResponse> {
  List<NotificationDatum>? data;

  NotifResponse({this.data});

  factory NotifResponse.fromJson(Map<String, dynamic> json) =>
      _$NotifResponseFromJson(json);

  @override
  NotifResponse fromJson(Map<String, dynamic> json) =>
      NotifResponse.fromJson(json);
}

@JsonSerializable()
class NotificationDatum extends BaseModel<NotificationDatum> {
  int? id;
  dynamic icon;
  String? subject;
  String? text;
  bool? isRead;
  DateTime? createdAt;

  NotificationDatum({
    this.id,
    this.icon,
    this.subject,
    this.text,
    this.isRead,
    this.createdAt,
  });

  factory NotificationDatum.fromJson(Map<String, dynamic> json) =>
      _$NotificationDatumFromJson(json);

  @override
  NotificationDatum fromJson(Map<String, dynamic> json) =>
      NotificationDatum.fromJson(json);
}
