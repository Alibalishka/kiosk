// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_subs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckSubsModel _$CheckSubsModelFromJson(Map<String, dynamic> json) =>
    CheckSubsModel(
      data: json['data'] == null
          ? null
          : CheckSubsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckSubsModelToJson(CheckSubsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CheckSubsData _$CheckSubsDataFromJson(Map<String, dynamic> json) =>
    CheckSubsData(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      subscriptionId: (json['subscription_id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      activeMonth: json['active_month'] as String?,
      paymentStatus: (json['payment_status'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckSubsDataToJson(CheckSubsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'subscription_id': instance.subscriptionId,
      'price': instance.price,
      'active_month': instance.activeMonth,
      'payment_status': instance.paymentStatus,
      'status': instance.status,
    };
