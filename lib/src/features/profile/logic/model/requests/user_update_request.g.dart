// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdateRequest _$UserUpdateRequestFromJson(Map<String, dynamic> json) =>
    UserUpdateRequest(
      name: json['name'] as String,
      phone: json['phone'] as String,
      bornDate: DateTime.parse(json['born_date'] as String),
      email: json['email'] as String,
      isMale: json['is_male'] as bool?,
    );

Map<String, dynamic> _$UserUpdateRequestToJson(UserUpdateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'born_date': instance.bornDate.toIso8601String(),
      'email': instance.email,
      'is_male': instance.isMale,
    };
