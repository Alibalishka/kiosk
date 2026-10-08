import 'dart:math' as math;

import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/service/alcohol_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/dish_profile.dart';

export 'package:qr_pay_app/src/features/home/vm/service/dish_profile.dart'
    show Cuisine, DishFacts, DishProfile, DishProfiler, DishRole, DrinkKind;

/// Чего хочется гостю — первый вопрос помощника. Кофе, чай, горячее,
/// холодное и «без кофе» — для меню, где почти всё напитки: какие кнопки
/// показать, решает [OrderAssistant.moods].
enum AssistantMood {
  hearty,
  light,
  sweet,
  drinks,
  coffee,
  tea,
  hot,
  cold,
  noCoffee,
  surprise,
}

/// Пожелание гостя. Помощник предлагает только те, что имеют смысл для
/// этого меню: «Без мяса» — если в меню есть и мясное, и постное.
enum AssistantPreference { none, spicy, mild, noMeat }

/// Время суток по часам киоска.
enum AssistantTime { morning, day, evening, night }

/// Часть заказа, которую закрывает позиция.
enum AssistantCourse { main, side, drink, dessert }

/// Почему блюдо попало в подборку — ярлык на карточке.
enum AssistantReason {
  hit,
  signature,
  shared,
  pairing,
  warming,
  refreshing,
  morning,
  spicy,
  light,
  hearty,
  newItem,
}

/// Что помощник учёл — показывается шагами, пока крутится барабан.
enum AssistantNoteKind {
  menu,
  time,
  cold,
  hot,
  preference,
  portions,
  pairing,
  budget,
}

class AssistantNote {
  const AssistantNote(this.kind, {this.value, this.time, this.preference});

  final AssistantNoteKind kind;
  final int? value;
  final AssistantTime? time;
  final AssistantPreference? preference;
}

class AssistantRequest {
  const AssistantRequest({
    required this.mood,
    this.guests = 1,
    this.budget,
    this.preference = AssistantPreference.none,
    this.now,
    this.inBasket = const {},
    this.shown = const {},
  });

  final AssistantMood mood;
  final int guests;

  /// На всю компанию. null — без ограничений.
  final int? budget;
  final AssistantPreference preference;

  /// Часы киоска; null — сейчас. Задаётся в тестах.
  final DateTime? now;

  /// Уже в корзине — такое предлагаем реже: гостю нужно новое.
  final Set<int> inBasket;

  /// Сколько раз блюдо уже показывали в этом диалоге: «Другой вариант» не
  /// должен возвращать то же самое.
  final Map<int, int> shown;

  AssistantRequest withShown(Map<int, int> shown) => AssistantRequest(
        mood: mood,
        guests: guests,
        budget: budget,
        preference: preference,
        now: now,
        inBasket: inBasket,
        shown: shown,
      );
}

/// Позиция подборки. [item] уже с модификаторами по умолчанию — ровно тем,
/// что предвыбрала бы карточка товара, — и кладётся в корзину как есть.
class AssistantLine {
  const AssistantLine({
    required this.dish,
    required this.course,
    this.count = 1,
    this.reason,
  });

  final DishProfile dish;
  final AssistantCourse course;
  final int count;
  final AssistantReason? reason;

  Items get item => dish.item;
  DishRole get role => dish.role;
  bool get isHit => dish.isHit;
  int get unitPrice => dish.unitPrice;
  int get total => unitPrice * count;
}

class AssistantSet {
  const AssistantSet({
    required this.lines,
    required this.request,
    this.time = AssistantTime.day,
    this.notes = const [],
  });

  final List<AssistantLine> lines;
  final AssistantRequest request;
  final AssistantTime time;
  final List<AssistantNote> notes;

  int get guests => math.max(1, request.guests);
  int? get budget => request.budget;
  int get total => lines.fold(0, (sum, line) => sum + line.total);
  int get perPerson => (total / guests).round();
  bool get isEmpty => lines.isEmpty;

  /// Даже самый дешёвый вариант не влез в бюджет — показываем ближайший.
  bool get overBudget => budget != null && total > budget!;

  AssistantSet replaceLine(int index, AssistantLine line) => AssistantSet(
        lines: [...lines]..[index] = line,
        request: request,
        time: time,
        notes: notes,
      );
}

/// Подбирает заказ по меню без сети и без модели.
///
/// Каждое блюдо сначала разбирается в [DishProfile] (роль, порции, острота,
/// мясо, кухня, горячий ли напиток). Затем набор собирается целиком:
/// лучевой поиск перебирает несколько десятков вариантов и оценивает их по
/// сумме «полезности» — насколько блюдо подходит настроению, времени суток
/// и сезону, сочетается с уже выбранным, не повторяет его, укладывается в
/// бюджет и в порции компании.
///
/// В подборку попадает только то, что можно добавить одним касанием: без
/// алкоголя (возраст подтверждается отдельно), без бесплатных позиций
/// подписки и без блюд, где обязательный модификатор не выбран по умолчанию.
class OrderAssistant {
  OrderAssistant(
    QrMenuModel menu, {
    AlcoholService alcoholService = const AlcoholService(),
  }) : _dishes = DishProfiler.profileMenu(menu, alcoholService: alcoholService);

  final List<DishProfile> _dishes;

  /// Ширина луча и ветвление: сколько вариантов держим и сколько лучших
  /// продолжений пробуем на каждом шаге.
  static const int _beamWidth = 24;
  static const int _branching = 6;

  /// Разброс «вкуса» между вариантами: выше — разнообразнее, ниже —
  /// предсказуемее.
  static const double _temperature = 0.35;
  static const double _surpriseTemperature = 0.9;

  int get dishCount => _dishes.length;
  bool get isAvailable => _dishes.isNotEmpty;

  /// Всё, что помощник понял о меню, — для отладки и тестов.
  List<DishProfile> get dishes => List.unmodifiable(_dishes);

  static DishRole? roleForItem(String? name) => DishProfiler.roleForItem(name);
  static DishRole? roleForCategory(String? name) =>
      DishProfiler.roleForCategory(name);
  static Items? readyToAdd(Items item) => DishProfiler.readyToAdd(item);

  /// Блюда с фото для «барабана», пока помощник «думает».
  List<Items> reelItems({int limit = 12, int seed = 0}) {
    final withImages = _dishes.where((d) => d.hasImage).toList()
      ..shuffle(math.Random(seed));
    return withImages.take(limit).map((d) => d.item).toList();
  }

