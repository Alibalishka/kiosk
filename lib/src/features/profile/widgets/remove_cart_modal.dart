import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_button2.dart';
import 'package:qr_pay_app/src/features/profile/vm/bank_card_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

class RemoveCartModal extends StatelessWidget {
  const RemoveCartModal({
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
              const ColumnSpacer(2),
              Text(
                'Вы уверены, что хотите удалить карту ${viewModel.itemRemove?.number}?',
                textAlign: TextAlign.center,
                style: AppTextStyles.headingH2
                    .copyWith(color: AppComponents.navbarTitleColorDefault),
              ),
              const ColumnSpacer(2),
              CustomButton(
                text: LocaleKeys.delete.tr(),
                onPressed: () {
                  viewModel.removeCard();
                  context.router.pop(true);
                },
              ),
              const ColumnSpacer(1.6),
              CustomButton2(
                backgroundColor:
                    AppComponents.buttongroupButtonGrayBgColorDefault,
                hasBorder: false,
                text: LocaleKeys.cancel.tr(),
                borderRadius: 12,
                onPressed: () => context.router.pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
