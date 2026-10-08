import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/service/basket_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/order_assistant.dart';
import 'package:qr_pay_app/src/features/home/vm/service/per_guest_modifiers.dart';

/// «Бульон 2 вида» из меню хого-ресторана, как его отдаёт сервер (вариантов
/// бульона и остроты меньше, чем в оригинале).
const _brothJson = '''
{
  "id": 136527,
  "name": "两种肉汤 Бульон 2 вида",
  "description": "Ассорти из двух видов наваристого бульона, подаваемых в одной посуде.",
  "price": 5000,
  "pos_id": "fef74369-729f-4979-a212-365cfd047c28",
  "code": "00433",
  "modifiers": [
    {
      "id": 1971,
      "name": "Дополнительно",
      "description": "",
      "min": 1,
      "max": 50,
      "required": true,
      "multiple": true,
      "items": [
        {
          "id": 136914,
          "name": "-1гость=1 соус",
          "characteristics": [],
          "image": [],
          "description": "",
          "price": 1000,
          "pos_id": "ddffb48e-cb1a-4e30-9c0d-ad1983d92a70",
          "code": "00985",
          "modifiers": [],
          "order": 0,
          "default": true,
          "required": true
        }
      ],
      "pos_id": null,
      "iiko_id": null
    },
    {
      "id": 1944,
      "name": "整份高汤 Укажите остроту бульона ",
      "description": "",
      "min": 2,
      "max": 2,
      "required": true,
      "multiple": true,
      "items": [
        {"id": 136548, "name": "德庄菌汤 Грибной бульон Дэжуан", "price": 0, "code": "00437", "modifiers": [], "default": false, "required": false},
        {"id": 136551, "name": "德庄牛骨汤 Белый костный бульон", "price": 0, "code": "00439", "modifiers": [], "default": false, "required": false},
        {"id": 136554, "name": "德庄李氏辣度锅底 Острый бульон", "price": 0, "code": "00438", "modifiers": [], "default": false, "required": false}
      ],
      "pos_id": "27372e1a-ee6e-4445-8c33-66cac8555e46",
      "iiko_id": "27372e1a-ee6e-4445-8c33-66cac8555e46"
    },
    {
      "id": 1956,
      "name": "-Острата 2 вида бульона",
      "description": "",
      "min": 0,
      "max": 1,
      "required": false,
      "multiple": false,
      "items": [
        {"id": 136839, "name": "12° бульон 2 вида", "price": 0, "code": "00947", "modifiers": [], "default": false, "required": false},
        {"id": 136854, "name": "75° бульон 2 вида", "price": 0, "code": "00953", "modifiers": [], "default": false, "required": false}
      ],
      "pos_id": "53f530ee-6eee-47d4-b938-8d73f458280b",
      "iiko_id": "53f530ee-6eee-47d4-b938-8d73f458280b"
    }
  ]
}
''';

Modifier _group(
  String optionName, {
  int min = 1,
  int max = 50,
  bool required = true,
  bool optionRequired = false,
}) =>
    Modifier(
      id: 1,
      name: 'Дополнительно',
      min: min,
      max: max,
      required: required,
      multiple: true,
      items: [
        Items(
          id: 10,
          name: optionName,
          price: 1000,
          requiredSelect: optionRequired,
        ),
      ],
    );

class _Host implements HostStorage {
  @override
  String? getHost() => 'kiosk';

  @override
  bool hasHost() => true;

  @override
  Future<void> saveHost(String host) async {}

  @override
  void deleteHost() {}
}

