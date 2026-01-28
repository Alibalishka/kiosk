import 'package:json_annotation/json_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'check_subs_response.g.dart';

@JsonSerializable()
class CheckSubsModel extends BaseModel<CheckSubsModel> {
  CheckSubsData? data;

  CheckSubsModel({this.data});

  factory CheckSubsModel.fromJson(Map<String, dynamic> json) =>
      _$CheckSubsModelFromJson(json);

  @override
  CheckSubsModel fromJson(Map<String, dynamic> json) =>
      CheckSubsModel.fromJson(json);
}

@JsonSerializable()
class CheckSubsData extends BaseModel<CheckSubsData> {
  int? id;
  int? userId;
  int? subscriptionId;
  int? price;
  String? activeMonth;
  int? paymentStatus;
  int? status;

  CheckSubsData({
    this.id,
    this.userId,
    this.subscriptionId,
    this.price,
    this.activeMonth,
    this.paymentStatus,
    this.status,
  });

  factory CheckSubsData.fromJson(Map<String, dynamic> json) =>
      _$CheckSubsDataFromJson(json);

  @override
  CheckSubsData fromJson(Map<String, dynamic> json) =>
      CheckSubsData.fromJson(json);
}
