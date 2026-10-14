import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/core/logic/locale_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Future<SharedPreferences> prefsWith(Map<String, Object> values) {
    SharedPreferences.setMockInitialValues(values);
    return SharedPreferences.getInstance();
  }

  test('запросы уходят на языке интерфейса', () async {
    final prefs = await prefsWith({'locale': 'kk'});
    expect(apiLanguage(prefs), 'kk');
  });

  test('язык не выбран — русский', () async {
    final prefs = await prefsWith({});
    expect(apiLanguage(prefs), 'ru');
  });

  test('китайский меняет интерфейс, а запросы остаются на прежнем языке',
      () async {
    final prefs = await prefsWith({'locale': 'kk'});
    saveLocale(prefs, 'zh');
    expect(prefs.getString('locale'), 'zh');
    expect(apiLanguage(prefs), 'kk');
  });

  test('повторный выбор китайского не теряет язык запросов', () async {
    final prefs = await prefsWith({'locale': 'en'});
    saveLocale(prefs, 'zh');
    saveLocale(prefs, 'zh');
    expect(apiLanguage(prefs), 'en');
  });

  test('с китайского на другой язык — запросы на новом языке', () async {
    final prefs = await prefsWith({'locale': 'kk'});
    saveLocale(prefs, 'zh');
    saveLocale(prefs, 'en');
    expect(apiLanguage(prefs), 'en');
  });

  test('китайский без прежнего выбора — запросы на русском', () async {
    final prefs = await prefsWith({});
    saveLocale(prefs, 'zh');
    expect(apiLanguage(prefs), 'ru');
  });
}
