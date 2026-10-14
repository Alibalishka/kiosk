import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _localeKey = 'locale';
const _apiLocaleKey = 'apiLocale';

/// Сохраняет язык интерфейса. Перед переходом на язык только интерфейса
/// ([AppLanguages.uiOnly]) запоминает прежний: на нём и дальше уходят
/// запросы, поэтому меню остаётся таким, каким было.
///
/// Без await, как и раньше: SharedPreferences обновляет кеш сразу, и
/// [apiLanguage] видит новый язык уже в следующей строке.
void saveLocale(SharedPreferences prefs, String code) {
  final previous = _code(prefs.getString(_localeKey));
  if (AppLanguages.uiOnly.contains(code) &&
      previous != null &&
      !AppLanguages.uiOnly.contains(previous)) {
    prefs.setString(_apiLocaleKey, previous);
  }
  prefs.setString(_localeKey, code);
}

/// Язык для Accept-Language: язык интерфейса, а если бэкенд его не знает —
/// тот, что был выбран до него.
String apiLanguage(SharedPreferences prefs) {
  final locale = _code(prefs.getString(_localeKey)) ?? AppLanguages.ru;
  if (!AppLanguages.uiOnly.contains(locale)) return locale;
  return _code(prefs.getString(_apiLocaleKey)) ?? AppLanguages.ru;
}

String? _code(String? locale) => locale?.split('_')[0];
