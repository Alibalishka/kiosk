import 'dart:math' as math;

import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/service/alcohol_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/assistant_lexicon.dart';
import 'package:qr_pay_app/src/features/home/vm/service/per_guest_modifiers.dart';

/// Роль блюда в заказе. Сервер её не присылает, поэтому выводим из названий
/// категории и самого блюда. [extra] — соусы, хлеб, упаковка: в подборку
/// не попадают.
enum DishRole { main, soup, salad, starter, side, drink, dessert, extra, other }

enum Cuisine { fastFood, italian, japanese, asian, kazakh, grill, breakfast }

enum DrinkKind {
  coffee,
  tea,
  cocoa,
  soda,
  juice,
  lemonade,
  water,
  dairy,
  shake,
  other,
}

/// Числа из названия, описания и характеристик: «300 г», «0,5 л»,
/// «32 шт», «30 см», «на 2 персоны».
class DishFacts {
  const DishFacts({
    this.grams,
    this.ml,
    this.kcal,
    this.pieces,
    this.cm,
    this.persons,
  });

  final int? grams;
  final int? ml;
  final int? kcal;
  final int? pieces;
  final int? cm;
  final double? persons;

  /// Характеристики точнее текста: их значения перекрывают найденное в
  /// названии.
  DishFacts overriddenBy(DishFacts other) => DishFacts(
        grams: other.grams ?? grams,
        ml: other.ml ?? ml,
        kcal: other.kcal ?? kcal,
        pieces: other.pieces ?? pieces,
        cm: other.cm ?? cm,
        persons: other.persons ?? persons,
      );
}

/// Всё, что помощник понял о блюде.
class DishProfile {
  const DishProfile({
    required this.item,
    required this.role,
    required this.category,
    required this.unitPrice,
    required this.pricePercentile,
    required this.isHit,
    required this.isPopular,
    required this.isNew,
    required this.isSignature,
    required this.hasImage,
    required this.hasDescription,
    required this.isSpicy,
    required this.hasMeat,
    required this.hasFish,
    required this.isVegetarian,
    required this.isBreakfast,
    required this.isLunchOffer,
    required this.isIceCream,
    required this.isColdDish,
    required this.cuisines,
    required this.drinkKind,
    required this.isHotDrink,
    required this.facts,
    required this.servings,
    required this.satiety,
    required this.lightness,
    required this.keyTokens,
  });

  /// Блюдо с модификаторами по умолчанию — кладётся в корзину как есть.
  final Items item;
  final DishRole role;

  /// Категория меню, где лежит блюдо: «Авторские», «Классика». Подпись на
  /// карточке, когда роль не узнали, — название заведения не соврёт.
  final String? category;

  /// Цена вместе с модификаторами по умолчанию.
  final int unitPrice;

  /// Место цены среди блюд той же роли: 0 — самое дешёвое, 1 — самое
  /// дорогое.
  final double pricePercentile;

  /// Есть в рекомендациях заведения.
  final bool isHit;

  /// Лежит в категории вроде «Хиты» или «Выбор шефа».
  final bool isPopular;
  final bool isNew;

  /// «Фирменный», «авторский», «домашний».
  final bool isSignature;
  final bool hasImage;
  final bool hasDescription;

  final bool isSpicy;

  /// Мясо или блюдо, которое обычно с мясом (бургер, плов, суши).
  final bool hasMeat;
  final bool hasFish;
  final bool isVegetarian;

  final bool isBreakfast;

  /// Бизнес-ланч, комплексный обед — обычно только днём.
  final bool isLunchOffer;
  final bool isIceCream;

  /// Холодный суп: окрошка, гаспачо.
  final bool isColdDish;

  final Set<Cuisine> cuisines;

  /// Только у напитков.
  final DrinkKind? drinkKind;

  /// Только у напитков: горячий (кофе, чай) или холодный.
  final bool? isHotDrink;

  final DishFacts facts;

  /// Скольких человек кормит одна позиция: пицца 40 см — троих, бутылка
  /// 1 л — троих, сет на 32 штуки — четверых.
  final double servings;

  /// Насколько сытная одна порция: ~1 — обычное основное блюдо.
  final double satiety;

  /// 0..1: салаты, супы, боулы — лёгкие; двойной бургер — нет.
  final double lightness;

  /// Значимые слова названия — для поиска похожих блюд.
  final Set<String> keyTokens;

  int get id => item.id ?? 0;
  bool get isFood => role != DishRole.drink;

