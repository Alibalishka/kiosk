import 'package:flutter/widgets.dart';
import 'package:qr_pay_app/src/core/widgets/safe_network_image.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';

/// Целевой размер (физ. пиксели) для imgproxy под hero на ProductPage.
///
/// [heightFraction] должен совпадать с `expandedHeight: 55.h` в sizer (55% высоты экрана).
({int widthPx, int heightPx}) qrPayHeroImageProxyPixels(
  BuildContext context, {
  double heightFraction = 0.55,
}) {
  final size = MediaQuery.sizeOf(context);
  final dpr = MediaQuery.devicePixelRatioOf(context);
  int clampPx(int v) => v.clamp(256, 4096);
  final widthPx = clampPx((size.width * dpr).round());
  final heightPx = clampPx((size.height * heightFraction * dpr).round());
  return (widthPx: widthPx, heightPx: heightPx);
}

/// Для прокси `img.qrpay.kz/insecure/.../h:…/w:…/…/q:…/` подменяет размеры и качество;
/// иначе возвращает исходный URL без изменений.
///
/// [targetWidthPx] и [targetHeightPx]: если заданы **оба**, подставляются как `w` и `h`;
/// иначе используется запасной вариант 1500×1500 (вызовы без контекста / старое поведение).
String normalizeQrPayInsecureImageUrl(
  String url, {
  int? targetWidthPx,
  int? targetHeightPx,
}) {
  if (url.isEmpty) return url;
  const marker = 'img.qrpay.kz/insecure/';
  if (!url.toLowerCase().contains(marker)) return url;

  final hasH = RegExp(r'h:\d+').hasMatch(url);
  final hasW = RegExp(r'w:\d+').hasMatch(url);
  final hasQ = RegExp(r'q:\d+').hasMatch(url);
  if (!hasH || !hasW || !hasQ) return url;

  final w =
      targetWidthPx != null && targetHeightPx != null ? targetWidthPx : 1500;
  final h =
      targetWidthPx != null && targetHeightPx != null ? targetHeightPx : 1500;

  return url
      .replaceFirst(RegExp(r'h:\d+'), 'h:$h')
      .replaceFirst(RegExp(r'w:\d+'), 'w:$w')
      .replaceFirst(RegExp(r'q:\d+'), 'q:90');
}

/// Единая точка выбора URL картинки для [ImageDatum].
///
/// Порядок приоритетов фиксирован: `path` → `file` → `filePreview` → `image`.
/// Все виджеты и precache **обязаны** использовать эту функцию,
/// чтобы URL совпадал и кеш попадал.
String resolveImageDatumUrl(ImageDatum? img) {
  if (img == null) return '';
  final candidates = <String?>[
    img.path,
    img.file,
    img.filePreview,
    img.image,
  ];
  for (final c in candidates) {
    final v = c?.trim() ?? '';
    if (v.isNotEmpty) return v;
  }
  return '';
}

/// Предзагружает картинку товара с тем же URL, который использует ProductPage
/// (приоритет `file` → `path`, + normalizeQrPayInsecureImageUrl).
/// Вызывать при тапе на товар **перед** навигацией.
void precacheProductPageImage(BuildContext context, Items item) {
  final images = item.image;
  if (images == null || images.isEmpty) return;

  final img = images.first;
  final rawUrl = img.file?.trim() ?? img.path?.trim() ?? '';
  if (rawUrl.isEmpty) return;

  final px = qrPayHeroImageProxyPixels(context);
  final url = normalizeQrPayInsecureImageUrl(
    rawUrl,
    targetWidthPx: px.widthPx,
    targetHeightPx: px.heightPx,
  );

  // ignore: avoid_dynamic_calls
  precacheUrl(url);
}
