import 'package:json_annotation/json_annotation.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';

part 'table_orders_response.g.dart';

/// Этап готовности позиции, раунда или заказа. Этап раунда и заказа —
/// самый ранний из его позиций; считает его сервер.
enum OrderStage {
  @JsonValue('new')
  accepted,
  @JsonValue('cooking')
  cooking,
  @JsonValue('ready')
  ready,
  @JsonValue('issued')
  issued,
  unknown,
}

enum TableOrderStatus {
  open,

  /// Счёт распечатан.
  bill,

  /// Заказ не дошёл до кассы — гостю нужен официант.
  error,
  unknown,
}

enum OrderPaymentMethod {
  /// Оплата у официанта.
  @JsonValue('pay_at_venue')
  payAtVenue,
  online,
  unknown,
}

enum OrderRoundSource {
  /// Заказ гостя.
  guest,

  /// Позиции, которые добавил официант.
  waiter,
  unknown,
}

@JsonSerializable(createToJson: false)
class TableOrdersResponse extends BaseModel<TableOrdersResponse> {
  TableOrdersData? data;

  TableOrdersResponse({this.data});

  factory TableOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$TableOrdersResponseFromJson(json);

  @override
  TableOrdersResponse fromJson(Map<String, dynamic> json) =>
      TableOrdersResponse.fromJson(json);
}

@JsonSerializable(createToJson: false)
class TableOrdersData extends BaseModel<TableOrdersData> {
  /// Через сколько секунд спрашивать снова: 15, пока у стола есть заказы,
  /// 60 — когда стол пустой.
  int? pollAfter;
  List<TableOrder>? orders;

  TableOrdersData({this.pollAfter, this.orders});

  factory TableOrdersData.fromJson(Map<String, dynamic> json) =>
      _$TableOrdersDataFromJson(json);

  @override
  TableOrdersData fromJson(Map<String, dynamic> json) =>
      TableOrdersData.fromJson(json);
}

@JsonSerializable(createToJson: false)
class TableOrder extends BaseModel<TableOrder> {
  int? id;
  int? posNumber;
  DateTime? createdAt;
  @JsonKey(unknownEnumValue: TableOrderStatus.unknown)
  TableOrderStatus? status;
  bool? paid;
  @JsonKey(unknownEnumValue: OrderPaymentMethod.unknown)
  OrderPaymentMethod? paymentMethod;
  int? total;
  @JsonKey(unknownEnumValue: OrderStage.unknown)
  OrderStage? stage;

  /// Заказ и дозаказы. Показывать — в порядке [sortedRounds].
  List<TableOrderRound>? rounds;

  TableOrder({
    this.id,
    this.posNumber,
    this.createdAt,
    this.status,
    this.paid,
    this.paymentMethod,
    this.total,
    this.stage,
    this.rounds,
  });

  /// Раунды по времени. Позиции официанта, которые ещё не ушли на кухню
  /// (`at == null`), — последними; при равном времени порядок сервера.
  List<TableOrderRound> get sortedRounds {
    final indexed = (rounds ?? const <TableOrderRound>[]).indexed.toList()
      ..sort((a, b) {
        final atA = a.$2.at;
        final atB = b.$2.at;
        if (atA != null && atB != null) {
          final byTime = atA.compareTo(atB);
          if (byTime != 0) return byTime;
        } else if (atA != atB) {
          return atA == null ? 1 : -1;
        }
        return a.$1.compareTo(b.$1);
      });
    return [for (final (_, round) in indexed) round];
  }

  factory TableOrder.fromJson(Map<String, dynamic> json) =>
      _$TableOrderFromJson(json);

  @override
  TableOrder fromJson(Map<String, dynamic> json) => TableOrder.fromJson(json);
}

@JsonSerializable(createToJson: false)
class TableOrderRound extends BaseModel<TableOrderRound> {
  /// Когда раунд ушёл на кухню. null — позиции официанта ещё не отправлены.
  DateTime? at;
  @JsonKey(unknownEnumValue: OrderRoundSource.unknown)
  OrderRoundSource? source;
  @JsonKey(unknownEnumValue: OrderStage.unknown)
  OrderStage? stage;
  List<TableOrderItem>? items;

  TableOrderRound({this.at, this.source, this.stage, this.items});

  factory TableOrderRound.fromJson(Map<String, dynamic> json) =>
      _$TableOrderRoundFromJson(json);

  @override
  TableOrderRound fromJson(Map<String, dynamic> json) =>
      TableOrderRound.fromJson(json);
}

@JsonSerializable(createToJson: false)
class TableOrderItem extends BaseModel<TableOrderItem> {
  String? name;

  /// Количество: у весовых позиций бывает дробным.
  num? amount;
  int? sum;
  @JsonKey(unknownEnumValue: OrderStage.unknown)
  OrderStage? stage;
  List<TableOrderModifier>? modifiers;

  TableOrderItem({
    this.name,
    this.amount,
    this.sum,
    this.stage,
    this.modifiers,
  });

  factory TableOrderItem.fromJson(Map<String, dynamic> json) =>
      _$TableOrderItemFromJson(json);

  @override
  TableOrderItem fromJson(Map<String, dynamic> json) =>
      TableOrderItem.fromJson(json);
}

@JsonSerializable(createToJson: false)
class TableOrderModifier extends BaseModel<TableOrderModifier> {
  String? name;
  num? amount;

  TableOrderModifier({this.name, this.amount});

  factory TableOrderModifier.fromJson(Map<String, dynamic> json) =>
      _$TableOrderModifierFromJson(json);

  @override
  TableOrderModifier fromJson(Map<String, dynamic> json) =>
      TableOrderModifier.fromJson(json);
}
