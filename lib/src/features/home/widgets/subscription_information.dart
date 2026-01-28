import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/formatters/date_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/features/home/widgets/cancel_subscription.dart';
import 'package:qr_pay_app/src/features/home/widgets/item_subcription_info.dart';
import 'package:qr_pay_app/src/features/home/widgets/subscription_canceled.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/subscription_bloc/subscription_bloc.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/profile/vm/subscription_vm.dart';

class SubscriptionInformation extends StatelessWidget {
  const SubscriptionInformation({
    super.key,
    required this.viewModel,
  });
  final SubscriptionVm viewModel;

  @override
  Widget build(BuildContext context) => Consumer<ProfileVm>(
        builder: (context, value, state) {
          return BlocConsumer<SubscriptionBloc, SubscriptionState>(
            bloc: viewModel.subscriptionBloc,
            listener: (context, state) => state.maybeWhen(
                orElse: () => null,
                cancelSuccess: () {
                  value.user?.data?.subscription?.status = 'cancelled';
                  showCustomSheet(context, child: const SubscriptionCanceled());
                  return null;
                }),
            builder: (context, state) {
              return Stack(
                children: [
                  Padding(
                    padding: AppPaddings.all,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Image.asset(
                            AppWebpImages.subscriptionLogo,
                            height: 160,
                          ),
                        ),
                        const ColumnSpacer(1),
                        Text(
                          '${LocaleKeys.subscription.tr()} Prime ${LocaleKeys.active.tr()}'
                              .toUpperCase(),
                          style: GoogleFonts.forum(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffEFE7D2),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const ColumnSpacer(0.8),
                        Center(
                          child: Text(
                            LocaleKeys.benefitsAvailable.tr(),
                            style: AppTextStyles.bodyL
                                .copyWith(color: AppColors.semanticFgSoft),
                          ),
                        ),
                        const ColumnSpacer(1.6),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              value.subscription?.data?.termInfos?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) =>
                              ItemSubscriptionInfo(
                                  data: value
                                      .subscription?.data?.termInfos?[index]),
                          separatorBuilder: (BuildContext context, int index) =>
                              const ColumnSpacer(0.8),
                        ),
                        const ColumnSpacer(2),
                        value.user?.data?.subscription?.status == 'cancelled'
                            ? Container(
                                padding: AppPaddings.all,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppComponents
                                        .navmenuNavmenuelementBgColorDefault),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      LocaleKeys.youCancelledSubscription.tr(),
                                      style: AppTextStyles.bodyLStrong.copyWith(
                                          color: AppComponents
                                              .notificationTitleColorDefault),
                                    ),
                                    const ColumnSpacer(0.4),
                                    Text(
                                      '${LocaleKeys.subscriptionPaidup.tr()} ${dayMonthYearByDot.format(value.user?.data?.subscription?.endAt ?? DateTime.now())}, ${LocaleKeys.afterThisPeriod.tr()} ',
                                      style: AppTextStyles.bodyM.copyWith(
                                          color: AppComponents
                                              .notificationBodytextColorDefault),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                padding: AppPaddings.all,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppComponents
                                        .navmenuNavmenuelementBgColorDefault),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      LocaleKeys.subscriptionActive.tr(),
                                      style: AppTextStyles.bodyLStrong.copyWith(
                                          color: AppComponents
                                              .notificationTitleColorDefault),
                                    ),
                                    const ColumnSpacer(0.4),
                                    Text(
                                      '${LocaleKeys.nextPaymentDate.tr()}: ${dayMonthYearByDot.format(value.user?.data?.subscription?.endAt ?? DateTime.now())}',
                                      style: AppTextStyles.bodyM.copyWith(
                                          color: AppComponents
                                              .notificationBodytextColorDefault),
                                    ),
                                    const ColumnSpacer(1.6),
                                    GestureDetector(
                                      onTap: () => showCustomSheet(
                                        context,
                                        child: CancelSubscription(
                                            bloc: viewModel.subscriptionBloc),
                                      ),
                                      child: Container(
                                        color: AppColors.none,
                                        child: Text(
                                          LocaleKeys.cancelSubscription.tr(),
                                          style: AppTextStyles.bodyL.copyWith(
                                              color: AppComponents
                                                  .functionbuttonAccentTextColorDefault),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                      ],
                    ),
                  ),
                  state.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    loading: () => Container(
                      color:
                          AppColors.primitiveNeutralwarm1000.withOpacity(0.3),
                      child: const CircleLoader(),
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
}
