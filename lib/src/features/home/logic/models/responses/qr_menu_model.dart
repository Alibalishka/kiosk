import 'package:json_annotation/json_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';

part 'qr_menu_model.g.dart';

@JsonSerializable()
class QrMenuModel extends BaseModel<QrMenuModel> {
  List<QrMenuDatum>? data;
  final List<Items>? featured;
  final List<Items>? recommend;
  DetailItemDatum? organization;

  QrMenuModel({
    this.data,
    this.featured,
    this.recommend,
    this.organization,
  });

  factory QrMenuModel.fromJson(Map<String, dynamic> json) =>
      _$QrMenuModelFromJson(json);

  @override
  QrMenuModel fromJson(Map<String, dynamic> json) => QrMenuModel.fromJson(json);
}

@JsonSerializable()
class QrMenuDatum extends BaseModel<QrMenuDatum> {
  int? id;
  String? name;
  List<Items>? recommend;
  List<Items>? featured;
  List<Items>? items;

  QrMenuDatum({
    this.id,
    this.name,
    this.recommend,
    this.featured,
    this.items,
  });

  factory QrMenuDatum.fromJson(Map<String, dynamic> json) =>
      _$QrMenuDatumFromJson(json);

  @override
  QrMenuDatum fromJson(Map<String, dynamic> json) => QrMenuDatum.fromJson(json);
}

@JsonSerializable()
class Items extends BaseModel<Items> {
  int? id;
  int? count;
  String? name;
  List<ImageDatum>? image;
  String? description;
  int? price;
  String? iikoId;
  String? code;
  List<Modifier>? modifiers;
  List<Characteristic>? characteristics;
  @JsonKey(name: 'default')
  bool? defaultSelect;
  @JsonKey(name: 'required')
  bool? requiredSelect;

  Items({
    this.id,
    this.count,
    this.name,
    this.image,
    this.description,
    this.price,
    this.iikoId,
    this.code,
    this.modifiers,
    this.characteristics,
    this.defaultSelect,
    this.requiredSelect,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  @override
  Items fromJson(Map<String, dynamic> json) => Items.fromJson(json);

  Items copyWith({
    int? id,
    int? count,
    String? name,
    List<ImageDatum>? image,
    String? description,
    int? price,
    String? iikoId,
    String? code,
    List<Modifier>? modifiers,
    List<Characteristic>? characteristics,
  }) {
    return Items(
      id: id ?? this.id,
      count: count ?? this.count,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      price: price ?? this.price,
      iikoId: iikoId ?? this.iikoId,
      code: code ?? this.code,
      modifiers: modifiers != null ? List.from(modifiers) : this.modifiers,
      characteristics: characteristics != null
          ? List.from(characteristics)
          : this.characteristics,
    );
  }
}

@JsonSerializable()
class Modifier extends BaseModel<Modifier> {
  int? id;
  String? name;
  String? description;
  int? min;
  int? max;
  bool? required;
  bool? multiple;
  String? iikoId;
  List<Items>? items;

  Modifier({
    this.id,
    this.name,
    this.description,
    this.min,
    this.max,
    this.required,
    this.multiple,
    this.iikoId,
    this.items,
  });

  factory Modifier.fromJson(Map<String, dynamic> json) =>
      _$ModifierFromJson(json);

  @override
  Modifier fromJson(Map<String, dynamic> json) => Modifier.fromJson(json);

  Modifier copyWith({
    int? id,
    String? name,
    String? description,
    int? min,
    int? max,
    bool? required,
    bool? multiple,
    String? iikoId,
    List<Items>? items,
  }) {
    return Modifier(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      min: min ?? this.min,
      max: max ?? this.max,
      required: required ?? this.required,
      multiple: multiple ?? this.multiple,
      iikoId: iikoId ?? this.iikoId,
      items:
          items != null ? items.map((e) => e.copyWith()).toList() : this.items,
    );
  }
}

@JsonSerializable()
class Characteristic extends BaseModel<Characteristic> {
  int? id;
  String? name;
  String? description;
  String? textValue;

  Characteristic({
    this.id,
    this.name,
    this.description,
    this.textValue,
  });

  factory Characteristic.fromJson(Map<String, dynamic> json) =>
      _$CharacteristicFromJson(json);

  @override
  Characteristic fromJson(Map<String, dynamic> json) =>
      Characteristic.fromJson(json);
}
