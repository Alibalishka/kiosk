// ignore_for_file: lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String phone;
  final String code;

  RegisterRequest({
    required this.phone,
    required this.code,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  @override
  String toString() => 'RegisterRequest(phone: $phone, code: $code)';
}
