import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'add_bank_card.g.dart';

@JsonSerializable()
class AddBankCardResponse extends BaseModel<AddBankCardResponse> {
  AddBankCardDatum? data;

  AddBankCardResponse({this.data});

  factory AddBankCardResponse.fromJson(Map<String, dynamic> json) =>
      _$AddBankCardResponseFromJson(json);

  @override
  AddBankCardResponse fromJson(Map<String, dynamic> json) =>
      AddBankCardResponse.fromJson(json);
}

@JsonSerializable()
class AddBankCardDatum extends BaseModel<AddBankCardDatum> {
  String? url;

  AddBankCardDatum({this.url});

  factory AddBankCardDatum.fromJson(Map<String, dynamic> json) =>
      _$AddBankCardDatumFromJson(json);

  @override
  AddBankCardDatum fromJson(Map<String, dynamic> json) =>
      AddBankCardDatum.fromJson(json);
}
