import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/features/home/vm/service/table_orders_service.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/table_orders_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/table_orders_poll.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';

typedef _Request = ({int venueId, String tableId, String? etag});

/// Сервер по сценарию: ответы по очереди, дальше — пустой стол.
class _Server extends Fake implements KioskRepository {
  final requests = <_Request>[];
  final _replies = <TableOrdersPoll>[];

  /// Если задан — запрос «висит», пока его не завершат.
  Completer<TableOrdersPoll>? hold;

  void reply(TableOrdersPoll poll) => _replies.add(poll);

  @override
  Future<TableOrdersPoll> fetchTableOrders({
    required int venueId,
    required String tableId,
    String? etag,
  }) async {
    requests.add((venueId: venueId, tableId: tableId, etag: etag));
    final held = hold;
    if (held != null) return held.future;
    return _replies.isEmpty ? _loaded(pollAfter: 60) : _replies.removeAt(0);
  }
}

TableOrdersPoll _loaded({
  int? pollAfter = 15,
  List<TableOrder> orders = const [],
  String? etag,
}) =>
    TableOrdersPoll.loaded(
      data: TableOrdersData(pollAfter: pollAfter, orders: orders),
      etag: etag,
    );

TableOrder _order({
  int number = 137,
  OrderStage stage = OrderStage.cooking,
  TableOrderStatus status = TableOrderStatus.open,
}) =>
    TableOrder(posNumber: number, stage: stage, status: status);

/// Сервис, который уже опрашивает стол 12 заведения 7.
TableOrdersService _polling(_Server server) => TableOrdersService(
      repository: server,
    )
      ..setTable(venueId: 7, tableId: '12')
      ..start();

Future<void> _wait(WidgetTester tester, int seconds) =>
    tester.pump(Duration(seconds: seconds));

void _lifecycle(WidgetTester tester, List<AppLifecycleState> states) {
  for (final state in states) {
    tester.binding.handleAppLifecycleStateChanged(state);
  }
}

void _toBackground(WidgetTester tester) => _lifecycle(tester, const [
      AppLifecycleState.inactive,
      AppLifecycleState.hidden,
      AppLifecycleState.paused,
    ]);

void _toForeground(WidgetTester tester) => _lifecycle(tester, const [
      AppLifecycleState.hidden,
      AppLifecycleState.inactive,
      AppLifecycleState.resumed,
    ]);

