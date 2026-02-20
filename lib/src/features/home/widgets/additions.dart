import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:sizer/sizer.dart';

class AdditionsWidget extends StatelessWidget {
  const AdditionsWidget({
    super.key,
    required this.modifierData,
    this.onChanged,
  });

  final List<Modifier> modifierData;
  final VoidCallback? onChanged;

  String _buildRangeText(Modifier m) {
    final min = m.min ?? 0;
    final max = m.max ?? 0;

    if (min > 0 && max > 0 && min == max) {
      // как на скрине: "Выберите 2"
      return 'Выберите $max';
    } else if (min == 0 && max > 0) {
      return 'Можно выбрать до $max';
    } else if (min > 0 && max > 0) {
      return 'Выберите от $min до $max';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<QrMenuVm>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (int i = 0; i < modifierData.length; i++) ...[
          if (i > 0) const ColumnSpacer(2.4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                modifierData[i].name ?? '',
                style: AppTextStyles.headingH3.copyWith(
                  // fontSize: viewModel.isTablet ? 16.sp : null,
                  fontSize: 16.sp,
                  color: AppComponents.blockBlocktitleHeadingColorDefault,
                ),
              ),
              if (_buildRangeText(modifierData[i]).isNotEmpty) ...[
                const ColumnSpacer(0.6),
                Text(
                  _buildRangeText(modifierData[i]),
                  style: AppTextStyles.bodyM.copyWith(
                    // fontSize: viewModel.isTablet ? 14.sp : null,
                    fontSize: 14.sp,
                    color: AppComponents.blockBlocktitleHeadingColorDefault
                        .withOpacity(0.7),
                  ),
                ),
              ],
              const ColumnSpacer(2),
              Modifiers(
                items: modifierData[i].items,
                min: modifierData[i].min ?? 0,
                max: modifierData[i].max ?? 1,
                onChanged: (items) {
                  final m = Modifier(
                    id: modifierData[i].id,
                    name: modifierData[i].name,
                    min: modifierData[i].min,
                    max: modifierData[i].max,
                    iikoId: modifierData[i].iikoId,
                    items: List.from(items ?? []),
                  );
                  viewModel.saveModifier(m);
                  onChanged?.call();
                },
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class Modifiers extends StatefulWidget {
  const Modifiers({
    super.key,
    required this.items,
    required this.min,
    required this.max,
    this.onChanged,
  });

  final List<Items>? items;
  final int min;
  final int max;
  final ValueChanged<List<Items>?>? onChanged;

  @override
  State<Modifiers> createState() => _ModifiersState();
}

class _ModifiersState extends State<Modifiers> {
  late List<int> _counts; // количество по каждому item

  bool get _isSingleChoice => widget.max <= 1; // один товар → режим select

  @override
  void initState() {
    super.initState();
    _initCounts();
  }

  @override
  void didUpdateWidget(covariant Modifiers oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items ||
        oldWidget.min != widget.min ||
        oldWidget.max != widget.max) {
      _initCounts();
    }
  }

  void _initCounts() {
    final items = widget.items ?? [];
    _counts = List<int>.filled(items.length, 0);

    // выбираем только те, что помечены defaultSelect
    for (int i = 0; i < items.length; i++) {
      if (items[i].defaultSelect == true) {
        _counts[i] = items[i].count ?? 1;
      }
    }

    _notifyParent();
  }

  int _totalSelected() =>
      _counts.fold<int>(0, (previous, element) => previous + element);

  void _notifyParent() {
    if (widget.onChanged == null || widget.items == null) return;

    final result = <Items>[];
    for (int i = 0; i < _counts.length; i++) {
      final count = _counts[i];
      if (count <= 0) continue;

      final item = widget.items![i];
      for (int j = 0; j < count; j++) {
        result.add(item);
      }
    }

    widget.onChanged!(result);
  }

  void _onSingleTap(int index) {
    final items = widget.items ?? [];
    if (index < 0 || index >= items.length) return;

    final item = items[index];
    final isRequiredItem = item.requiredSelect == true;
    final current = _counts[index];

    setState(() {
      if (current > 0) {
        // уже выбран
        if (isRequiredItem) {
          // обязательный элемент нельзя полностью выключить
          return;
        }
        _counts[index] = 0;
      } else {
        // снимаем выбор со всех НЕобязательных и выбираем этот
        for (int i = 0; i < _counts.length; i++) {
          final it = items[i];
          if (it.requiredSelect == true) continue; // обязательные оставляем
          _counts[i] = 0;
        }
        _counts[index] = 1;
      }
    });

    _notifyParent();
  }

  void _changeCount(int index, int delta) {
    final items = widget.items ?? [];
    if (index < 0 || index >= items.length) return;

    final item = items[index];
    final isRequiredItem = item.requiredSelect == true;

    final current = _counts[index];
    final total = _totalSelected();

    if (delta > 0) {
      // +1
      if (widget.max > 0 && total >= widget.max) {
        // достигли максимума по группе
        return;
      }
      setState(() {
        _counts[index] = current + 1;
      });
    } else if (delta < 0) {
      // -1
      if (current == 0) return;
      if (isRequiredItem && current <= 1) {
        // обязательный item не может стать 0
        return;
      }
      setState(() {
        _counts[index] = current - 1;
      });
    }

    _notifyParent();
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.items ?? [];
    final viewModel = context.read<QrMenuVm>();
    final isTablet = viewModel.isTablet;

    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      children: List.generate(items.length, (index) {
        final item = items[index];
        final count = _counts[index];
        final isSelected = count > 0;
        final isItemRequired = item.requiredSelect == true;

        final canIncrement = !_isSingleChoice &&
            (widget.max == 0 || _totalSelected() < widget.max);
        final canDecrement = !_isSingleChoice && count > 0 && !isItemRequired;

        return _ModifierItemRow(
          item: item,
          isTablet: isTablet,
          isSingleChoice: _isSingleChoice,
          isSelected: isSelected,
          count: count,
          canIncrement: canIncrement,
          canDecrement: canDecrement,
          onTap: () {
            if (_isSingleChoice) {
              _onSingleTap(index);
            } else {
              // в мульти-режиме по тапу: если 0 → +1, если >0 → -1
              if (count == 0) {
                _changeCount(index, 1);
              } else {
                _changeCount(index, -1);
              }
            }
          },
          onIncrement: _isSingleChoice ? null : () => _changeCount(index, 1),
          onDecrement: _isSingleChoice ? null : () => _changeCount(index, -1),
        );
      }),
    );
  }
}

class _ModifierItemRow extends StatelessWidget {
  const _ModifierItemRow({
    required this.item,
    required this.isTablet,
    required this.isSingleChoice,
    required this.isSelected,
    required this.count,
    required this.canIncrement,
    required this.canDecrement,
    required this.onTap,
    this.onIncrement,
    this.onDecrement,
  });

  final Items item;
  final bool isTablet;
  final bool isSingleChoice;
  final bool isSelected;
  final int count;
  final bool canIncrement;
  final bool canDecrement;
  final VoidCallback onTap;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            // чекбокс / селект

            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primitiveNeutralwarm1000
                      : AppColors.primitiveNeutral300,
                  width: 2,
                ),
                color: isSelected
                    ? AppColors.primitiveNeutralwarm1000
                    : AppColors.semanticBgSurface1,
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 32,
                      color: AppColors.primitiveNeutralcold0,
                    )
                  : null,
            ),
            const RowSpacer(1.6),
            // название + цена
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyXl.copyWith(
                      fontSize: isTablet ? 1.6.sh : null,
                      color: AppComponents.blockBlocktitleHeadingColorDefault,
                    ),
                  ),
                  const RowSpacer(1.2),
                  Text(
                    '+${item.price ?? 0} ₸',
                    style: AppTextStyles.bodyL.copyWith(
                      fontSize: isTablet ? 1.6.sh : null,
                      color: AppColors.semanticBgSurface7,
                    ),
                  ),
                ],
              ),
            ),
            if (!isSingleChoice && isSelected) ...[
              const SizedBox(width: 12),
              _QtyButton(
                icon: AppSvgImages.minus,
                enabled: canDecrement,
                onPressed: onDecrement,
              ),
              const RowSpacer(2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  count.toString(),
                  style: AppTextStyles.bodyL.copyWith(
                    color: AppComponents.buttongroupButtonGrayIconColorDefault,
                    fontSize: isTablet ? 2.sh : null,
                  ),
                ),
              ),
              const RowSpacer(2),
              _QtyButton(
                icon: AppSvgImages.plus,
                enabled: canIncrement,
                onPressed: onIncrement,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  const _QtyButton({
    required this.icon,
    required this.enabled,
    this.onPressed,
  });

  final String icon;
  final bool enabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Opacity(
        opacity: enabled ? 1.0 : 0.3,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppComponents.buttongroupButtonGrayBgColorDefault,
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              height: 24,
              color: AppComponents.buttongroupButtonGrayIconColorDefault,
            ),
          ),
        ),
      ),
    );
  }
}

