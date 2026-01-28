import 'package:json_annotation/json_annotation.dart';

part 'check_promo_requests.g.dart';

@JsonSerializable()
class CheckPromoRequest {
  String? discountCode;
  List<DishesData>? dishes;

  CheckPromoRequest({
    this.discountCode,
    this.dishes,
  });

  Map<String, dynamic> toJson() => _$CheckPromoRequestToJson(this);
}

@JsonSerializable()
class DishesData {
  int? id;
  String? totalPrice;

  DishesData({
    this.id,
    this.totalPrice,
  });

  Map<String, dynamic> toJson() => _$DishesDataToJson(this);

  factory DishesData.fromJson(Map<String, dynamic> json) =>
      _$DishesDataFromJson(json);
}