  /// Насколько блюда похожи по названию: «Чизбургер» и «Двойной
  /// чизбургер» — 1, «Кола» и «Латте» — 0.
  double similarity(DishProfile other) {
    if (keyTokens.isEmpty || other.keyTokens.isEmpty) return 0;
    final common = keyTokens.where(other.keyTokens.contains).length;
    return common / math.min(keyTokens.length, other.keyTokens.length);
  }
}

/// Разбирает меню в [DishProfile].
abstract final class DishProfiler {
  static final RegExp _hanzi = RegExp(r'[\u4e00-\u9fff]');

  // Регулярки без `unicode: true` и `\p{L}`: с ними разбор меню был в
  // десятки раз медленнее. Текст к этому моменту уже в нижнем регистре,
  // поэтому буквы перечислены явно — латиница, кириллица и казахские.
  static const String _letters = 'a-zа-яёәғқңөұүһі';
  static const String _numberPattern = r'(\d+(?:[.,]\d+)?)';

  static final RegExp _mlRe =
      RegExp('$_numberPattern\\s*(?:мл|ml)(?![$_letters])');
  static final RegExp _litersRe = RegExp(
    '$_numberPattern\\s*(?:л|l|литр[$_letters]*|liter[$_letters]*|litre[$_letters]*)'
    '(?![$_letters])',
  );
  static final RegExp _kgRe =
      RegExp('$_numberPattern\\s*(?:кг|kg)(?![$_letters])');
  static final RegExp _gramsRe = RegExp(
    '$_numberPattern\\s*(?:г|гр|грамм[$_letters]*|g|gr)(?![$_letters])',
  );
  static final RegExp _kcalRe = RegExp(
    '(\\d+)\\s*(?:ккал|kcal|кал|калори[$_letters]*)(?![$_letters])',
  );
  static final RegExp _piecesRe = RegExp(
    '(\\d+)\\s*(?:шт|pcs|pc|штук[$_letters]*|кус[$_letters]*|дана)'
    '(?![$_letters])',
  );
  static final RegExp _cmRe = RegExp('(\\d+)\\s*(?:см|cm)(?![$_letters])');
  static final RegExp _personsRe = RegExp(
    '(\\d+)\\s*(?:персон[$_letters]*|перс|чел[$_letters]*|гост[$_letters]*|'
    'person[$_letters]*|people|pax|адам[$_letters]*)(?![$_letters])',
  );

  /// «Вода 0,25», «Кола 1,5» — литры без единиц, только у напитков.
  static final RegExp _bareLitersRe =
      RegExp(r'(?<![\d.,])([0-2][.,]\d{1,2})(?![\d.,])');

  static final RegExp _numberRe = RegExp(r'\d+(?:[.,]\d+)?');

  /// «с/б», «ж/б», «пл/б» — бутылка или банка.
  static final RegExp _bottleRe = RegExp('(?:^|[^$_letters])(?:с|c|ж|пл)/б');

  /// Типографские знаки вне ASCII, которые разделяют слова. Всё остальное
  /// не из ASCII — буквы любых алфавитов (кириллица, казахский, иероглифы).
  static const Set<int> _wideSeparators = {
    0x00A0,
    0x00A9,
    0x00AB,
    0x00AE,
    0x00B0,
    0x00B7,
    0x00BB,
    0x00D7,
    0x2013,
    0x2014,
    0x2018,
    0x2019,
    0x201C,
    0x201D,
    0x2022,
    0x2026,
    0x20B8,
    0x2116,
    0x2122,
    0x3000,
    0x3001,
    0x3002,
    0xFF08,
    0xFF09,
    0xFF0C,
  };

  static String normalize(String text) =>
      text.toLowerCase().replaceAll('ё', 'е');

  /// Разбивает на слова посимвольно: так в разы быстрее, чем по регулярке
  /// с Unicode-классами, а меню на киоске разбирается целиком.
  static List<String> tokenize(String normalized) {
    final tokens = <String>[];
    var start = -1;
    for (var i = 0; i < normalized.length; i++) {
      final unit = normalized.codeUnitAt(i);
      final isWord = unit < 128
          ? (unit >= 48 && unit <= 57) || (unit >= 97 && unit <= 122)
          : !_wideSeparators.contains(unit);
      if (isWord) {
        if (start < 0) start = i;
      } else if (start >= 0) {
        tokens.add(normalized.substring(start, i));
        start = -1;
      }
    }
    if (start >= 0) tokens.add(normalized.substring(start));
    return tokens;
  }

  // --------------------------------------------------------------------------
  // Роль
  // --------------------------------------------------------------------------

