import 'package:shared_preferences/shared_preferences.dart';

abstract class IWordStorage {
  Future<void> saveWords(String words);
  Future<void> deleteWords();
  bool hasWords();
  String? getWords();
}

const String _wordsKey = 'city_id';

class SharedPrefsWordStorage implements IWordStorage {
  SharedPrefsWordStorage({required final SharedPreferences preferences})
      : _preferences = preferences;

  final SharedPreferences _preferences;

  @override
  Future<void> deleteWords() async {
    await _preferences.remove(_wordsKey);
  }

  @override
  String? getWords() => _preferences.getString(_wordsKey);

  @override
  bool hasWords() {
    if (!_preferences.containsKey(_wordsKey)) {
      return false;
    } else {
      final words = _preferences.getStringList(_wordsKey);
      return words != null ? true : false;
    }
  }

  @override
  Future<void> saveWords(String words) async =>
      _preferences.setString(_wordsKey, words);
}
