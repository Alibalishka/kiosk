import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/pages/product_page.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/vm/service/basket_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/menu_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/scroll_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/video_service.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';
import 'package:sizer/sizer.dart';

/// «Бульон 2 вида» как в меню хого-ресторана: соус на каждого гостя
/// (обязательный, по умолчанию один) и два вида бульона на выбор.
Items _broth() => Items(
      id: 136527,
      name: 'Бульон 2 вида',
      price: 5000,
      modifiers: [
        Modifier(
          id: 1971,
          name: 'Дополнительно',
          min: 1,
          max: 50,
          required: true,
          multiple: true,
          items: [
            Items(
              id: 136914,
              name: '-1гость=1 соус',
              price: 1000,
              defaultSelect: true,
              requiredSelect: true,
            ),
          ],
        ),
        Modifier(
          id: 1944,
          name: 'Укажите остроту бульона',
          min: 2,
          max: 2,
          required: true,
          multiple: true,
          posId: 'flavors',
          items: [
            Items(id: 136548, name: 'Грибной бульон', price: 0),
            Items(id: 136551, name: 'Белый костный бульон', price: 0),
          ],
        ),
      ],
    );

class _Router extends Fake implements StackRouter {
  int pops = 0;

  @override
  Future<bool> pop<T extends Object?>([T? result]) async {
    pops++;
    return true;
  }
}

class _KioskRepository extends Fake implements KioskRepository {}

class _Page {
  _Page(this.vm, this.router);

  final QrMenuVm vm;
  final _Router router;

  List<Items> get basket => vm.basketService.basket;
}

Future<_Page> _open(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1080, 1920);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  sl.registerSingleton<KioskRepository>(_KioskRepository());
  addTearDown(sl.reset);

  final router = _Router();
  QrMenuVm? vm;
  await tester.pumpWidget(
    Sizer(
      builder: (context, orientation, screenType) => MaterialApp(
        home: Builder(
          builder: (context) {
            vm ??= QrMenuVm(
              context: context,
              basketService: BasketService(),
              scrollService: ScrollService(),
              videoService: VideoPreviewService(),
              menuDataService: MenuDataService(),
            )
              ..isKioskMode = false
              ..isTablet = true
              ..menuData = QrMenuModel(
                organization: DetailItemDatum(availablePayments: ['kaspi_pay']),
              );
            return ChangeNotifierProvider<QrMenuVm>.value(
              value: vm!,
              child: StackRouterScope(
                controller: router,
                stateHash: 0,
                child: ProductPage(item: _broth()),
              ),
            );
          },
        ),
      ),
    ),
  );
  await tester.pump();
  // Таймер простоя киоска заводится на касаниях — гасим его после теста.
  addTearDown(vm!.kioskService.dispose);

  return _Page(vm!, router);
}

Future<void> _tap(WidgetTester tester, Finder finder) async {
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

/// Как гость: смахнуть страницу вверх, к нижним строкам. Короткую страницу
/// магнитная шапка возвращает к началу после любого касания, поэтому
/// смахиваем перед каждым тапом внизу.
Future<void> _swipeUp(WidgetTester tester) async {
  await tester.fling(
      find.byType(CustomScrollView), const Offset(0, -1000), 3000);
  await tester.pumpAndSettle();
}

Finder _inDialog(Finder finder) =>
    find.descendant(of: find.byType(BackdropFilter), matching: finder);

Future<void> _pickFlavors(WidgetTester tester) async {
  for (final flavor in ['Грибной бульон', 'Белый костный бульон']) {
    await _swipeUp(tester);
    await _tap(tester, find.text(flavor));
  }
}

int _sauces(Items line) => line.modifiers!
    .firstWhere((m) => m.id == 1971)
    .items!
    .where((e) => e.id == 136914)
    .length;

void main() {
  // Без инициализации easy_localization `.tr()` отдаёт сам ключ.
  testWidgets('вместо счётчика — «Сколько вас?», количество блюда скрыто',
      (tester) async {
    await _open(tester);

    expect(find.text(LocaleKeys.guestCountTitle), findsOneWidget);
    expect(find.text('Дополнительно'), findsNothing);
    expect(
      find.byWidgetPredicate((w) =>
          w is SvgPicture &&
          w.pictureProvider is ExactAssetPicture &&
          (w.pictureProvider as ExactAssetPicture).assetName ==
              AppSvgImages.plus),
      findsNothing,
      reason: 'один котёл на строку: соусы не должны умножаться',
    );
  });

  testWidgets('ответ на странице: двое — два соуса, без лишних вопросов',
      (tester) async {
    final page = await _open(tester);

    await _tap(tester, find.text('2'));
    await _pickFlavors(tester);
    expect(find.text('7 000 ₸'), findsOneWidget);

    await _tap(tester, find.text(LocaleKeys.addToOrder));

    expect(_inDialog(find.text(LocaleKeys.guestCountTitle)), findsNothing);
    final line = page.basket.single;
    expect(_sauces(line), 2);
    expect(page.vm.basketService.getItemTotalPrice(line), 7000);
    expect(page.router.pops, 1);
  });

  testWidgets('не ответили — спрашиваем при добавлении', (tester) async {
    final page = await _open(tester);
    await _pickFlavors(tester);

    await _tap(tester, find.text(LocaleKeys.addToOrder));
    expect(_inDialog(find.text(LocaleKeys.guestCountTitle)), findsOneWidget);

    await _tap(tester, _inDialog(find.text('3')));
    await _tap(tester, _inDialog(find.text(LocaleKeys.addToOrder)));

    final line = page.basket.single;
    expect(_sauces(line), 3);
    expect(page.vm.basketService.getItemTotalPrice(line), 8000);
    expect(page.router.pops, 1);
  });

  testWidgets('отмена в вопросе — ничего не добавляется', (tester) async {
    final page = await _open(tester);
    await _pickFlavors(tester);

    await _tap(tester, find.text(LocaleKeys.addToOrder));
    await _tap(tester, _inDialog(find.text(LocaleKeys.cancel)));

    expect(find.byType(BackdropFilter), findsNothing);
    expect(page.basket, isEmpty);
    expect(page.router.pops, 0);
  });
}