  /// Порядок важен: «Комбо с колой» — не напиток, «Суп-лапша» — суп, а не
  /// горячее, «Картофель фри» в категории «Бургеры» — гарнир.
  static const List<(DishRole, WordSet)> _itemRoles = [
    (DishRole.drink, AssistantLexicon.drink),
    (DishRole.dessert, AssistantLexicon.dessert),
    (DishRole.soup, AssistantLexicon.soup),
    (DishRole.salad, AssistantLexicon.salad),
    (DishRole.side, AssistantLexicon.side),
    (DishRole.starter, AssistantLexicon.starter),
    (DishRole.main, AssistantLexicon.main),
  ];

  static const List<(DishRole, WordSet)> _categoryRoles = [
    (DishRole.drink, AssistantLexicon.drink),
    (DishRole.dessert, AssistantLexicon.dessert),
    (DishRole.dessert, AssistantLexicon.categoryDessert),
    (DishRole.soup, AssistantLexicon.soup),
    (DishRole.salad, AssistantLexicon.salad),
    (DishRole.side, AssistantLexicon.side),
    (DishRole.starter, AssistantLexicon.starter),
    (DishRole.main, AssistantLexicon.main),
    (DishRole.main, AssistantLexicon.categoryMain),
  ];

  static DishRole? roleForItem(String? name) {
    if (name == null) return null;
    final tokens = tokenize(normalize(name));
    // Добавка — если о ней первые слова: «Сырный соус», но не «Курица в
    // кисло-сладком соусе».
    if (tokens.take(2).any(AssistantLexicon.extra.matches)) {
      return DishRole.extra;
    }
    if (AssistantLexicon.combo.any(tokens)) return DishRole.main;
    for (final (role, words) in _itemRoles) {
      if (words.any(tokens)) return role;
    }
    return null;
  }

  static DishRole? roleForCategory(String? name) {
    if (name == null) return null;
    final tokens = tokenize(normalize(name));
    if (AssistantLexicon.extra.any(tokens)) return DishRole.extra;
    if (AssistantLexicon.combo.any(tokens)) return DishRole.main;
    for (final (role, words) in _categoryRoles) {
      if (words.any(tokens)) return role;
    }
    return null;
  }

  static DishRole? _hanziRole(String raw) {
    if (raw.contains(AssistantLexicon.hanziSoup)) return DishRole.soup;
    if (raw.contains(AssistantLexicon.hanziTea)) return DishRole.drink;
    if (AssistantLexicon.hanziMainChars.split('').any(raw.contains)) {
      return DishRole.main;
    }
    return null;
  }

  // --------------------------------------------------------------------------
  // Модификаторы
  // --------------------------------------------------------------------------

  /// Копия блюда с модификаторами по умолчанию — так же, как их предвыбирает
  /// карточка товара (`defaultSelect`). null — без выбора гостя не обойтись:
  /// обязательная группа пуста, умолчания не проходят по min/max или добавку
  /// нужно взять на каждого гостя — по умолчанию там одна на всех.
  static Items? readyToAdd(Items item) {
    final groups = item.modifiers;
    if (groups == null || groups.isEmpty) return item;

    final selected = <Modifier>[];
    for (final group in groups) {
      if (PerGuestModifiers.matches(group)) return null;

      final picked = <Items>[];
      for (final option in group.items ?? const <Items>[]) {
        if (option.defaultSelect != true) continue;
        for (var i = 0; i < (option.count ?? 1); i++) {
          picked.add(option);
        }
      }

      final min = group.min ?? 0;
      final max = group.max;
      if (picked.length < min) return null;
      if (max != null && max > 0 && picked.length > max) return null;
      if (group.required == true && picked.isEmpty) return null;

      selected.add(Modifier(
        id: group.id,
        name: group.name,
        min: group.min,
        max: group.max,
        posId: group.posId,
        items: picked,
      ));
    }
    return item.copyWith(modifiers: selected);
  }

  /// Как в BasketService.getItemTotalPrice: цена блюда плюс выбранные опции.
  static int _priceWithModifiers(Items item) {
    var price = item.price ?? 0;
    for (final group in item.modifiers ?? const <Modifier>[]) {
      for (final option in group.items ?? const <Items>[]) {
        price += option.price ?? 0;
      }
    }
    return price;
  }

  // --------------------------------------------------------------------------
  // Числа
  // --------------------------------------------------------------------------

  static double? _number(String? raw) =>
      raw == null ? null : double.tryParse(raw.replaceAll(',', '.'));

  static DishFacts parseFacts(
    String text, {
    List<Characteristic>? characteristics,
    bool drink = false,
  }) {
    final normalized = normalize(text);
    final fromText = _parseText(normalized, drink: drink);
    var fromCharacteristics = const DishFacts();
    for (final c in characteristics ?? const <Characteristic>[]) {
      fromCharacteristics = fromCharacteristics.overriddenBy(
        _parseCharacteristic(c, drink: drink),
      );
    }
    return fromText.overriddenBy(fromCharacteristics);
  }

