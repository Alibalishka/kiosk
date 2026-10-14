// ignore_for_file: prefer-correct-identifier-length

part of 'resources.dart';

/// Все языки поддерживаемые приложением описаны здесь
abstract class AppLanguages {
  static const String kk = 'kk';

  static const String ru = 'ru';

  static const String en = 'en';

  static const String zh = 'zh';

  /// Языки только интерфейса: бэкенд их не знает, поэтому запросы уходят на
  /// прежнем языке, а меню и всё, что приходит с сервера, не меняется.
  static const Set<String> uiOnly = {zh};

  /// Меню, где гостю предлагают китайский. У остальных его нет в списке
  /// языков.
  static const Set<int> zhMenuIds = {136341};

  AppLanguages._();
}
