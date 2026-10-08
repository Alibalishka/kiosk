import 'dart:math' as math;

import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';

/// Добавка «по одной на каждого гостя» — например, соус к хого.
///
/// Отдельного признака сервер не присылает, поэтому узнаём её по тому, как
/// такую добавку заводят в кассе: обязательная группа из одной позиции, которую
/// можно взять несколько раз, и в названии прямо сказано про гостей
/// («-1гость=1 соус»). Совпало всё — киоск спрашивает «Сколько вас?» вместо
/// голого счётчика. Не совпало хоть что-то — группа показывается как обычно,
/// с теми же проверками минимума и максимума, поэтому чужое меню не сломается.
abstract final class PerGuestModifiers {
  /// Буквы, которые продолжают слово: «гостевой» — не «гость», «персонал» —
  /// не «персона», «ГОСТ» — вообще не про гостей.
  static const _letters = 'a-zа-яёәғқңөұүһі';

  static final RegExp _guestWords = RegExp(
    '(?<![$_letters])(?:'
    // ru: гость в любом падеже, человек, «чел.», персона.
    'гост(?:ь|я|ю|ем|е|и|ей|ям|ями|ях)|человек(?:а|у|ом|е)?|чел'
    '|персон(?:а|ы|е|у|ой)?'
    // kk: қонақ, адам — с любыми окончаниями.
    '|қонақ[$_letters]*|адам[$_letters]*'
    // en
    '|guests?|persons?|people|pax'
    ')(?![$_letters])'
    // zh: «на каждого», «по числу людей».
    '|每人|每位|按人',
  );

  static final RegExp _leadingMarks = RegExp(r'^[\s\-–—*•.]+');

  /// Группа «по одной на каждого гостя»?
  static bool matches(Modifier group) {
    final options = group.items;
    if (options == null || options.length != 1) return false;
    // Счётчик, а не выбор одного варианта.
    if ((group.max ?? 0) <= 1) return false;

    final option = options.first;
    // Необязательную группу гость вправе пропустить — переспрашивать не о чем.
    final isRequired = (group.min ?? 0) >= 1 ||
        group.required == true ||
        option.requiredSelect == true;
    if (!isRequired) return false;

    final text = [
      group.name,
      group.description,
      option.name,
      option.description,
    ].whereType<String>().join(' ').toLowerCase();
    return _guestWords.hasMatch(text);
  }

  /// Такие группы блюда, в порядке меню.
  static List<Modifier> of(Items item) => [
        for (final group in item.modifiers ?? const <Modifier>[])
          if (matches(group)) group,
      ];

  /// Сколько гостей можно указать, чтобы каждая группа уложилась в свои
  /// пределы: касса не примет меньше минимума и больше максимума.
  static ({int min, int max}) guestRange(List<Modifier> groups) {
    var low = 1;
    int? high;
    for (final group in groups) {
      low = math.max(low, group.min ?? 1);
      final max = group.max ?? 0;
      if (max > 0) high = high == null ? max : math.min(high, max);
    }
    return (min: low, max: math.max(low, high ?? low));
  }

  /// Выбор группы на [guests] гостей — та же позиция [guests] раз, как её
  /// складывает обычный счётчик модификаторов.
  ///
  /// null — гость ещё не ответил: группа пустая, и добавить блюдо без
  /// добавки не даст проверка минимума в корзине.
  static Modifier selection(Modifier group, int? guests) {
    final option = group.items!.first;
    final count = guests == null
        ? 0
        : math.min(math.max(guests, group.min ?? 0), group.max ?? guests);
    return Modifier(
      id: group.id,
      name: group.name,
      min: group.min,
      max: group.max,
      posId: group.posId,
      // count = 1: в кассу уходит по штуке на каждую запись
      // (BasketService.buildCheckoutRequest), то есть ровно по числу гостей.
      items: List.filled(count, option.copyWith(count: 1)),
    );
  }

  /// Что подаётся каждому гостю — без кассовых пометок вроде «-» в начале.
  static String names(List<Modifier> groups) => groups
      .map((group) => (group.items?.first.name ?? '')
          .replaceFirst(_leadingMarks, '')
          .trim())
      .where((name) => name.isNotEmpty)
      .join(', ');

  /// Сколько добавки стоят на одного гостя.
  static int pricePerGuest(List<Modifier> groups) =>
      groups.fold(0, (sum, group) => sum + (group.items?.first.price ?? 0));
}
