import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/core/widgets/title_text_field.dart';
import 'package:qr_pay_app/src/features/qr/logic/bloc/promo_code_bloc/promo_code_bloc.dart';
import 'package:qr_pay_app/src/features/qr/vm/checkout_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

class PromoCodeModal extends StatefulWidget {
  const PromoCodeModal({
    super.key,
    required this.viewModel,
  });
  final CheckoutVm viewModel;

  @override
  State<PromoCodeModal> createState() => _PromoCodeModalState();
}

class _PromoCodeModalState extends State<PromoCodeModal> {
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PromoCodeBloc, PromoCodeState>(
      bloc: widget.viewModel.promoBloc,
      listener: (context, state) => state.maybeWhen(
        orElse: () => null,
        success: (model) {
          widget.viewModel.savePromoData(model);
          context.router.pop();
          return null;
        },
        failed: (message) => setState(() => isError = true),
      ),
      builder: (context, state) {
        return Padding(
          padding: context.mediaQuery.viewInsets,
          child: Container(
            padding: AppPaddings.horizontal16,
            decoration: const BoxDecoration(
                color: AppColors.semanticBgSurface1,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ColumnSpacer(0.8),
                const CustomBar(),
                const ColumnSpacer(2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => context.router.pop(),
                      child: SvgPicture.asset(AppSvgImages.chevronBack),
                    ),
                    Text(
                      'Промокод',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headingH3
                          .copyWith(color: AppColors.semanticFgDefault),
                    ),
                    const ColumnSpacer(2.4),
                  ],
                ),
                TitleTextField(
                  title: '',
                  controller: widget.viewModel.promocodeController,
                  placeholder: LocaleKeys.enterPromo.tr(),
                  isBorder: isError,
                  hasBorderColor: isError,
                  onChanged: (_) => setState(() {}),
                ),
                state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  failed: (message) => Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      message,
                      style: AppTextStyles.bodyM.copyWith(
                        color: AppComponents.inputPrimaryHinttextColorError,
                      ),
                    ),
                  ),
                ),
                const ColumnSpacer(1.6),
                state.maybeWhen(
                  // loading: () => const CircleLoader(),
                  orElse: () => CustomButton(
                    text: LocaleKeys.apply.tr(),
                    // onPressed: () {
                    //   widget.viewModel.savePromoData(PromoModel(
                    //       data: PromoData(
                    //     success: true,
                    //     type: 'promo_code',
                    //     bonus: '500',
                    //     // bool? success;
                    //     // String? type;
                    //     // String? bonus;
                    //   )));
                    //   context.router.pop();
                    // },
                    onPressed: widget.viewModel.promocodeController.text.isEmpty
                        ? null
                        : () => widget.viewModel.checkPromoCode(),
                  ),
                ),
                const ColumnSpacer(3.2),
              ],
            ),
          ),
        );
      },
    );
  }
}