class ItemModifier extends StatelessWidget {
  const ItemModifier({
    super.key,
    required this.item,
    required this.isSelected,
    this.onChanged,
  });

  final Items? item;
  final bool isSelected;
  final Function(Items?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final isTablet = Provider.of<QrMenuVm>(context, listen: false).isTablet;
    return GestureDetector(
      onTap: () {
        if (item != null) {
          onChanged?.call(item);
        }
      },
      child: Container(
        height: isTablet ? 175 : 152,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: isSelected
              ? const LinearGradient(
                  stops: [0.1, 0.85],
                  colors: [
                    Colors.black,
                    Colors.black,
                  ],
                )
              : null,
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.semanticBgSurface1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              item?.image?.isEmpty ?? true
                  ? Image.asset(
                      AppWebpImages.airplane,
                      height: isTablet ? 90 : 72,
                    )
                  : CachedNetworkImage(
                      height: isTablet ? 90 : 72,
                      imageUrl: item?.image?.first.path ?? '',
                      // progressIndicatorBuilder: (context, url, progress) =>
                      //     Shimmer.fromColors(
                      //   baseColor: AppComponents.shimmerBase,
                      //   highlightColor: AppComponents.shimmerHighlight,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       color: AppColors.primitiveNeutral0,
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //   ),
                      // ),
                      fit: BoxFit.cover,
                      imageBuilder: (context, placeholder) => Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                            image: placeholder,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
              const ColumnSpacer(0.2),
              Text(
                item?.name ?? '',
                // 'erofmernfekrfniernf frefniwoifniowefn eriomore gergnoiqrengo',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyM.copyWith(
                  color: AppComponents.chipgroupChipsSelectedLabelColorDefault,
                  fontSize: isTablet ? 16 : null,
                ),
              ),
              const ColumnSpacer(0.4),
              Text(
                '+${item?.price ?? 0} ₸',
                style: AppTextStyles.bodyM.copyWith(
                  color: AppColors.semanticBgSurface7,
                  fontSize: isTablet ? 16 : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