  static AssistantTime timeOf(DateTime now) {
    final hour = now.hour;
    if (hour >= 6 && hour < 11) return AssistantTime.morning;
    if (hour >= 11 && hour < 17) return AssistantTime.day;
    if (hour >= 17 && hour < 23) return AssistantTime.evening;
    return AssistantTime.night;
  }

  // --------------------------------------------------------------------------
  // Вопросы
  // --------------------------------------------------------------------------

  /// Кнопки первого вопроса — только те, за которыми в этом меню что-то
  /// есть: в кофейне нечего «сытно поесть», в бургерной незачем
  /// расспрашивать про чай. Кнопка показывается, если за ней хотя бы две
  /// позиции, она сужает выбор («Только напитки» — если есть и еда,
  /// «Холодное» — если есть и горячее) и не повторяет предыдущую. Если
  /// почти всё меню — напитки, вместо «Только напитки» спрашиваем, каких
  /// именно. «Удиви меня» — всегда последней; если кроме неё предложить
  /// нечего, вопрос не задаём и берём [defaultMood].
  late final List<AssistantMood> moods = _availableMoods();

  /// Настроение, когда спрашивать не о чем (одни пиццы, одни соки): то, за
  /// которым больше всего позиций.
  late final AssistantMood defaultMood = const [
    AssistantMood.hearty,
    AssistantMood.light,
    AssistantMood.sweet,
    AssistantMood.drinks,
  ].reduce((a, b) => _pools[b]!.length > _pools[a]!.length ? b : a);

  /// Сколько кнопок помещается в первый вопрос вместе с «Удиви меня».
  static const int _maxMoods = 6;

  /// Что убирать первым, если кнопок больше, чем помещается.
  static const _expendableMoods = [
    AssistantMood.noCoffee,
    AssistantMood.light,
    AssistantMood.tea,
  ];

  /// Настроения, где весь набор — напитки.
  static const _drinkMoods = {
    AssistantMood.drinks,
    AssistantMood.coffee,
    AssistantMood.tea,
    AssistantMood.hot,
    AssistantMood.cold,
    AssistantMood.noCoffee,
  };

  /// Еда, а не напитки и не десерты: по ней видно, кафе это или кофейня.
  static const _mealRoles = {
    DishRole.main,
    DishRole.other,
    DishRole.soup,
    DishRole.salad,
    DishRole.starter,
    DishRole.side,
  };

  /// С какой «лёгкости» основное блюдо считается лёгким — и для кнопки, и
  /// для ярлыка «Лёгкое».
  static const double _lightEnough = 0.6;

  /// Позиции, ради которых гость нажал бы кнопку: «Сладкое» — десерты,
  /// «Кофе» — кофе, «Лёгкое» — салаты, супы и лёгкие основные.
  static bool _fits(AssistantMood mood, DishProfile dish) => switch (mood) {
        AssistantMood.hearty =>
          dish.role == DishRole.main || dish.role == DishRole.other,
        AssistantMood.light => switch (dish.role) {
            DishRole.salad || DishRole.soup || DishRole.starter => true,
            DishRole.main => dish.lightness >= _lightEnough,
            _ => false,
          },
        AssistantMood.sweet => dish.role == DishRole.dessert,
        AssistantMood.drinks => dish.role == DishRole.drink,
        AssistantMood.coffee => dish.drinkKind == DrinkKind.coffee,
        AssistantMood.tea => dish.drinkKind == DrinkKind.tea,
        AssistantMood.hot => dish.isHotDrink == true,
        AssistantMood.cold => dish.isHotDrink == false,
        AssistantMood.noCoffee =>
          dish.role == DishRole.drink && dish.drinkKind != DrinkKind.coffee,
        AssistantMood.surprise => true,
      };

  late final Map<AssistantMood, Set<int>> _pools = {
    for (final mood in AssistantMood.values)
      mood: {
        for (final dish in _dishes)
          if (_fits(mood, dish)) dish.id,
      },
  };

  List<AssistantMood> _availableMoods() {
    final all = _dishes.length;
    final drinks = _pools[AssistantMood.drinks]!.length;
    final desserts = _pools[AssistantMood.sweet]!.length;
    final meals = _dishes.where((d) => _mealRoles.contains(d.role)).length;

    final result = <AssistantMood>[];
    // [within] — сколько позиций в том, что кнопка сужает: у «Холодного» —
    // все напитки, у «Сладкого» — всё меню.
    bool offer(AssistantMood mood, int within) {
      final pool = _pools[mood]!;
      if (pool.length < 2 || pool.length >= within) return false;
      for (final shown in result) {
        final other = _pools[shown]!;
        if (other.length == pool.length && other.containsAll(pool)) {
          return false;
        }
      }
      result.add(mood);
      return true;
    }

    // Кофейня, чайная, фреш-бар: напитков вдвое больше, чем еды, и больше,
    // чем десертов.
    if (drinks > 2 * meals && drinks > desserts) {
      final coffee = offer(AssistantMood.coffee, drinks);
      final tea = offer(AssistantMood.tea, drinks);
      // По видам не делится (одни кофе) — делим по температуре.
      if (!coffee && !tea) offer(AssistantMood.hot, drinks);
      offer(AssistantMood.cold, drinks);
      offer(AssistantMood.noCoffee, drinks);
      if (result.isEmpty) offer(AssistantMood.drinks, all);
      offer(AssistantMood.sweet, all);
      offer(AssistantMood.hearty, all);
      offer(AssistantMood.light, all);
    } else {
      offer(AssistantMood.hearty, all);
      offer(AssistantMood.light, all);
      offer(AssistantMood.sweet, all);
      offer(AssistantMood.drinks, all);
    }

    for (final mood in _expendableMoods) {
      if (result.length < _maxMoods) break;
      result.remove(mood);
    }
    return [...result, AssistantMood.surprise];
  }

  /// Пожелания, которые имеет смысл предложить: только если в меню есть и
  /// то и другое. Пусто — вопрос не задаём.
  List<AssistantPreference> preferencesFor(AssistantMood mood) {
    if (mood != AssistantMood.hearty && mood != AssistantMood.light) {
      return const [];
    }
    final candidates = _dishes.where(_plan(mood, 1).first.admits).toList();
    final spicy = candidates.where((d) => d.isSpicy).length;

    final result = [
      if (spicy > 0) AssistantPreference.spicy,
      if (spicy > 0 && spicy < candidates.length) AssistantPreference.mild,
      if (candidates.any((d) => d.isVegetarian) &&
          candidates.any((d) => !d.isVegetarian))
        AssistantPreference.noMeat,
    ];
    return result.isEmpty ? const [] : [...result, AssistantPreference.none];
  }

