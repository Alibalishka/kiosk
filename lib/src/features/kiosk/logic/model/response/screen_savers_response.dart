import 'package:json_annotation/json_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'screen_savers_response.g.dart';

@JsonSerializable()
class ScreenSaversResponse extends BaseModel<ScreenSaversResponse> {
  List<ScreenSaversDatum>? data;
  int? idleTimeout;

  ScreenSaversResponse({
    this.data,
    this.idleTimeout,
  });

  factory ScreenSaversResponse.fromJson(Map<String, dynamic> json) =>
      _$ScreenSaversResponseFromJson(json);

  @override
  ScreenSaversResponse fromJson(Map<String, dynamic> json) =>
      ScreenSaversResponse.fromJson(json);
}

@JsonSerializable()
class ScreenSaversDatum extends BaseModel<ScreenSaversDatum> {
  int? id;
  String? title;
  String? description;
  String? image;
  String? video;
  int? displayDuration;
  int? order;

  ScreenSaversDatum({
    this.id,
    this.title,
    this.description,
    this.image,
    this.video,
    this.displayDuration,
    this.order,
  });

  factory ScreenSaversDatum.fromJson(Map<String, dynamic> json) =>
      _$ScreenSaversDatumFromJson(json);

  @override
  ScreenSaversDatum fromJson(Map<String, dynamic> json) =>
      ScreenSaversDatum.fromJson(json);
}