  static DishFacts _parseText(String text, {required bool drink}) {
    int? ml = _number(_mlRe.firstMatch(text)?[1])?.round();
    final liters = _number(_litersRe.firstMatch(text)?[1]);
    if (ml == null && liters != null) ml = (liters * 1000).round();
    if (ml == null && drink) {
      final bare = _number(_bareLitersRe.firstMatch(text)?[1]);
      if (bare != null && bare > 0) ml = (bare * 1000).round();
    }

    int? grams;
    final kg = _number(_kgRe.firstMatch(text)?[1]);
    if (kg != null) grams = (kg * 1000).round();
    grams ??= _number(_gramsRe.firstMatch(text)?[1])?.round();

    double? persons = _number(_personsRe.firstMatch(text)?[1]);
    if (persons == null) {
      final tokens = tokenize(text);
      for (final entry in AssistantLexicon.personsWords.entries) {
        if (tokens.any((t) => t.startsWith(entry.key))) {
          persons = entry.value;
          break;
        }
      }
      if (persons == null && text.contains('for two')) persons = 2;
    }

    return DishFacts(
      grams: grams,
      ml: ml,
      kcal: _number(_kcalRe.firstMatch(text)?[1])?.round(),
      pieces: _number(_piecesRe.firstMatch(text)?[1])?.round(),
      cm: _number(_cmRe.firstMatch(text)?[1])?.round(),
      persons: persons,
    );
  }

  /// «Вес: 350», «Объём, л: 0,5», «Калорийность: 420 ккал».
  static DishFacts _parseCharacteristic(Characteristic c,
      {required bool drink}) {
    final value = normalize(c.textValue ?? '');
    final label = normalize('${c.name ?? ''} ${c.description ?? ''}');
    final withUnits = _parseText('$value ', drink: drink);
    final number = _number(_numberRe.firstMatch(value)?[0]);
    if (number == null) return withUnits;

    final labelTokens = tokenize(label);
    bool has(List<String> stems) =>
        labelTokens.any((t) => stems.any(t.startsWith));

    if (has(const ['калор', 'ккал', 'kcal', 'energy', 'энерг'])) {
      return DishFacts(kcal: withUnits.kcal ?? number.round());
    }
    if (has(const ['объем', 'volume', 'көлем'])) {
      if (withUnits.ml != null) return DishFacts(ml: withUnits.ml);
      final inLiters = labelTokens.contains('л') || number <= 3;
      return DishFacts(ml: inLiters ? (number * 1000).round() : number.round());
    }
    if (has(const ['вес', 'выход', 'масс', 'weight', 'салмақ'])) {
      if (withUnits.grams != null) return DishFacts(grams: withUnits.grams);
      final inKg = labelTokens.contains('кг') || labelTokens.contains('kg');
      return DishFacts(grams: inKg ? (number * 1000).round() : number.round());
    }
    if (has(const ['порц', 'персон', 'serv', 'адам'])) {
      return DishFacts(persons: number);
    }
    if (has(const ['количеств', 'pieces', 'дана'])) {
      return DishFacts(pieces: number.round());
    }
    if (has(const ['диаметр', 'размер', 'size', 'өлшем'])) {
      return DishFacts(cm: withUnits.cm ?? number.round());
    }
    return withUnits;
  }

  // --------------------------------------------------------------------------
  // Меню целиком
  // --------------------------------------------------------------------------

