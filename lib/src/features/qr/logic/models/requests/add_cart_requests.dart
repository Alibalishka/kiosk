import 'package:json_annotation/json_annotation.dart';

part 'add_cart_requests.g.dart';

@JsonSerializable()
class AddCartRequest {
  final String quantity;
  final String organizationId;

  AddCartRequest({
    required this.quantity,
    required this.organizationId,
  });

  Map<String, dynamic> toJson() => _$AddCartRequestToJson(this);

  @override
  String toString() =>
      'AddCartRequest(quantity: $quantity, organizationId: $organizationId)';
}
