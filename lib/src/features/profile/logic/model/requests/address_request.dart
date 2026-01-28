import 'package:json_annotation/json_annotation.dart';

part 'address_request.g.dart';

@JsonSerializable()
class AddressRequest {
  String? address;
  String? house;
  String? floor;
  String? apartment;
  String? lat;
  String? lng;
  String? comment;

  AddressRequest({
    this.address,
    this.house,
    this.floor,
    this.apartment,
    this.lat,
    this.lng,
    this.comment,
  });

  Map<String, dynamic> toJson() => _$AddressRequestToJson(this);

  @override
  String toString() =>
      'AddressRequest(address: $address, house: $house, floor: $floor, apartment: $apartment, lat: $lat, lon: $lng, comment: $comment)';
}