  static List<DishProfile> profileMenu(
    QrMenuModel menu, {
    AlcoholService alcoholService = const AlcoholService(),
  }) {
    final categories = menu.data ?? const <QrMenuDatum>[];

    final hitIds = <int?>{
      for (final item in menu.effectiveRecommend) item.id,
      for (final item in menu.featured ?? const <Items>[]) item.id,
      for (final category in categories) ...[
        for (final item in category.recommend ?? const <Items>[]) item.id,
        for (final item in category.featured ?? const <Items>[]) item.id,
      ],
    }..remove(null);

    // Алкоголь отсекаем по категориям: признака у самого блюда нет.
    final alcoholIds = <int>{};
    for (final category in categories) {
      if (!alcoholService.isAlcoholCategoryName(category.name)) continue;
      for (final list in [
        category.items,
        category.recommend,
        category.featured
      ]) {
        for (final item in list ?? const <Items>[]) {
          if (item.id != null) alcoholIds.add(item.id!);
        }
      }
    }

    // Одно блюдо может лежать в нескольких категориях («Бургеры» и
    // «Хиты») — собираем все, чтобы не потерять ни роль, ни популярность.
    // Категории разбираются один раз, а не для каждого блюда.
    final items = <int, Items>{};
    final itemCategories = <int, List<_Category>>{};
    for (final category in categories) {
      if (alcoholService.isAlcoholCategoryName(category.name)) continue;
      final parsed = _Category.parse(category.name);
      for (final item in category.items ?? const <Items>[]) {
        final id = item.id;
        if (id == null) continue;
        items.putIfAbsent(id, () => item);
        (itemCategories[id] ??= []).add(parsed);
      }
    }

    // Роли — до разбора блюд: незнакомые названия узнаются по соседям, а
    // для этого нужны роли всего меню.
    final roles = <int, DishRole>{
      for (final MapEntry(key: id, value: item) in items.entries)
        if (_roleOf(item, itemCategories[id]!) case final role?) id: role,
    };
    _inferUnknownRoles(roles, items, itemCategories, alcoholIds);

    final drafts = <_Draft>[];
    for (final MapEntry(key: id, value: item) in items.entries) {
      final role = roles[id];
      if (role == null || role == DishRole.extra) continue;
      if (alcoholIds.contains(id) || (item.price ?? 0) <= 0) continue;
      final ready = readyToAdd(item);
      if (ready == null) continue;
      drafts.add(
        _draft(item, ready, itemCategories[id]!, hitIds.contains(id), role),
      );
    }

    final pricesByRole = <DishRole, List<int>>{};
    for (final draft in drafts) {
      (pricesByRole[draft.role] ??= []).add(draft.unitPrice);
    }
    for (final prices in pricesByRole.values) {
      prices.sort();
    }

    return [
      for (final draft in drafts)
        draft.finish(_percentile(pricesByRole[draft.role]!, draft.unitPrice)),
    ];
  }

  static double _percentile(List<int> sorted, int value) {
    if (sorted.length < 2) return 0.5;
    final first = sorted.indexOf(value);
    final last = sorted.lastIndexOf(value);
    return (first + last) / 2 / (sorted.length - 1);
  }

  /// Роль по названию блюда, затем по категории, затем по иероглифам.
  /// null — служебная позиция (сбор, доставка), а не блюдо.
  static DishRole? _roleOf(Items item, List<_Category> categories) {
    final rawName = item.name ?? '';
    if (AssistantLexicon.service.any(tokenize(normalize(rawName)))) {
      return null;
    }
    DishRole? categoryRole;
    for (final c in categories) {
      categoryRole = c.role;
      if (categoryRole != null) break;
    }
    return roleForItem(rawName) ??
        categoryRole ??
        _hanziRole(rawName) ??
        DishRole.other;
  }

  /// Сколько узнанных соседей по категории нужно, чтобы по ним судить.
  static const int _minNeighbours = 2;

  /// Позиции, которых нет в словаре («Бамбл», «Сансет»), узнаём косвенно.
  /// Объём в мл без веса — напиток. Иначе берём роль, которая у двух третей
  /// узнанных соседей по категории: в «Авторских», где кругом кофе,
  /// незнакомое название — тоже напиток. Узнанные так позиции сами не
  /// голосуют — вывод только из того, что понято наверняка.
  static void _inferUnknownRoles(
    Map<int, DishRole> roles,
    Map<int, Items> items,
    Map<int, List<_Category>> itemCategories,
    Set<int> alcoholIds,
  ) {
    final members = <_Category, List<int>>{};
    for (final MapEntry(key: id, value: categories) in itemCategories.entries) {
      for (final category in categories) {
        (members[category] ??= []).add(id);
      }
    }

    final inferred = <int, DishRole>{};
    for (final MapEntry(key: id, value: role) in roles.entries) {
      if (role != DishRole.other) continue;
      final item = items[id]!;
      final facts = parseFacts(
        '${item.name ?? ''} ${item.description ?? ''}',
        characteristics: item.characteristics,
      );
      if (facts.ml != null && facts.grams == null) {
        inferred[id] = DishRole.drink;
        continue;
      }

      final votes = <DishRole, int>{};
      final neighbours = {
        for (final category in itemCategories[id]!) ...members[category]!,
      }..remove(id);
      for (final neighbour in neighbours) {
        final vote = roles[neighbour];
        if (vote == null ||
            vote == DishRole.other ||
            vote == DishRole.extra ||
            alcoholIds.contains(neighbour)) {
          continue;
        }
        votes[vote] = (votes[vote] ?? 0) + 1;
      }
      final total = votes.values.fold(0, (sum, n) => sum + n);
      if (total < _minNeighbours) continue;
      final top = votes.entries.reduce((a, b) => b.value > a.value ? b : a);
      if (top.value * 3 < total * 2) continue;
      // Вес без объёма — еда, даже если вокруг одни напитки.
      if (top.key == DishRole.drink && facts.grams != null) continue;
      inferred[id] = top.key;
    }
    roles.addAll(inferred);
  }

