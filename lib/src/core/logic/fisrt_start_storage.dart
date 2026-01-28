// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:shared_preferences/shared_preferences.dart';

abstract class FirstStartStorage {
  //save first start
  Future<void> saveFirst(String token);

  // delete
  void deleteFirst();

  // check exist/has
  bool hasFirst();

  // get token
  String? getFirstStart();
}

const String _firstStartKey = 'first_start';

class SharedPrefsFirstStartStorage implements FirstStartStorage {
  SharedPrefsFirstStartStorage({required final SharedPreferences preferences})
      : _preferences = preferences;

  // ignore: member-ordering-extended
  final SharedPreferences _preferences;

  @override
  Future<void> deleteFirst() async {
    // ignore: avoid-ignoring-return-values
    await _preferences.remove(_firstStartKey);
  }

  @override
  String? getFirstStart() => _preferences.getString(_firstStartKey);

  @override
  bool hasFirst() {
    /// Проверяем есть ли ключ, если нет возвращаем false
    if (!_preferences.containsKey(_firstStartKey)) {
      return false;
    } else {
      final first = _preferences.getString(_firstStartKey);

      return first != null ? true : false;
    }
  }

  @override
  Future<void> saveFirst(String token) async =>
      _preferences.setString(_firstStartKey, token);
}
