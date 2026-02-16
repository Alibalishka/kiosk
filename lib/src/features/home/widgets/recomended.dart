import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/basket_btn.dart';
import 'package:sizer/sizer.dart';
import 'package:talker_flutter/talker_flutter.dart';

class RecomendedWidget extends StatelessWidget {
  const RecomendedWidget({
    super.key,
    required this.item,
    required this.viewModel,
  });

  final Items? item;
  final QrMenuVm viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 78),
      child: Padding(
        padding: AppPaddings.horizontal16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primitiveNeutralwarm0.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Рекомендуем',
                style: AppTextStyles.bodyS.copyWith(
                  fontSize: viewModel.isTablet ? 14.sp : null,
                ),
              ),
            ),
            const ColumnSpacer(0.4),
            Text(
              item?.name ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyLStrong.copyWith(
                  fontSize: viewModel.isTablet ? 18.sp : null,
                  color: AppColors.primitiveNeutralcold0),
            ),
            const ColumnSpacer(0.4),
            Text(
              item?.description ?? '',
              maxLines: viewModel.isTablet ? 5 : 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyM.copyWith(
                  fontSize: viewModel.isTablet ? 14.sp : null,
                  color: AppColors.primitiveNeutralcold0),
            ),
            const ColumnSpacer(1.2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${priceFormat(item?.price.toString() ?? '0')} ₸',
                  style: AppTextStyles.bodyXlStrong.copyWith(
                      fontSize: viewModel.isTablet ? 18.sp : null,
                      color: AppColors.primitiveNeutralcold0),
                ),
                BasketBtn(viewModel: viewModel, item: item!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
