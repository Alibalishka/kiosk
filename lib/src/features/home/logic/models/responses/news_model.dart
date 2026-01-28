import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends BaseModel<NewsModel> {
  List<NewsDatum>? data;

  NewsModel({this.data});

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  @override
  NewsModel fromJson(Map<String, dynamic> json) => NewsModel.fromJson(json);
}

@JsonSerializable()
class NewsDatum extends BaseModel<NewsDatum> {
  int? id;
  int? itemId;
  String? name;
  String? image;
  String? path;
  String? text;
  String? headerTitle;
  String? file;
  String? filePreview;
  List<NewsDatum>? items;

  NewsDatum({
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

  factory NewsDatum.fromJson(Map<String, dynamic> json) =>
      _$NewsDatumFromJson(json);

  @override
  NewsDatum fromJson(Map<String, dynamic> json) => NewsDatum.fromJson(json);
}

// @JsonSerializable()
// class ItemNews extends BaseModel<ItemNews> {
//   int? id;
//   String? text;
//   String? image;

//   ItemNews({
//     this.id,
//     this.text,
//     this.image,
//   });

//   factory ItemNews.fromJson(Map<String, dynamic> json) =>
//       _$ItemNewsFromJson(json);

//   @override
//   ItemNews fromJson(Map<String, dynamic> json) => ItemNews.fromJson(json);
// }
