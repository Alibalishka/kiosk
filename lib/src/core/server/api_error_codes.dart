/// Машинные коды ошибок 400, на которые приложение реагирует по-разному.
abstract class ApiErrorCodes {
  /// Касса занята другим заказом этого стола — повторить через 2–3 с с тем
  /// же Idempotency-Key.
  static const String payAtVenueBusy = 'pay_at_venue_busy';

  /// Заказ не дошёл до кассы — гостю нужен официант.
  static const String payAtVenuePosFailed = 'pay_at_venue_pos_failed';

  /// Неизвестно, дошёл ли дозаказ до кассы, — гостю нужен официант.
  static const String payAtVenueRoundUnknown = 'pay_at_venue_round_unknown';

  /// Онлайн-оплату (карта, Kaspi) в заведении выключили.
  static const String onlinePaymentDisabled = 'online_payment_disabled';

  static const Set<String> all = {
    payAtVenueBusy,
    payAtVenuePosFailed,
    payAtVenueRoundUnknown,
    onlinePaymentDisabled,
  };

  static bool isKnown(String? value) => all.contains(value?.trim());

  /// Известный код из тела ответа. Контракт называет коды, но не поле, в
  /// котором они приходят (текст — в `data.message`), поэтому ищем по всему
  /// телу: и в значениях, и в ключах.
  static String? find(Object? body) {
    if (body is String) return isKnown(body) ? body.trim() : null;
    if (body is Map) {
      for (final entry in body.entries) {
        final key = entry.key;
        if (key is String && isKnown(key)) return key.trim();
        final nested = find(entry.value);
        if (nested != null) return nested;
      }
    }
    if (body is List) {
      for (final value in body) {
        final nested = find(value);
        if (nested != null) return nested;
      }
    }
    return null;
  }

  ApiErrorCodes._();
}
