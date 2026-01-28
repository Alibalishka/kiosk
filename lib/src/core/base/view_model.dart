import 'package:flutter/cupertino.dart';

/// Базовый класс для всех делегатов презентационной логики
class ViewModel extends ChangeNotifier with WidgetsBindingObserver {
  /// Метод который будет вызыватся в initState
  void init() {}
}