  /// Два варианта бюджета на всю компанию — экономный и комфортный — по
  /// реально собранным наборам. Пусто — подбирать не из чего.
  List<int> budgetPresets(
    AssistantMood mood,
    int guests, {
    AssistantPreference preference = AssistantPreference.none,
    DateTime? now,
  }) {
    final request = AssistantRequest(
      mood: mood,
      guests: guests,
      preference: preference,
      now: now,
    );
    final ctx = _context(request, seed: 0, temperature: 0);
    final plan = _plan(mood, ctx.guests);
    final best = _optimize(ctx, plan);
    if (best.picks.isEmpty) return const [];

    final comfortable = _roundUp(best.cost);
    final economy = _roundUp(
      math.max(_minimalCost(plan, ctx), (best.cost * 0.7).round()),
    );
    if (economy >= comfortable) return [comfortable];
    return [economy, comfortable];
  }

  // --------------------------------------------------------------------------
  // Подбор
  // --------------------------------------------------------------------------

  AssistantSet pick(AssistantRequest request, {int seed = 0}) {
    final ctx = _context(
      request,
      seed: seed,
      temperature: request.mood == AssistantMood.surprise
          ? _surpriseTemperature
          : _temperature,
    );
    var state = _optimize(ctx, _plan(request.mood, ctx.guests));

    // Меню без узнаваемого основного (кофейня, кондитерская): берём любую
    // еду, лишь бы не пусто.
    if (state.picks.isEmpty && _dishes.isNotEmpty) {
      state = _optimize(ctx, [
        _Slot(
          _SlotKind.main,
          const [
            DishRole.main,
            DishRole.other,
            DishRole.salad,
            DishRole.soup,
            DishRole.starter,
            DishRole.side,
            DishRole.dessert,
          ],
          ctx.guests.toDouble(),
        ),
        _Slot(
          _SlotKind.drink,
          const [DishRole.drink],
          ctx.guests.toDouble(),
          optional: true,
          missingPenalty: 0.5,
        ),
      ]);
    }

    final lines = _lines(state.picks);
    return AssistantSet(
      lines: lines,
      request: request,
      time: ctx.time,
      notes: _notes(ctx, lines),
    );
  }

  /// Есть ли чем заменить позицию — без тяжёлого подсчёта, для кнопки.
  bool hasAlternative(AssistantSet set, int index) =>
      _alternatives(set, index).isNotEmpty;

  /// Замена позиции: другое блюдо той же части заказа, которое лучше всего
  /// сочетается с остальным набором и влезает в бюджет. null — заменить
  /// не на что.
  AssistantLine? alternativeFor(AssistantSet set, int index, {int seed = 0}) {
    final candidates = _alternatives(set, index);
    if (candidates.isEmpty) return null;

    final line = set.lines[index];
    final ctx = _context(set.request, seed: seed, temperature: 0.6);
    final slot = _slotFor(line.course, set.request.mood, ctx.guests);
    final lineCoverage = slot.coverageOf(line.dish) * line.count;

    // Остальной набор — как уже сделанный выбор: замена оценивается в его
    // контексте (сочетания, повторы, цены соседей).
    final others = <_Pick>[
      for (var i = 0; i < set.lines.length; i++)
        if (i != index)
          for (var n = 0; n < set.lines[i].count; n++)
            _Pick(
              set.lines[i].dish,
              _slotFor(set.lines[i].course, set.request.mood, ctx.guests),
            ),
    ];
    final state = _State(
      picks: others,
      cost: 0,
      score: 0,
      slot: 0,
      covered: math.max(0.0, slot.need - lineCoverage),
    );

    _Scored? best;
    for (final dish in candidates) {
      final scored = _score(dish, state, slot, ctx);
      if (scored != null && (best == null || scored.utility > best.utility)) {
        best = scored;
      }
    }
    if (best == null) return null;

    return AssistantLine(
      dish: best.dish,
      course: line.course,
      count: _countFor(best.dish, slot, lineCoverage),
      reason: best.reason,
    );
  }

  /// Сколько штук нового блюда закроют тех же гостей: четыре колы можно
  /// заменить двумя бутылками по литру.
  static int _countFor(DishProfile dish, _Slot slot, double coverage) =>
      math.max(1, (coverage / slot.coverageOf(dish) - 1e-6).ceil());

  List<DishProfile> _alternatives(AssistantSet set, int index) {
    final line = set.lines[index];
    final request = set.request;
    final slot = _slotFor(line.course, request.mood, set.guests);
    final taken = {for (final l in set.lines) l.dish.id};
    final budget = request.budget;
    final headroom = budget == null ? null : budget - (set.total - line.total);
    final lineCoverage = slot.coverageOf(line.dish) * line.count;

    return [
      for (final dish in _dishes)
        if (slot.admits(dish) &&
            !taken.contains(dish.id) &&
            _allowed(dish, request.preference) &&
            (headroom == null ||
                dish.unitPrice * _countFor(dish, slot, lineCoverage) <=
                    headroom))
          dish,
    ];
  }

  // --------------------------------------------------------------------------
  // План набора
  // --------------------------------------------------------------------------

  static const _mainRoles = [DishRole.main, DishRole.other];
  static const _sideRoles = [DishRole.side, DishRole.starter, DishRole.salad];
  static const _lightRoles = [
    DishRole.salad,
    DishRole.soup,
    DishRole.starter,
    DishRole.main,
  ];

