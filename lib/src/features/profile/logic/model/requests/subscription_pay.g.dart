// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_pay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionPayRequest _$SubscriptionPayRequestFromJson(
        Map<String, dynamic> json) =>
    SubscriptionPayRequest(
      bankcardId: json['bankcard_id'] as String?,
      paymentMethodId: json['payment_method_id'] as String,
      activeMonth: json['active_month'] as String,
      isFastpay: json['is_fastpay'] as bool,
    );

Map<String, dynamic> _$SubscriptionPayRequestToJson(
        SubscriptionPayRequest instance) =>
    <String, dynamic>{
      'bankcard_id': instance.bankcardId,
      'payment_method_id': instance.paymentMethodId,
      'active_month': instance.activeMonth,
      'is_fastpay': instance.isFastpay,
    };
