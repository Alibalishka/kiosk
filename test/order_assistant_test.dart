import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/service/order_assistant.dart';

Items _item(
  int id,
  String name,
  int price, {
  String? description,
  List<Characteristic>? characteristics,
  List<Modifier>? modifiers,
  bool defaultSelect = false,
  bool image = true,
}) =>
    Items(
      id: id,
      name: name,
      price: price,
      description: description,
      characteristics: characteristics,
      modifiers: modifiers,
      defaultSelect: defaultSelect,
      image: image ? [ImageDatum(path: 'https://img/$id.webp')] : null,
    );

QrMenuDatum _category(String name, List<Items> items, {List<Items>? hits}) =>
    QrMenuDatum(name: name, items: items, recommend: hits);

/// Бургерная: бургеры, гарниры, напитки, десерты, а также всё, чего в
/// подборке быть не должно.
QrMenuModel _burgerMenu() => QrMenuModel(
      data: [
        _category('Бургеры', [
          _item(1, 'Чизбургер', 2500),
          _item(2, 'Двойной бургер с беконом', 3500),
          _item(3, 'Чикен бургер', 2200),
          _item(4, 'Острый бургер халапеньо', 2700),
          _item(5, 'Вегетарианский бургер', 2400),
        ], hits: [
          _item(2, 'Двойной бургер с беконом', 3500),
        ]),
        _category('Закуски', [
          _item(10, 'Картофель фри', 900),
          _item(11, 'Наггетсы', 1200),
          _item(12, 'Луковые кольца', 1000),
        ]),
        _category('Салаты', [
          _item(20, 'Цезарь с курицей', 2100),
          _item(21, 'Греческий салат', 1500),
        ]),
        _category('Напитки', [
          _item(30, 'Кола 0,5 л', 600),
          _item(31, 'Кола 1 л', 1000),
          _item(32, 'Латте', 1100),
          _item(33, 'Чай черный', 500),
          _item(34, 'Лимонад домашний', 900),
        ]),
        _category('Десерты', [
          _item(40, 'Чизкейк', 1600),
          _item(41, 'Мороженое пломбир', 800),
        ]),
        _category('Соусы', [_item(50, 'Сырный соус', 300)]),
        _category('Пиво', [_item(60, 'Светлое', 1500)]),
        _category('Хиты', [
          _item(70, 'Кофе по подписке', 0),
          // Обязательный выбор без умолчания — одним касанием не добавить.
          _item(71, 'Пицца на выбор', 3000, modifiers: [
            Modifier(id: 1, name: 'Пицца', min: 1, max: 1, items: [
              _item(711, 'Маргарита', 0),
              _item(712, 'Пепперони', 0),
            ]),
          ]),
          // Обязательный выбор с умолчанием — можно.
          _item(72, 'Кофе с молоком', 900, modifiers: [
            Modifier(id: 2, name: 'Молоко', min: 1, max: 1, items: [
              _item(721, 'Обычное', 0, defaultSelect: true),
              _item(722, 'Овсяное', 200),
            ]),
          ]),
          _item(73, 'Сервисный сбор', 500),
        ]),
      ],
    );

/// Китайское заведение: иероглифы в названиях, как в реальном меню.
QrMenuModel _chineseMenu() => QrMenuModel(
      data: [
        _category('Горячие блюда', [
          _item(1, '麻辣牛肉 Говядина по-сычуаньски', 3200),
          _item(2, '回锅肉 Свинина дважды приготовленная', 2900),
          _item(3, '红烧肉 Тушёное мясо', 3100),
          _item(4, '宫保鸡丁 Курица гунбао', 2700),
          _item(5, '素炒时蔬 Овощи по-китайски', 1900),
          _item(6, '鲜切牛小排 Свеже нарез. мясо гов. ребра', 2500),
        ]),
        _category('Гарниры', [
          _item(10, '米饭 Рис отварной', 500),
          _item(11, '蛋炒饭 Рис жареный с курицей', 1500),
          _item(12, '鞭炮笋 Морские водоросли', 1900),
        ]),
        _category('Напитки', [
          _item(20, '茶 Чай жасминовый', 800),
          _item(21, 'Кола 0,5 л', 700),
          _item(22, 'Чай с грейпфрутом напиток', 1500),
          _item(23, 'Вода Tassay 0,25 с/г', 400),
        ]),
      ],
    );

