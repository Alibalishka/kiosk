import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'unread_response.g.dart';

@JsonSerializable()
class UnreadResponse extends BaseModel<UnreadResponse> {
  UnreadData? data;

  UnreadResponse({this.data});

  factory UnreadResponse.fromJson(Map<String, dynamic> json) =>
      _$UnreadResponseFromJson(json);

  @override
  UnreadResponse fromJson(Map<String, dynamic> json) =>
      UnreadResponse.fromJson(json);
}

@JsonSerializable()
class UnreadData extends BaseModel<UnreadData> {
  int? count;

  UnreadData({this.count});

  factory UnreadData.fromJson(Map<String, dynamic> json) =>
      _$UnreadDataFromJson(json);

  @override
  UnreadData fromJson(Map<String, dynamic> json) => UnreadData.fromJson(json);
}
