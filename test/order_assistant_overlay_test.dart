import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/service/order_assistant.dart';
import 'package:qr_pay_app/src/features/home/widgets/order_assistant_overlay.dart';
import 'package:sizer/sizer.dart';

Items _item(int id, String name, int price) =>
    Items(id: id, name: name, price: price);

/// Без картинок: карточки рисуют заглушку и не ходят в сеть.
QrMenuModel _menu() => QrMenuModel(
      data: [
        QrMenuDatum(name: 'Бургеры', items: [
          _item(1, 'Чизбургер', 2500),
          _item(2, 'Двойной бургер с очень длинным названием на две строки',
              3500),
          _item(3, 'Чикен бургер', 2200),
        ]),
        QrMenuDatum(name: 'Закуски', items: [
          _item(10, 'Картофель фри', 900),
          _item(11, 'Наггетсы', 1200),
        ]),
        QrMenuDatum(name: 'Напитки', items: [
          _item(30, 'Кола', 600),
          _item(31, 'Латте', 1100),
          _item(32, 'Чай', 500),
        ]),
        QrMenuDatum(name: 'Десерты', items: [
          _item(40, 'Чизкейк', 1600),
          _item(41, 'Мороженое', 800),
        ]),
      ],
    );

class _Harness {
  final added = <(int?, int)>[];
  var closed = false;
}

