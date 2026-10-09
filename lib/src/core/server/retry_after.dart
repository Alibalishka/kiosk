import 'dart:io';

/// Значение заголовка Retry-After: число секунд или HTTP-дата. null — если
/// заголовка нет или его не разобрать.
Duration? parseRetryAfter(String? value, {DateTime? now}) {
  final raw = value?.trim();
  if (raw == null || raw.isEmpty) return null;

  final seconds = int.tryParse(raw);
  if (seconds != null) return seconds < 0 ? null : Duration(seconds: seconds);

  try {
    final wait = HttpDate.parse(raw).difference(now ?? DateTime.now());
    return wait.isNegative ? Duration.zero : wait;
  } on Exception {
    return null;
  }
}
