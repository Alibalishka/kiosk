import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/profile/vm/bank_card_vm.dart';
import 'package:qr_pay_app/src/features/profile/widgets/remove_cart_modal.dart';

class SettingsCardModal extends StatelessWidget {
  const SettingsCardModal({
    super.key,
    required this.viewModel,
  });
  final BacnkCardVm viewModel;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: AppPaddings.horizontal16,
        decoration: const BoxDecoration(
          color: AppColors.semanticBgSurface1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ColumnSpacer(0.8),
              const CustomBar(),
              const ColumnSpacer(1.6),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 20),
              //   child: Container(
              //     color: AppColors.none,
              //     child: Row(
              //       children: [
              //         SvgPicture.asset(AppSvgImages.card),
              //         const RowSpacer(1.2),
              //         Text(
              //           'Сделать основным способом оплаты',
              //           style: AppTextStyles.headingH4.copyWith(
              //               color: AppComponents.listitemTitleColorDefault),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: () => showCustomSheet(
                    context,
                    child: RemoveCartModal(viewModel: viewModel),
                    onClose: () => context.router.pop(),
                  ),
                  child: Container(
                    color: AppColors.none,
                    child: Row(
                      children: [
                        SvgPicture.asset(AppSvgImages.trash),
                        const RowSpacer(1.2),
                        Text(
                          LocaleKeys.delete.tr(),
                          style: AppTextStyles.headingH4.copyWith(
                              color: AppComponents.listitemTitleColorDefault),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