  /// Из чего состоит набор. Основное — каждому гостю (или одно блюдо на
  /// нескольких, если оно большое); гарниры и закуски — на всех, одна на
  /// двоих; напитки — каждому, но бутылка 1 л закрывает троих.
  static List<_Slot> _plan(AssistantMood mood, int guests) {
    final g = guests.toDouble();
    switch (mood) {
      case AssistantMood.hearty:
        return [
          _Slot(_SlotKind.main, _mainRoles, g),
          _Slot(_SlotKind.side, _sideRoles, g,
              shared: true, optional: true, missingPenalty: 0.6),
          _Slot(_SlotKind.drink, const [DishRole.drink], g,
              optional: true, missingPenalty: 0.8),
        ];
      case AssistantMood.light:
        return [
          _Slot(_SlotKind.main, _lightRoles, g),
          _Slot(_SlotKind.drink, const [DishRole.drink], g,
              optional: true, missingPenalty: 0.7),
        ];
      case AssistantMood.sweet:
        return [
          _Slot(_SlotKind.dessert, const [DishRole.dessert], g),
          _Slot(_SlotKind.drink, const [DishRole.drink], g,
              optional: true, missingPenalty: 0.7),
        ];
      case AssistantMood.drinks:
      case AssistantMood.coffee:
      case AssistantMood.tea:
      case AssistantMood.hot:
      case AssistantMood.cold:
      case AssistantMood.noCoffee:
        return [
          _Slot(_SlotKind.drink, const [DishRole.drink], g,
              accepts: (dish) => _fits(mood, dish)),
        ];
      case AssistantMood.surprise:
        return [
          _Slot(_SlotKind.main, _mainRoles, g),
          _Slot(_SlotKind.side, _sideRoles, g,
              shared: true, optional: true, missingPenalty: 0.4),
          _Slot(_SlotKind.drink, const [DishRole.drink], g,
              optional: true, missingPenalty: 0.6),
          _Slot(_SlotKind.dessert, const [DishRole.dessert], g,
              shared: true, optional: true, missingPenalty: 0.2),
        ];
    }
  }

  static _Slot _slotFor(
      AssistantCourse course, AssistantMood mood, int guests) {
    final kind = switch (course) {
      AssistantCourse.main => _SlotKind.main,
      AssistantCourse.side => _SlotKind.side,
      AssistantCourse.drink => _SlotKind.drink,
      AssistantCourse.dessert => _SlotKind.dessert,
    };
    for (final slot in _plan(mood, guests)) {
      if (slot.kind == kind) return slot;
    }
    final g = guests.toDouble();
    return switch (kind) {
      _SlotKind.main => _Slot(kind, _mainRoles, g),
      _SlotKind.side => _Slot(kind, _sideRoles, g, shared: true),
      _SlotKind.drink => _Slot(kind, const [DishRole.drink], g),
      _SlotKind.dessert => _Slot(kind, const [DishRole.dessert], g),
    };
  }

  // --------------------------------------------------------------------------
  // Поиск
  // --------------------------------------------------------------------------

  _Ctx _context(
    AssistantRequest request, {
    required int seed,
    required double temperature,
  }) {
    final now = request.now ?? DateTime.now();
    final random = math.Random(seed);
    return _Ctx(
      request: request,
      time: timeOf(now),
      season: _seasonOf(now),
      hour: now.hour,
      noise: {
        for (final dish in _dishes)
          dish.id: temperature == 0 ? 0 : temperature * _gumbel(random),
      },
    );
  }

  static _Season _seasonOf(DateTime now) {
    final month = now.month;
    if (month >= 11 || month <= 3) return _Season.cold;
    if (month >= 6 && month <= 8) return _Season.hot;
    return _Season.mild;
  }

  /// Шум Гумбеля: у каждого варианта свой «вкус дня», поэтому «Другой
  /// вариант» даёт другой, но всё равно хороший набор.
  static double _gumbel(math.Random random) {
    final u = random.nextDouble().clamp(1e-9, 1 - 1e-9);
    return -math.log(-math.log(u));
  }

  static bool _allowed(DishProfile dish, AssistantPreference preference) {
    switch (preference) {
      case AssistantPreference.noMeat:
        return !dish.isFood ||
            dish.role == DishRole.dessert ||
            dish.isVegetarian;
      case AssistantPreference.mild:
        return !dish.isSpicy;
      case AssistantPreference.spicy:
      case AssistantPreference.none:
        return true;
    }
  }

  List<DishProfile> _poolFor(_Slot slot, _Ctx ctx) => [
        for (final dish in _dishes)
          if (slot.admits(dish) && _allowed(dish, ctx.preference)) dish,
      ];

  /// Лучевой поиск по частям плана. Каждое состояние — частично собранный
  /// набор; на каждом шаге оно продолжается лучшими блюдами для текущей
  /// части заказа или пропускает необязательную часть.
  _State _optimize(_Ctx ctx, List<_Slot> plan) {
    final pools = [for (final slot in plan) _poolFor(slot, ctx)];
    // Минимальная цена за накормленного человека в каждой части — нижняя
    // граница стоимости, чтобы заранее отсеивать безнадёжные по бюджету
    // варианты.
    final minPerPerson = [
      for (var i = 0; i < plan.length; i++)
        pools[i].isEmpty
            ? 0.0
            : pools[i]
                .map((d) => d.unitPrice / plan[i].coverageOf(d))
                .reduce(math.min),
    ];

    var beam = [const _State.initial()];
    final finished = <_State>[];

    for (var step = 0; step < 64 && beam.isNotEmpty; step++) {
      final next = <_State>[];
      for (final state in beam) {
        if (state.slot >= plan.length) {
          finished.add(state);
          continue;
        }
        final slot = plan[state.slot];

        if (slot.optional && state.covered == 0) {
          next.add(state.skip(slot.missingPenalty));
        }

        final scored = <_Scored>[];
        for (final dish in pools[state.slot]) {
          final s = _score(dish, state, slot, ctx);
          if (s != null) scored.add(s);
        }
        if (scored.isEmpty) {
          // Нечем закрыть часть — идём дальше со штрафом за каждого
          // ненакормленного гостя.
          if (!slot.optional || state.covered > 0) {
            next.add(state.skip(2.0 * (slot.need - state.covered)));
          }
          continue;
        }
        scored.sort((a, b) => b.utility.compareTo(a.utility));
        for (final s in scored.take(_branching)) {
          next.add(state.add(
            _Pick(s.dish, slot, s.reason, s.strength),
            s.utility,
            slot,
          ));
        }
      }
      beam = _prune(next, plan, minPerPerson, ctx);
    }
    finished.addAll(beam.where((s) => s.slot >= plan.length));
    if (finished.isEmpty) return const _State.initial();

    // Сначала — уложившиеся в бюджет, по качеству; если таких нет —
    // ближайший к бюджету.
    finished.sort((a, b) {
      final overA = _overshoot(a.cost, ctx);
      final overB = _overshoot(b.cost, ctx);
      if ((overA <= 0) != (overB <= 0)) return overA <= 0 ? -1 : 1;
      if (overA > 0 && overA != overB) return overA.compareTo(overB);
      return _finalScore(b, ctx).compareTo(_finalScore(a, ctx));
    });
    return finished.first;
  }

