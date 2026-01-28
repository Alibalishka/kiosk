import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel extends BaseModel<SearchModel> {
  SearchData? data;

  SearchModel({
    this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  @override
  SearchModel fromJson(Map<String, dynamic> json) => SearchModel.fromJson(json);
}

@JsonSerializable()
class SearchData extends BaseModel<SearchData> {
  List<Item>? items;
  SearchData({
    this.items,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) =>
      _$SearchDataFromJson(json);

  @override
  SearchData fromJson(Map<String, dynamic> json) => SearchData.fromJson(json);
}

@JsonSerializable()
class Item extends BaseModel<Item> {
  int? id;
  String? type;
  String? slug;
  Catalog? catalog;
  String? name;

  Item({
    this.id,
    this.type,
    this.slug,
    this.catalog,
    this.name,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @override
  Item fromJson(Map<String, dynamic> json) => Item.fromJson(json);
}

@JsonSerializable()
class Catalog extends BaseModel<Catalog> {
  int? id;
  String? name;
  dynamic description;
  dynamic type;
  String? slug;
  dynamic image;

  Catalog({
    this.id,
    this.name,
    this.description,
    this.type,
    this.slug,
    this.image,
  });

  factory Catalog.fromJson(Map<String, dynamic> json) =>
      _$CatalogFromJson(json);

  @override
  Catalog fromJson(Map<String, dynamic> json) => Catalog.fromJson(json);
}
