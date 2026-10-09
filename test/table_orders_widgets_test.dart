import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/formatters/date_formats.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/server/result.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/pages/tablet_checkout.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/vm/service/basket_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/menu_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/scroll_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/table_orders_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/video_service.dart';
import 'package:qr_pay_app/src/features/home/widgets/table_orders_button.dart';
import 'package:qr_pay_app/src/features/home/widgets/table_orders_overlay.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_status.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/table_orders_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/table_orders_poll.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/checkout_model.dart'
    show ChekoutDatum, ChekoutModel;
import 'package:qr_pay_app/src/features/qr/logic/repository/cart_repository.dart';
import 'package:sizer/sizer.dart';

/// Отвечает на опрос по очереди, дальше — тем же последним ответом.
class _Server extends Fake implements KioskRepository {
  _Server(this.replies);

  final List<TableOrdersPoll> replies;

  @override
  Future<TableOrdersPoll> fetchTableOrders({
    required int venueId,
    required String tableId,
    String? etag,
  }) async =>
      replies.length > 1 ? replies.removeAt(0) : replies.single;
}

class _Router extends Fake implements StackRouter {}

class _HostStorage extends Fake implements HostStorage {
  @override
  String? getHost() => 'test';
}

class _Cart extends Fake implements CartRepository {
  _Cart(this.reply);

  final Result<ChekoutModel> reply;

  @override
  Future<Result<ChekoutModel>> fetchChekoutMenu({
    required MenuCheckoutRequest body,
  }) async =>
      reply;
}

const _orderAt = '2026-10-07T21:36:23+05:00';
const _moreAt = '2026-10-07T21:50:00+05:00';

String _time(String at) => hourMinutes.format(DateTime.parse(at).toLocal());

/// Заказ из контракта: раунд гостя, дозаказ и позиции официанта, которые
/// ещё не ушли на кухню (сервер прислал их первыми).
TableOrder _cooking() => TableOrder(
      id: 154824,
      posNumber: 137,
      createdAt: DateTime.parse(_orderAt),
      status: TableOrderStatus.open,
      paid: false,
      paymentMethod: OrderPaymentMethod.payAtVenue,
      total: 29900,
      stage: OrderStage.cooking,
      rounds: [
        TableOrderRound(
          source: OrderRoundSource.waiter,
          stage: OrderStage.accepted,
          items: [
            TableOrderItem(
              name: 'Хлеб',
              amount: 1,
              sum: 400,
              stage: OrderStage.accepted,
            ),
          ],
        ),
        TableOrderRound(
          at: DateTime.parse(_orderAt),
          source: OrderRoundSource.guest,
          stage: OrderStage.cooking,
          items: [
            TableOrderItem(
              name: 'Бульон 3 вида',
              amount: 1,
              sum: 2500,
              stage: OrderStage.cooking,
              modifiers: [
                TableOrderModifier(name: 'Томатный бульон', amount: 1)
              ],
            ),
          ],
        ),
        TableOrderRound(
          at: DateTime.parse(_moreAt),
          source: OrderRoundSource.guest,
          stage: OrderStage.ready,
          items: [
            TableOrderItem(
              name: 'Чай',
              amount: 2,
              sum: 1000,
              stage: OrderStage.ready,
            ),
          ],
        ),
      ],
    );

TableOrder _notSent() => TableOrder(
      posNumber: 138,
      status: TableOrderStatus.error,
      paid: false,
      paymentMethod: OrderPaymentMethod.online,
      total: 1500,
      stage: OrderStage.accepted,
      rounds: [
        TableOrderRound(
          at: DateTime.parse(_moreAt),
          source: OrderRoundSource.guest,
          items: [TableOrderItem(name: 'Лагман', amount: 1, sum: 1500)],
        ),
      ],
    );

TableOrdersPoll _loaded(List<TableOrder> orders) => TableOrdersPoll.loaded(
      data: TableOrdersData(pollAfter: 15, orders: orders),
    );

TableOrdersService _service(List<TableOrdersPoll> replies) =>
    TableOrdersService(repository: _Server(replies))
      ..setTable(venueId: 7, tableId: '12')
      ..start();

