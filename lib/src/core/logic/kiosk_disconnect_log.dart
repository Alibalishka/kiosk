import 'dart:developer';

import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Записывает, почему планшет вернули к подключению.
///
/// Обычный лог в релизе не выводится, а история Talker живёт в памяти
/// процесса и переживает переход на экран регистрации: по ней видно, что
/// именно отключило киоск.
void logKioskDisconnect(String reason) {
  final message = '[KIOSK] disconnect: $reason';
  log(message);
  if (sl.isRegistered<Talker>()) sl<Talker>().warning(message);
}
