import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:toyville/src/common/dependencies/app_dependencies.dart';
// import 'package:toyville/src/common/dependencies/app_dependencies_scope.dart';

/// Контекст экстеншны
extension BuildContextX on BuildContext {
  /// Полуиить зависимости через контекст
  // IAppDependencies get dependencies =>
  //     AppDependenciesScope.dependenciesOf(this);

  /// Получить MediaQuery через контекст
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;

  /// Получить тему через контекст
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

    /// Проверка: на desktop
  bool get isDesktop {
    return [
      TargetPlatform.macOS,
      TargetPlatform.windows,
      TargetPlatform.linux,
    ].contains(defaultTargetPlatform);
  }

  /// Перевести через контекст
  // AppLocalizations? get localized => AppLocalizations.of(this);
}
