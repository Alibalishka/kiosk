import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/custom_button2.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/service/per_guest_modifiers.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

/// «1гость=1 соус — +1 000 ₸ на каждого гостя»: что и почём подаётся каждому.
String guestCountHint(List<Modifier> groups) {
  final price = PerGuestModifiers.pricePerGuest(groups);
  final perGuest = price > 0
      ? LocaleKeys.guestCountPerGuestPrice
          .tr(namedArgs: {'price': priceFormat('$price')})
      : LocaleKeys.guestCountPerGuest.tr();
  final names = PerGuestModifiers.names(groups);
  return names.isEmpty ? perGuest : '$names — $perGuest';
}

/// «Сколько вас?»: числа одним касанием и «9+» для компании побольше.
///
/// Всё в одну строку на всю ширину: кнопки делят её поровну. На узком
/// экране чисел меньше, но строка не переносится. «9+» открывает под строкой
/// счётчик до максимума группы.
class GuestCountPicker extends StatelessWidget {
  const GuestCountPicker({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.size = 64,
  });

  /// null — гость ещё не ответил, ничего не выделено.
  final int? value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  /// Высота кнопок.
  final double size;

  static const quickCount = 8;
  static const _gap = 12.0;

  /// Уже — палец промахивается, а «9+» не помещается.
  static const _minCellWidth = 44.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : (quickCount + 1) * (size + _gap);
        final fits = math.max(
          2,
          ((width + _gap) / (_minCellWidth + _gap)).floor(),
        );

        var quickMax = math.min(quickCount, max);
        var hasMore = max > quickMax;
        if (quickMax + (hasMore ? 1 : 0) > fits) {
          quickMax = fits - 1;
          hasMore = true;
        }

        final current = value;
        final isMore = hasMore && current != null && current > quickMax;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                for (var n = 1; n <= quickMax; n++) ...[
                  if (n > 1) const SizedBox(width: _gap),
                  Expanded(
                    child: _GuestChip(
                      label: '$n',
                      size: size,
                      selected: current == n,
                      enabled: n >= min,
                      onTap: () => onChanged(n),
                    ),
                  ),
                ],
                if (hasMore) ...[
                  const SizedBox(width: _gap),
                  Expanded(
                    child: _GuestChip(
                      label: '${quickMax + 1}+',
                      size: size,
                      selected: isMore,
                      enabled: true,
                      onTap: () {
                        if (!isMore) onChanged(math.max(quickMax + 1, min));
                      },
                    ),
                  ),
                ],
              ],
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              alignment: Alignment.topCenter,
              child: isMore
                  ? Padding(
                      padding: const EdgeInsets.only(top: _gap),
                      child: _GuestStepper(
                        value: current,
                        min: math.max(min, 1),
                        max: max,
                        size: size,
                        onChanged: onChanged,
                      ),
                    )
                  : const SizedBox(width: double.infinity),
            ),
          ],
        );
      },
    );
  }
}

class _GuestChip extends StatelessWidget {
  const _GuestChip({
    required this.label,
    required this.size,
    required this.selected,
    required this.enabled,
    required this.onTap,
  });

  final String label;
  final double size;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.3,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: enabled ? onTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          height: size,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: selected
                ? AppColors.primitiveNeutralwarm1000
                : AppComponents.buttongroupButtonGrayBgColorDefault,
          ),
          child: Center(
            // Узкая кнопка: «9+» уменьшается, а не обрезается.
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                maxLines: 1,
                style: AppTextStyles.bodyXlStrong.copyWith(
                  fontSize: size * 0.36,
                  color: selected
                      ? AppColors.primitiveNeutralcold0
                      : AppComponents.buttongroupButtonGrayIconColorDefault,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Компания больше чисел в строке: точное количество — счётчиком под ней.
class _GuestStepper extends StatelessWidget {
  const _GuestStepper({
    required this.value,
    required this.min,
    required this.max,
    required this.size,
    required this.onChanged,
  });

  final int value;
  final int min;
  final int max;
  final double size;
  final ValueChanged<int> onChanged;

  Widget _button(String icon, int? next) {
    final enabled = next != null;
    return Opacity(
      opacity: enabled ? 1 : 0.3,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: enabled ? () => onChanged(next) : null,
        child: SizedBox(
          width: size * 1.5,
          height: size,
          child: Center(
            child: SvgPicture.asset(
              icon,
              height: size * 0.36,
              color: AppComponents.buttongroupButtonGrayIconColorDefault,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppComponents.buttongroupButtonGrayBgColorDefault,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _button(AppSvgImages.minus, value > min ? value - 1 : null),
          Text(
            '$value',
            style: AppTextStyles.bodyXlStrong.copyWith(
              fontSize: size * 0.36,
              color: AppComponents.buttongroupButtonGrayIconColorDefault,
            ),
          ),
          _button(AppSvgImages.plus, value < max ? value + 1 : null),
        ],
      ),
    );
  }
}

/// Переспрашивает «Сколько вас?», если гость нажал «Добавить», не ответив на
/// странице блюда. Возвращает число гостей или null, если гость передумал.
class GuestCountDialog {
  const GuestCountDialog._();

  static Future<int?> show(
    BuildContext context, {
    required int min,
    required int max,
    required String hint,
  }) {
    return showDialog<int>(
      context: context,
      // Ответ нужен явный: тап мимо не закрывает.
      barrierDismissible: false,
      // Блюр рисуем сами, как в предупреждении об алкоголе.
      barrierColor: Colors.transparent,
      builder: (_) => BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: ColoredBox(
          color: Colors.black.withValues(alpha: 0.35),
          child: _GuestCountCard(min: min, max: max, hint: hint),
        ),
      ),
    );
  }
}

class _GuestCountCard extends StatefulWidget {
  const _GuestCountCard({
    required this.min,
    required this.max,
    required this.hint,
  });

  final int min;
  final int max;
  final String hint;

  @override
  State<_GuestCountCard> createState() => _GuestCountCardState();
}

class _GuestCountCardState extends State<_GuestCountCard> {
  int? _guests;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
        child: ConstrainedBox(
          // Шире предупреждения об алкоголе: кнопки с числами почти квадратные.
          constraints: const BoxConstraints(maxWidth: 720),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.guestCountTitle.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headingH1.copyWith(fontSize: 28),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.hint,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyL.copyWith(
                      fontSize: 20,
                      height: 1.4,
                      color: AppColors.semanticFgDefault,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GuestCountPicker(
                    value: _guests,
                    min: widget.min,
                    max: widget.max,
                    onChanged: (guests) => setState(() => _guests = guests),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton2(
                          text: LocaleKeys.cancel.tr(),
                          fontSize: 18,
                          backgroundColor: AppColors.none,
                          borderRadius: 16,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CustomButton(
                          text: LocaleKeys.addToOrder.tr(),
                          fontSize: 18,
                          borderRadius: 16,
                          isDisabled: _guests == null,
                          onPressed: () => Navigator.of(context).pop(_guests),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
