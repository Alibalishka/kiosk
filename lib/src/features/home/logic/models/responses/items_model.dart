import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'items_model.g.dart';

@JsonSerializable()
class ItemsModel extends BaseModel<ItemsModel> {
  List<Item>? data;
  Meta? meta;

  ItemsModel({
    this.data,
    this.meta,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ItemsModelFromJson(json);

  @override
  ItemsModel fromJson(Map<String, dynamic> json) => ItemsModel.fromJson(json);
}

@JsonSerializable()
class Meta extends BaseModel<Meta> {
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  @override
  Meta fromJson(Map<String, dynamic> json) => Meta.fromJson(json);
}

@JsonSerializable()
class Item extends BaseModel<Item> {
  int? id;
  String? type;
  String? slug;
  CatalogDatum? catalog;
  String? name;
  String? description;
  List<ImageDatum>? images;
  String? address;
  int? cityId;
  int? price;
  int? discountPrice;
  List<Option>? options;
  List<TagsData>? tags;

  Item({
    this.id,
    this.address,
    this.type,
    this.slug,
    this.name,
    this.description,
    this.images,
    this.cityId,
    this.catalog,
    this.price,
    this.discountPrice,
    this.options,
    this.tags,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @override
  Item fromJson(Map<String, dynamic> json) => Item.fromJson(json);
}

@JsonSerializable()
class CatalogDatum extends BaseModel<CatalogDatum> {
  int? id;
  String? name;
  String? description;
  String? slug;

  CatalogDatum({
    this.id,
    this.name,
    this.description,
    this.slug,
  });

  factory CatalogDatum.fromJson(Map<String, dynamic> json) =>
      _$CatalogDatumFromJson(json);

  @override
  CatalogDatum fromJson(Map<String, dynamic> json) =>
      CatalogDatum.fromJson(json);
}

@JsonSerializable()
class ImageDatum extends BaseModel<ImageDatum> {
  int? id;
  int? itemId;
  String? name;
  String? image;
  String? path;
  String? text;
  String? headerTitle;
  String? file;
  String? filePreview;
  List<ImageDatum>? items;

  ImageDatum({
    this.id,
    this.itemId,
    this.name,
    this.image,
    this.path,
    this.headerTitle,
    this.file,
    this.filePreview,
    this.items,
  });

  factory ImageDatum.fromJson(Map<String, dynamic> json) =>
      _$ImageDatumFromJson(json);

  @override
  ImageDatum fromJson(Map<String, dynamic> json) => ImageDatum.fromJson(json);
}

@JsonSerializable()
class Option extends BaseModel<Option> {
  int? id;
  String? name;
  bool? isRequired;
  List<Product>? products;

  Option({
    this.id,
    this.name,
    this.isRequired,
    this.products,
  });

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  @override
  Option fromJson(Map<String, dynamic> json) => Option.fromJson(json);
}

@JsonSerializable()
class Product extends BaseModel<Product> {
  int? id;
  String? name;
  dynamic price;
  String? image;

  Product({
    this.id,
    this.name,
    this.price,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  Product fromJson(Map<String, dynamic> json) => Product.fromJson(json);
}

@JsonSerializable()
class TagsData extends BaseModel<TagsData> {
  int? id;
  String? name;
  String? color;

  TagsData({
    this.id,
    this.name,
    this.color,
  });

  factory TagsData.fromJson(Map<String, dynamic> json) =>
      _$TagsDataFromJson(json);

  @override
  TagsData fromJson(Map<String, dynamic> json) => TagsData.fromJson(json);
}