  /// Оставляет лучшие состояния: сначала те, что ещё могут уложиться в
  /// бюджет, — по качеству, затем остальные — по тому, насколько близко.
  List<_State> _prune(
    List<_State> states,
    List<_Slot> plan,
    List<double> minPerPerson,
    _Ctx ctx,
  ) {
    final unique = <String, _State>{};
    for (final state in states) {
      final key = state.signature;
      final existing = unique[key];
      if (existing == null || existing.score < state.score) {
        unique[key] = state;
      }
    }
    if (ctx.budget == null) {
      return (unique.values.toList()
            ..sort((a, b) => b.score.compareTo(a.score)))
          .take(_beamWidth)
          .toList();
    }

    int projected(_State s) {
      var cost = s.cost.toDouble();
      for (var i = s.slot; i < plan.length; i++) {
        final slot = plan[i];
        final started = i == s.slot && s.covered > 0;
        if (slot.optional && !started) continue;
        final remaining = i == s.slot ? slot.need - s.covered : slot.need;
        cost += remaining * minPerPerson[i];
      }
      return cost.round();
    }

    final over = {
      for (final s in unique.values) s: _overshoot(projected(s), ctx),
    };
    final ranked = unique.values.toList()
      ..sort((a, b) {
        final overA = over[a]!;
        final overB = over[b]!;
        if ((overA <= 0) != (overB <= 0)) return overA <= 0 ? -1 : 1;
        if (overA > 0 && overA != overB) return overA.compareTo(overB);
        return b.score.compareTo(a.score);
      });
    return ranked.take(_beamWidth).toList();
  }

  static int _overshoot(int cost, _Ctx ctx) {
    final budget = ctx.budget;
    return budget == null ? 0 : cost - budget;
  }

  /// Внутри бюджета — небольшой плюс за то, что он использован: при щедром
  /// бюджете гость ждёт не самый дешёвый набор.
  static double _finalScore(_State state, _Ctx ctx) {
    final budget = ctx.budget;
    if (budget == null || budget <= 0) return state.score;
    return state.score + 0.6 * math.min(1.0, state.cost / budget);
  }

  // --------------------------------------------------------------------------
  // Полезность блюда в контексте набора
  // --------------------------------------------------------------------------

  static const _rankBonus = [0.6, 0.3, 0.1, -0.2];

  /// Само блюдо, без контекста: рекомендация заведения, фото, фирменное.
  static double _quality(DishProfile dish) =>
      (dish.isHit ? 1.0 : 0.0) +
      (dish.isPopular ? 0.6 : 0.0) +
      (dish.isSignature ? 0.4 : 0.0) +
      (dish.isNew ? 0.25 : 0.0) +
      (dish.hasImage ? 0.5 : -0.2) +
      (dish.hasDescription ? 0.1 : 0.0);

  /// Насколько хорошо [dish] продолжает набор [state] в части [slot].
  /// null — нельзя: это блюдо уже стоит в другой части заказа.
  _Scored? _score(DishProfile dish, _State state, _Slot slot, _Ctx ctx) {
    AssistantReason? reason;
    var strength = 0.0;
    void because(AssistantReason r, double weight) {
      if (weight > strength) {
        strength = weight;
        reason = r;
      }
    }

    // «Вкус дня» достаётся блюду один раз: иначе удачно выпавшее блюдо
    // перевешивало бы штраф за повтор и доставалось бы каждому гостю.
    final repeat = state.picks.any((p) => p.dish.id == dish.id);
    double u = _quality(dish) + (repeat ? 0.0 : ctx.noise[dish.id] ?? 0.0);
    if (dish.isHit) {
      because(AssistantReason.hit, 0.8);
    } else if (dish.isPopular) {
      because(AssistantReason.hit, 0.6);
    }
    if (dish.isSignature) because(AssistantReason.signature, 0.7);
    if (dish.isNew) because(AssistantReason.newItem, 0.4);

    final rank = slot.roles.indexOf(dish.role);
    u += _rankBonus[math.min(rank, _rankBonus.length - 1)];

    u += _moodFit(dish, slot, ctx, because);
    u += _preferenceFit(dish, slot, ctx, because);
    u += _timeFit(dish, ctx, because);
    // Просто вода — не то, что советуют; уместна только в «лёгком».
    if (dish.drinkKind == DrinkKind.water && ctx.mood != AssistantMood.light) {
      u -= 0.3;
    }

    final pairing = _pairing(dish, state, slot);
    u += pairing;
    if (pairing >= 0.45) because(AssistantReason.pairing, pairing * 0.7);

    final redundancy = _redundancy(dish, state, slot, ctx);
    if (redundancy.isInfinite) return null;
    u -= redundancy;

    if (slot.kind == _SlotKind.main || slot.kind == _SlotKind.dessert) {
      u -= _fairness(dish, state, slot);
    }

    // Порции: бутылка 1 л одному гостю — перебор.
    final remaining = slot.need - state.covered;
    final coverage = slot.coverageOf(dish);
    final slack = slot.shared ? 1.0 : 0.75;
    if (coverage > remaining + slack) {
      u -= 0.5 * (coverage - remaining);
    } else if (ctx.guests >= 2 && dish.servings >= 1.8) {
      because(AssistantReason.shared, 0.9);
    }

    // Цена: без бюджета — предпочитаем разумное, с бюджетом за цену
    // отвечает сам бюджет. Напитки и гарниры дешёвые — их цена весит меньше,
    // чем сочетание с основным.
    final cheapCourse =
        slot.kind == _SlotKind.drink || slot.kind == _SlotKind.side;
    u -= (ctx.budget == null ? 0.3 : 0.1) *
        (cheapCourse ? 0.5 : 1.0) *
        dish.pricePercentile;

    if (ctx.request.inBasket.contains(dish.id)) u -= 0.8;
    u -= 0.6 * (ctx.request.shown[dish.id] ?? 0);

    return _Scored(dish, u, reason, strength);
  }

