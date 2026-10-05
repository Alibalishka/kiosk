import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';

/// Определяет, относится ли товар к алкогольной категории.
///
/// У товара нет признака «алкоголь» — сервер отдаёт только названия категорий,
/// поэтому ориентируемся на них. Слова лежат здесь одним местом: появится
/// категория с другим названием — достаточно дописать слово сюда.
class AlcoholService {
  const AlcoholService();

  /// Слова, которые должны совпасть с токеном названия целиком: короткие и
  /// двусмысленные («ром» в «Ромашке»), по префиксу их искать нельзя.
  static const Set<String> _exactWords = {
    // ru
    'пиво', 'пива', 'пиве', 'пиву', 'пивом',
    'вино', 'вина', 'вине', 'вину', 'вином',
    'ром', 'рома', 'джин', 'джина', 'саке', 'сидр', 'сидры',
    // kk
    'сыра', 'шарап', 'шарабы', 'арақ', 'арағы', 'арак',
    // en
    'beer', 'beers', 'wine', 'wines', 'rum', 'gin', 'sake', 'cider',
  };

  /// Корни, по которым достаточно начала токена: такое слово в названии
  /// категории практически не бывает ничем, кроме алкоголя.
  static const List<String> _stems = [
    // ru / kk
    'алкогол', 'пивн', 'винн', 'водк', 'виски', 'коньяк', 'бренди', 'текил',
    'ликер', 'шампан', 'игрист', 'вермут', 'абсент', 'настойк', 'спиртн',
    'самбук', 'граппа',
    // en
    'alcohol', 'spirits', 'liquor', 'liqueur', 'vodka', 'whisk', 'brandy',
    'cognac', 'tequila', 'champagne',
  ];

  /// Корни самого слова «алкоголь»: только они спасают смешанное название вида
  /// «Алкогольные и безалкогольные напитки» от выбраковки.
  static const List<String> _alcoholRoots = ['алкогол', 'alcohol'];

  /// «Безалкогольное пиво», «Алкогольсіз сусындар», «Non-alcoholic beer» —
  /// такие слова вырезаются, а название с ними считается безалкогольным, если
  /// рядом нет самостоятельного «алкоголь».
  static final RegExp _nonAlcoholic = RegExp(
    r'без\s*алкогол\p{L}*|алкогольсіз\p{L}*|non[\s-]?alcoholic|alcohol[\s-]?free',
    unicode: true,
  );

  static final RegExp _separators = RegExp(r'[^\p{L}\p{N}]+', unicode: true);

  /// Название категории про алкоголь?
  bool isAlcoholCategoryName(String? name) {
    if (name == null) return false;

    final normalized = name.toLowerCase().replaceAll('ё', 'е');
    final cleaned = normalized.replaceAll(_nonAlcoholic, ' ');
    final hasNonAlcoholicMarker = cleaned != normalized;

    final tokens = cleaned.split(_separators).where((t) => t.isNotEmpty);

    if (hasNonAlcoholicMarker) {
      return tokens.any((t) => _alcoholRoots.any(t.startsWith));
    }

    return tokens.any(
      (t) => _exactWords.contains(t) || _stems.any(t.startsWith),
    );
  }

  /// Лежит ли [item] в какой-нибудь алкогольной категории меню.
  bool isAlcoholItem(QrMenuModel? menu, Items item) {
    final id = item.id;
    final categories = menu?.data;
    if (id == null || categories == null) return false;

    bool contains(List<Items>? list) => list?.any((i) => i.id == id) ?? false;

    return categories.any(
      (category) =>
          isAlcoholCategoryName(category.name) &&
          (contains(category.items) ||
              contains(category.recommend) ||
              contains(category.featured)),
    );
  }
}
