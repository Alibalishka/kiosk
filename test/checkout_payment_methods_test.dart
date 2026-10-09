import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/server/api_error_codes.dart';
import 'package:qr_pay_app/src/core/server/exceptions/network_exception.dart';
import 'package:qr_pay_app/src/core/server/result.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/vm/service/basket_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/menu_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/scroll_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/video_service.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_status.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';
import 'package:qr_pay_app/src/features/kiosk/widgets/payment_status_views.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/checkout_model.dart'
    show ChekoutDatum, ChekoutModel;
import 'package:qr_pay_app/src/features/qr/logic/models/responses/pay_model.dart';
import 'package:qr_pay_app/src/features/qr/logic/repository/cart_repository.dart';

class _HostStorage extends Fake implements HostStorage {
  @override
  String? getHost() => 'test';
}

class _Router extends Fake implements StackRouter {
  final pushed = <PageRouteInfo>[];
  var pops = 0;

  @override
  Future<T?> push<T extends Object?>(
    PageRouteInfo route, {
    OnNavigationFailure? onFailure,
  }) async {
    pushed.add(route);
    return null;
  }

  @override
  Future<bool> pop<T extends Object?>([T? result]) async {
    pops++;
    return true;
  }
}

/// Предрасчёт отвечает тем, что лежит в [reply].
class _Cart extends Fake implements CartRepository {
  _Cart(this.reply);

  Result<ChekoutModel> reply;
  final requests = <MenuCheckoutRequest>[];

  @override
  Future<Result<ChekoutModel>> fetchChekoutMenu({
    required MenuCheckoutRequest body,
  }) async {
    requests.add(body);
    return reply;
  }
}

/// pay-order: ответы по очереди.
class _PayOrder extends Fake implements KioskRepository {
  _PayOrder(this.replies);

  final List<Result<PayModel>> replies;
  final requests = <MenuCheckoutRequest>[];

  @override
  Future<Result<PayModel>> payKaspi({required MenuCheckoutRequest body}) async {
    requests.add(body);
    return replies.removeAt(0);
  }
}

class _Context extends Fake implements BuildContext {}

Result<ChekoutModel> _preview({
  bool? kaspi,
  bool? card,
  bool? venue,
}) =>
    Result.success(ChekoutModel(
      data: ChekoutDatum(
        totalPrice: 500,
        kaspiPayReady: kaspi,
        cardPayReady: card,
        payAtVenueReady: venue,
        payAtVenuePaymentMethodId: venue == true ? 7 : null,
      ),
    ));

NetworkException _rejected(String message, {String? code}) {
  final options = RequestOptions(path: '/orders');
  return NetworkException.request(
    error: DioException.badResponse(
      statusCode: 400,
      requestOptions: options,
      response: Response<dynamic>(
        requestOptions: options,
        statusCode: 400,
        data: {
          'data': {'message': message, if (code != null) 'code': code},
        },
      ),
    ),
  );
}

NetworkException _dropped() => NetworkException.request(
      error: DioException.connectionError(
        requestOptions: RequestOptions(path: '/orders'),
        reason: 'connection reset',
      ),
    );

Result<PayModel> _payFailed(NetworkException error) => Result.failure(error);

/// Гость за столом 12 с одним блюдом в корзине.
QrMenuVm _vm({BuildContext? context, List<String> payments = const []}) {
  final vm = QrMenuVm(
    context: context ?? _Context(),
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
        id: 3,
        posOrgId: 'org',
        availablePayments: payments,
      ),
    );
  vm.basketService.basket.add(Items(id: 1, price: 500, count: 1));
  return vm;
}

