import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';

/// Компактный бейдж номера стола для тулбара меню.
///
/// Тёмная плашка: слева иконка стола, подпись «СТОЛ» и название зала,
/// справа — крупный номер на белом чипе. Номер читается с расстояния,
/// а сама плашка одинаково смотрится и на белом фоне, и поверх картинки
/// в раскрытом заголовке.
class KioskTableBadge extends StatelessWidget {
  const KioskTableBadge({
    super.key,
    required this.groupName,
    required this.number,
  });

  final String? groupName;
  final String? number;

  @override
  Widget build(BuildContext context) {
    final g = groupName?.trim() ?? '';
    final n = number?.trim() ?? '';
    if (g.isEmpty && n.isEmpty) return const SizedBox.shrink();

    final label = LocaleKeys.table.tr().toUpperCase();

    return Padding(
      padding: const EdgeInsets.only(right: 12),
      // AppBar растягивает actions по высоте тулбара — Center возвращает
      // плашке её собственную высоту.
      child: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.primitiveNeutralcold1000.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.primitiveNeutralcold0.withValues(alpha: 0.14),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppSvgImages.tableRound,
                  width: 18,
                  height: 18,
                  color: AppColors.primitiveNeutralcold0.withValues(alpha: 0.7),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: AppTextStyles.bodyXsStrong.copyWith(
                        color: AppColors.primitiveNeutralcold0
                            .withValues(alpha: 0.6),
                        letterSpacing: 1.4,
                        height: 1,
                      ),
                    ),
                    if (g.isNotEmpty) ...[
                      const SizedBox(height: 3),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 160),
                        child: Text(
                          g,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.bodyMStrong.copyWith(
                            color: AppColors.primitiveNeutralcold0,
                            height: 1.1,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                if (n.isNotEmpty) ...[
                  const SizedBox(width: 12),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.primitiveNeutralcold0,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      child: Text(
                        n,
                        style: AppTextStyles.headingH2.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primitiveNeutralcold1000,
                          height: 1.1,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Номер стола поверх рекламы — «номерок».
///
/// Без плашек и рамок, чтобы не спорить с роликом: крупный белый номер
/// в правом нижнем углу, над ним название зала капсом.
/// Читаемость на светлых роликах даёт мягкий тёмный градиент снизу и тень
/// под текстом. Виджет сам рисует градиент на всю ширину — ставится
/// `Positioned(left: 0, right: 0, bottom: 0)`.
class KioskTableOverlayBadge extends StatelessWidget {
  const KioskTableOverlayBadge({
    super.key,
    required this.groupName,
    required this.number,
  });

  final String? groupName;
  final String? number;

  @override
  Widget build(BuildContext context) {
    final g = groupName?.trim() ?? '';
    final n = number?.trim() ?? '';
    if (g.isEmpty && n.isEmpty) return const SizedBox.shrink();

    const white = AppColors.primitiveNeutralcold0;
    const black = AppColors.primitiveNeutralcold1000;

    // Герой — номер; если его нет, крупно показываем зал.
    // Подпись — только зал над номером, без слова «стол».
    final hero = n.isNotEmpty ? n : g;
    final caption = n.isNotEmpty ? g : '';

    final shadows = [
      Shadow(
        color: black.withValues(alpha: 0.45),
        blurRadius: 24,
        offset: const Offset(0, 4),
      ),
    ];

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
      builder: (context, t, child) => Opacity(
        opacity: t,
        child: Transform.translate(
          offset: Offset(0, (1 - t) * 16),
          child: child,
        ),
      ),
      // Оверлей рекламы лежит вне Scaffold — без Material текст получает
      // дефолтный стиль с жёлтым подчёркиванием.
      child: Material(
        type: MaterialType.transparency,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 0.45, 1],
              colors: [
                black.withValues(alpha: 0),
                black.withValues(alpha: 0.22),
                black.withValues(alpha: 0.6),
              ],
            ),
          ),
          child: SafeArea(
            top: false,
            minimum: const EdgeInsets.fromLTRB(28, 96, 28, 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (caption.isNotEmpty) ...[
                  Text(
                    caption.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: AppTextStyles.bodyLStrong.copyWith(
                      color: white.withValues(alpha: 0.85),
                      letterSpacing: 2,
                      height: 1,
                      shadows: shadows,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  hero,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: AppTextStyles.title.copyWith(
                    fontSize: n.isNotEmpty ? 96 : 48,
                    fontWeight: FontWeight.w800,
                    color: white,
                    height: 1,
                    letterSpacing: n.isNotEmpty ? -2 : 0,
                    shadows: shadows,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
