import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/server/result.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/pages/product_page.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/vm/service/basket_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/menu_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/scroll_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/video_service.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_status.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/checkout_model.dart'
    show ChekoutDatum, ChekoutModel;
import 'package:qr_pay_app/src/features/qr/logic/repository/cart_repository.dart';
import 'package:sizer/sizer.dart';

class _Context extends Fake implements BuildContext {}

class _Router extends Fake implements StackRouter {}

class _KioskRepository extends Fake implements KioskRepository {}

class _HostStorage extends Fake implements HostStorage {
  @override
  String? getHost() => 'test';
}

/// Предрасчёт, в котором заведение принимает наличные.
class _CartRepository extends Fake implements CartRepository {
  final requests = <MenuCheckoutRequest>[];

  @override
  Future<Result<ChekoutModel>> fetchChekoutMenu({
    required MenuCheckoutRequest body,
  }) async {
    requests.add(body);
    return Result.success(ChekoutModel(
      data: ChekoutDatum(payAtVenueReady: true, payAtVenuePaymentMethodId: 7),
    ));
  }
}

QrMenuVm _vm({BuildContext? context, List<String> payments = const []}) =>
    QrMenuVm(
      context: context ?? _Context(),
      basketService: BasketService(),
      scrollService: ScrollService(),
      videoService: VideoPreviewService(),
      menuDataService: MenuDataService(),
    )
      ..isKioskMode = false
      ..isTablet = true
      ..menuData = QrMenuModel(
        organization: DetailItemDatum(availablePayments: payments),
      );

ChekoutDatum _preview({required bool payAtVenueReady}) => ChekoutDatum(
      payAtVenueReady: payAtVenueReady,
      payAtVenuePaymentMethodId: 7,
    );

void main() {
  // VideoPreviewService подписывается на WidgetsBinding в конструкторе.
  TestWidgetsFlutterBinding.ensureInitialized();

  group('«Добавить»: гостю есть чем заплатить', () {
    test('Kaspi или карта — можно и без стола', () {
      for (final payments in [
        ['kaspi_pay'],
        ['airba_pay'],
        ['kaspi_pay', 'airba_pay'],
      ]) {
        expect(_vm(payments: payments).hasAvailablePayments, isTrue,
            reason: '$payments');
      }
    });

    test('без онлайн-оплаты, но за столом — наличные', () {
      final fromSection = _vm()..kioskSection = SectionData(tableId: 12);
      final fromQr = _vm()..tableId = '5';

      expect(fromSection.hasAvailablePayments, isTrue);
      expect(fromQr.hasAvailablePayments, isTrue);
    });

    test('без онлайн-оплаты и без стола — нельзя', () {
      final noSection = _vm();
      final emptyTable = _vm()..kioskSection = SectionData(tableId: '');

      expect(noSection.hasAvailablePayments, isFalse);
      expect(emptyTable.hasAvailablePayments, isFalse,
          reason: 'пустой table_id — это не стол');
    });

    test('способ без кнопки в корзине не в счёт', () {
      // Наличным без стола некуда уйти, а другой кнопки в корзине нет.
      expect(_vm(payments: ['cash']).hasAvailablePayments, isFalse);
    });
  });

  group('наличные в корзине', () {
    test('за столом — как скажет предрасчёт', () {
      final vm = _vm()
        ..kioskSection = SectionData(tableId: 12)
        ..checkoutPreview = _preview(payAtVenueReady: true);

      expect(vm.hasPayAtVenue, isTrue);
      expect(vm.payAtVenuePaymentMethodId, 7);

      vm.checkoutPreview = _preview(payAtVenueReady: false);
      expect(vm.hasPayAtVenue, isFalse, reason: 'заведение не принимает');
    });

    test('стол пропал, пока гость в корзине, — наличных нет', () {
      final vm = _vm()
        ..kioskSection = SectionData(tableId: 12)
        ..checkoutPreview = _preview(payAtVenueReady: true);

      vm.setKioskSection(SectionData());

      expect(vm.hasPayAtVenue, isFalse);
      expect(vm.payAtVenuePaymentMethodId, isNull);
    });

    // testWidgets — ради управляемых таймеров: предрасчёт идёт с дебаунсом.
    testWidgets('стол закрепили, пока гость в корзине, — предрасчёт заново',
        (tester) async {
      final cart = _CartRepository();
      sl.registerSingleton<CartRepository>(cart);
      sl.registerSingleton<HostStorage>(_HostStorage());
      addTearDown(sl.reset);

      final vm = _vm()
        ..menuData = QrMenuModel(
          organization: DetailItemDatum(posOrgId: 'org'),
        );
      vm.basketService.basket.add(Items(id: 1, price: 500, count: 1));

      vm.startCheckoutPreview(indexType: 0);
      await tester.pump();
      expect(cart.requests, isEmpty, reason: 'без стола предрасчёта нет');
      expect(vm.hasPayAtVenue, isFalse);

      vm.setKioskSection(SectionData(tableId: 12));
      await tester.pump(const Duration(milliseconds: 400));
      expect(cart.requests.single.tableId, '12');
      expect(vm.hasPayAtVenue, isTrue);

      // Опрос статуса раз в 30 секунд присылает тот же стол.
      vm.setKioskSection(SectionData(tableId: 12));
      await tester.pump(const Duration(milliseconds: 400));
      expect(cart.requests, hasLength(1));

      vm.setKioskSection(null);
      await tester.pump();
      expect(vm.checkoutPreview, isNull);
      expect(vm.hasPayAtVenue, isFalse);
    });
  });

  testWidgets('карточка товара видит, что стол появился или пропал',
      (tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    sl.registerSingleton<KioskRepository>(_KioskRepository());
    addTearDown(sl.reset);

    QrMenuVm? vm;
    await tester.pumpWidget(
      Sizer(
        builder: (context, orientation, screenType) => MaterialApp(
          home: Builder(
            builder: (context) {
              vm ??= _vm(context: context);
              return ChangeNotifierProvider<QrMenuVm>.value(
                value: vm!,
                child: StackRouterScope(
                  controller: _Router(),
                  stateHash: 0,
                  child: ProductPage(
                    item: Items(id: 1, name: 'Чай', price: 500),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
    await tester.pump();
    addTearDown(vm!.kioskService.dispose);

    // Без easy_localization `.tr()` отдаёт сам ключ.
    final add = find.text(LocaleKeys.addToOrder);
    expect(add, findsNothing);

    vm!.setKioskSection(SectionData(tableId: 12));
    await tester.pump();
    expect(add, findsOneWidget);

    vm!.setKioskSection(null);
    await tester.pump();
    expect(add, findsNothing);
  });
}