void main() {
  // VideoPreviewService подписывается на WidgetsBinding в конструкторе.
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => sl.registerSingleton<HostStorage>(_HostStorage()));
  tearDown(sl.reset);

  group('способы оплаты — только по ответу предрасчёта', () {
    testWidgets('ровно те флаги, что true; available_payments не в счёт',
        (tester) async {
      sl.registerSingleton<CartRepository>(
        _Cart(_preview(kaspi: false, card: true, venue: false)),
      );
      final vm = _vm(payments: ['kaspi_pay', 'airba_pay']);

      vm.startCheckoutPreview(indexType: 0);
      await tester.pump();

      expect(vm.canPayByKaspi, isFalse, reason: 'в меню есть, чекаут — нет');
      expect(vm.canPayByCard, isTrue);
      expect(vm.hasPayAtVenue, isFalse);
      expect(vm.hasAnyPaymentMethod, isTrue);
    });

    testWidgets('в меню способов нет, а чекаут разрешил — показываем',
        (tester) async {
      sl.registerSingleton<CartRepository>(
        _Cart(_preview(kaspi: true, card: false, venue: true)),
      );
      final vm = _vm();

      vm.startCheckoutPreview(indexType: 0);
      await tester.pump();

      expect(vm.canPayByKaspi, isTrue);
      expect(vm.canPayByCard, isFalse);
      expect(vm.payAtVenuePaymentMethodId, 7);
    });

    testWidgets('до ответа предрасчёта способов нет', (tester) async {
      sl.registerSingleton<CartRepository>(_Cart(_preview(kaspi: true)));
      final vm = _vm(payments: ['kaspi_pay']);

      expect(vm.hasAnyPaymentMethod, isFalse);
      vm.startCheckoutPreview(indexType: 0);
      expect(vm.hasAnyPaymentMethod, isFalse, reason: 'запрос ещё в пути');
      await tester.pump();
      expect(vm.canPayByKaspi, isTrue);
    });

    testWidgets('отказ заведения — его текст, способов нет, повтора нет',
        (tester) async {
      sl.registerSingleton<CartRepository>(
        _Cart(Result.failure(_rejected('Заведение скоро закрывается'))),
      );
      final vm = _vm(payments: ['kaspi_pay', 'airba_pay']);

      vm.startCheckoutPreview(indexType: 0);
      await tester.pump();

      expect(vm.checkoutPreviewError, 'Заведение скоро закрывается');
      expect(vm.checkoutPreviewRetryable, isFalse);
      expect(vm.hasAnyPaymentMethod, isFalse);
    });

    testWidgets('нет связи — общий текст и «Попробовать снова»',
        (tester) async {
      final cart = _Cart(Result.failure(_dropped()));
      sl.registerSingleton<CartRepository>(cart);
      final vm = _vm();

      vm.startCheckoutPreview(indexType: 0);
      await tester.pump();
      expect(vm.checkoutPreviewError, LocaleKeys.checkoutFailed);
      expect(vm.checkoutPreviewRetryable, isTrue);
      expect(vm.hasAnyPaymentMethod, isFalse);

      cart.reply = _preview(card: true);
      await vm.fetchCheckoutPreview();
      expect(vm.checkoutPreviewError, isNull);
      expect(vm.canPayByCard, isTrue);
    });

    testWidgets('online_payment_disabled убирает Kaspi и карту до выхода',
        (tester) async {
      sl.registerSingleton<CartRepository>(
        _Cart(_preview(kaspi: true, card: true, venue: true)),
      );
      final vm = _vm();
      vm.startCheckoutPreview(indexType: 0);
      await tester.pump();

      vm.disableOnlinePayments();
      expect(vm.canPayByKaspi, isFalse);
      expect(vm.canPayByCard, isFalse);
      expect(vm.hasPayAtVenue, isTrue, reason: 'у официанта платить можно');

      vm
        ..stopCheckoutPreview()
        ..startCheckoutPreview(indexType: 0);
      await tester.pump();
      expect(vm.canPayByKaspi, isTrue, reason: 'новая корзина — новый ответ');
    });
  });

  group('экран Kaspi или карты: online_payment_disabled', () {
    Future<(QrMenuVm, _Router, BuildContext)> pumpPage(
      WidgetTester tester,
    ) async {
      final router = _Router();
      late BuildContext pageContext;
      final vm = _vm();
      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider<QrMenuVm>.value(
          value: vm,
          child: StackRouterScope(
            controller: router,
            stateHash: 0,
            child: Builder(builder: (context) {
              pageContext = context;
              return const SizedBox.expand();
            }),
          ),
        ),
      ));
      return (vm, router, pageContext);
    }

    testWidgets('текст сервера, кнопки онлайн-оплаты убраны, назад',
        (tester) async {
      sl.registerSingleton<CartRepository>(
        _Cart(_preview(kaspi: true, card: true)),
      );
      final (vm, router, context) = await pumpPage(tester);
      vm.startCheckoutPreview(indexType: 0);
      await tester.pump();

      leaveFailedOnlinePayment(
        context,
        message: 'Онлайн-оплата временно отключена',
        reason: ApiErrorCodes.onlinePaymentDisabled,
      );
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Онлайн-оплата временно отключена'), findsOneWidget);
      expect(vm.canPayByKaspi, isFalse);
      expect(vm.canPayByCard, isFalse);
      expect(router.pops, 1);

      await tester.pump(const Duration(seconds: 6));
    });

    testWidgets('вместо текста голый код — показываем свой', (tester) async {
      final (vm, router, context) = await pumpPage(tester);

      leaveFailedOnlinePayment(
        context,
        message: ApiErrorCodes.onlinePaymentDisabled,
        reason: ApiErrorCodes.onlinePaymentDisabled,
      );
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text(LocaleKeys.onlinePaymentDisabled), findsOneWidget);
      expect(router.pops, 1);
      await tester.pump(const Duration(seconds: 6));
    });

    testWidgets('другая ошибка — только текст и назад', (tester) async {
      sl.registerSingleton<CartRepository>(
        _Cart(_preview(kaspi: true, card: true)),
      );
      final (vm, router, context) = await pumpPage(tester);
      vm.startCheckoutPreview(indexType: 0);
      await tester.pump();

      leaveFailedOnlinePayment(context, message: 'Что-то пошло не так!');
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Что-то пошло не так!'), findsOneWidget);
      expect(vm.canPayByKaspi, isTrue);
      expect(router.pops, 1);
      await tester.pump(const Duration(seconds: 6));
    });
  });

  group('оплата у официанта', () {
    /// Корзина за столом, где чекаут разрешил оплату у официанта.
    Future<(QrMenuVm, _Router, BuildContext)> pumpCart(
      WidgetTester tester,
      List<Result<PayModel>> replies,
    ) async {
      sl
        ..registerSingleton<CartRepository>(_Cart(_preview(venue: true)))
        ..registerSingleton<KioskRepository>(_PayOrder(replies));
      final router = _Router();
      late BuildContext cartContext;
      await tester.pumpWidget(MaterialApp(
        home: StackRouterScope(
          controller: router,
          stateHash: 0,
          child: Builder(builder: (context) {
            cartContext = context;
            return const SizedBox.expand();
          }),
        ),
      ));
      final vm = _vm(context: cartContext);
      vm.startCheckoutPreview(indexType: 0);
      await tester.pump();
      expect(vm.hasPayAtVenue, isTrue);
      return (vm, router, cartContext);
    }

    _PayOrder payOrder() => sl<KioskRepository>() as _PayOrder;

    testWidgets('касса занята — повтор через 2–3 с с тем же ключом',
        (tester) async {
      final (vm, _, context) = await pumpCart(tester, [
        _payFailed(
            _rejected('Касса занята', code: ApiErrorCodes.payAtVenueBusy)),
        _payFailed(
            _rejected('Касса занята', code: ApiErrorCodes.payAtVenueBusy)),
        _payFailed(_rejected(
          'Не удалось передать заказ',
          code: ApiErrorCodes.payAtVenuePosFailed,
        )),
      ]);

      vm.tabletPayAtVenue(context, indexType: 0);
      await tester.pump();
      expect(payOrder().requests, hasLength(1));
      expect(vm.payAtVenueLoading, isTrue);

      await tester.pump(const Duration(milliseconds: 1900));
      expect(payOrder().requests, hasLength(1), reason: 'не раньше 2 с');
      await tester.pump(const Duration(milliseconds: 600));
      expect(payOrder().requests, hasLength(2));
      await tester.pump(const Duration(milliseconds: 2500));
      expect(payOrder().requests, hasLength(3));

      final keys = payOrder().requests.map((r) => r.idempotencyKey).toSet();
      expect(keys, hasLength(1), reason: 'один и тот же Idempotency-Key');
      expect(payOrder().requests.first.paymentMethodId, 7);

      await tester.pump(const Duration(milliseconds: 100));
      expect(vm.payAtVenueLoading, isFalse);
      expect(find.text(LocaleKeys.payAtVenueCallWaiter), findsOneWidget,
          reason: 'pos_failed — позовите официанта');
      await tester.pump(const Duration(seconds: 6));
    });

    testWidgets('дозаказ не определился — позовите официанта, без повтора',
        (tester) async {
      final (vm, _, context) = await pumpCart(tester, [
        _payFailed(_rejected(
          'pay_at_venue_round_unknown',
          code: ApiErrorCodes.payAtVenueRoundUnknown,
        )),
      ]);

      vm.tabletPayAtVenue(context, indexType: 0);
      await tester.pump(const Duration(milliseconds: 100));

      expect(payOrder().requests, hasLength(1));
      expect(find.text(LocaleKeys.payAtVenueCallWaiter), findsOneWidget);
      await tester.pump(const Duration(seconds: 6));
    });

    testWidgets('обрыв связи — повтор с тем же ключом; новое нажатие — новый',
        (tester) async {
      final (vm, router, context) = await pumpCart(tester, [
        _payFailed(_dropped()),
        Result.success(
          PayModel()..data = PayDatum(id: 501, statusRaw: 'new'),
        ),
        Result.success(
          PayModel()..data = PayDatum(id: 502, statusRaw: 'inprogress'),
        ),
      ]);

      vm.tabletPayAtVenue(context, indexType: 0);
      await tester.pump();
      await tester.pump(const Duration(seconds: 3));

      final first = payOrder().requests;
      expect(first, hasLength(2));
      expect(first[1].idempotencyKey, first[0].idempotencyKey);
      expect(router.pushed.single, isA<KioskSuccessPageRoute>());

      vm.tabletPayAtVenue(context, indexType: 0);
      await tester.pump();
      expect(payOrder().requests, hasLength(3));
      expect(
        payOrder().requests[2].idempotencyKey,
        isNot(first[0].idempotencyKey),
        reason: 'каждое «Заказать» — новый ключ',
      );
    });

    testWidgets('связь так и не вернулась — проверить «Заказы стола»',
        (tester) async {
      final (vm, _, context) = await pumpCart(tester, [
        for (var i = 0; i < 4; i++) _payFailed(_dropped()),
      ]);

      vm.tabletPayAtVenue(context, indexType: 0);
      await tester.pump();
      for (var i = 0; i < 3; i++) {
        await tester.pump(const Duration(seconds: 3));
      }
      await tester.pump(const Duration(milliseconds: 100));

      expect(payOrder().requests, hasLength(4));
      expect(
        payOrder().requests.map((r) => r.idempotencyKey).toSet(),
        hasLength(1),
      );
      expect(find.text(LocaleKeys.payAtVenueNoConnection), findsOneWidget);
      expect(vm.payAtVenueLoading, isFalse);
      await tester.pump(const Duration(seconds: 6));
    });

    testWidgets('гость ушёл из корзины — повторов нет', (tester) async {
      final (vm, _, context) = await pumpCart(tester, [
        _payFailed(
            _rejected('Касса занята', code: ApiErrorCodes.payAtVenueBusy)),
        _payFailed(
            _rejected('Касса занята', code: ApiErrorCodes.payAtVenueBusy)),
      ]);

      vm.tabletPayAtVenue(context, indexType: 0);
      await tester.pump();
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(seconds: 10));

      expect(payOrder().requests, hasLength(1));
      expect(vm.payAtVenueLoading, isFalse);
    });
  });
}
