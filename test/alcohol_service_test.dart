import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/service/alcohol_service.dart';

void main() {
  const service = AlcoholService();

  group('isAlcoholCategoryName', () {
    test('распознаёт алкогольные категории на трёх языках', () {
      for (final name in [
        'Пиво',
        'Водка',
        'Виски',
        'Вино',
        'Коньяк',
        'Ром',
        'Джин',
        'Текила',
        'Шампанское',
        'Ликёры',
        'Алкогольные напитки',
        'Крафтовое пиво',
        'Винная карта',
        'Сыра',
        'Арақ',
        'Шарап',
        'Beer',
        'Whiskey',
        'Red wine',
        'Alcohol',
      ]) {
        expect(service.isAlcoholCategoryName(name), isTrue, reason: name);
      }
    });

    test('не трогает обычные категории', () {
      for (final name in [
        'Кофе',
        'Горячие напитки',
        'Вода',
        'Energy drinks',
        'Ромашковый чай',
        'Виноградный сок',
        'Винегрет',
        'Десерты',
        'Coffee',
      ]) {
        expect(service.isAlcoholCategoryName(name), isFalse, reason: name);
      }
    });

    test('безалкогольные категории не считаются алкогольными', () {
      for (final name in [
        'Безалкогольные напитки',
        'Безалкогольное пиво',
        'Алкогольсіз сусындар',
        'Non-alcoholic beer',
        'Alcohol-free',
      ]) {
        expect(service.isAlcoholCategoryName(name), isFalse, reason: name);
      }
    });

    test('смешанное название с «алкогольные» всё равно алкогольное', () {
      expect(
        service.isAlcoholCategoryName('Алкогольные и безалкогольные напитки'),
        isTrue,
      );
    });

    test('null и пустая строка — не алкоголь', () {
      expect(service.isAlcoholCategoryName(null), isFalse);
      expect(service.isAlcoholCategoryName(''), isFalse);
    });
  });

  group('isAlcoholItem', () {
    final vodka = Items(id: 1, name: 'Чистые росы 50 мл');
    final coffee = Items(id: 2, name: 'Латте');
    final recommended = Items(id: 3, name: 'Байдзю');

    final menu = QrMenuModel(
      data: [
        QrMenuDatum(id: 10, name: 'Кофе', items: [coffee]),
        QrMenuDatum(
          id: 11,
          name: 'Водка',
          items: [vodka],
          recommend: [recommended],
        ),
      ],
    );

    test('товар из алкогольной категории', () {
      expect(service.isAlcoholItem(menu, vodka), isTrue);
    });

    test('товар из рекомендаций алкогольной категории', () {
      expect(service.isAlcoholItem(menu, recommended), isTrue);
    });

    test('товар из обычной категории', () {
      expect(service.isAlcoholItem(menu, coffee), isFalse);
    });

    test('нет меню или id — не алкоголь', () {
      expect(service.isAlcoholItem(null, vodka), isFalse);
      expect(service.isAlcoholItem(menu, Items(name: 'без id')), isFalse);
    });
  });
}
