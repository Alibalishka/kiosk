// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponsesModel _$UserResponsesModelFromJson(Map<String, dynamic> json) =>
    UserResponsesModel(
      data: json['data'] == null
          ? null
          : UserDatum.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponsesModelToJson(UserResponsesModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UserDatum _$UserDatumFromJson(Map<String, dynamic> json) => UserDatum(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'],
      lastName: json['last_name'],
      surname: json['surname'],
      avatar: json['avatar'] as String?,
      avatarColor: json['avatar_color'],
      avgRating: json['avg_rating'] as String?,
      phone: json['phone'] as String?,
      companyName: json['company_name'],
      binIin: json['bin_iin'],
      cityId: json['city_id'],
      moderationStatus: (json['moderation_status'] as num?)?.toInt(),
      moderationStatusRaw: json['moderation_status_raw'] as String?,
      isIdentified: json['is_identified'] as bool?,
      isOwner: json['is_owner'] as bool?,
      maxBonusPercent: (json['max_bonus_percent'] as num?)?.toInt(),
      cashbackPercentage: (json['cashback_percentage'] as num?)?.toInt(),
      balance: json['balance'] == null
          ? null
          : Balance.fromJson(json['balance'] as Map<String, dynamic>),
      subscription: json['subscription'] == null
          ? null
          : SubscriptionData.fromJson(
              json['subscription'] as Map<String, dynamic>),
      endCheckHour: (json['end_check_hour'] as num?)?.toInt(),
      iban: json['iban'] as String?,
      bornDate: json['born_date'] == null
          ? null
          : DateTime.parse(json['born_date'] as String),
      refCode: json['ref_code'] as String?,
      isMale: (json['is_male'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserDatumToJson(UserDatum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'last_name': instance.lastName,
      'surname': instance.surname,
      'avatar': instance.avatar,
      'avatar_color': instance.avatarColor,
      'avg_rating': instance.avgRating,
      'phone': instance.phone,
      'company_name': instance.companyName,
      'bin_iin': instance.binIin,
      'city_id': instance.cityId,
      'moderation_status': instance.moderationStatus,
      'moderation_status_raw': instance.moderationStatusRaw,
      'is_identified': instance.isIdentified,
      'is_owner': instance.isOwner,
      'max_bonus_percent': instance.maxBonusPercent,
      'cashback_percentage': instance.cashbackPercentage,
      'balance': instance.balance,
      'subscription': instance.subscription,
      'end_check_hour': instance.endCheckHour,
      'iban': instance.iban,
      'born_date': instance.bornDate?.toIso8601String(),
      'ref_code': instance.refCode,
      'is_male': instance.isMale,
    };

Balance _$BalanceFromJson(Map<String, dynamic> json) => Balance(
      money: (json['money'] as num?)?.toInt(),
      bonus: (json['bonus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
      'money': instance.money,
      'bonus': instance.bonus,
    };

SubscriptionData _$SubscriptionDataFromJson(Map<String, dynamic> json) =>
    SubscriptionData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      activeMonth: json['active_month'] as String?,
      startAt: json['start_at'] == null
          ? null
          : DateTime.parse(json['start_at'] as String),
      endAt: json['end_at'] == null
          ? null
          : DateTime.parse(json['end_at'] as String),
      isOrder: json['is_order'] as bool?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SubscriptionDataToJson(SubscriptionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active_month': instance.activeMonth,
      'start_at': instance.startAt?.toIso8601String(),
      'end_at': instance.endAt?.toIso8601String(),
      'is_order': instance.isOrder,
      'status': instance.status,
    };