/// Кофейня: одни напитки, и часть названий словарь не знает.
QrMenuModel _coffeeMenu({List<QrMenuDatum> extra = const []}) => QrMenuModel(
      data: [
        _category('Классика', [
          _item(1, 'Эспрессо', 700),
          _item(2, 'Американо', 900),
          _item(3, 'Капучино 300 мл', 1200),
          _item(4, 'Флэт уайт', 1300),
          _item(5, 'Кортадо', 1100),
        ]),
        _category('Авторские', [
          _item(10, 'Раф лаванда', 1600),
          _item(11, 'Бамбл', 1500),
          _item(12, 'Эспрессо-тоник', 1500),
          _item(13, 'Голубой матча латте', 1700),
          // Ни одного знакомого слова — напиток по соседям.
          _item(14, 'Сансет', 1600),
          // Вес — значит еда, хоть вокруг одни напитки.
          _item(15, 'Киш лорен 180 г', 1400),
        ]),
        _category('Холодное', [
          _item(20, 'Колд брю', 1400),
          _item(21, 'Айс латте', 1400),
          _item(22, 'Лимонад манго-маракуйя', 1300),
        ]),
        _category('Не кофе', [
          _item(30, 'Какао с маршмеллоу', 1200),
          _item(31, 'Улун молочный', 1000),
          _item(32, 'Бабл ти таро', 1800),
        ]),
        // Одна позиция, и та незнакомая, — напиток по объёму.
        _category('Сезонное', [_item(40, 'Тропик 400 мл', 1500)]),
        ...extra,
      ],
    );

final _morning = DateTime(2026, 10, 6, 8);
final _lunch = DateTime(2026, 10, 6, 13);
final _evening = DateTime(2026, 10, 6, 19);
final _night = DateTime(2026, 10, 6, 22);
final _winter = DateTime(2026, 1, 15, 15);
final _summer = DateTime(2026, 7, 15, 15);

/// Доля сидов, на которых выполняется условие: подбор вероятностный, поэтому
/// «умность» проверяем статистически, а запреты — на каждом сиде.
double _share(
  OrderAssistant assistant,
  AssistantRequest request,
  bool Function(AssistantSet set) test, {
  int seeds = 40,
}) {
  var hits = 0;
  for (var seed = 0; seed < seeds; seed++) {
    if (test(assistant.pick(request, seed: seed))) hits++;
  }
  return hits / seeds;
}

DishProfile _dish(OrderAssistant assistant, int id) =>
    assistant.dishes.firstWhere((d) => d.id == id);

int _coverage(AssistantSet set, AssistantCourse course) => set.lines
    .where((l) => l.course == course)
    .fold(0, (sum, l) => sum + (l.dish.servings * l.count).round());