void main() {
  final broth = Items.fromJson(jsonDecode(_brothJson) as Map<String, dynamic>);
  final sauce = broth.modifiers![0];
  final flavors = broth.modifiers![1];
  final spice = broth.modifiers![2];

  group('узнаёт добавку на каждого гостя', () {
    test('соус к хого из меню ресторана', () {
      expect(PerGuestModifiers.matches(sauce), isTrue);
      expect(PerGuestModifiers.matches(flavors), isFalse);
      expect(PerGuestModifiers.matches(spice), isFalse);
      expect(PerGuestModifiers.of(broth), [sauce]);
    });

    test('по словам про гостей на разных языках', () {
      for (final name in [
        '-1гость=1 соус',
        'Соус (на каждого гостя)',
        'Приборы по числу гостей',
        'Хлеб на 1 человека',
        '1 чел. = 1 соус',
        'Соус на персону',
        '1 қонаққа 1 тұздық',
        'Әр адамға соус',
        'Sauce per guest',
        '1 per person',
        'Dipping sauce for each pax',
        '每人一份蘸料',
      ]) {
        expect(PerGuestModifiers.matches(_group(name)), isTrue, reason: name);
      }
    });

    test('похожие слова не путает', () {
      for (final name in [
        'Соус',
        'Хлеб ГОСТ',
        'Гостевой набор',
        'Гостиничный завтрак',
        'Для персонала',
        'Челюсти краба',
        'Personal pizza',
      ]) {
        expect(PerGuestModifiers.matches(_group(name)), isFalse, reason: name);
      }
    });

    test('только обязательный счётчик из одной позиции', () {
      expect(
        PerGuestModifiers.matches(
            _group('1 гость = 1 соус', min: 0, required: false)),
        isFalse,
        reason: 'необязательную группу можно пропустить',
      );
      expect(
        PerGuestModifiers.matches(_group('1 гость = 1 соус', max: 1)),
        isFalse,
        reason: 'выбор одного варианта, а не количество',
      );
      expect(
        PerGuestModifiers.matches(Modifier(
          name: 'На каждого гостя',
          min: 1,
          max: 10,
          required: true,
          items: [Items(id: 1, name: 'Соус'), Items(id: 2, name: 'Хлеб')],
        )),
        isFalse,
        reason: 'две позиции — непонятно, какую на гостя',
      );
      expect(
        PerGuestModifiers.matches(_group('1 гость = 1 соус',
            min: 0, required: false, optionRequired: true)),
        isTrue,
        reason: 'сама позиция обязательна',
      );
    });
  });

  test('выбор на гостей: позиция по штуке на каждого, в пределах группы', () {
    final three = PerGuestModifiers.selection(sauce, 3);
    expect(three.id, sauce.id);
    expect(three.posId, isNull);
    expect(three.items!.map((e) => e.id), [136914, 136914, 136914]);
    expect(three.items!.every((e) => e.count == 1), isTrue);

    expect(PerGuestModifiers.selection(sauce, null).items, isEmpty);
    expect(PerGuestModifiers.selection(sauce, 80).items, hasLength(50));
  });

  test('пределы, название и цена на гостя', () {
    expect(PerGuestModifiers.guestRange([sauce]), (min: 1, max: 50));
    expect(PerGuestModifiers.names([sauce]), '1гость=1 соус');
    expect(PerGuestModifiers.pricePerGuest([sauce]), 1000);
  });

  group('корзина и касса', () {
    setUp(() => sl.registerSingleton<HostStorage>(_Host()));
    tearDown(() => sl.reset());

    test('три гостя — три соуса в цене и в заказе', () {
      final basket = BasketService();
      basket.basket.add(broth.copyWith(
        count: 1,
        modifiers: [PerGuestModifiers.selection(sauce, 3)],
      ));

      expect(basket.getItemTotalPrice(basket.basket.single), 8000);

      final request = basket.buildCheckoutRequest(
        indexType: 1,
        organizationSecondId: 1,
      );
      final line = request.items!.single;
      expect(line.itemId, 136527);
      expect(line.amount, 1);
      final modifier = line.modifiers!.single;
      expect(modifier.itemId, 136914);
      expect(modifier.amount, 3);
      expect(modifier.itemGroupId, isNull);
    });
  });

  test('помощник не предлагает блюдо, где добавку берут на каждого гостя', () {
    Items pot(int id, List<Modifier> modifiers) => Items(
          id: id,
          name: 'Казан-кебаб на компанию',
          price: 9000,
          modifiers: modifiers,
        );
    final assistant = OrderAssistant(QrMenuModel(data: [
      QrMenuDatum(name: 'Горячее', items: [
        pot(1, [sauce]),
        pot(2, const []),
      ]),
      QrMenuDatum(
          name: 'Напитки', items: [Items(id: 3, name: 'Чай', price: 500)]),
    ]));

    final ids = assistant.dishes.map((d) => d.id).toSet();
    expect(ids, isNot(contains(1)),
        reason: 'по умолчанию там один соус на всех');
    expect(ids, contains(2));
  });
}
