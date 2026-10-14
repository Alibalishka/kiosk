import 'package:flutter/services.dart';

/// Вызовы из нативной части по каналу `dpc` (managedConfigChanged).
///
/// Обработчик у канала один, а слушают его и экран регистрации, и меню. При
/// `replaceAll` новая страница подписывается раньше, чем закрывается старая,
/// поэтому старая снимает обработчик, только если он всё ещё её, — иначе
/// новая страница перестала бы получать вызовы.
abstract final class DpcCalls {
  static const MethodChannel _channel = MethodChannel('dpc');

  static Object? _owner;

  static void listen(
    Object owner,
    Future<dynamic> Function(MethodCall call) handler,
  ) {
    _owner = owner;
    _channel.setMethodCallHandler(handler);
  }

  static void cancel(Object owner) {
    if (!identical(_owner, owner)) return;
    _owner = null;
    _channel.setMethodCallHandler(null);
  }
}
