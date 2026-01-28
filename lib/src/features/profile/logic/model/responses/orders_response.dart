import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_response.g.dart';

@JsonSerializable()
class OrdersResponseModel extends BaseModel<OrdersResponseModel> {
  List<OrderDatum>? data;
  Meta? meta;

  OrdersResponseModel({
    this.data,
    this.meta,
  });

  factory OrdersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseModelFromJson(json);

  @override
  OrdersResponseModel fromJson(Map<String, dynamic> json) =>
      OrdersResponseModel.fromJson(json);
}

@JsonSerializable()
class OrderDatum extends BaseModel<OrderDatum> {
  int? id;
  int? totalPrice;
  String? comment;
  int? status;
  String? statusRaw;
  String? statusText;
  // List<Item>? items;

  OrderDatum({
    this.id,
    this.totalPrice,
    this.comment,
    this.status,
    this.statusRaw,
    this.statusText,
    // this.items,
  });

  factory OrderDatum.fromJson(Map<String, dynamic> json) =>
      _$OrderDatumFromJson(json);

  @override
  OrderDatum fromJson(Map<String, dynamic> json) => OrderDatum.fromJson(json);
}

@JsonSerializable()
class Meta extends BaseModel<Meta> {
  int? currentPage;
  int? from;
  int? lastPage;
  int? perPage;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.perPage,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  @override
  Meta fromJson(Map<String, dynamic> json) => Meta.fromJson(json);
}