void main() {
  testWidgets('первый запрос — сразу, как известны стол и заведение',
      (tester) async {
    final server = _Server();
    final service = TableOrdersService(repository: server)..start();

    await tester.pump();
    expect(server.requests, isEmpty, reason: 'стол ещё неизвестен');

    service.setTable(venueId: 7, tableId: '');
    await tester.pump();
    expect(server.requests, isEmpty, reason: 'пустой table_id — не стол');

    service.setTable(venueId: 7, tableId: '12');
    await tester.pump();
    expect(server.requests.single, (venueId: 7, tableId: '12', etag: null));

    service.dispose();
  });

  testWidgets('не запущен — не спрашивает', (tester) async {
    final server = _Server();
    final service = TableOrdersService(repository: server)
      ..setTable(venueId: 7, tableId: '12');

    await _wait(tester, 120);
    expect(server.requests, isEmpty);

    service.dispose();
  });

  testWidgets('следующий запрос — не раньше poll_after', (tester) async {
    final server = _Server()
      ..reply(_loaded(pollAfter: 15, orders: [_order()]))
      ..reply(_loaded(pollAfter: 60));
    final service = _polling(server);
    await tester.pump();
    expect(server.requests, hasLength(1));
    expect(service.orders, hasLength(1));

    await _wait(tester, 14);
    expect(server.requests, hasLength(1), reason: 'у стола есть заказы: 15 с');
    await _wait(tester, 1);
    expect(server.requests, hasLength(2));
    expect(service.orders, isEmpty);

    await _wait(tester, 59);
    expect(server.requests, hasLength(2), reason: 'стол пустой: 60 с');
    await _wait(tester, 1);
    expect(server.requests, hasLength(3));

    service.dispose();
  });

  testWidgets('poll_after: 0 или без него — не чаще 5 и 15 с', (tester) async {
    final server = _Server()
      ..reply(_loaded(pollAfter: 0))
      ..reply(_loaded(pollAfter: null));
    final service = _polling(server);
    await tester.pump();

    await _wait(tester, 4);
    expect(server.requests, hasLength(1));
    await _wait(tester, 1);
    expect(server.requests, hasLength(2));

    await _wait(tester, 14);
    expect(server.requests, hasLength(2));
    await _wait(tester, 1);
    expect(server.requests, hasLength(3));

    service.dispose();
  });

  testWidgets('ETag уходит в If-None-Match, 304 оставляет данные',
      (tester) async {
    final server = _Server()
      ..reply(_loaded(orders: [_order()], etag: '"v1"'))
      ..reply(const TableOrdersPoll.notModified());
    final service = _polling(server);
    await tester.pump();
    final orders = service.orders;

    await _wait(tester, 15);
    expect(server.requests.last.etag, '"v1"');
    expect(service.orders, same(orders));
    expect(service.status, TableOrdersStatus.ready);

    // После 304 — прежний темп и тот же ETag.
    await _wait(tester, 15);
    expect(server.requests, hasLength(3));
    expect(server.requests.last.etag, '"v1"');

    service.dispose();
  });

  testWidgets('429: ждём Retry-After, но не чаще poll_after', (tester) async {
    final server = _Server()
      ..reply(_loaded(pollAfter: 15, orders: [_order()]))
      ..reply(const TableOrdersPoll.rateLimited(
        retryAfter: Duration(seconds: 40),
      ))
      ..reply(const TableOrdersPoll.rateLimited())
      ..reply(const TableOrdersPoll.rateLimited(
        retryAfter: Duration(seconds: 3),
      ));
    final service = _polling(server);
    await tester.pump();
    await _wait(tester, 15);
    expect(server.requests, hasLength(2));

    await _wait(tester, 39);
    expect(server.requests, hasLength(2), reason: 'Retry-After: 40');
    await _wait(tester, 1);
    expect(server.requests, hasLength(3));

    await _wait(tester, 59);
    expect(server.requests, hasLength(3), reason: 'без Retry-After — минута');
    await _wait(tester, 1);
    expect(server.requests, hasLength(4));

    await _wait(tester, 14);
    expect(server.requests, hasLength(4), reason: 'Retry-After меньше 15 с');
    expect(service.orders, hasLength(1), reason: 'данные прежние');
    await _wait(tester, 1);
    expect(server.requests, hasLength(5));

    service.dispose();
  });

  testWidgets('403: опрос встаёт и просит переподключение', (tester) async {
    var forbidden = 0;
    final server = _Server()..reply(const TableOrdersPoll.forbidden());
    final service = _polling(server)..onForbidden = () => forbidden++;
    await tester.pump();
    expect(forbidden, 1);

    await _wait(tester, 600);
    expect(server.requests, hasLength(1));

    // Страница меню после переподключения — новый токен, спросим сразу.
    service
      ..stop()
      ..start();
    await tester.pump();
    expect(server.requests, hasLength(2));
    expect(forbidden, 1);

    service.dispose();
  });

  testWidgets('400: неверный стол — пусто и минута до следующей попытки',
      (tester) async {
    final server = _Server()
      ..reply(_loaded(orders: [_order()], etag: '"v1"'))
      ..reply(const TableOrdersPoll.invalidTable());
    final service = _polling(server);
    await tester.pump();
    await _wait(tester, 15);

    expect(service.status, TableOrdersStatus.invalidTable);
    expect(service.orders, isEmpty);

    await _wait(tester, 59);
    expect(server.requests, hasLength(2));
    await _wait(tester, 1);
    expect(server.requests, hasLength(3));
    expect(server.requests.last.etag, isNull, reason: 'ETag сброшен');

    service.dispose();
  });

  testWidgets('сеть: повтор через poll_after, данные остаются на экране',
      (tester) async {
    final server = _Server()
      ..reply(const TableOrdersPoll.failed())
      ..reply(_loaded(pollAfter: 15, orders: [_order()]))
      ..reply(const TableOrdersPoll.failed());
    final service = _polling(server);
    await tester.pump();
    expect(service.status, TableOrdersStatus.unavailable);

    await _wait(tester, 15);
    expect(service.status, TableOrdersStatus.ready);
    expect(service.stale, isFalse);

    await _wait(tester, 15);
    expect(server.requests, hasLength(3));
    expect(service.status, TableOrdersStatus.ready);
    expect(service.stale, isTrue);
    expect(service.orders, hasLength(1));

    await _wait(tester, 15);
    expect(server.requests, hasLength(4));
    expect(service.stale, isFalse);

    service.dispose();
  });

  testWidgets('в фоне не спрашиваем, вернулись — спрашиваем в срок',
      (tester) async {
    final server = _Server()
      ..reply(_loaded(pollAfter: 15))
      ..reply(_loaded(pollAfter: 15));
    _lifecycle(tester, const [AppLifecycleState.resumed]);
    final service = _polling(server);
    await tester.pump();
    expect(server.requests, hasLength(1));

    _toBackground(tester);
    await _wait(tester, 120);
    expect(server.requests, hasLength(1), reason: 'приложение не на экране');

    _toForeground(tester);
    await tester.pump();
    expect(server.requests, hasLength(2), reason: 'срок давно подошёл');

    // Вернулись раньше срока — ждём остаток, а не спрашиваем сразу.
    await _wait(tester, 5);
    _toBackground(tester);
    await _wait(tester, 5);
    _toForeground(tester);
    await tester.pump();
    expect(server.requests, hasLength(2));
    await _wait(tester, 5);
    expect(server.requests, hasLength(3));

    service.dispose();
  });

  testWidgets('смена стола: прежний ответ не показываем, ETag сбрасываем',
      (tester) async {
    final server = _Server()..hold = Completer<TableOrdersPoll>();
    final service = _polling(server);
    await tester.pump();
    expect(server.requests.single.tableId, '12');

    service.setTable(venueId: 7, tableId: '14');
    expect(service.status, TableOrdersStatus.loading);
    expect(server.requests, hasLength(1), reason: 'запрос ещё в пути');

    final held = server.hold!;
    server.hold = null;
    held.complete(_loaded(orders: [_order()], etag: '"old"'));
    await tester.pump();
    expect(service.orders, isEmpty, reason: 'это заказы прежнего стола');
    expect(service.status, TableOrdersStatus.loading);

    await _wait(tester, 15);
    expect(server.requests.last, (venueId: 7, tableId: '14', etag: null));
    expect(service.status, TableOrdersStatus.ready);

    service.dispose();
  });

  testWidgets('новая страница меню подписывается раньше, чем уходит старая',
      (tester) async {
    final server = _Server()..reply(_loaded(pollAfter: 15));
    final service = _polling(server)..start();
    await tester.pump();

    service.stop();
    await _wait(tester, 15);
    expect(server.requests, hasLength(2), reason: 'новая страница ещё тут');

    service.stop();
    await _wait(tester, 120);
    expect(server.requests, hasLength(2));

    service.dispose();
  });

  testWidgets('этап стола — самый ранний среди заказов', (tester) async {
    final server = _Server()
      ..reply(_loaded(orders: [
        _order(stage: OrderStage.issued),
        _order(stage: OrderStage.ready),
        _order(stage: OrderStage.unknown),
      ]));
    final service = TableOrdersService(repository: server);
    expect(service.tableStage, isNull);
    expect(service.needsWaiter, isFalse);

    service
      ..setTable(venueId: 7, tableId: '12')
      ..start();
    await tester.pump();
    expect(service.tableStage, OrderStage.ready);
    expect(service.needsWaiter, isFalse);

    service.dispose();
  });

  testWidgets('заказ не дошёл до кассы — нужен официант', (tester) async {
    final server = _Server()
      ..reply(_loaded(orders: [
        _order(stage: OrderStage.accepted, status: TableOrderStatus.error),
      ]));
    final service = _polling(server);
    await tester.pump();

    expect(service.needsWaiter, isTrue);

    service.dispose();
  });
}
