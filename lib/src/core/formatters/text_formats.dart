/// Первое слово — всегда с заглавной буквы, остальные строчные.
/// Со второго слова: если слово целиком в верхнем регистре — та же схема
/// (одна заглавная, остальные строчные); если уже в нижнем — не поднимаем регистр;
/// смешанный регистр — нормализуем (первая заглавная, дальше строчные).
String formatMenuItemTitle(String? raw) {
  if (raw == null || raw.isEmpty) return raw ?? '';

  String oneWordTitleCase(String word) {
    if (word.isEmpty) return word;
    final lower = word.toLowerCase();
    return lower[0].toUpperCase() + lower.substring(1);
  }

  final words = raw.trim().split(RegExp(r'\s+'));
  final out = <String>[];
  for (var i = 0; i < words.length; i++) {
    final word = words[i];
    if (word.isEmpty) continue;

    if (i == 0) {
      out.add(oneWordTitleCase(word));
      continue;
    }

    final isAllUpper = word == word.toUpperCase() && word != word.toLowerCase();
    final isAllLower = word == word.toLowerCase();

    if (isAllUpper) {
      out.add(oneWordTitleCase(word));
    } else if (isAllLower) {
      out.add(word.toLowerCase());
    } else {
      out.add(oneWordTitleCase(word));
    }
  }
  return out.join(' ');
}
