import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class PayRequest {
  final Filter filters;
  final int? bankcardId;
  final int paymentMethodId;
  final bool isUsedBonus;
  final bool isFastpay;
  final bool isKaspipay;

  PayRequest({
    required this.filters,
    this.bankcardId,
    required this.paymentMethodId,
    required this.isUsedBonus,
    required this.isFastpay,
    required this.isKaspipay,
  });

  Map<String, dynamic> toJson() => _$PayRequestToJson(this);
}

@JsonSerializable()
class Filter {
  final String organizationId;
  final String iikoOrderId;

  Filter({
    required this.organizationId,
    required this.iikoOrderId,
  });

  Map<String, dynamic> toJson() => _$FiltersToJson(this);

  factory Filter.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);
}

// ignore: unused_element
PayRequest _$PayRequestFromJson(Map<String, dynamic> json) => PayRequest(
      filters: Filter.fromJson(json['filters'] as Map<String, dynamic>),
      bankcardId: (json['bankcard_id'] as num?)?.toInt(),
      paymentMethodId: (json['payment_method_id'] as num).toInt(),
      isUsedBonus: json['is_used_bonus'] as bool,
      isFastpay: json['is_fastpay'] as bool,
      isKaspipay: json['is_kaspipay'] as bool,
    );

Map<String, dynamic> _$PayRequestToJson(PayRequest instance) =>
    <String, dynamic>{
      'filters': _$FiltersToJson(instance.filters),
      'bankcard_id': instance.bankcardId,
      'payment_method_id': instance.paymentMethodId,
      'is_used_bonus': instance.isUsedBonus,
      'is_fastpay': instance.isFastpay,
      'is_kaspipay': instance.isKaspipay,
    };

Filter _$FiltersFromJson(Map<String, dynamic> json) => Filter(
      organizationId: json['organization_id'] as String,
      iikoOrderId: json['iiko_order_id'] as String,
    );

Map<String, dynamic> _$FiltersToJson(Filter instance) => <String, dynamic>{
      'organization_id': instance.organizationId,
      'iiko_order_id': instance.iikoOrderId,
    };