  /// Подпись блюда — название его категории. «Хиты» и «Новинки» о самом
  /// блюде ничего не говорят: берём их, только если других категорий нет.
  static String? _categoryLabel(List<_Category> categories) {
    String? fallback;
    for (final c in categories) {
      final name = c.name?.trim();
      if (name == null || name.isEmpty) continue;
      if (!c.isPopular && !c.isNew) return name;
      fallback ??= name;
    }
    return fallback;
  }

  static _Draft _draft(
    Items item,
    Items ready,
    List<_Category> categories,
    bool isHit,
    DishRole baseRole,
  ) {
    final rawName = item.name ?? '';
    final rawText = '$rawName ${item.description ?? ''}';
    final name = normalize(rawName);
    final text = normalize(rawText);
    final nameTokens = tokenize(name);
    final tokens = tokenize(text);
    final flat = tokens.join(' ');

    final categoryTokens = [for (final c in categories) ...c.tokens];
    var role = baseRole;

    // Мясо и рыба.
    final isVegetarianMarked = AssistantLexicon.vegetarian.any(tokens) ||
        AssistantLexicon.vegetarianPhrases.any(flat.contains) ||
        rawText.contains(AssistantLexicon.hanziVegetarian);
    final explicitMeat = AssistantLexicon.meatProtein.any(tokens) ||
        AssistantLexicon.hanziMeatChars.split('').any(rawText.contains);
    final dishMeat = !isVegetarianMarked &&
        (AssistantLexicon.meatDish.any(tokens) ||
            flat.contains('том ям') ||
            flat.contains('tom yum'));
    final hasMeat = explicitMeat || dishMeat;
    final hasFish = AssistantLexicon.fish.any(tokens) ||
        AssistantLexicon.hanziFishChars.split('').any(rawText.contains);

    // «Рис с курицей», «Картофель с мясом» — это уже не гарнир.
    if (role == DishRole.side && (explicitMeat || hasFish)) {
      role = DishRole.main;
    }

    final isVegetarian = !hasMeat &&
        !hasFish &&
        (isVegetarianMarked ||
            const {
              DishRole.side,
              DishRole.salad,
              DishRole.starter,
              DishRole.dessert,
              DishRole.drink,
            }.contains(role));

    final isSpicy = (AssistantLexicon.spicy.any(tokens) ||
            rawText.contains(AssistantLexicon.hanziSpicy) ||
            rawText.contains('🌶')) &&
        !AssistantLexicon.mildPhrases.any(flat.contains);

    final allTokens = [...tokens, ...categoryTokens];
    final cuisines = <Cuisine>{
      if (AssistantLexicon.fastFood.any(allTokens)) Cuisine.fastFood,
      if (AssistantLexicon.italian.any(allTokens)) Cuisine.italian,
      if (AssistantLexicon.japanese.any(allTokens)) Cuisine.japanese,
      if (AssistantLexicon.asian.any(allTokens) ||
          flat.contains('кисло сладк') ||
          _hanzi.hasMatch(rawName))
        Cuisine.asian,
      if (AssistantLexicon.kazakh.any(allTokens)) Cuisine.kazakh,
      if (AssistantLexicon.grill.any(allTokens)) Cuisine.grill,
      if (AssistantLexicon.breakfast.any(allTokens)) Cuisine.breakfast,
    };

    DrinkKind? drinkKind;
    bool? isHotDrink;
    if (role == DishRole.drink) {
      drinkKind = _drinkKind(tokens, rawText);
      isHotDrink = _isHotDrink(drinkKind, tokens, text, rawText);
    }

    final facts = parseFacts(
      rawText,
      characteristics: item.characteristics,
      drink: role == DishRole.drink,
    );

    return _Draft(
      item: ready,
      role: role,
      category: _categoryLabel(categories),
      unitPrice: _priceWithModifiers(ready),
      isHit: isHit,
      isPopular: categories.any((c) => c.isPopular),
      isNew: AssistantLexicon.newItem.any(nameTokens) ||
          categories.any((c) => c.isNew),
      isSignature: AssistantLexicon.signature.any(allTokens),
      hasImage: item.image?.isNotEmpty ?? false,
      hasDescription: (item.description ?? '').trim().length > 10,
      isSpicy: isSpicy,
      hasMeat: hasMeat,
      hasFish: hasFish,
      isVegetarian: isVegetarian,
      isBreakfast: AssistantLexicon.breakfast.any(allTokens),
      isLunchOffer: AssistantLexicon.lunchOffer.any(nameTokens) ||
          AssistantLexicon.lunchOffer.any(categoryTokens),
      isIceCream:
          AssistantLexicon.iceCream.any(tokens) || flat.contains('ice cream'),
      isColdDish: AssistantLexicon.coldDish.any(tokens),
      isHearty: AssistantLexicon.hearty.any(tokens),
      isLight: AssistantLexicon.light.any(tokens),
      isPlatter: AssistantLexicon.platter.any(tokens),
      isSet: AssistantLexicon.combo.any(nameTokens),
      isPizza: nameTokens.any((t) => t.startsWith('пицц') || t == 'pizza'),
      cuisines: cuisines,
      drinkKind: drinkKind,
      isHotDrink: isHotDrink,
      facts: facts,
      keyTokens: {
        for (final t in nameTokens)
          if (t.length >= 3 &&
              !AssistantLexicon.stopWords.contains(t) &&
              double.tryParse(t) == null)
            t.length > 5 ? t.substring(0, 5) : t,
      },
    );
  }

