import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_fcm_request.g.dart';

@JsonSerializable()
class SendFcmRequest {
  final String token;
  final String platform;
  final String deviceName;

  SendFcmRequest({
    required this.token,
    required this.platform,
    required this.deviceName,
  });

  Map<String, dynamic> toJson() => _$SendFcmRequestToJson(this);
}
