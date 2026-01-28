import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponsesModel extends BaseModel<UserResponsesModel> {
  UserDatum? data;

  UserResponsesModel({this.data});

  factory UserResponsesModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponsesModelFromJson(json);

  @override
  UserResponsesModel fromJson(Map<String, dynamic> json) =>
      UserResponsesModel.fromJson(json);
}

@JsonSerializable()
class UserDatum extends BaseModel<UserDatum> {
  int? id;
  String? name;
  dynamic email;
  dynamic lastName;
  dynamic surname;
  String? avatar;
  dynamic avatarColor;
  String? avgRating;
  String? phone;
  dynamic companyName;
  dynamic binIin;
  dynamic cityId;
  int? moderationStatus;
  String? moderationStatusRaw;
  bool? isIdentified;
  bool? isOwner;
  int? maxBonusPercent;
  int? cashbackPercentage;
  Balance? balance;
  SubscriptionData? subscription;
  int? endCheckHour;
  String? iban;
  DateTime? bornDate;
  String? refCode;
  int? isMale;

  UserDatum({
    this.id,
    this.name,
    this.email,
    this.lastName,
    this.surname,
    this.avatar,
    this.avatarColor,
    this.avgRating,
    this.phone,
    this.companyName,
    this.binIin,
    this.cityId,
    this.moderationStatus,
    this.moderationStatusRaw,
    this.isIdentified,
    this.isOwner,
    this.maxBonusPercent,
    this.cashbackPercentage,
    this.balance,
    this.subscription,
    this.endCheckHour,
    this.iban,
    this.bornDate,
    this.refCode,
    this.isMale,
  });

  factory UserDatum.fromJson(Map<String, dynamic> json) =>
      _$UserDatumFromJson(json);

  @override
  UserDatum fromJson(Map<String, dynamic> json) => UserDatum.fromJson(json);
}

@JsonSerializable()
class Balance extends BaseModel<Balance> {
  int? money;
  int? bonus;

  Balance({
    this.money,
    this.bonus,
  });

  factory Balance.fromJson(Map<String, dynamic> json) =>
      _$BalanceFromJson(json);

  @override
  Balance fromJson(Map<String, dynamic> json) => Balance.fromJson(json);
}

@JsonSerializable()
class SubscriptionData extends BaseModel<SubscriptionData> {
  int? id;
  String? name;
  String? activeMonth;
  DateTime? startAt;
  DateTime? endAt;
  bool? isOrder;
  String? status;

  SubscriptionData({
    this.id,
    this.name,
    this.activeMonth,
    this.startAt,
    this.endAt,
    this.isOrder,
    this.status,
  });

  factory SubscriptionData.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDataFromJson(json);

  @override
  SubscriptionData fromJson(Map<String, dynamic> json) =>
      SubscriptionData.fromJson(json);
}
