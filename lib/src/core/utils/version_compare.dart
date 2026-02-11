int compareSemver(String a, String b) {
  List<int> parse(String v) {
    // "2.7.6" или "2.7.6+10" или "2.7.6-beta" -> берём только цифры
    final clean = v.split('+').first.split('-').first.trim();
    final parts = clean.split('.');
    return [
      int.tryParse(parts.elementAtOrNull(0) ?? '0') ?? 0,
      int.tryParse(parts.elementAtOrNull(1) ?? '0') ?? 0,
      int.tryParse(parts.elementAtOrNull(2) ?? '0') ?? 0,
    ];
  }

  final pa = parse(a);
  final pb = parse(b);

  for (var i = 0; i < 3; i++) {
    if (pa[i] != pb[i]) return pa[i].compareTo(pb[i]); // -1,0,1
  }
  return 0;
}

extension _SafeIndex on List<String> {
  String? elementAtOrNull(int i) => (i >= 0 && i < length) ? this[i] : null;
}
