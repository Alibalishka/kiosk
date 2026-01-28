// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:shared_preferences/shared_preferences.dart';

abstract class ITokenStorage {
  //save token
  Future<void> saveToken(String token);

  // delete token
  void deleteToken();

  // check token exist/has
  bool hasToken();

  // get token
  String? getToken();
}

const String _tokenKey = 'user_token';

class SharedPrefsTokenStorage implements ITokenStorage {
  SharedPrefsTokenStorage({required final SharedPreferences preferences})
      : _preferences = preferences;

  // ignore: member-ordering-extended
  final SharedPreferences _preferences;

  @override
  Future<void> deleteToken() async {
    // ignore: avoid-ignoring-return-values
    await _preferences.remove(_tokenKey);
  }

  @override
  String? getToken() => _preferences.getString(_tokenKey);

  @override
  bool hasToken() {
    /// Проверяем есть ли ключ, если нет возвращаем false
    if (!_preferences.containsKey(_tokenKey)) {
      return false;
    } else {
      final token = _preferences.getString(_tokenKey);

      return token != null ? true : false;
    }
  }

  @override
  Future<void> saveToken(String token) async =>
      _preferences.setString(_tokenKey, token);
}
