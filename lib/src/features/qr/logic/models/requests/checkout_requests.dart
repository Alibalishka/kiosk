import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class CheckoutRequests {
  final Filters filters;

  CheckoutRequests({required this.filters});

  Map<String, dynamic> toJson() => _$CheckoutRequestsToJson(this);
}

@JsonSerializable()
class Filters {
  final String? tableId;
  final String? posOrderId;
  final String? organizationId;
  // final int itemId;

  Filters({
    this.tableId,
    this.posOrderId,
    this.organizationId,
    // required this.itemId,
  });

  Map<String, dynamic> toJson() => _$FiltersToJson(this);

  factory Filters.fromJson(Map<String, dynamic> json) =>
      _$FiltersFromJson(json);
}

Map<String, dynamic> _$CheckoutRequestsToJson(CheckoutRequests instance) =>
    <String, dynamic>{
      'filters': _$FiltersToJson(instance.filters),
    };

Filters _$FiltersFromJson(Map<String, dynamic> json) => Filters(
      tableId: json['table_id'] as String,
      posOrderId: json['pos_order_id'] as String,
      organizationId: json['organization_id'] as String,
      // itemId: json['item_id'] as int,
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'table_id': instance.tableId,
      'pos_order_id': instance.posOrderId,
      'organization_id': instance.organizationId,
      // 'item_id': instance.itemId,
    };
