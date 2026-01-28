import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/news_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_item_model.g.dart';

@JsonSerializable()
class DetailItemModel extends BaseModel<DetailItemModel> {
  DetailItemDatum? data;

  DetailItemModel({
    this.data,
  });

  factory DetailItemModel.fromJson(Map<String, dynamic> json) =>
      _$DetailItemModelFromJson(json);

  @override
  DetailItemModel fromJson(Map<String, dynamic> json) =>
      DetailItemModel.fromJson(json);
}

@JsonSerializable()
class DetailItemDatum extends BaseModel<DetailItemDatum> {
  int? id;
  String? posOrgId;
  String? type;
  CatalogDatum? catalog;
  String? name;
  String? slug;
  String? description;
  List<NewsDatum>? images;
  String? reviewsAvg;
  int? reviewsCount;
  String? address;
  String? phone;
  String? whatsapp;
  String? lat;
  String? lng;
  bool? hasMenu;
  String? orgId;
  String? menuLink;
  bool? isReady;
  bool? canReserve;
  List<GraphicWorkDatum>? graphicWorks;

  DetailItemDatum({
    this.id,
    this.posOrgId,
    this.type,
    this.catalog,
    this.name,
    this.slug,
    this.description,
    this.images,
    this.reviewsAvg,
    this.reviewsCount,
    this.address,
    this.phone,
    this.whatsapp,
    this.lat,
    this.lng,
    this.hasMenu,
    this.orgId,
    this.menuLink,
    this.isReady,
    this.canReserve,
    this.graphicWorks,
  });

  factory DetailItemDatum.fromJson(Map<String, dynamic> json) =>
      _$DetailItemDatumFromJson(json);

  @override
  DetailItemDatum fromJson(Map<String, dynamic> json) =>
      DetailItemDatum.fromJson(json);
}

@JsonSerializable()
class GraphicWorkDatum extends BaseModel<GraphicWorkDatum> {
  bool? isClosed;
  String? startTime;
  String? endTime;
  String? dayRaw;
  int? day;
  bool? isAllDay;

  GraphicWorkDatum({
    this.isClosed,
    this.startTime,
    this.endTime,
    this.dayRaw,
    this.day,
    this.isAllDay,
  });

  factory GraphicWorkDatum.fromJson(Map<String, dynamic> json) =>
      _$GraphicWorkDatumFromJson(json);

  @override
  GraphicWorkDatum fromJson(Map<String, dynamic> json) =>
      GraphicWorkDatum.fromJson(json);
}
