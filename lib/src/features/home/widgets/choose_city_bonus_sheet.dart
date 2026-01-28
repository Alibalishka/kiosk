import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_appbar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/features/home/vm/bonus_vm.dart';

class ChooseCityBonus extends StatelessWidget {
  const ChooseCityBonus({super.key, required this.viewModel});
  final BonusVm viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.semanticBgSurface1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BottomSheetAppBar(
            title: LocaleKeys.selectCity.tr(),
            svg: AppSvgImages.iconLeft,
          ),
          Padding(
            padding: AppPaddings.horizontal16,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () => viewModel
                    .selectCity(viewModel.dataCity[index])
                    .then((_) => context.router.pop()),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    color: AppColors.none,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          viewModel.dataCity[index].name ?? '',
                          style: AppTextStyles.bodyL.copyWith(
                              color: AppComponents.listitemTitleColorDefault),
                        ),
                        SvgPicture.asset(AppSvgImages.chevronForward)
                      ],
                    ),
                  ),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const CustomDivider(),
              itemCount: viewModel.dataCity.length,
            ),
          ),
          const ColumnSpacer(1.6),
        ],
      ),
    );
  }
}
