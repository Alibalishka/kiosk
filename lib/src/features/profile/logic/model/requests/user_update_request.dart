import 'package:json_annotation/json_annotation.dart';
part 'user_update_request.g.dart';

@JsonSerializable()
class UserUpdateRequest {
  final String name;
  final String phone;
  final DateTime bornDate;
  final String email;
  final bool? isMale;
  UserUpdateRequest({
    required this.name,
    required this.phone,
    required this.bornDate,
    required this.email,
    this.isMale,
  });

  Map<String, dynamic> toJson() => _$UserUpdateRequestToJson(this);

  @override
  String toString() =>
      'UserUpdateRequest(name: $name, phone: $phone, born_date: $bornDate, is_male: $isMale)';
}
