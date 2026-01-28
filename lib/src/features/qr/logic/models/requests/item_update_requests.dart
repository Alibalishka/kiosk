import 'package:json_annotation/json_annotation.dart';

part 'item_update_requests.g.dart';

@JsonSerializable()
class ItemRequests {
  int id;
  int quantity;
  int organizationId;

  ItemRequests({
    required this.id,
    required this.quantity,
    required this.organizationId,
  });

  Map<String, dynamic> toJson() => _$ItemRequestsToJson(this);
}
