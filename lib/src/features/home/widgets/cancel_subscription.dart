import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/subscription_bloc/subscription_bloc.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

class CancelSubscription extends StatelessWidget {
  const CancelSubscription({
    super.key,
    required this.bloc,
  });
  final SubscriptionBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.semanticBgSurface1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      child: Padding(
        padding: AppPaddings.horizontal16,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ColumnSpacer(0.8),
              const CustomBar(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.router.pop(),
                    child: SvgPicture.asset(AppSvgImages.chevronBack),
                  ),
                ],
              ),
              const ColumnSpacer(1.6),
              Image.asset(
                AppWebpImages.cancelSubscription,
                height: 128,
              ),
              const ColumnSpacer(0.8),
              Text(
                '${LocaleKeys.cancelSubscription.tr()} Prime?',
                textAlign: TextAlign.center,
                style: AppTextStyles.headingH2
                    .copyWith(color: AppColors.semanticFgDefault),
              ),
              const ColumnSpacer(0.8),
              Text(
                LocaleKeys.accessWillEnd.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyL
                    .copyWith(color: AppColors.primitiveNeutral300),
              ),
              const ColumnSpacer(1.6),
              CustomButton(
                text: LocaleKeys.yesCancel.tr(),
                onPressed: () => context.router.pop().then(
                      (_) => bloc.add(
                        SubscriptionEvent.cancelSubscription(
                          id: context
                              .read<ProfileVm>()
                              .user!
                              .data!
                              .subscription!
                              .id!,
                        ),
                      ),
                    ),
              ),
              const ColumnSpacer(1.6),
              CustomButton(
                text: LocaleKeys.noLeaveIt.tr(),
                onPressed: () => context.router.pop(),
                buttonColor: AppComponents.buttongroupButtonGrayBgColorDefault,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
