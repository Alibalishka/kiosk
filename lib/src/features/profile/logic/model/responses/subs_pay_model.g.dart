// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subs_pay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubsPayModel _$SubsPayModelFromJson(Map<String, dynamic> json) => SubsPayModel(
      userSubscriptionId: (json['user_subscription_id'] as num?)?.toInt(),
      redirectUrl: json['redirect_url'] as String?,
    );

Map<String, dynamic> _$SubsPayModelToJson(SubsPayModel instance) =>
    <String, dynamic>{
      'user_subscription_id': instance.userSubscriptionId,
      'redirect_url': instance.redirectUrl,
    };
