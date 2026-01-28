import 'package:json_annotation/json_annotation.dart';

part 'cart_items_requests.g.dart';

@JsonSerializable()
class CartItemsRequests {
  final List<CartItemsData> items;

  CartItemsRequests({required this.items});

  Map<String, dynamic> toJson() => _$CartItemsRequestsToJson(this);
}

@JsonSerializable()
class CartItemsData {
  final int id;
  final int organizationId;

  CartItemsData({
    required this.id,
    required this.organizationId,
  });

  Map<String, dynamic> toJson() => _$CartItemsDataToJson(this);

  factory CartItemsData.fromJson(Map<String, dynamic> json) =>
      _$CartItemsDataFromJson(json);
}
