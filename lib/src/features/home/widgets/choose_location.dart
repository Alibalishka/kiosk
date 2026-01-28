import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/vm/bonus_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/choose_city_bonus_sheet.dart';

class ChooseLocation extends StatelessWidget {
  const ChooseLocation({super.key, required this.viewModel});
  final BonusVm viewModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showCustomSheet(
        context,
        child: ChooseCityBonus(viewModel: viewModel),
      ),
      child: Row(
        children: [
          Container(
            padding: AppPaddings.locationContainer,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: AppComponents.productcardBgColorDefault),
            child: Center(
              child: Row(
                children: [
                  SvgPicture.asset(AppSvgImages.location, height: 16),
                  const RowSpacer(0.4),
                  Text(
                    viewModel.currentCity?.name ?? 'Укажите город',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyL
                        .copyWith(color: AppColors.semanticFgDefault),
                  ),
                  const RowSpacer(0.4),
                  SvgPicture.asset(
                    AppSvgImages.chevronDown,
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
