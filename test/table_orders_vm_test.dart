import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/vm/service/basket_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/menu_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/scroll_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/video_service.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_status.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/table_orders_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/table_orders_poll.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';

class _Context extends Fake implements BuildContext {}

class _Server extends Fake implements KioskRepository {
  final requests = <(int, String)>[];

  @override
  Future<TableOrdersPoll> fetchTableOrders({
    required int venueId,
    required String tableId,
    String? etag,
  }) async {
    requests.add((venueId, tableId));
    return TableOrdersPoll.loaded(
      data: TableOrdersData(pollAfter: 60, orders: []),
    );
  }
}

/// Киоск, подключённый к заведению 7; меню ещё не загрузилось.
QrMenuVm _kiosk({bool isKiosk = true}) => QrMenuVm(
      context: _Context(),
      basketService: BasketService(),
      scrollService: ScrollService(),
      videoService: VideoPreviewService(),
      menuDataService: MenuDataService(),
    )
      ..isKioskMode = isKiosk
      ..menuId = 7;

void main() {
  // VideoPreviewService подписывается на WidgetsBinding в конструкторе.
  TestWidgetsFlutterBinding.ensureInitialized();

  test('заказы стола — только когда есть стол', () {
    final vm = _kiosk();
    expect(vm.hasTableOrders, isFalse);
    expect(vm.tableOrders.hasTable, isFalse);

    vm.setKioskSection(SectionData(tableId: 12));
    expect(vm.hasTableOrders, isTrue);
    expect(vm.tableOrders.hasTable, isTrue);

    vm.setKioskSection(SectionData(tableId: ''));
    expect(vm.hasTableOrders, isFalse, reason: 'пустой table_id — не стол');
    expect(vm.tableOrders.hasTable, isFalse);

    vm.setKioskSection(null);
    expect(vm.hasTableOrders, isFalse);
  });

  test('не киоск — заказов стола нет даже за столом', () {
    final vm = _kiosk(isKiosk: false)
      ..setKioskSection(SectionData(tableId: 12));
    expect(vm.hasTableOrders, isFalse);
  });

  testWidgets('стол есть, меню ещё нет — заведение из подключения',
      (tester) async {
    final server = _Server();
    sl.registerSingleton<KioskRepository>(server);
    addTearDown(sl.reset);

    final vm = _kiosk();
    vm.tableOrders.start();
    await tester.pump();
    expect(server.requests, isEmpty, reason: 'без стола не спрашиваем');

    vm.setKioskSection(SectionData(tableId: 12));
    await tester.pump();
    expect(server.requests.single, (7, '12'));

    vm.tableOrders.dispose();
  });
}
