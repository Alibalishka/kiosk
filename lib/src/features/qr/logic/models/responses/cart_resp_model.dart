// import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
// import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'cart_resp_model.g.dart';

// @JsonSerializable()
// class CartResponsesModel extends BaseModel<CartResponsesModel> {
//   final CartResponsesDatum? data;

//   CartResponsesModel({this.data});

//   factory CartResponsesModel.fromJson(Map<String, dynamic> json) =>
//       _$CartResponsesModelFromJson(json);

//   @override
//   CartResponsesModel fromJson(Map<String, dynamic> json) =>
//       CartResponsesModel.fromJson(json);
// }

// @JsonSerializable()
// class CartResponsesDatum extends BaseModel<CartResponsesDatum> {
//   final dynamic fullName;
//   final dynamic paymentMethod;
//   final dynamic phone;
//   final List<Organization>? organizations;
//   final int? totalPrice;

//   CartResponsesDatum({
//     this.fullName,
//     this.paymentMethod,
//     this.phone,
//     this.organizations,
//     this.totalPrice,
//   });

//   factory CartResponsesDatum.fromJson(Map<String, dynamic> json) =>
//       _$CartResponsesDatumFromJson(json);

//   @override
//   CartResponsesDatum fromJson(Map<String, dynamic> json) =>
//       CartResponsesDatum.fromJson(json);
// }
