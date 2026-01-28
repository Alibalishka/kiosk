import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/free_model.dart';

class ChipCustom extends StatelessWidget {
  const ChipCustom({
    super.key,
    required this.item,
    required this.value,
    required this.groupValue,
    this.onChanged,
  });
  final FreeDatum? item;
  final int value;
  final int groupValue;
  final Function(int?, String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bool selected = value != groupValue;
        if (selected) {
          onChanged!(value, item!.name);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
        decoration: BoxDecoration(
          color: AppComponents.chipgroupChipsNotSelectedBgColorDefault,
          border: Border.all(
            color: value == groupValue
                ? AppComponents.chipgroupChipsSelectedBorderColorDefault
                : AppColors.none,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppComponents.chipgroupChipsBorderradius),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            item?.name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMStrong.copyWith(
                color: AppComponents.chipgroupChipsSelectedLabelColorDefault),
          ),
        ),
      ),
    );
  }
}