  static const List<(DrinkKind, WordSet)> _drinkKinds = [
    (DrinkKind.shake, AssistantLexicon.shake),
    (DrinkKind.coffee, AssistantLexicon.coffee),
    (DrinkKind.cocoa, AssistantLexicon.cocoa),
    (DrinkKind.tea, AssistantLexicon.tea),
    (DrinkKind.dairy, AssistantLexicon.dairy),
    (DrinkKind.lemonade, AssistantLexicon.lemonade),
    (DrinkKind.juice, AssistantLexicon.juice),
    (DrinkKind.soda, AssistantLexicon.soda),
    (DrinkKind.water, AssistantLexicon.water),
  ];

  static DrinkKind _drinkKind(List<String> tokens, String raw) {
    for (final (kind, words) in _drinkKinds) {
      if (words.any(tokens)) return kind;
    }
    if (raw.contains(AssistantLexicon.hanziTea)) return DrinkKind.tea;
    return DrinkKind.other;
  }

  static bool _isHotDrink(
    DrinkKind kind,
    List<String> tokens,
    String normalized,
    String raw,
  ) {
    if (AssistantLexicon.hotDrink.any(tokens)) return true;
    final cold = AssistantLexicon.coldDrink.any(tokens) ||
        AssistantLexicon.bottle.any(tokens) ||
        _bottleRe.hasMatch(normalized) ||
        raw.contains(AssistantLexicon.hanziCold);
    if (cold) return false;
    return kind == DrinkKind.coffee ||
        kind == DrinkKind.tea ||
        kind == DrinkKind.cocoa;
  }
}

/// Категория меню, разобранная один раз на всё меню.
class _Category {
  const _Category({
    required this.name,
    required this.tokens,
    required this.role,
    required this.isPopular,
    required this.isNew,
  });

  factory _Category.parse(String? name) {
    final tokens = DishProfiler.tokenize(DishProfiler.normalize(name ?? ''));
    return _Category(
      name: name,
      tokens: tokens,
      role: DishProfiler.roleForCategory(name),
      isPopular: AssistantLexicon.popular.any(tokens),
      isNew: AssistantLexicon.newItem.any(tokens),
    );
  }

  final String? name;
  final List<String> tokens;
  final DishRole? role;

  /// «Хиты», «Популярное», «Выбор шефа».
  final bool isPopular;
  final bool isNew;
}

/// Блюдо до того, как стали известны цены соседей по роли.
class _Draft {
  _Draft({
    required this.item,
    required this.role,
    required this.category,
    required this.unitPrice,
    required this.isHit,
    required this.isPopular,
    required this.isNew,
    required this.isSignature,
    required this.hasImage,
    required this.hasDescription,
    required this.isSpicy,
    required this.hasMeat,
    required this.hasFish,
    required this.isVegetarian,
    required this.isBreakfast,
    required this.isLunchOffer,
    required this.isIceCream,
    required this.isColdDish,
    required this.isHearty,
    required this.isLight,
    required this.isPlatter,
    required this.isSet,
    required this.isPizza,
    required this.cuisines,
    required this.drinkKind,
    required this.isHotDrink,
    required this.facts,
    required this.keyTokens,
  });

