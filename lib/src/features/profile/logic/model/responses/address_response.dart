import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_response.g.dart';

@JsonSerializable()
class AddressResponseModel extends BaseModel<AddressResponseModel> {
  List<AddressResponseDatum>? data;

  AddressResponseModel({this.data});

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseModelFromJson(json);

  @override
  AddressResponseModel fromJson(Map<String, dynamic> json) =>
      AddressResponseModel.fromJson(json);
}

@JsonSerializable()
class AddressResponseDatum extends BaseModel<AddressResponseDatum> {
  int? id;
  int? cityId;
  int? userId;
  String? name;
  String? address;
  String? house;
  String? floor;
  String? apartment;
  String? lat;
  String? lng;
  bool? isTypeStore;
  bool? isMain;

  AddressResponseDatum({
    this.id,
    this.cityId,
    this.userId,
    this.name,
    this.address,
    this.house,
    this.floor,
    this.apartment,
    this.lat,
    this.lng,
    this.isTypeStore,
    this.isMain,
  });

  factory AddressResponseDatum.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseDatumFromJson(json);

  @override
  AddressResponseDatum fromJson(Map<String, dynamic> json) =>
      AddressResponseDatum.fromJson(json);
}
