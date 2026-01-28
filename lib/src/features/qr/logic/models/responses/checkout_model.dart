import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'checkout_model.g.dart';

@JsonSerializable()
class ChekoutModel extends BaseModel<ChekoutModel> {
  ChekoutDatum? data;

  ChekoutModel({this.data});

  factory ChekoutModel.fromJson(Map<String, dynamic> json) =>
      _$ChekoutModelFromJson(json);

  @override
  ChekoutModel fromJson(Map<String, dynamic> json) =>
      ChekoutModel.fromJson(json);
}

@JsonSerializable()
class ChekoutDatum extends BaseModel<ChekoutDatum> {
  int? guestsCount;
  int? totalPrice;
  int? number;
  String? tableId;
  String? iikoOrderId;
  double? serviceSum;
  List<Discount>? discounts;
  @JsonKey(name: 'VAT')
  dynamic vat;
  DateTime? createdAt;
  ChekoutItem? item;
  List<Dish>? dishes;
  String? section;
  String? table;
  bool? kaspiPayReady;
  bool? cardPayReady;

  ChekoutDatum({
    this.guestsCount,
    this.totalPrice,
    this.number,
    this.tableId,
    this.iikoOrderId,
    this.serviceSum,
    this.discounts,
    this.vat,
    this.createdAt,
    this.item,
    this.dishes,
    this.section,
    this.table,
    this.kaspiPayReady,
    this.cardPayReady,
  });

  factory ChekoutDatum.fromJson(Map<String, dynamic> json) =>
      _$ChekoutDatumFromJson(json);

  @override
  ChekoutDatum fromJson(Map<String, dynamic> json) =>
      ChekoutDatum.fromJson(json);
}

@JsonSerializable()
class Dish extends BaseModel<Dish> {
  String? name;
  int? count;
  int? totalPrice;
  List<Dish>? modifiers;

  Dish({
    this.name,
    this.count,
    this.totalPrice,
    this.modifiers,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);

  @override
  Dish fromJson(Map<String, dynamic> json) => Dish.fromJson(json);
}

@JsonSerializable()
class ChekoutItem extends BaseModel<ChekoutItem> {
  int? id;
  String? name;
  String? address;
  String? lat;
  String? lng;
  List<Image>? images;

  ChekoutItem({
    this.id,
    this.name,
    this.address,
    this.lat,
    this.lng,
    this.images,
  });

  factory ChekoutItem.fromJson(Map<String, dynamic> json) =>
      _$ChekoutItemFromJson(json);

  @override
  ChekoutItem fromJson(Map<String, dynamic> json) => ChekoutItem.fromJson(json);
}

@JsonSerializable()
class Image extends BaseModel<Image> {
  int? id;
  String? path;

  Image({
    this.id,
    this.path,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  @override
  Image fromJson(Map<String, dynamic> json) => Image.fromJson(json);
}

@JsonSerializable()
class Discount extends BaseModel<Discount> {
  String? name;
  double? sum;

  Discount({
    this.name,
    this.sum,
  });

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  @override
  Discount fromJson(Map<String, dynamic> json) => Discount.fromJson(json);
}
