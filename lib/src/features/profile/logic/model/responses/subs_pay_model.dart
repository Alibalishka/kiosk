import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'subs_pay_model.g.dart';

@JsonSerializable()
class SubsPayModel extends BaseModel<SubsPayModel> {
  int? userSubscriptionId;
  String? redirectUrl;

  SubsPayModel({
    this.userSubscriptionId,
    this.redirectUrl,
  });

  factory SubsPayModel.fromJson(Map<String, dynamic> json) =>
      _$SubsPayModelFromJson(json);

  @override
  SubsPayModel fromJson(Map<String, dynamic> json) =>
      SubsPayModel.fromJson(json);
}
