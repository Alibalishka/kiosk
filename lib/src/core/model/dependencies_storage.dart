import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Интерфейс для имплементации зависимостей
abstract class IDependenciesStorage {
  SharedPreferences get sharedPreferences;
  PackageInfo get packageInfo;

  void close();
}

class DependenciesStorage implements IDependenciesStorage {
  @override
  final SharedPreferences sharedPreferences;
  @override
  final PackageInfo packageInfo;

  DependenciesStorage({
    required this.sharedPreferences,
    required this.packageInfo,
  });

  @override
  void close() {}
}
