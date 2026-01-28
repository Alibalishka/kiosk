import 'package:json_annotation/json_annotation.dart';

part 'subscription_pay.g.dart';

@JsonSerializable()
class SubscriptionPayRequest {
  final String? bankcardId;
  final String paymentMethodId;
  final String activeMonth;
  final bool isFastpay;

  SubscriptionPayRequest({
    this.bankcardId,
    required this.paymentMethodId,
    required this.activeMonth,
    required this.isFastpay,
  });

  Map<String, dynamic> toJson() => _$SubscriptionPayRequestToJson(this);
}
