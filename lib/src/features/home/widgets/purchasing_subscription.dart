import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/extensions/analytics.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/logic/token_storage.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_content.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/widgets/period_subscription.dart';
import 'package:qr_pay_app/src/features/home/widgets/subscription_payment.dart';
import 'package:qr_pay_app/src/features/home/widgets/term_info_subscription.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/user_bloc/user_bloc.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/profile/vm/subscription_vm.dart';
import 'package:qr_pay_app/src/features/profile/widgets/enter_phone_bottom_sheet.dart';
import 'package:shimmer/shimmer.dart';

class PurchasingSubscription extends StatelessWidget {
  const PurchasingSubscription({
    super.key,
    required this.viewModel,
  });

  final SubscriptionVm viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      bloc: viewModel.userBloc,
      listener: (context, state) => state.maybeWhen(
        orElse: () => null,
        checkSubsSuccess: (data) {
          viewModel.changeLoadinfAfetrPayment(false);
          if ((data.data?.paymentStatus ?? 0) == 2) {
            AnalyticsService.buySubscription(
              amount: viewModel.data?.data?.prices
                      ?.firstWhere(
                          (e) => e.activeMonth == viewModel.periodMonth)
                      .price ??
                  0,
              activeMonth: viewModel.periodMonth,
            );

            context.read<ProfileVm>().fetchUser();
            showCustomSheet(
              context,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.semanticBgSurface1,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: BottomSheetContent(
                  title: LocaleKeys.congratulationsPrime.tr(),
                  text: LocaleKeys.congratulationsPrimeDescription.tr(),
                  buttonText: LocaleKeys.close.tr(),
                  icon: AppWebpImages.delete5,
                ),
              ),
            );
          } else {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.error(
                textAlign: TextAlign.start,
                message: 'Оплата не прошла! Попробуйте еще раз',
              ),
              dismissType: DismissType.onSwipe,
            );
          }
          return null;
        },
      ),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: Builder(
                  builder: (context) => IconButton(
                    icon: SvgPicture.asset(AppSvgImages.iconLeft),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                expandedHeight: context.mediaQuery.size.width / 2,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: viewModel.data?.data?.image ?? '',
                        progressIndicatorBuilder: (context, url, progress) =>
                            Shimmer.fromColors(
                          baseColor: AppComponents.shimmerBase,
                          highlightColor: AppComponents.shimmerHighlight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primitiveNeutral0,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        fit: BoxFit.fill,
                        imageBuilder: (context, placeholder) => Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            image: DecorationImage(
                              image: placeholder,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromRGBO(0, 0, 0, 0),
                                Colors.black.withOpacity(1),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: AppPaddings.horizontal16,
                      child: SafeArea(
                        top: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              (viewModel.data?.data?.text ?? '')
                                  .toUpperCase()
                                  .replaceFirst('ПО', '\nПО'),
                              style: GoogleFonts.forum(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffEFE7D2),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const ColumnSpacer(0.2),
                            Text(
                              'Бонусы от каждого похода в ресторан Sandyq Group',
                              style: AppTextStyles.bodyM
                                  .copyWith(color: AppColors.semanticFgSoft),
                            ),
                            const ColumnSpacer(2),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: AppPaddings.empty,
                              itemBuilder: (BuildContext context, int index) =>
                                  TermInfoSubscriptionWidget(
                                termInfo:
                                    viewModel.data?.data?.termInfos?[index],
                                index: index,
                                viewModel: viewModel,
                              ),
                              itemCount:
                                  viewModel.data?.data?.termInfos?.length ?? 0,
                            ),
                            SizedBox(
                              height: 130,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: PeriodSubscription(
                                      value: 1,
                                      groupValue: viewModel.valuePeriod,
                                      prices: viewModel.data?.data?.prices?[1],
                                      onChanged: (value, period) =>
                                          viewModel.selectPeriod(value, period),
                                    ),
                                  ),
                                  const RowSpacer(1.2),
                                  Expanded(
                                    child: PeriodSubscription(
                                      value: 0,
                                      groupValue: viewModel.valuePeriod,
                                      prices: viewModel.data?.data?.prices?[0],
                                      onChanged: (value, period) =>
                                          viewModel.selectPeriod(value, period),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const ColumnSpacer(2.4),
                            GestureDetector(
                              onTap: () {
                                if (sl<ITokenStorage>()
                                        .getToken()
                                        ?.isNotEmpty ??
                                    false) {
                                  showCustomSheet(context,
                                      child: SubscriptionPayment(
                                          viewModel: viewModel));
                                } else {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    isDismissible: true,
                                    useRootNavigator: true,
                                    backgroundColor:
                                        AppComponents.modalBgColorDefault,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(12))),
                                    builder: (context) =>
                                        const EnterPhoneBottomSheet(),
                                  );
                                }
                              },
                              child: Container(
                                height: 56,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(202, 160, 33, 1),
                                        Color.fromRGBO(158, 30, 44, 1),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    )),
                                padding: AppPaddings.all,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  LocaleKeys.subscribeNow.tr(),
                                  style: AppTextStyles.bodyLStrong.copyWith(
                                      color: AppComponents
                                          .buttongroupButtonPrimaryTextColorDefault),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          viewModel.isLoadingAfterPayment
              ? Container(
                  color: AppColors.primitiveNeutralwarm1000.withOpacity(0.5),
                  child: const CircleLoader())
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
