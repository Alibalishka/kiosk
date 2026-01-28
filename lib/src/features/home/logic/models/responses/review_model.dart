import 'package:json_annotation/json_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel extends BaseModel<ReviewModel> {
  List<ReviewDatum>? data;

  ReviewModel({this.data});

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  @override
  ReviewModel fromJson(Map<String, dynamic> json) => ReviewModel.fromJson(json);
}

@JsonSerializable()
class ReviewDatum extends BaseModel<ReviewDatum> {
  int? id;
  String? name;
  int? rating;
  String? question;
  String? slogan;
  List<Message>? messages;

  ReviewDatum({
    this.id,
    this.name,
    this.rating,
    this.question,
    this.slogan,
    this.messages,
  });

  factory ReviewDatum.fromJson(Map<String, dynamic> json) =>
      _$ReviewDatumFromJson(json);

  @override
  ReviewDatum fromJson(Map<String, dynamic> json) => ReviewDatum.fromJson(json);
}

@JsonSerializable()
class Message extends BaseModel<Message> {
  int? id;
  String? message;

  Message({
    this.id,
    this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  @override
  Message fromJson(Map<String, dynamic> json) => Message.fromJson(json);
}
