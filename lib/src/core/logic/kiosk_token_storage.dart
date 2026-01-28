import 'package:shared_preferences/shared_preferences.dart';

abstract class KTokenStorage {
  //save token
  Future<void> saveToken(String token);

  // delete token
  void deleteToken();

  // check token exist/has
  bool hasToken();

  // get token
  String? getToken();
}

const String _tokenKey = 'kiosk_token';

class SharedPrefsKTokenStorage implements KTokenStorage {
  SharedPrefsKTokenStorage({required final SharedPreferences preferences})
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

abstract class HostStorage {
  //save host
  Future<void> saveHost(String host);

  // delete host
  void deleteHost();

  // check host exist/has
  bool hasHost();

  // get host
  String? getHost();
}

const String _hostKey = 'host_name';

class SharedPrefsHostStorage implements HostStorage {
  SharedPrefsHostStorage({required final SharedPreferences preferences})
      : _preferences = preferences;

  // ignore: member-ordering-extended
  final SharedPreferences _preferences;

  @override
  Future<void> saveHost(String host) async =>
      _preferences.setString(_hostKey, host);

  @override
  Future<void> deleteHost() async {
    // ignore: avoid-ignoring-return-values
    await _preferences.remove(_hostKey);
  }

  @override
  String? getHost() => _preferences.getString(_hostKey);

  @override
  bool hasHost() {
    /// Проверяем есть ли ключ, если нет возвращаем false
    if (!_preferences.containsKey(_hostKey)) {
      return false;
    } else {
      final host = _preferences.getString(_hostKey);

      return host != null ? true : false;
    }
  }
}