void _screen(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

Future<void> _pumpOverlay(
  WidgetTester tester,
  TableOrdersService service, {
  Size size = const Size(800, 1280),
  VoidCallback? onClose,
}) async {
  _screen(tester, size);
  await tester.pumpWidget(Sizer(
    builder: (context, orientation, screenType) => MaterialApp(
      home: TableOrdersOverlay(
        service: service,
        idleTimeout: const Duration(minutes: 2),
        groupName: 'Зал',
        tableNumber: '12',
        onClose: onClose ?? () {},
      ),
    ),
  ));
  await tester.pump(const Duration(milliseconds: 400));
}

/// Убирает экран и сервис — их таймеры не должны пережить тест.
Future<void> _dispose(WidgetTester tester, TableOrdersService service) async {
  await tester.pumpWidget(const SizedBox());
  service.dispose();
}

void main() {
  group('экран «Заказы стола»', () {
    for (final entry in {
      'портрет': const Size(800, 1280),
      'альбом': const Size(1280, 800),
    }.entries) {
      testWidgets('карточки заказов: ${entry.key}', (tester) async {
        final service = _service([
          _loaded([_cooking(), _notSent()]),
        ]);
        await _pumpOverlay(tester, service, size: entry.value);

        expect(find.text(LocaleKeys.tableOrders), findsOneWidget);
        expect(find.text(LocaleKeys.tableOrderNumber), findsWidgets);

        // Позиции, модификаторы, суммы.
        expect(find.text('1 × Бульон 3 вида'), findsOneWidget);
        expect(find.text('Томатный бульон'), findsOneWidget);
        expect(find.text('2 500 ₸'), findsOneWidget);
        expect(find.text('29 900 ₸'), findsOneWidget);
        expect(find.text(LocaleKeys.tableOrderPayAtVenue), findsOneWidget);

        // Раунды по времени, позиции официанта без времени — в конце.
        final first = find.text(
          '${LocaleKeys.tableOrderRoundFirst} · ${_time(_orderAt)}'
              .toUpperCase(),
        );
        final more = find.text(
          '${LocaleKeys.tableOrderRoundMore} · ${_time(_moreAt)}'.toUpperCase(),
        );
        final waiter = find.text(
          '${LocaleKeys.tableOrderRoundWaiter} · '
                  '${LocaleKeys.tableOrderRoundPending}'
              .toUpperCase(),
        );
        expect(first, findsOneWidget);
        expect(more, findsOneWidget);
        expect(waiter, findsOneWidget);
        expect(
            tester.getTopLeft(first).dy, lessThan(tester.getTopLeft(more).dy));
        expect(
          tester.getTopLeft(more).dy,
          lessThan(tester.getTopLeft(waiter).dy),
        );

        // Второй заказ не дошёл до кассы — зовём официанта.
        await tester.scrollUntilVisible(
          find.text(LocaleKeys.tableOrderErrorTitle),
          300,
          scrollable: find.byType(Scrollable).first,
        );
        expect(find.text(LocaleKeys.tableOrderErrorTitle), findsOneWidget);
        expect(find.text(LocaleKeys.tableOrdersCallWaiter), findsOneWidget);
        expect(find.text(LocaleKeys.tableOrderNotPaid), findsOneWidget);

        await _dispose(tester, service);
      });
    }

    testWidgets('этап позиции подписан, только если он отличается',
        (tester) async {
      final service = _service([
        _loaded([
          TableOrder(
            posNumber: 140,
            status: TableOrderStatus.open,
            stage: OrderStage.cooking,
            rounds: [
              TableOrderRound(
                at: DateTime.parse(_orderAt),
                source: OrderRoundSource.guest,
                stage: OrderStage.cooking,
                items: [
                  TableOrderItem(name: 'Плов', stage: OrderStage.cooking),
                  TableOrderItem(name: 'Морс', stage: OrderStage.ready),
                ],
              ),
            ],
          ),
        ]),
      ]);
      await _pumpOverlay(tester, service);

      // Этап заказа назван один раз — в плашке; у плова своей подписи нет.
      expect(find.text(LocaleKeys.tableOrderStageCooking), findsOneWidget);
      expect(find.text(LocaleKeys.tableOrderHintCooking), findsOneWidget);
      // Морс уже готов — это отличие и подписано.
      expect(find.text(LocaleKeys.tableOrderStageReady), findsOneWidget);

      await _dispose(tester, service);
    });

    testWidgets('пустой стол — пустой экран', (tester) async {
      final service = _service([_loaded(const [])]);
      await _pumpOverlay(tester, service);

      expect(find.text(LocaleKeys.tableOrdersEmpty), findsOneWidget);
      expect(find.text(LocaleKeys.tableOrderNumber), findsNothing);

      await _dispose(tester, service);
    });

    testWidgets('неверный стол и нет связи', (tester) async {
      final invalid = _service([const TableOrdersPoll.invalidTable()]);
      await _pumpOverlay(tester, invalid);
      expect(find.text(LocaleKeys.tableOrdersInvalidTable), findsOneWidget);
      await _dispose(tester, invalid);

      final offline = _service([const TableOrdersPoll.failed()]);
      await _pumpOverlay(tester, offline);
      expect(find.text(LocaleKeys.tableOrdersUnavailable), findsOneWidget);
      await _dispose(tester, offline);
    });

    testWidgets('связь пропала — последние данные и предупреждение',
        (tester) async {
      final service = _service([
        _loaded([_cooking()]),
        const TableOrdersPoll.failed(),
      ]);
      await _pumpOverlay(tester, service);
      expect(find.text(LocaleKeys.tableOrdersStale), findsNothing);

      await tester.pump(const Duration(seconds: 15));
      expect(find.text(LocaleKeys.tableOrdersStale), findsOneWidget);
      expect(find.text('1 × Бульон 3 вида'), findsOneWidget);

      await _dispose(tester, service);
    });

    testWidgets('закрывается кнопкой и сам после простоя', (tester) async {
      final service = _service([_loaded(const [])]);
      var closed = 0;
      await _pumpOverlay(tester, service, onClose: () => closed++);

      await tester.tap(find.byIcon(Icons.close_rounded));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));
      expect(closed, 1);
      await _dispose(tester, service);

      final idle = _service([_loaded(const [])]);
      await _pumpOverlay(tester, idle, onClose: () => closed++);
      await tester.pump(const Duration(minutes: 1));
      await tester.tap(find.text(LocaleKeys.tableOrdersEmpty));
      await tester.pump(const Duration(seconds: 90));
      expect(closed, 1, reason: 'касание продлевает простой');
      await tester.pump(const Duration(seconds: 31));
      await tester.pump(const Duration(milliseconds: 400));
      expect(closed, 2);
      await _dispose(tester, idle);
    });
  });

  group('кнопка в тулбаре', () {
    Future<void> pumpButton(
      WidgetTester tester,
      TableOrdersService service, {
      VoidCallback? onTap,
    }) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            actions: [
              TableOrdersButton(service: service, onTap: onTap ?? () {}),
            ],
          ),
        ),
      ));
      await tester.pump();
    }

    testWidgets('без стола кнопки нет', (tester) async {
      final service = TableOrdersService(repository: _Server([_loaded([])]));
      await pumpButton(tester, service);
      expect(find.text(LocaleKeys.tableOrders), findsNothing);
      service.dispose();
    });

    testWidgets('этап стола и сигнал «позовите официанта»', (tester) async {
      var taps = 0;
      final service = _service([
        _loaded([_cooking()]),
        _loaded([_cooking(), _notSent()]),
      ]);
      await pumpButton(tester, service, onTap: () => taps++);

      expect(find.text(LocaleKeys.tableOrders), findsOneWidget);
      expect(find.text(LocaleKeys.tableOrderStageCooking), findsOneWidget);

      await tester.tap(find.text(LocaleKeys.tableOrders));
      expect(taps, 1);

      await tester.pump(const Duration(seconds: 15));
      expect(find.text(LocaleKeys.tableOrdersCallWaiter), findsOneWidget);

      await tester.pumpWidget(const SizedBox());
      service.dispose();
    });
  });

  group('корзина: кнопки оплаты по предрасчёту', () {
    Future<QrMenuVm> pumpCart(
      WidgetTester tester,
      Result<ChekoutModel> preview, {
      Size size = const Size(800, 1280),
    }) async {
      _screen(tester, size);
      sl
        ..registerSingleton<HostStorage>(_HostStorage())
        ..registerSingleton<CartRepository>(_Cart(preview))
        ..registerSingleton<KioskRepository>(_Server([_loaded([])]));
      addTearDown(sl.reset);

      QrMenuVm? vm;
      await tester.pumpWidget(Sizer(
        builder: (context, orientation, screenType) => MaterialApp(
          home: Builder(builder: (context) {
            vm ??= QrMenuVm(
              context: context,
              basketService: BasketService(),
              scrollService: ScrollService(),
              videoService: VideoPreviewService(),
              menuDataService: MenuDataService(),
            )
              ..isKioskMode = false
              ..isTablet = true
              ..kioskSection = SectionData(tableId: 12)
              ..menuData = QrMenuModel(
                organization: DetailItemDatum(
                  posOrgId: 'org',
                  // В меню заявлены Kaspi и карта — корзина их не слушает.
                  availablePayments: ['kaspi_pay', 'airba_pay'],
                ),
              );
            if (vm!.basketService.basket.isEmpty) {
              vm!.basketService.basket
                  .add(Items(id: 1, name: 'Бульон', price: 2500, count: 1));
            }
            return ChangeNotifierProvider<QrMenuVm>.value(
              value: vm!,
              child: StackRouterScope(
                controller: _Router(),
                stateHash: 0,
                child: const TabletCheckoutPage(),
              ),
            );
          }),
        ),
      ));
      await tester.pump();
      await tester.pump();
      return vm!;
    }

    for (final entry in {
      'портрет': const Size(800, 1280),
      'альбом': const Size(1280, 800),
    }.entries) {
      testWidgets('ровно разрешённые способы: ${entry.key}', (tester) async {
        await pumpCart(
          tester,
          Result.success(ChekoutModel(
            data: ChekoutDatum(
              totalPrice: 2500,
              kaspiPayReady: false,
              cardPayReady: true,
              payAtVenueReady: true,
              payAtVenuePaymentMethodId: 7,
            ),
          )),
          size: entry.value,
        );

        expect(find.text('Kaspi QR'), findsNothing);
        expect(find.text('Оплата картой |'), findsOneWidget);
        expect(find.text(LocaleKeys.payWithCash), findsOneWidget);
      });
    }

    testWidgets('ни одного способа — объясняем, а не молчим', (tester) async {
      await pumpCart(
        tester,
        Result.success(ChekoutModel(data: ChekoutDatum(totalPrice: 2500))),
      );

      expect(find.text('Kaspi QR'), findsNothing);
      expect(find.text('Оплата картой |'), findsNothing);
      expect(find.text(LocaleKeys.noPaymentMethods), findsOneWidget);
    });
  });
}
