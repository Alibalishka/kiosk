import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/nutrition_list.dart';
import 'package:sizer/sizer.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({
    super.key,
    required this.item,
  });
  final Items item;

  @override
  Widget build(BuildContext context) {
    return Consumer<QrMenuVm>(
      builder: (context, value, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name ?? '',
              style: AppTextStyles.headingH1.copyWith(
                  fontSize: value.isTablet ? 18.sp : null,
                  color: AppComponents.listitemTitleColorDefault),
            ),
            const ColumnSpacer(1.6),
            Text(
              '${priceFormat(((item.price ?? 0) + value.getModifierTotalSum()).toString())} ₸',
              style: AppTextStyles.headingH3.copyWith(
                  fontSize: value.isTablet ? 16.sp : null,
                  color: AppComponents.blockBlocktitleTitleColorDefault),
            ),
            const ColumnSpacer(1.2),
            Text(
              item.description ?? '',
              style: AppTextStyles.bodyXl.copyWith(
                  fontSize: value.isTablet ? 15.sp : null,
                  color: AppColors.semanticFgSofter),
            ),
            item.characteristics?.isNotEmpty ?? false
                ? ColumnSpacer(value.isTablet ? 2 : 1.2)
                : const SizedBox.shrink(),
            AlignedGridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: item.characteristics?.length ?? 0,
              itemBuilder: (context, index) => NutritionListTitle(
                title: item.characteristics?[index].textValue ?? '',
                subtitle: item.characteristics?[index].name ?? '',
              ),
            ),
            item.characteristics?.isNotEmpty ?? false
                ? Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      LocaleKeys.gram100.tr(),
                      style: AppTextStyles.bodyS.copyWith(
                          fontSize: value.isTablet ? 13.sp : null,
                          color: AppColors.semanticFgSoft),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        );
      },
    );
  }
}