  final Items item;
  final DishRole role;
  final String? category;
  final int unitPrice;
  final bool isHit;
  final bool isPopular;
  final bool isNew;
  final bool isSignature;
  final bool hasImage;
  final bool hasDescription;
  final bool isSpicy;
  final bool hasMeat;
  final bool hasFish;
  final bool isVegetarian;
  final bool isBreakfast;
  final bool isLunchOffer;
  final bool isIceCream;
  final bool isColdDish;
  final bool isHearty;
  final bool isLight;
  final bool isPlatter;
  final bool isSet;
  final bool isPizza;
  final Set<Cuisine> cuisines;
  final DrinkKind? drinkKind;
  final bool? isHotDrink;
  final DishFacts facts;
  final Set<String> keyTokens;

  static const _roleSatiety = {
    DishRole.main: 1.0,
    DishRole.other: 0.8,
    DishRole.soup: 0.6,
    DishRole.salad: 0.5,
    DishRole.starter: 0.45,
    DishRole.side: 0.4,
    DishRole.dessert: 0.35,
    DishRole.drink: 0.05,
    DishRole.extra: 0.0,
  };

  double get servings {
    final persons = facts.persons;
    if (persons != null) return persons.clamp(1, 12).toDouble();

    if (role == DishRole.drink) {
      final ml = facts.ml;
      if (ml == null || ml <= 600) return 1;
      if (ml <= 1100) return 3;
      if (ml <= 1600) return 4;
      return 6;
    }

    final cm = facts.cm;
    if (isPizza && cm != null) {
      if (cm <= 25) return 1.5;
      if (cm <= 32) return 2;
      if (cm <= 40) return 3;
      return 4;
    }

    final pieces = facts.pieces;
    if (pieces != null &&
        (isSet || (cuisines.contains(Cuisine.japanese) && pieces >= 16))) {
      return (pieces / 8).clamp(1, 8).toDouble();
    }

    final grams = facts.grams;
    if (grams != null) {
      // Целый торт — на компанию: ~150 г на человека.
      if (role == DishRole.dessert) {
        return grams >= 800 ? (grams / 150).clamp(1, 12).toDouble() : 1.0;
      }
      if (grams >= 1500) return 4;
      if (grams >= 1000) return 3;
      if (grams >= 650 && (role == DishRole.main || role == DishRole.other)) {
        return 2;
      }
    }

    if (isPlatter) return 3;
    return 1;
  }

  DishProfile finish(double pricePercentile) {
    final servings = this.servings;
    final kind = drinkKind;

    var satiety = _roleSatiety[role]!;
    if (role == DishRole.drink) {
      if (kind == DrinkKind.shake ||
          kind == DrinkKind.dairy ||
          kind == DrinkKind.cocoa) {
        satiety = 0.2;
      }
    } else {
      final kcal = facts.kcal;
      final grams = facts.grams;
      if (kcal != null && kcal > 0) {
        satiety = (kcal / servings / 650).clamp(0.15, 1.8).toDouble();
      } else if (grams != null && grams > 0) {
        satiety *=
            (0.55 + 0.45 * grams / servings / 300).clamp(0.6, 1.6).toDouble();
      }
      if (isHearty) satiety += 0.25;
      if (isLight) satiety -= 0.2;
      // Дороже в своей роли — обычно больше порция.
      satiety += 0.25 * (pricePercentile - 0.5);
      satiety = satiety.clamp(0.05, 2.0).toDouble();
    }

    final double lightness = role == DishRole.drink
        ? 0.5
        : (1 -
                satiety / 1.3 +
                (isLight ? 0.3 : 0.0) -
                (isHearty ? 0.3 : 0.0) +
                (hasFish ? 0.1 : 0.0) +
                (role == DishRole.salad || role == DishRole.soup ? 0.15 : 0.0))
            .clamp(0.0, 1.0)
            .toDouble();

    return DishProfile(
      item: item,
      role: role,
      category: category,
      unitPrice: unitPrice,
      pricePercentile: pricePercentile,
      isHit: isHit,
      isPopular: isPopular,
      isNew: isNew,
      isSignature: isSignature,
      hasImage: hasImage,
      hasDescription: hasDescription,
      isSpicy: isSpicy,
      hasMeat: hasMeat,
      hasFish: hasFish,
      isVegetarian: isVegetarian,
      isBreakfast: isBreakfast,
      isLunchOffer: isLunchOffer,
      isIceCream: isIceCream,
      isColdDish: isColdDish,
      cuisines: cuisines,
      drinkKind: drinkKind,
      isHotDrink: isHotDrink,
      facts: facts,
      servings: servings,
      satiety: satiety,
      lightness: lightness,
      keyTokens: keyTokens,
    );
  }
}
