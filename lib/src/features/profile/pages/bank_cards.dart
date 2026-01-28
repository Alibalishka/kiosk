import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/list_item1.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/profile/widgets/setting_card_modal.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/home/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/bank_cart_bloc/bank_cart_bloc.dart';
import 'package:qr_pay_app/src/features/profile/vm/bank_card_vm.dart';
import 'package:qr_pay_app/src/features/profile/widgets/shimmer_hor.dart';

class PaymentMethodes extends StatefulWidget {
  const PaymentMethodes({super.key, required this.viewModel});
  final BacnkCardVm viewModel;

  @override
  State<PaymentMethodes> createState() => _PaymentMethodesState();
}

class _PaymentMethodesState extends State<PaymentMethodes>
    with ViewModelMixin<PaymentMethodes, BacnkCardVm>, WidgetsBindingObserver {
  @override
  BacnkCardVm get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      viewModel.onRefresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.paymentMethods.tr(),
        hasLeading: true,
      ),
      body: Padding(
        padding: AppPaddings.all,
        child: RefreshIndicator.adaptive(
          edgeOffset: 25,
          color: AppColors.primitiveNeutralwarm0,
          onRefresh: () => viewModel.onRefresh(),
          child: Stack(
            children: [
              ListView(
                children: [
                  SectionTitle(
                    title: LocaleKeys.myCards.tr(),
                    padding: false,
                  ),
                  const ColumnSpacer(1.6),
                  BlocConsumer<BankCartBloc, BankCartState>(
                    bloc: viewModel.bloc,
                    listener: (context, state) => state.maybeWhen(
                      orElse: () => null,
                      successCards: (model) =>
                          viewModel.saveCrdsData(model.data ?? []),
                      loadingRemove: () => viewModel.changeStatus(true),
                      successRemove: () {
                        viewModel.updateCardList();
                        viewModel.changeStatus(false);
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.success(
                            textAlign: TextAlign.start,
                            message: 'Карта удалена',
                          ),
                          dismissType: DismissType.onSwipe,
                        );
                        return null;
                      },
                      failed: (message) => showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(
                          textAlign: TextAlign.start,
                          message: message,
                        ),
                        dismissType: DismissType.onSwipe,
                      ),
                    ),
                    builder: (context, state) => state.maybeWhen(
                      loading: () => const ShimmerLoadingHorizontal(count: 3),
                      orElse: () => ListView.separated(
                        padding: AppPaddings.empty,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.semanticBgSurface1,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(AppWebpImages.logoVisa,
                                        height: 24),
                                    const RowSpacer(1.2),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            viewModel.dataCards[index].number ??
                                                '',
                                            style: AppTextStyles.headingH4
                                                .copyWith(
                                                    color: AppColors
                                                        .semanticFgDefault),
                                          ),
                                          // index == 0
                                          //     ? Text(
                                          //         'Основной способ оплаты',
                                          //         style: AppTextStyles.bodyM.copyWith(
                                          //             color: AppColors
                                          //                 .primitiveNeutral300),
                                          //       )
                                          //     : const SizedBox(),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        viewModel.selectCrad(
                                            viewModel.dataCards[index]);
                                        showCustomSheet(
                                          context,
                                          child: SettingsCardModal(
                                              viewModel: viewModel),
                                        );
                                      },
                                      child: SvgPicture.asset(
                                        AppSvgImages.ellipsisHorizontalFill,
                                        color:
                                            AppColors.primitiveNeutralwarm100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const ColumnSpacer(0.8),
                        itemCount: viewModel.dataCards.length,
                      ),
                    ),
                  ),
                  const ColumnSpacer(0.8),
                  BlocConsumer<BankCartBloc, BankCartState>(
                    bloc: viewModel.blocAddCard,
                    listener: (context, state) => state.maybeWhen(
                        orElse: () => Container(),
                        successAdd: (data) async =>
                            await LaunchInBrowserUtil.launchUrl(
                                data.data!.url!)),
                    builder: (context, state) {
                      return ListItem1(
                          title: LocaleKeys.addCards.tr(),
                          leftIcon: AppSvgImages.addCircle,
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          onTap: () => viewModel.blocAddCard.add(
                              BankCartEvent.addBankCard(
                                  id: viewModel.paymentMethod.first.id!))
                          // showCustomSheet(
                          //   context,
                          //   child: ChoosePaymentMethods(viewModel: viewModel),
                          // ),
                          );
                    },
                  ),
                  // const ColumnSpacer(2.4),
                  // const SectionTitle(
                  //   title: 'Доступные способы оплаты',
                  //   padding: false,
                  // ),
                  // const ColumnSpacer(1.6),
                  BlocConsumer<BankCartBloc, BankCartState>(
                    bloc: viewModel.blocPaymentMethod,
                    listener: (context, state) => state.maybeWhen(
                      orElse: () => Container(),
                      successPaymentMehods: (paymentMethod) =>
                          viewModel.savePaymentMethod(paymentMethod.data ?? []),
                    ),
                    builder: (context, state) => state.maybeWhen(
                      orElse: () => Container(),
                      loading: () => const SizedBox.shrink(),
                      // loading: () => const ShimmerLoadingHorizontal(),
                      successPaymentMehods: (paymentMethod) =>
                          ListView.separated(
                        padding: AppPaddings.empty,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return const SizedBox.shrink();
                          // return GestureDetector(
                          //   onTap: () {},
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //         color: AppColors.semanticBgSurface1,
                          //         borderRadius: BorderRadius.circular(12)),
                          //     child: Padding(
                          //       padding: AppPaddings.sym16x24,
                          //       child: Row(
                          //         children: [
                          //           SvgPicture.asset(AppSvgImages.logoHalyk),
                          //           const RowSpacer(1.2),
                          //           Text(
                          //             paymentMethod.data?[index].name ?? '',
                          //             style: AppTextStyles.headingH4.copyWith(
                          //                 color: AppColors.semanticFgDefault),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const ColumnSpacer(0.8),
                        itemCount: paymentMethod.data?.length ?? 0,
                      ),
                    ),
                  ),
                ],
              ),
              viewModel.uodateDataStatus
                  ? Container(
                      color:
                          AppColors.primitiveNeutralwarm1000.withOpacity(0.4),
                      child: const CircleLoader(),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
