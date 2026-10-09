import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/table_orders_response.dart';

/// Ответ из контракта `GET /api/orders/table`.
const _sample = {
  'data': {
    'poll_after': 15,
    'orders': [
      {
        'id': 154824,
        'pos_number': 137,
        'created_at': '2026-10-07T21:36:23+05:00',
        'status': 'open',
        'paid': false,
        'payment_method': 'pay_at_venue',
        'total': 29900,
        'stage': 'cooking',
        'rounds': [
          {
            'at': '2026-10-07T21:36:23+05:00',
            'source': 'guest',
            'stage': 'cooking',
            'items': [
              {
                'name': 'Бульон 3 вида',
                'amount': 1,
                'sum': 2500,
                'stage': 'cooking',
                'modifiers': [
                  {'name': 'Томатный бульон', 'amount': 1},
                ],
              },
            ],
          },
        ],
      },
    ],
  },
};

TableOrderRound _round(String? at, OrderRoundSource source) => TableOrderRound(
      at: at == null ? null : DateTime.parse(at),
      source: source,
    );

void main() {
  test('ответ из контракта разбирается целиком', () {
    final data = TableOrdersResponse.fromJson(_sample).data!;
    expect(data.pollAfter, 15);

    final order = data.orders!.single;
    expect(order.id, 154824);
    expect(order.posNumber, 137);
    expect(order.createdAt, DateTime.utc(2026, 10, 7, 16, 36, 23));
    expect(order.status, TableOrderStatus.open);
    expect(order.paid, isFalse);
    expect(order.paymentMethod, OrderPaymentMethod.payAtVenue);
    expect(order.total, 29900);
    expect(order.stage, OrderStage.cooking);

    final round = order.rounds!.single;
    expect(round.source, OrderRoundSource.guest);
    expect(round.stage, OrderStage.cooking);

    final item = round.items!.single;
    expect(item.name, 'Бульон 3 вида');
    expect(item.amount, 1);
    expect(item.sum, 2500);
    expect(item.stage, OrderStage.cooking);
    expect(item.modifiers!.single.name, 'Томатный бульон');
  });

  test('этапы и статусы — по контракту, незнакомые не роняют разбор', () {
    TableOrder parse(Map<String, dynamic> json) => TableOrder.fromJson(json);

    expect(parse({'stage': 'new'}).stage, OrderStage.accepted);
    expect(parse({'stage': 'ready'}).stage, OrderStage.ready);
    expect(parse({'stage': 'issued'}).stage, OrderStage.issued);
    expect(parse({'status': 'bill'}).status, TableOrderStatus.bill);
    expect(parse({'status': 'error'}).status, TableOrderStatus.error);
    expect(parse({'payment_method': 'online'}).paymentMethod,
        OrderPaymentMethod.online);

    expect(parse({'stage': 'cancelled'}).stage, OrderStage.unknown);
    expect(parse({'status': 'closed'}).status, TableOrderStatus.unknown);
    expect(parse({'payment_method': 'bonus'}).paymentMethod,
        OrderPaymentMethod.unknown);
  });

  test('весовая позиция с дробным количеством', () {
    final item = TableOrderItem.fromJson({'name': 'Стейк', 'amount': 0.35});
    expect(item.amount, 0.35);
  });

  test('раунды по времени, позиции официанта без времени — последними', () {
    final waiterPending = _round(null, OrderRoundSource.waiter);
    final later = _round('2026-10-07T21:50:00+05:00', OrderRoundSource.guest);
    final first = _round('2026-10-07T21:36:23+05:00', OrderRoundSource.guest);
    final waiterSent =
        _round('2026-10-07T21:40:00+05:00', OrderRoundSource.waiter);

    final order = TableOrder(
      rounds: [waiterPending, later, first, waiterSent],
    );

    expect(order.sortedRounds, [first, waiterSent, later, waiterPending]);
  });

  test('при равном времени и без времени — порядок сервера', () {
    final a = _round(null, OrderRoundSource.waiter);
    final b = _round(null, OrderRoundSource.waiter);
    final c = _round('2026-10-07T21:36:23+05:00', OrderRoundSource.guest);
    final d = _round('2026-10-07T21:36:23+05:00', OrderRoundSource.waiter);

    expect(TableOrder(rounds: [a, c, b, d]).sortedRounds, [c, d, a, b]);
    expect(TableOrder().sortedRounds, isEmpty);
  });
}