  static double _moodFit(
    DishProfile dish,
    _Slot slot,
    _Ctx ctx,
    void Function(AssistantReason, double) because,
  ) {
    final kind = dish.drinkKind;
    switch (ctx.mood) {
      case AssistantMood.hearty:
        if (slot.kind != _SlotKind.main) return 0;
        if (dish.satiety >= 1.15) because(AssistantReason.hearty, 0.5);
        return 0.8 * dish.satiety;
      case AssistantMood.light:
        if (slot.kind == _SlotKind.main) {
          if (dish.lightness >= _lightEnough) {
            because(AssistantReason.light, 0.5);
          }
          return dish.lightness - 0.5 * math.max(0.0, dish.satiety - 0.9);
        }
        if (slot.kind == _SlotKind.drink) return _lightDrinks[kind] ?? 0.0;
        return 0;
      case AssistantMood.sweet:
        if (slot.kind == _SlotKind.drink) return _sweetDrinks[kind] ?? 0.0;
        return 0;
      case AssistantMood.drinks:
      case AssistantMood.coffee:
      case AssistantMood.tea:
      case AssistantMood.hot:
      case AssistantMood.cold:
      case AssistantMood.noCoffee:
        if (slot.kind != _SlotKind.drink) return 0;
        return (dish.isSignature ? 0.3 : 0.0) + (_drinksMood[kind] ?? 0.0);
      case AssistantMood.surprise:
        final special =
            dish.isHit || dish.isSignature || dish.isNew || dish.isPopular;
        return special ? 0.5 : 0.0;
    }
  }

  /// Лёгкое — без газировки и шейков.
  static const _lightDrinks = {
    DrinkKind.water: 0.25,
    DrinkKind.tea: 0.3,
    DrinkKind.juice: 0.25,
    DrinkKind.dairy: 0.1,
    DrinkKind.lemonade: 0.05,
    DrinkKind.cocoa: -0.3,
    DrinkKind.soda: -0.5,
    DrinkKind.shake: -0.5,
  };

  /// К сладкому — кофе и чай.
  static const _sweetDrinks = {
    DrinkKind.coffee: 0.45,
    DrinkKind.tea: 0.4,
    DrinkKind.cocoa: 0.35,
    DrinkKind.shake: 0.2,
    DrinkKind.water: -0.2,
    DrinkKind.soda: -0.3,
  };

  /// «Только напитки» — интересные напитки, а не просто вода.
  static const _drinksMood = {
    DrinkKind.lemonade: 0.25,
    DrinkKind.shake: 0.25,
    DrinkKind.juice: 0.2,
    DrinkKind.coffee: 0.1,
    DrinkKind.water: -0.4,
  };

  static double _preferenceFit(
    DishProfile dish,
    _Slot slot,
    _Ctx ctx,
    void Function(AssistantReason, double) because,
  ) {
    // Гость прямо попросил острое — это решающий довод для основного.
    if (ctx.preference == AssistantPreference.spicy) {
      if (dish.isSpicy) {
        because(AssistantReason.spicy, 1.2);
        return slot.kind == _SlotKind.main ? 2.0 : 0.8;
      }
      return slot.kind == _SlotKind.main ? -0.3 : 0.0;
    }
    // Острое без запроса не навязываем, но и не прячем.
    if (ctx.preference == AssistantPreference.none && dish.isSpicy) {
      return -0.15;
    }
    return 0;
  }

  static double _timeFit(
    DishProfile dish,
    _Ctx ctx,
    void Function(AssistantReason, double) because,
  ) {
    var u = 0.0;
    final kind = dish.drinkKind;

    switch (ctx.time) {
      case AssistantTime.morning:
        if (dish.isBreakfast) {
          u += 0.8;
          because(AssistantReason.morning, 0.75);
        }
        if (kind == DrinkKind.coffee) {
          u += 0.5;
          because(AssistantReason.morning, 0.6);
        }
        if (dish.role == DishRole.main &&
            !dish.isBreakfast &&
            dish.satiety > 1.2) {
          u -= 0.2;
        }
      case AssistantTime.day:
        if (dish.isLunchOffer) u += 0.5;
        if (dish.role == DishRole.soup) u += 0.15;
        // Завтраки часто подают до полудня.
        if (dish.isBreakfast &&
            dish.role != DishRole.dessert &&
            ctx.hour >= 12) {
          u -= 0.3;
        }
      case AssistantTime.evening:
      case AssistantTime.night:
        if (dish.isBreakfast && dish.role != DishRole.dessert) u -= 0.6;
    }
    // Бизнес-ланч вне обеда скорее всего не продадут.
    if (dish.isLunchOffer && ctx.time != AssistantTime.day) u -= 3;
    // Вечером — меньше кофеина.
    if (ctx.hour >= 20 || ctx.hour < 6) {
      if (kind == DrinkKind.coffee) u -= 0.4;
      if (kind == DrinkKind.tea) u += 0.1;
    }

    switch (ctx.season) {
      case _Season.cold:
        if (dish.isHotDrink == true) {
          u += 0.5;
          because(AssistantReason.warming, 0.65);
        } else if (dish.isHotDrink == false) {
          u -= 0.1;
        }
        if (dish.role == DishRole.soup && !dish.isColdDish) u += 0.3;
        if (dish.isIceCream) u -= 0.2;
      case _Season.hot:
        if (dish.isHotDrink == false) {
          u += 0.4;
          because(AssistantReason.refreshing, 0.65);
        } else if (dish.isHotDrink == true) {
          u -= 0.2;
        }
        if (dish.role == DishRole.soup) u += dish.isColdDish ? 0.3 : -0.2;
        if (dish.isIceCream) {
          u += 0.4;
          because(AssistantReason.refreshing, 0.5);
        }
      case _Season.mild:
        break;
    }
    return u;
  }

  /// Сочетание с уже выбранным: напиток — к кухне основного или к десерту,
  /// гарнир — из той же кухни, второе основное — не из другой вселенной.
  static double _pairing(DishProfile dish, _State state, _Slot slot) {
    final anchors = [
      for (final p in state.picks)
        if (p.slot.kind == _SlotKind.main || p.slot.kind == _SlotKind.dessert)
          p.dish,
    ];
    if (anchors.isEmpty) return 0;

    switch (slot.kind) {
      case _SlotKind.drink:
        final kind = dish.drinkKind ?? DrinkKind.other;
        var sum = 0.0;
        for (final anchor in anchors) {
          sum += _drinkAffinity(anchor, kind);
        }
        return sum / anchors.length;
      case _SlotKind.side:
      case _SlotKind.dessert:
        final cuisines = {
          for (final a in anchors)
            if (a.role != DishRole.dessert) ...a.cuisines,
        }..remove(Cuisine.breakfast);
        final own = {...dish.cuisines}..remove(Cuisine.breakfast);
        if (cuisines.isEmpty || own.isEmpty) return 0;
        return own.any(cuisines.contains) ? 0.5 : -0.25;
      case _SlotKind.main:
        final first = anchors.first;
        // Блюдо не «сочетается» само с собой.
        if (first.id == dish.id) return 0;
        if (first.cuisines.isEmpty || dish.cuisines.isEmpty) return 0;
        return dish.cuisines.any(first.cuisines.contains) ? 0.25 : -0.25;
    }
  }