Future<_Harness> _pump(
  WidgetTester tester,
  Size size, {
  QrMenuModel? menu,
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  final harness = _Harness();
  await tester.pumpWidget(
    Sizer(
      builder: (context, orientation, screenType) => MaterialApp(
        home: Scaffold(
          body: OrderAssistantOverlay(
            assistant: OrderAssistant(menu ?? _menu()),
            idleTimeout: const Duration(minutes: 2),
            onAddToBasket: (context, item, count) async {
              harness.added.add((item.id, count));
              return true;
            },
            onClose: () => harness.closed = true,
          ),
        ),
      ),
    ),
  );
  return harness;
}

/// Сфера и свечение анимируются бесконечно — pumpAndSettle не дождётся,
/// поэтому просто проматываем время кусками.
Future<void> _wait(WidgetTester tester, [int ms = 2500]) async {
  for (var left = ms; left > 0; left -= 100) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

Future<void> _tapText(WidgetTester tester, String text) async {
  final finder = find.text(text).first;
  await tester.ensureVisible(finder);
  await tester.pump();
  await tester.tap(finder);
  await tester.pump();
}

void main() {
  const sizes = <String, Size>{
    'портрет 1080x1920': Size(1080, 1920),
    'портрет 800x1280': Size(800, 1280),
    'альбом 1920x1080': Size(1920, 1080),
    'альбом 1280x800': Size(1280, 800),
  };

  // Без инициализации easy_localization `.tr()` отдаёт сам ключ.
  sizes.forEach((name, size) {
    testWidgets('весь сценарий без исключений: $name', (tester) async {
      final harness = await _pump(tester, size);
      await _wait(tester);
      expect(find.text(LocaleKeys.assistantGreeting), findsOneWidget);

      await _tapText(tester, LocaleKeys.assistantMoodHearty);
      await _wait(tester);
      expect(find.text(LocaleKeys.assistantAskGuests), findsOneWidget);

      await _tapText(tester, LocaleKeys.assistantGuestsTwo);
      await _wait(tester);
      expect(find.text(LocaleKeys.assistantAskBudget), findsOneWidget);

      await _tapText(tester, LocaleKeys.assistantBudgetAny);
      await _wait(tester, 5000);
      expect(find.text(LocaleKeys.assistantResult), findsOneWidget);
      expect(find.text(LocaleKeys.assistantAddAll), findsOneWidget);

      // Замена блюда и другой вариант — карточки переворачиваются.
      final swap = find.byIcon(Icons.autorenew_rounded).first;
      await tester.ensureVisible(swap);
      await tester.tap(swap);
      await _wait(tester, 800);
      await _tapText(tester, LocaleKeys.assistantAnother);
      await _wait(tester, 800);

      await _tapText(tester, LocaleKeys.assistantAddAll);
      await _wait(tester, 2000);

      // Сытно на двоих без бюджета: два основных и два напитка.
      final portions = harness.added.fold(0, (sum, e) => sum + e.$2);
      expect(portions, greaterThanOrEqualTo(4));
      expect(harness.closed, isTrue);
      expect(tester.takeException(), isNull);
    });
  });

  testWidgets('вопрос о пожеланиях — только когда в меню есть выбор',
      (tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    final added = <int?>[];
    await tester.pumpWidget(
      Sizer(
        builder: (context, orientation, screenType) => MaterialApp(
          home: Scaffold(
            body: OrderAssistantOverlay(
              assistant: OrderAssistant(QrMenuModel(data: [
                QrMenuDatum(name: 'Бургеры', items: [
                  _item(1, 'Бургер с беконом', 2600),
                  _item(2, 'Вегетарианский бургер', 2400),
                  _item(3, 'Чикен бургер', 2200),
                ]),
                QrMenuDatum(name: 'Напитки', items: [
                  _item(30, 'Кола 0,5 л', 600),
                ]),
              ])),
              idleTimeout: const Duration(minutes: 2),
              onAddToBasket: (context, item, count) async {
                added.add(item.id);
                return true;
              },
              onClose: () {},
            ),
          ),
        ),
      ),
    );
    await _wait(tester);
    await _tapText(tester, LocaleKeys.assistantMoodHearty);
    await _wait(tester);
    await _tapText(tester, LocaleKeys.assistantGuestsOne);
    await _wait(tester);
    expect(find.text(LocaleKeys.assistantAskPreference), findsOneWidget);
    expect(find.text(LocaleKeys.assistantPrefNoMeat), findsOneWidget);
    expect(find.text(LocaleKeys.assistantPrefSpicy), findsNothing,
        reason: 'острого в меню нет');

    await _tapText(tester, LocaleKeys.assistantPrefNoMeat);
    await _wait(tester);
    await _tapText(tester, LocaleKeys.assistantBudgetAny);
    await _wait(tester, 5000);
    await _tapText(tester, LocaleKeys.assistantAddAll);
    await _wait(tester, 2000);

    expect(added, contains(2));
    expect(added, isNot(contains(1)));
    expect(added, isNot(contains(3)));
    expect(tester.takeException(), isNull);
  });

  testWidgets('в кофейне спрашивает про напитки, а не «Сытно поесть»',
      (tester) async {
    final harness = await _pump(
      tester,
      const Size(1080, 1920),
      menu: QrMenuModel(data: [
        QrMenuDatum(name: 'Кофе', items: [
          _item(1, 'Капучино', 1200),
          _item(2, 'Латте', 1300),
          _item(3, 'Айс латте', 1400),
        ]),
        QrMenuDatum(name: 'Чай', items: [
          _item(10, 'Чай чёрный', 600),
          _item(11, 'Улун', 900),
        ]),
      ]),
    );
    await _wait(tester);
    expect(find.text(LocaleKeys.assistantMoodCoffee), findsOneWidget);
    expect(find.text(LocaleKeys.assistantMoodTea), findsOneWidget);
    expect(find.text(LocaleKeys.assistantMoodHearty), findsNothing);
    expect(find.text(LocaleKeys.assistantMoodSweet), findsNothing);
    expect(find.text(LocaleKeys.assistantMoodDrinks), findsNothing);

    await _tapText(tester, LocaleKeys.assistantMoodTea);
    await _wait(tester);
    await _tapText(tester, LocaleKeys.assistantGuestsOne);
    await _wait(tester);
    await _tapText(tester, LocaleKeys.assistantBudgetAny);
    await _wait(tester, 5000);
    await _tapText(tester, LocaleKeys.assistantAddAll);
    await _wait(tester, 2000);

    expect(harness.added, isNotEmpty);
    expect(harness.added.map((e) => e.$1), everyElement(isIn([10, 11])));
    expect(tester.takeException(), isNull);
  });

  testWidgets('выбирать не из чего — сразу спрашивает, сколько гостей',
      (tester) async {
    await _pump(
      tester,
      const Size(1080, 1920),
      menu: QrMenuModel(data: [
        QrMenuDatum(name: 'Фреши', items: [
          _item(1, 'Сок апельсиновый', 1500),
          _item(2, 'Сок яблочный', 1300),
          _item(3, 'Морс клюквенный', 900),
        ]),
      ]),
    );
    await _wait(tester);
    expect(find.text(LocaleKeys.assistantGreetingGuests), findsOneWidget);
    expect(find.text(LocaleKeys.assistantMoodSurprise), findsNothing);

    await _tapText(tester, LocaleKeys.assistantGuestsTwo);
    await _wait(tester);
    await _tapText(tester, LocaleKeys.assistantBudgetAny);
    await _wait(tester, 5000);
    expect(find.text(LocaleKeys.assistantResult), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('«Удиви меня» сразу показывает подборку', (tester) async {
    await _pump(tester, const Size(1080, 1920));
    await _wait(tester);

    await _tapText(tester, LocaleKeys.assistantMoodSurprise);
    await _wait(tester, 5000);

    expect(find.text(LocaleKeys.assistantAskGuests), findsNothing);
    expect(find.text(LocaleKeys.assistantResult), findsOneWidget);
    expect(tester.takeException(), isNull);

    // Закрытие — без висящих таймеров.
    await tester.tap(find.byIcon(Icons.close_rounded));
    await _wait(tester, 1000);
  });

  testWidgets('без оплаты кнопки «Добавить» нет', (tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      Sizer(
        builder: (context, orientation, screenType) => MaterialApp(
          home: Scaffold(
            body: OrderAssistantOverlay(
              assistant: OrderAssistant(_menu()),
              idleTimeout: const Duration(minutes: 2),
              onAddToBasket: null,
              onClose: () {},
            ),
          ),
        ),
      ),
    );
    await _wait(tester);
    await _tapText(tester, LocaleKeys.assistantMoodSurprise);
    await _wait(tester, 5000);

    expect(find.text(LocaleKeys.assistantAddAll), findsNothing);
    expect(find.text(LocaleKeys.assistantAnother), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