void main() {
  group('роли', () {
    test('по названию блюда', () {
      expect(OrderAssistant.roleForItem('Капучино'), DishRole.drink);
      expect(OrderAssistant.roleForItem('Кока-Кола 0,5'), DishRole.drink);
      expect(OrderAssistant.roleForItem('Комбо: бургер + кола'), DishRole.main);
      expect(OrderAssistant.roleForItem('Суп-лапша'), DishRole.soup);
      expect(OrderAssistant.roleForItem('Салат Цезарь с курицей'),
          DishRole.salad);
      expect(OrderAssistant.roleForItem('Картофель фри'), DishRole.side);
      expect(OrderAssistant.roleForItem('Соус барбекю'), DishRole.extra);
      expect(OrderAssistant.roleForItem('Сырный соус'), DishRole.extra);
      expect(OrderAssistant.roleForItem('Курица в кисло-сладком соусе'),
          isNull);
      expect(OrderAssistant.roleForItem('Тортилья с курицей'), isNull);
      expect(OrderAssistant.roleForItem('Супер комбо'), DishRole.main);
      expect(OrderAssistant.roleForItem('Морс клюквенный'), DishRole.drink);
      expect(OrderAssistant.roleForItem('鞭炮笋 Морские водоросли'), isNull);
      expect(OrderAssistant.roleForItem('Салат Фантазия'), DishRole.salad);
      expect(OrderAssistant.roleForItem('Watermelon salad'), DishRole.salad);
      expect(OrderAssistant.roleForItem('Печень говяжья'), isNull);
      expect(OrderAssistant.roleForItem('Печенье овсяное'), DishRole.dessert);
    });

    test('по названию категории', () {
      expect(OrderAssistant.roleForCategory('Горячие напитки'), DishRole.drink);
      expect(OrderAssistant.roleForCategory('Горячие блюда'), DishRole.main);
      expect(OrderAssistant.roleForCategory('Сладкое'), DishRole.dessert);
      expect(OrderAssistant.roleForCategory('Сусындар'), DishRole.drink);
      expect(OrderAssistant.roleForCategory('Ыстық тағамдар'), DishRole.main);
      expect(OrderAssistant.roleForCategory('Хиты'), isNull);
    });

    test('незнакомые напитки — по словарю, объёму и соседям по категории',
        () {
      final assistant = OrderAssistant(_coffeeMenu());
      for (final id in [4, 5, 11, 20]) {
        expect(_dish(assistant, id).role, DishRole.drink, reason: 'id=$id');
        expect(_dish(assistant, id).drinkKind, DrinkKind.coffee,
            reason: 'id=$id');
      }
      expect(_dish(assistant, 11).isHotDrink, isFalse, reason: 'бамбл');
      expect(_dish(assistant, 12).isHotDrink, isFalse, reason: 'тоник');
      expect(_dish(assistant, 20).isHotDrink, isFalse, reason: 'колд брю');
      expect(_dish(assistant, 14).role, DishRole.drink, reason: 'по соседям');
      expect(_dish(assistant, 40).role, DishRole.drink, reason: 'по объёму');
      expect(_dish(assistant, 15).role, DishRole.other, reason: 'есть вес');
    });

    test('нераспознанное подписано категорией, а не «Хитами»', () {
      final sunset = _item(1, 'Сансет', 1600);
      final assistant = OrderAssistant(QrMenuModel(data: [
        _category('Хиты', [sunset]),
        _category('Сезонное', [sunset]),
      ]));
      expect(_dish(assistant, 1).role, DishRole.other);
      expect(_dish(assistant, 1).category, 'Сезонное');
      expect(_dish(OrderAssistant(_coffeeMenu()), 15).category, 'Авторские');
    });

    test('гарнир с мясом — это основное', () {
      final assistant = OrderAssistant(_chineseMenu());
      expect(_dish(assistant, 11).role, DishRole.main);
      expect(_dish(assistant, 10).role, DishRole.side);
    });
  });

  group('числа из названий и характеристик', () {
    test('объём, вес, штуки, диаметр, персоны, калории', () {
      expect(DishProfiler.parseFacts('Кола 0,5 л').ml, 500);
      expect(DishProfiler.parseFacts('Кола 1л').ml, 1000);
      expect(DishProfiler.parseFacts('Сок 500 мл').ml, 500);
      expect(DishProfiler.parseFacts('Вода Tassay 0,25 с/г', drink: true).ml,
          250);
      expect(DishProfiler.parseFacts('Стейк 300 г').grams, 300);
      expect(DishProfiler.parseFacts('Бешбармак 1,2 кг').grams, 1200);
      expect(DishProfiler.parseFacts('Сет Филадельфия 32 шт').pieces, 32);
      expect(DishProfiler.parseFacts('Пицца Маргарита 40 см').cm, 40);
      expect(DishProfiler.parseFacts('Сет на 4 персоны').persons, 4);
      expect(DishProfiler.parseFacts('Плато на компанию').persons, 4);
      expect(DishProfiler.parseFacts('Боул, 520 ккал').kcal, 520);
    });

    test('не путает единицы со словами', () {
      expect(DishProfiler.parseFacts('Сыр выдержки 5 лет').ml, isNull);
      expect(DishProfiler.parseFacts('Ужин для 2 гостей').grams, isNull);
    });

    test('характеристики без единиц — по названию характеристики', () {
      final facts = DishProfiler.parseFacts('Стейк', characteristics: [
        Characteristic(name: 'Вес', textValue: '350'),
        Characteristic(name: 'Объём, л', textValue: '0,5'),
        Characteristic(name: 'Калорийность', textValue: '420 ккал'),
      ]);
      expect(facts.grams, 350);
      expect(facts.ml, 500);
      expect(facts.kcal, 420);
    });

    test('порции: пицца 40 см, литр колы, сет 32 шт, целый торт', () {
      final assistant = OrderAssistant(QrMenuModel(data: [
        _category('Пицца', [_item(1, 'Пицца Маргарита 40 см', 4000)]),
        _category('Роллы', [_item(2, 'Сет Филадельфия 32 шт', 9000)]),
        _category('Напитки', [_item(3, 'Кола 1 л', 1000)]),
        _category('Десерты', [_item(4, 'Торт Наполеон целый 1,5 кг', 9000)]),
      ]));
      expect(_dish(assistant, 1).servings, 3);
      expect(_dish(assistant, 2).servings, 4);
      expect(_dish(assistant, 3).servings, 3);
      expect(_dish(assistant, 4).servings, 10);
    });
  });

  group('признаки блюд', () {
    late OrderAssistant burgers;
    late OrderAssistant chinese;
    setUp(() {
      burgers = OrderAssistant(_burgerMenu());
      chinese = OrderAssistant(_chineseMenu());
    });

    test('острое — по словам и по иероглифу 辣', () {
      expect(_dish(burgers, 4).isSpicy, isTrue);
      expect(_dish(burgers, 1).isSpicy, isFalse);
      expect(_dish(chinese, 1).isSpicy, isTrue);
    });

    test('мясо и вегетарианское', () {
      expect(_dish(burgers, 5).isVegetarian, isTrue);
      expect(_dish(burgers, 21).isVegetarian, isTrue);
      expect(_dish(burgers, 20).hasMeat, isTrue, reason: 'Цезарь с курицей');
      expect(_dish(burgers, 1).hasMeat, isTrue, reason: 'бургер — мясной');
      expect(_dish(chinese, 5).isVegetarian, isTrue, reason: '素 — постное');
      expect(_dish(chinese, 6).hasMeat, isTrue);
    });

    test('напитки: вид и температура', () {
      expect(_dish(burgers, 32).drinkKind, DrinkKind.coffee);
      expect(_dish(burgers, 32).isHotDrink, isTrue);
      expect(_dish(burgers, 30).drinkKind, DrinkKind.soda);
      expect(_dish(burgers, 30).isHotDrink, isFalse);
      expect(_dish(chinese, 20).drinkKind, DrinkKind.tea);
      expect(_dish(chinese, 20).isHotDrink, isTrue);
      expect(_dish(chinese, 22).isHotDrink, isFalse,
          reason: 'бутилированный «напиток» — холодный');
      expect(_dish(chinese, 23).facts.ml, 250);
    });

    test('кухни', () {
      expect(_dish(burgers, 1).cuisines, contains(Cuisine.fastFood));
      expect(_dish(burgers, 10).cuisines, contains(Cuisine.fastFood));
      expect(_dish(chinese, 4).cuisines, contains(Cuisine.asian));
    });
  });

  group('что может попасть в подборку', () {
    test('без алкоголя, соусов, бесплатного, служебного и требующего выбора',
        () {
      final assistant = OrderAssistant(_burgerMenu());
      for (final mood in AssistantMood.values) {
        for (var seed = 0; seed < 15; seed++) {
          final set = assistant.pick(
            AssistantRequest(mood: mood, guests: 3, now: _lunch),
            seed: seed,
          );
          final ids = {for (final l in set.lines) l.item.id};
          expect(ids.intersection({50, 60, 70, 71, 73}), isEmpty,
              reason: '$mood seed=$seed');
        }
      }
    });

    test('обязательный модификатор берётся из умолчания', () {
      final hits = _burgerMenu().data!.last.items!;
      final ready = OrderAssistant.readyToAdd(hits[2])!;
      expect(ready.modifiers!.single.items!.map((i) => i.id), [721]);
      expect(OrderAssistant.readyToAdd(hits[1]), isNull);
    });
  });

  group('первый вопрос', () {
    test('в кафе — про еду, только то, что есть в меню', () {
      expect(OrderAssistant(_burgerMenu()).moods, [
        AssistantMood.hearty,
        AssistantMood.light,
        AssistantMood.sweet,
        AssistantMood.drinks,
        AssistantMood.surprise,
      ]);
      expect(OrderAssistant(_chineseMenu()).moods, [
        AssistantMood.hearty,
        AssistantMood.drinks,
        AssistantMood.surprise,
      ]);
    });

    test('в кофейне — про напитки', () {
      expect(OrderAssistant(_coffeeMenu()).moods, [
        AssistantMood.coffee,
        AssistantMood.tea,
        AssistantMood.cold,
        AssistantMood.noCoffee,
        AssistantMood.surprise,
      ]);
    });

    test('кофейня с едой — лишнее убирается, чтобы кнопки поместились', () {
      final assistant = OrderAssistant(_coffeeMenu(extra: [
        _category('Десерты', [
          _item(50, 'Чизкейк', 1600),
          _item(51, 'Брауни', 1200),
          _item(52, 'Круассан', 900),
        ]),
        _category('Сэндвичи', [
          _item(60, 'Сэндвич с курицей', 2200),
          _item(61, 'Сэндвич с тунцом', 2400),
        ]),
      ]));
      expect(assistant.moods, [
        AssistantMood.coffee,
        AssistantMood.tea,
        AssistantMood.cold,
        AssistantMood.sweet,
        AssistantMood.hearty,
        AssistantMood.surprise,
      ]);
    });

    test('одни кофе — делит по температуре', () {
      final assistant = OrderAssistant(QrMenuModel(data: [
        _category('Кофе', [
          _item(1, 'Эспрессо', 700),
          _item(2, 'Капучино', 1200),
          _item(3, 'Латте', 1300),
          _item(4, 'Айс латте', 1400),
          _item(5, 'Колд брю', 1400),
        ]),
      ]));
      expect(assistant.moods, [
        AssistantMood.hot,
        AssistantMood.cold,
        AssistantMood.surprise,
      ]);
    });

    test('выбирать не из чего — вопрос не задаётся', () {
      final juices = OrderAssistant(QrMenuModel(data: [
        _category('Фреши', [
          _item(1, 'Сок апельсиновый', 1500),
          _item(2, 'Сок яблочный', 1300),
          _item(3, 'Морс клюквенный', 900),
        ]),
      ]));
      expect(juices.moods, [AssistantMood.surprise]);
      expect(juices.defaultMood, AssistantMood.drinks);

      final pizzas = OrderAssistant(QrMenuModel(data: [
        _category('Пицца', [
          _item(1, 'Маргарита', 2500),
          _item(2, 'Пепперони', 2900),
          _item(3, 'Четыре сыра', 3100),
        ]),
      ]));
      expect(pizzas.moods, [AssistantMood.surprise]);
      expect(pizzas.defaultMood, AssistantMood.hearty);
    });

    test('напитки — только выбранного вида, и замена тоже', () {
      final assistant = OrderAssistant(_coffeeMenu());
      final fits = <AssistantMood, bool Function(DishProfile)>{
        AssistantMood.coffee: (d) => d.drinkKind == DrinkKind.coffee,
        AssistantMood.tea: (d) => d.drinkKind == DrinkKind.tea,
        AssistantMood.cold: (d) => d.isHotDrink == false,
        AssistantMood.noCoffee: (d) =>
            d.role == DishRole.drink && d.drinkKind != DrinkKind.coffee,
      };
      fits.forEach((mood, fit) {
        for (var seed = 0; seed < 15; seed++) {
          final set = assistant.pick(
            AssistantRequest(mood: mood, guests: 2, now: _lunch),
            seed: seed,
          );
          expect(set.lines, isNotEmpty, reason: '$mood seed=$seed');
          for (var i = 0; i < set.lines.length; i++) {
            expect(fit(set.lines[i].dish), isTrue,
                reason: '$mood seed=$seed ${set.lines[i].item.name}');
            final swapped = assistant.alternativeFor(set, i, seed: seed);
            if (swapped == null) continue;
            expect(fit(swapped.dish), isTrue,
                reason: '$mood seed=$seed замена ${swapped.item.name}');
          }
        }
      });
    });
  });

  group('пожелания', () {
    test('предлагаются только те, что есть в меню', () {
      final burgers = OrderAssistant(_burgerMenu());
      expect(burgers.preferencesFor(AssistantMood.hearty), [
        AssistantPreference.spicy,
        AssistantPreference.mild,
        AssistantPreference.noMeat,
        AssistantPreference.none,
      ]);
      expect(burgers.preferencesFor(AssistantMood.sweet), isEmpty);

      final plain = OrderAssistant(QrMenuModel(data: [
        _category('Бургеры', [
          _item(1, 'Чизбургер', 2500),
          _item(2, 'Чикен бургер', 2200),
        ]),
      ]));
      expect(plain.preferencesFor(AssistantMood.hearty), isEmpty);
    });

    test('запреты соблюдаются на каждом варианте', () {
      for (final assistant in [
        OrderAssistant(_burgerMenu()),
        OrderAssistant(_chineseMenu()),
      ]) {
        for (var seed = 0; seed < 30; seed++) {
          AssistantSet pick(AssistantPreference p) => assistant.pick(
                AssistantRequest(
                  mood: AssistantMood.hearty,
                  guests: 2,
                  preference: p,
                  now: _lunch,
                ),
                seed: seed,
              );
          expect(
            pick(AssistantPreference.mild).lines.any((l) => l.dish.isSpicy),
            isFalse,
          );
          expect(
            pick(AssistantPreference.noMeat).lines.any(
                  (l) => l.dish.hasMeat || l.dish.hasFish,
                ),
            isFalse,
          );
        }
      }
    });

    test('«Поострее» — острое основное почти всегда', () {
      final assistant = OrderAssistant(_burgerMenu());
      final share = _share(
        assistant,
        AssistantRequest(
          mood: AssistantMood.hearty,
          preference: AssistantPreference.spicy,
          now: _lunch,
        ),
        (set) => set.lines.any(
          (l) => l.course == AssistantCourse.main && l.dish.isSpicy,
        ),
      );
      expect(share, greaterThan(0.9));
    });
  });

  group('сочетания', () {
    test('к бургеру — газировка или лимонад, а не латте', () {
      final assistant = OrderAssistant(_burgerMenu());
      final share = _share(
        assistant,
        AssistantRequest(mood: AssistantMood.hearty, now: _lunch),
        (set) => set.lines.any((l) =>
            l.dish.drinkKind == DrinkKind.soda ||
            l.dish.drinkKind == DrinkKind.lemonade),
      );
      expect(share, greaterThan(0.75));
    });

    test('к бургеру — картофель фри чаще, чем салат', () {
      final assistant = OrderAssistant(_burgerMenu());
      final request = AssistantRequest(mood: AssistantMood.hearty, now: _lunch);
      final fries = _share(
        assistant,
        request,
        (set) => set.lines.any((l) => l.item.id == 10),
      );
      final greek = _share(
        assistant,
        request,
        (set) => set.lines.any((l) => l.item.id == 21),
      );
      expect(fries, greaterThan(greek));
    });

    test('к азиатской кухне — чай', () {
      final assistant = OrderAssistant(_chineseMenu());
      final share = _share(
        assistant,
        AssistantRequest(mood: AssistantMood.hearty, now: _lunch),
        (set) => set.lines.any((l) => l.dish.drinkKind == DrinkKind.tea),
      );
      expect(share, greaterThan(0.6));
    });

    test('к десерту — кофе или чай', () {
      final assistant = OrderAssistant(_burgerMenu());
      final share = _share(
        assistant,
        AssistantRequest(mood: AssistantMood.sweet, now: _lunch),
        (set) => set.lines.any((l) =>
            l.dish.drinkKind == DrinkKind.coffee ||
            l.dish.drinkKind == DrinkKind.tea),
      );
      expect(share, greaterThan(0.75));
    });
  });

  group('время и сезон', () {
    test('утром кофе чаще, чем ночью', () {
      final assistant = OrderAssistant(_burgerMenu());
      bool coffee(AssistantSet set) =>
          set.lines.any((l) => l.dish.drinkKind == DrinkKind.coffee);
      final morning = _share(
        assistant,
        AssistantRequest(mood: AssistantMood.sweet, now: _morning),
        coffee,
      );
      final night = _share(
        assistant,
        AssistantRequest(mood: AssistantMood.sweet, now: _night),
        coffee,
      );
      expect(morning, greaterThan(night));
    });

    test('завтраки — утром, бизнес-ланч — только днём', () {
      final assistant = OrderAssistant(QrMenuModel(data: [
        _category('Завтраки', [
          _item(1, 'Сырники со сметаной', 1800),
          _item(2, 'Омлет с сыром', 1600),
        ]),
        _category('Горячее', [
          _item(3, 'Плов', 2200),
          _item(4, 'Лагман', 2100),
          _item(5, 'Бизнес-ланч', 2000),
        ]),
      ]));
      bool breakfast(AssistantSet set) =>
          set.lines.any((l) => l.dish.isBreakfast);
      expect(
        _share(
          assistant,
          AssistantRequest(mood: AssistantMood.hearty, now: _morning),
          breakfast,
        ),
        greaterThan(_share(
          assistant,
          AssistantRequest(mood: AssistantMood.hearty, now: _evening),
          breakfast,
        )),
      );
      expect(
        _share(
          assistant,
          AssistantRequest(mood: AssistantMood.hearty, now: _night),
          (set) => set.lines.any((l) => l.item.id == 5),
        ),
        0,
      );
    });

    test('зимой горячие напитки чаще, чем летом', () {
      final assistant = OrderAssistant(_chineseMenu());
      bool hot(AssistantSet set) =>
          set.lines.any((l) => l.dish.isHotDrink == true);
      final winter = _share(
        assistant,
        AssistantRequest(mood: AssistantMood.hearty, now: _winter),
        hot,
      );
      final summer = _share(
        assistant,
        AssistantRequest(mood: AssistantMood.hearty, now: _summer),
        hot,
      );
      expect(winter, greaterThan(summer));
    });
  });

  group('порции и компания', () {
    test('всех гостей закрывают основным и напитками', () {
      final assistant = OrderAssistant(_burgerMenu());
      for (var seed = 0; seed < 20; seed++) {
        final set = assistant.pick(
          AssistantRequest(mood: AssistantMood.hearty, guests: 4, now: _lunch),
          seed: seed,
        );
        expect(_coverage(set, AssistantCourse.main), greaterThanOrEqualTo(4));
        final drinks = _coverage(set, AssistantCourse.drink);
        expect(drinks == 0 || drinks >= 4, isTrue, reason: 'seed=$seed');
      }
    });

    test('одна большая пицца на троих, а не три', () {
      final assistant = OrderAssistant(QrMenuModel(data: [
        _category('Пицца', [
          _item(1, 'Пицца Маргарита 40 см', 4200),
          _item(2, 'Пицца Пепперони 40 см', 4500),
        ]),
      ]));
      final set = assistant.pick(
        AssistantRequest(mood: AssistantMood.hearty, guests: 3, now: _lunch),
      );
      final pizzas = set.lines.fold(0, (sum, l) => sum + l.count);
      expect(pizzas, 1);
      expect(set.lines.single.reason, AssistantReason.shared);
    });

    test('одному гостю — не литровая бутылка', () {
      final assistant = OrderAssistant(_burgerMenu());
      final share = _share(
        assistant,
        AssistantRequest(mood: AssistantMood.hearty, now: _lunch),
        (set) => set.lines.every((l) => l.item.id != 31),
      );
      expect(share, greaterThan(0.85));
    });

    test('двоим — разные основные блюда одного уровня цен', () {
      final assistant = OrderAssistant(_burgerMenu());
      final request =
          AssistantRequest(mood: AssistantMood.hearty, guests: 2, now: _lunch);
      final distinct = _share(assistant, request, (set) {
        final mains = set.lines.where((l) => l.course == AssistantCourse.main);
        return mains.length == 2;
      });
      expect(distinct, greaterThan(0.85));

      final fair = _share(assistant, request, (set) {
        final prices = [
          for (final l in set.lines)
            if (l.course == AssistantCourse.main) l.unitPrice,
        ]..sort();
        return prices.length < 2 || prices.last / prices.first <= 1.7;
      });
      expect(fair, greaterThan(0.85));
    });

    test('гарниры на компанию не повторяются', () {
      final assistant = OrderAssistant(_burgerMenu());
      final share = _share(
        assistant,
        AssistantRequest(mood: AssistantMood.hearty, guests: 4, now: _lunch),
        (set) => set.lines
            .where((l) => l.course == AssistantCourse.side)
            .every((l) => l.count == 1),
      );
      expect(share, greaterThan(0.9));
    });
  });

  group('бюджет', () {
    test('укладывается, когда это возможно', () {
      final assistant = OrderAssistant(_burgerMenu());
      for (var seed = 0; seed < 30; seed++) {
        final set = assistant.pick(
          AssistantRequest(
            mood: AssistantMood.hearty,
            guests: 2,
            budget: 6000,
            now: _lunch,
          ),
          seed: seed,
        );
        expect(set.total, lessThanOrEqualTo(6000), reason: 'seed=$seed');
        expect(set.lines.any((l) => l.course == AssistantCourse.main), isTrue);
      }
    });

    test('слишком маленький бюджет — ближайший вариант, а не пустота', () {
      final assistant = OrderAssistant(_burgerMenu());
      final set = assistant.pick(
        AssistantRequest(
          mood: AssistantMood.hearty,
          guests: 2,
          budget: 1000,
          now: _lunch,
        ),
      );
      expect(set.isEmpty, isFalse);
      expect(set.overBudget, isTrue);
    });

    test('варианты бюджета: эконом < комфорт, оба реально собираются', () {
      final assistant = OrderAssistant(_burgerMenu());
      final presets =
          assistant.budgetPresets(AssistantMood.hearty, 2, now: _lunch);
      expect(presets, hasLength(2));
      expect(presets.first, lessThan(presets.last));
      for (final budget in presets) {
        final set = assistant.pick(AssistantRequest(
          mood: AssistantMood.hearty,
          guests: 2,
          budget: budget,
          now: _lunch,
        ));
        expect(set.overBudget, isFalse, reason: 'budget=$budget');
      }
    });
  });

  group('разнообразие', () {
    test('«Другой вариант» предлагает новое', () {
      final assistant = OrderAssistant(_burgerMenu());
      final request =
          AssistantRequest(mood: AssistantMood.hearty, guests: 2, now: _lunch);
      final first = assistant.pick(request, seed: 1);
      final shown = {for (final l in first.lines) l.dish.id: 1};
      final second = assistant.pick(request.withShown(shown), seed: 2);
      final firstIds = {for (final l in first.lines) l.dish.id};
      final secondIds = {for (final l in second.lines) l.dish.id};
      expect(secondIds.difference(firstIds), isNotEmpty);
    });

    test('то, что уже в корзине, предлагается реже', () {
      final assistant = OrderAssistant(_burgerMenu());
      bool hasHit(AssistantSet set) => set.lines.any((l) => l.item.id == 2);
      final usual = _share(
        assistant,
        AssistantRequest(mood: AssistantMood.hearty, now: _lunch),
        hasHit,
      );
      final inBasket = _share(
        assistant,
        AssistantRequest(mood: AssistantMood.hearty, now: _lunch, inBasket: {2}),
        hasHit,
      );
      expect(inBasket, lessThan(usual));
    });

    test('одинаковый seed — одинаковая подборка', () {
      final assistant = OrderAssistant(_burgerMenu());
      final request = AssistantRequest(mood: AssistantMood.surprise, now: _lunch);
      final a = assistant.pick(request, seed: 7);
      final b = assistant.pick(request, seed: 7);
      expect(
        [for (final l in a.lines) l.item.id],
        [for (final l in b.lines) l.item.id],
      );
    });
  });

  group('замена', () {
    test('та же часть заказа, с учётом пожеланий', () {
      final assistant = OrderAssistant(_burgerMenu());
      final set = assistant.pick(AssistantRequest(
        mood: AssistantMood.hearty,
        guests: 2,
        preference: AssistantPreference.mild,
        now: _lunch,
      ));
      for (var i = 0; i < set.lines.length; i++) {
        if (!assistant.hasAlternative(set, i)) continue;
        final swapped = assistant.alternativeFor(set, i, seed: 3)!;
        expect(swapped.course, set.lines[i].course);
        expect(swapped.item.id, isNot(set.lines[i].item.id));
        expect(swapped.dish.isSpicy, isFalse);
      }
    });
  });

  group('пояснения', () {
    test('шаги анализа отражают запрос', () {
      final assistant = OrderAssistant(_burgerMenu());
      final set = assistant.pick(AssistantRequest(
        mood: AssistantMood.hearty,
        guests: 3,
        budget: 20000,
        preference: AssistantPreference.noMeat,
        now: _winter,
      ));
      final kinds = set.notes.map((n) => n.kind).toList();
      expect(kinds.first, AssistantNoteKind.menu);
      expect(kinds, contains(AssistantNoteKind.time));
      expect(kinds, contains(AssistantNoteKind.preference));
      expect(kinds, contains(AssistantNoteKind.portions));
      expect(kinds, contains(AssistantNoteKind.budget));
      expect(set.time, AssistantTime.day);
      expect(set.perPerson, (set.total / 3).round());
    });
  });

  group('крайние случаи', () {
    test('пустое меню', () {
      final empty = OrderAssistant(QrMenuModel(data: []));
      expect(empty.isAvailable, isFalse);
      expect(
        empty.pick(const AssistantRequest(mood: AssistantMood.hearty)).isEmpty,
        isTrue,
      );
      expect(empty.budgetPresets(AssistantMood.hearty, 2), isEmpty);
    });

    test('кофейня без основного: «сытно» всё равно что-то предлагает', () {
      final assistant = OrderAssistant(QrMenuModel(data: [
        _category('Кофе', [_item(1, 'Капучино', 1200), _item(2, 'Латте', 1300)]),
        _category('Десерты', [_item(3, 'Чизкейк', 1600)]),
      ]));
      final set = assistant.pick(
        AssistantRequest(mood: AssistantMood.hearty, now: _lunch),
      );
      expect(set.isEmpty, isFalse);
    });

    test('большое меню считается быстро', () {
      final roles = ['Бургеры', 'Салаты', 'Супы', 'Напитки', 'Десерты', 'Закуски'];
      final menu = QrMenuModel(data: [
        for (var c = 0; c < roles.length; c++)
          _category(roles[c], [
            for (var i = 0; i < 50; i++)
              _item(c * 1000 + i, '${roles[c]} позиция $i', 800 + i * 70),
          ]),
      ]);
      final assistant = OrderAssistant(menu);
      final watch = Stopwatch()..start();
      assistant.pick(
        AssistantRequest(mood: AssistantMood.surprise, guests: 4, now: _lunch),
      );
      assistant.budgetPresets(AssistantMood.hearty, 4, now: _lunch);
      watch.stop();
      expect(watch.elapsedMilliseconds, lessThan(1500));
    });
  });
}