  static double _drinkAffinity(DishProfile anchor, DrinkKind kind) {
    if (anchor.role == DishRole.dessert) return _dessertDrinks[kind] ?? 0.0;
    if (anchor.cuisines.isEmpty) return _anyDrinks[kind] ?? 0.0;
    var best = -1.0;
    for (final cuisine in anchor.cuisines) {
      best = math.max(best, _cuisineDrinks[cuisine]?[kind] ?? 0.0);
    }
    return best;
  }

  static const _anyDrinks = {
    DrinkKind.juice: 0.3,
    DrinkKind.lemonade: 0.3,
    DrinkKind.soda: 0.3,
    DrinkKind.tea: 0.3,
    DrinkKind.water: 0.2,
  };

  static const _dessertDrinks = {
    DrinkKind.coffee: 1.0,
    DrinkKind.tea: 0.9,
    DrinkKind.cocoa: 0.7,
    DrinkKind.shake: 0.5,
    DrinkKind.juice: 0.2,
    DrinkKind.lemonade: 0.2,
    DrinkKind.soda: -0.1,
  };

  /// Классические пары: к бургеру — газировка, к азиатскому — чай, к
  /// казахскому — чай или айран, к завтраку — кофе.
  static const _cuisineDrinks = {
    Cuisine.fastFood: {
      DrinkKind.soda: 1.0,
      DrinkKind.shake: 0.7,
      DrinkKind.lemonade: 0.6,
      DrinkKind.juice: 0.3,
      DrinkKind.water: 0.2,
      DrinkKind.tea: -0.2,
      DrinkKind.coffee: -0.3,
      DrinkKind.dairy: -0.2,
    },
    Cuisine.italian: {
      DrinkKind.lemonade: 0.8,
      DrinkKind.soda: 0.6,
      DrinkKind.juice: 0.5,
      DrinkKind.water: 0.5,
      DrinkKind.tea: 0.1,
      DrinkKind.dairy: -0.3,
    },
    Cuisine.japanese: {
      DrinkKind.tea: 1.0,
      DrinkKind.lemonade: 0.6,
      DrinkKind.water: 0.6,
      DrinkKind.juice: 0.3,
      DrinkKind.soda: 0.3,
      DrinkKind.coffee: -0.3,
      DrinkKind.dairy: -0.4,
      DrinkKind.shake: -0.2,
    },
    Cuisine.asian: {
      DrinkKind.tea: 1.0,
      DrinkKind.lemonade: 0.7,
      DrinkKind.juice: 0.4,
      DrinkKind.water: 0.4,
      DrinkKind.soda: 0.4,
      DrinkKind.coffee: -0.3,
      DrinkKind.dairy: -0.2,
    },
    Cuisine.kazakh: {
      DrinkKind.tea: 1.0,
      DrinkKind.dairy: 0.9,
      DrinkKind.juice: 0.5,
      DrinkKind.water: 0.4,
      DrinkKind.lemonade: 0.3,
      DrinkKind.soda: 0.2,
      DrinkKind.coffee: -0.2,
    },
    Cuisine.grill: {
      DrinkKind.juice: 0.7,
      DrinkKind.lemonade: 0.7,
      DrinkKind.water: 0.5,
      DrinkKind.soda: 0.5,
      DrinkKind.tea: 0.3,
      DrinkKind.dairy: 0.2,
      DrinkKind.coffee: -0.2,
    },
    Cuisine.breakfast: {
      DrinkKind.coffee: 1.0,
      DrinkKind.tea: 0.8,
      DrinkKind.juice: 0.8,
      DrinkKind.cocoa: 0.5,
      DrinkKind.water: 0.2,
      DrinkKind.dairy: 0.2,
      DrinkKind.soda: -0.4,
    },
  };

  /// Повторы: та же картошка дважды — плохо, тот же бургер двоим — можно,
  /// но лучше разные; похожие по названию блюда — тоже повтор.
  static double _redundancy(
    DishProfile dish,
    _State state,
    _Slot slot,
    _Ctx ctx,
  ) {
    var penalty = 0.0;
    for (final pick in state.picks) {
      final other = pick.dish;
      if (other.id == dish.id) {
        if (pick.slot.kind != slot.kind) return double.infinity;
        // Повтор теряет почти всю «привлекательность» блюда: хит хорош
        // один раз, второму гостю лучше предложить другое.
        penalty += 0.7 * _quality(dish) +
            switch (slot.kind) {
              // Двоим-троим — разные блюда, большой компании повтор простителен.
              _SlotKind.main => ctx.guests >= 4 ? 0.3 : 0.8,
              _SlotKind.drink => _drinkMoods.contains(ctx.mood) ? 0.45 : 0.15,
              _SlotKind.dessert => 0.3,
              _SlotKind.side => 0.8,
            };
        continue;
      }
      final similarity = dish.similarity(other);
      if (similarity >= 0.5) {
        penalty += (pick.slot.kind == slot.kind ? 0.35 : 0.15) * similarity;
      }
      if (dish.drinkKind != null && dish.drinkKind == other.drinkKind) {
        penalty += _drinkMoods.contains(ctx.mood) ? 0.3 : 0.08;
      }
    }
    return penalty;
  }

  /// Основные блюда гостей — одного ценового уровня: не 1 200 ₸ одному и
  /// 6 000 ₸ другому.
  static double _fairness(DishProfile dish, _State state, _Slot slot) {
    final prices = [
      for (final p in state.picks)
        if (p.slot.kind == slot.kind) p.dish.unitPrice / p.dish.servings,
    ];
    if (prices.isEmpty) return 0;
    final mean = prices.reduce((a, b) => a + b) / prices.length;
    final ratio = dish.unitPrice / dish.servings / mean;
    return 0.5 * math.min(1.0, math.log(ratio).abs());
  }

  // --------------------------------------------------------------------------
  // Итог
  // --------------------------------------------------------------------------

  /// Самый дешёвый способ закрыть обязательные части — нижняя граница для
  /// экономного бюджета.
  int _minimalCost(List<_Slot> plan, _Ctx ctx) {
    var total = 0;
    for (final slot in plan) {
      if (slot.optional) continue;
      final pool = _poolFor(slot, ctx);
      if (pool.isEmpty) continue;
      final bulk = pool.reduce((a, b) =>
          a.unitPrice / slot.coverageOf(a) <= b.unitPrice / slot.coverageOf(b)
              ? a
              : b);
      final cheapest =
          pool.reduce((a, b) => a.unitPrice <= b.unitPrice ? a : b);
      var covered = 0.0;
      while (covered < slot.need - 1e-6) {
        final remaining = slot.need - covered;
        final dish =
            slot.coverageOf(bulk) <= remaining + 0.75 ? bulk : cheapest;
        total += dish.unitPrice;
        covered += slot.coverageOf(dish);
      }
    }
    return total;
  }

  static int _step(int value) => value >= 5000 ? 1000 : 500;

  static int _roundUp(int value) {
    final step = _step(value);
    return ((value + step - 1) ~/ step) * step;
  }

  /// Одинаковые блюда — одной строкой со счётчиком, в порядке плана.
  static List<AssistantLine> _lines(List<_Pick> picks) {
    final order = <int>[];
    final counts = <int, int>{};
    final strongest = <int, _Pick>{};
    for (final pick in picks) {
      final id = pick.dish.id;
      if (!counts.containsKey(id)) order.add(id);
      counts[id] = (counts[id] ?? 0) + 1;
      final current = strongest[id];
      if (current == null || pick.strength > current.strength) {
        strongest[id] = pick;
      }
    }
    return [
      for (final id in order)
        AssistantLine(
          dish: strongest[id]!.dish,
          course: strongest[id]!.slot.course,
          count: counts[id]!,
          reason: strongest[id]!.reason,
        ),
    ];
  }

  List<AssistantNote> _notes(_Ctx ctx, List<AssistantLine> lines) {
    final drinks = [
      for (final line in lines)
        if (line.dish.isHotDrink != null) line.dish.isHotDrink!,
    ];
    return [
      AssistantNote(AssistantNoteKind.menu, value: dishCount),
      AssistantNote(AssistantNoteKind.time, time: ctx.time),
      if (ctx.season == _Season.cold && drinks.contains(true))
        const AssistantNote(AssistantNoteKind.cold),
      if (ctx.season == _Season.hot && drinks.contains(false))
        const AssistantNote(AssistantNoteKind.hot),
      if (ctx.preference != AssistantPreference.none)
        AssistantNote(
          AssistantNoteKind.preference,
          preference: ctx.preference,
        ),
      if (ctx.guests >= 2) const AssistantNote(AssistantNoteKind.portions),
      if (lines.length >= 2) const AssistantNote(AssistantNoteKind.pairing),
      if (ctx.budget != null)
        AssistantNote(AssistantNoteKind.budget, value: ctx.budget),
    ];
  }
}

enum _Season { cold, mild, hot }

enum _SlotKind { main, side, drink, dessert }

class _Ctx {
  const _Ctx({
    required this.request,
    required this.time,
    required this.season,
    required this.hour,
    required this.noise,
  });

  final AssistantRequest request;
  final AssistantTime time;
  final _Season season;
  final int hour;
  final Map<int, double> noise;

  AssistantMood get mood => request.mood;
  int get guests => math.max(1, request.guests);
  int? get budget => request.budget;
  AssistantPreference get preference => request.preference;
}

/// Часть заказа: основное, гарниры, напитки, десерты.
class _Slot {
  const _Slot(
    this.kind,
    this.roles,
    this.need, {
    this.shared = false,
    this.optional = false,
    this.missingPenalty = 0,
    this.accepts,
  });

  final _SlotKind kind;

  /// Подходящие роли по убыванию желательности.
  final List<DishRole> roles;

  /// Сужение внутри ролей: «Кофе» — только кофе, «Холодное» — только
  /// холодные напитки. null — любые блюда этих ролей.
  final bool Function(DishProfile dish)? accepts;

  /// Скольких человек нужно закрыть.
  final double need;

  /// Общее на стол: одна позиция — на двоих.
  final bool shared;

  /// Можно пропустить, если не влезает в бюджет.
  final bool optional;

  /// Сколько «полезности» теряет набор без этой части.
  final double missingPenalty;

  bool admits(DishProfile dish) =>
      roles.contains(dish.role) && (accepts?.call(dish) ?? true);

  double coverageOf(DishProfile dish) => dish.servings * (shared ? 2 : 1);

  AssistantCourse get course => switch (kind) {
        _SlotKind.main => AssistantCourse.main,
        _SlotKind.side => AssistantCourse.side,
        _SlotKind.drink => AssistantCourse.drink,
        _SlotKind.dessert => AssistantCourse.dessert,
      };
}

class _Pick {
  const _Pick(this.dish, this.slot, [this.reason, this.strength = 0]);

  final DishProfile dish;
  final _Slot slot;
  final AssistantReason? reason;
  final double strength;
}

class _Scored {
  const _Scored(this.dish, this.utility, this.reason, this.strength);

  final DishProfile dish;
  final double utility;
  final AssistantReason? reason;
  final double strength;
}

/// Частично собранный набор.
class _State {
  const _State({
    required this.picks,
    required this.cost,
    required this.score,
    required this.slot,
    required this.covered,
  });

  const _State.initial()
      : picks = const [],
        cost = 0,
        score = 0,
        slot = 0,
        covered = 0;

  final List<_Pick> picks;
  final int cost;
  final double score;

  /// Индекс текущей части плана.
  final int slot;

  /// Сколько человек в текущей части уже закрыто.
  final double covered;

  /// Полезность блюда весит столько, скольких гостей оно кормит: одно
  /// ассорти на четверых не должно проигрывать четырём отдельным блюдам
  /// только потому, что позиций меньше.
  _State add(_Pick pick, double utility, _Slot slot) {
    final remaining = slot.need - this.covered;
    final coverage = slot.coverageOf(pick.dish);
    final covered = this.covered + coverage;
    final complete = covered >= slot.need - 1e-6;
    return _State(
      picks: [...picks, pick],
      cost: cost + pick.dish.unitPrice,
      score: score + utility * math.min(coverage, remaining),
      slot: complete ? this.slot + 1 : this.slot,
      covered: complete ? 0 : covered,
    );
  }

  _State skip(double penalty) => _State(
        picks: picks,
        cost: cost,
        score: score - penalty,
        slot: slot + 1,
        covered: 0,
      );

  /// Один и тот же набор, собранный в разном порядке, — одно состояние.
  String get signature {
    final ids = [for (final p in picks) p.dish.id]..sort();
    return '$slot|${covered.toStringAsFixed(2)}|${ids.join(',')}';
  }
}
