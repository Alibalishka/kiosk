import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/extensions/analytics.dart';
import 'package:qr_pay_app/src/core/formatters/date_formats.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/list_item1.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/history_order_bloc/history_order_bloc.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/profile/widgets/not_auth_profile.dart';
import 'package:qr_pay_app/src/features/profile/widgets/shimmer_hor.dart';
import 'package:qr_pay_app/src/features/qr/logic/bloc/checkout_bloc/chekout_bloc.dart';
import 'package:qr_pay_app/src/features/qr/logic/bloc/pay_bloc/pay_bloc.dart';
import 'package:qr_pay_app/src/features/qr/vm/checkout_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/block_title.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:qr_pay_app/src/features/home/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/features/qr/widgets/payment_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutSandyq extends StatefulWidget {
  const CheckoutSandyq({super.key, required this.viewModel});
  final CheckoutVm viewModel;

  @override
  State<CheckoutSandyq> createState() => _CheckoutSandyqState();
}

class _CheckoutSandyqState extends State<CheckoutSandyq>
    with ViewModelMixin<CheckoutSandyq, CheckoutVm>, WidgetsBindingObserver {
  bool isLoadingAfterPayment = false;
  bool isShowPop = false;
  bool hasShownPaymentError = false;
  @override
  CheckoutVm get viewModel => widget.viewModel;

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
    if (widget.viewModel.orderId != 0 && !viewModel.successTransaction) {
      if (state == AppLifecycleState.resumed && viewModel.isOutOfApp) {
        !isLoadingAfterPayment
            ? setState(() => isLoadingAfterPayment = true)
            : null;
        Future.delayed(const Duration(seconds: 6), () {
          widget.viewModel.historyOrderBloc.add(
              HistoryOrderEvent.fetchHistoryDetailOrder(
                  id: widget.viewModel.orderId));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !isLoadingAfterPayment,
      child: Scaffold(
        appBar: CustomAppBar(
          text: LocaleKeys.yourOrder.tr(),
          hasLeading: true,
        ),
        body: BlocListener<HistoryOrderBloc, HistoryOrderState>(
          bloc: widget.viewModel.historyOrderBloc,
          listener: (context, state) => state.maybeWhen(
              orElse: () => null,
              // loading: () {},
              failed: (error) {
                setState(() => isLoadingAfterPayment = false);
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(
                    textAlign: TextAlign.start,
                    message: error,
                  ),
                  dismissType: DismissType.onSwipe,
                );
                return null;
              },
              successDetail: (data) {
                if (data.data?.paymentStatus == 2) {
                  viewModel.successTransaction = true;
                  // AnalyticsService.successPaid(type: 'order');

                  // context.router
                  //     .push(
                  //       ReviewProviderRoute(
                  //         id: widget.viewModel.checkout.data?.item?.id ?? 1,
                  //       ),
                  //     )
                  //     .then((value) =>
                  //         context.router.popUntil((route) => route.isFirst));
                  // context.read<ProfileVm>().gotDrink();
                  final itemId = widget.viewModel.checkout.data?.item?.id ?? 1;

                  context.router
                      .push(ReviewProviderRoute(id: itemId))
                      .then((value) {
                    if (context.mounted) {
                      context.router.popUntil((route) => route.isFirst);
                    }
                  });
                } else if (data.data?.paymentStatus == 1) {
                  Future.delayed(const Duration(seconds: 2), () {
                    isShowPop = true;
                    widget.viewModel.historyOrderBloc.add(
                        HistoryOrderEvent.fetchHistoryDetailOrder(
                            id: widget.viewModel.orderId));
                  });
                } else {
                  // AnalyticsService.failPaid(type: 'order');
                  // setState(() => isLoadingAfterPayment = false);

                  // if (isShowPop) {
                  //   isShowPop = false;
                  //   showTopSnackBar(
                  //     Overlay.of(context),
                  //     const CustomSnackBar.error(
                  //       textAlign: TextAlign.start,
                  //       message: 'Оплата не прошла! Попробуйте еще раз',
                  //     ),
                  //     dismissType: DismissType.onSwipe,
                  //   );
                  // }
                  setState(() => isLoadingAfterPayment = false);

                  if (isShowPop && !hasShownPaymentError) {
                    isShowPop = false;
                    hasShownPaymentError = true;

                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.error(
                        textAlign: TextAlign.start,
                        message: 'Оплата не прошла! Попробуйте еще раз',
                      ),
                      dismissType: DismissType.onSwipe,
                    );
                  }
                }
                return null;
              }),
          child: BlocConsumer<ChekoutBloc, ChekoutState>(
            bloc: viewModel.bloc,
            listener: (context, state) => state.maybeWhen(
              orElse: () => Container(),
              success: (checkout) => viewModel.saveCheckout(checkout),
              failed: (error) => context.router.pop(error),
            ),
            builder: (context, state) => state.maybeWhen(
              loading: () => const ShimmerLoadingHorizontal(count: 10),
              orElse: () => Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const ColumnSpacer(1.6),
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColors.semanticBgSurface1,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: BlockTitleWidget(
                            title: viewModel.checkout.data?.item?.name ?? '',
                            text:
                                '${LocaleKeys.date.tr()}: ${dayMonthYearByDotAndTime.format(viewModel.checkout.data?.createdAt ?? DateTime.now())}',
                            divider: false,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppComponents.blockBgColorDefault,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              const CustomDivider(),
                              const ColumnSpacer(1.2),
                              Padding(
                                padding: AppPaddings.horizontal16,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppSvgImages.storefront),
                                    const RowSpacer(1.2),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            viewModel.checkout.data?.item
                                                    ?.address ??
                                                'null',
                                            style: AppTextStyles.bodyM.copyWith(
                                                color: AppComponents
                                                    .listitemBodytextColorDefault),
                                          ),
                                          const ColumnSpacer(0.4),
                                          Text(
                                            '${viewModel.checkout.data?.section ?? ''}, ${LocaleKeys.table.tr()} ${viewModel.checkout.data?.table ?? ''}',
                                            style: AppTextStyles.bodyM.copyWith(
                                                color: AppComponents
                                                    .listitemSubtitleColorDefault),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SeparatorContainer(),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.semanticBgSurface1,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              // const ColumnSpacer(1.2),
                              SectionTitle(title: LocaleKeys.dishesOrder.tr()),
                              const ColumnSpacer(1.2),
                              const CustomDivider(),
                              ListView.separated(
                                padding: AppPaddings.empty,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    viewModel.checkout.data?.dishes?.length ??
                                        0,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const CustomDivider(),
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        BlockTitleWidget2(
                                  subtitle:
                                      '${priceFormat(viewModel.checkout.data?.dishes?[index].totalPrice.toString() ?? '0')} ₸',
                                  title: viewModel
                                          .checkout.data?.dishes?[index].name ??
                                      '',
                                  price:
                                      '${viewModel.checkout.data?.dishes?[index].count}х * ${priceFormat(viewModel.checkout.data?.dishes?[index].totalPrice.toString() ?? '0')}  ₸',
                                  modifires: viewModel
                                      .checkout.data?.dishes?[index].modifiers,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SeparatorContainer(),
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColors.semanticBgSurface1,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Column(
                            children: [
                              ListItem2(
                                title: LocaleKeys.orderAmount.tr(),
                                subtitle:
                                    '${priceFormat(((viewModel.checkout.data?.totalPrice ?? 0) - (viewModel.checkout.data?.serviceSum ?? 0)).toInt().toString())} ₸',
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: viewModel
                                        .checkout.data?.discounts?.length ??
                                    0,
                                itemBuilder: (context, index) => ListItem2(
                                  title: viewModel.checkout.data
                                          ?.discounts?[index].name ??
                                      '',
                                  subtitle:
                                      '${priceFormat(viewModel.checkout.data?.discounts?[index].sum?.toInt().toString() ?? '0')} ₸',
                                ),
                              ),
                              ListItem2(
                                title: LocaleKeys.total.tr(),
                                subtitle:
                                    '${priceFormat(((viewModel.checkout.data?.totalPrice ?? 0)).toString())} ₸',
                                divider: false,
                              )
                            ],
                          ),
                        ),
                        const ColumnSpacer(1.2),
                      ],
                    ),
                  ),
                  if (isLoadingAfterPayment)
                    Container(
                      color:
                          AppColors.primitiveNeutralwarm1000.withOpacity(0.5),
                      child: const CircleLoader(),
                    ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: viewModel.checkout.data == null
            ? const SizedBox.shrink()
            : isLoadingAfterPayment
                ? const SizedBox.shrink()
                : Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 1),
                        ),
                      ],
                      color: AppColors.semanticBgSurface1,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: AppPaddings.all,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BlocConsumer<PayBloc, PayState>(
                            bloc: viewModel.payBloc,
                            listener: (context, state) => state.maybeWhen(
                                orElse: () => Container(),
                                failed: (error) {
                                  // AnalyticsService.failPaid(type: 'coffee');
                                  showTopSnackBar(
                                    Overlay.of(context),
                                    CustomSnackBar.error(
                                      textAlign: TextAlign.start,
                                      message: error,
                                    ),
                                    dismissType: DismissType.onSwipe,
                                  );
                                  return null;
                                },
                                success: (data) {
                                  widget.viewModel.orderId = data.orderId ?? 0;
                                  context.router.pop();
                                  if (data.redirectUrl != null) {
                                    data.redirectUrl!.contains('kaspi.kz')
                                        ? LaunchInBrowserUtil.launchUrl(
                                            data.redirectUrl!,
                                            LaunchMode.externalApplication,
                                          )
                                        : context.router
                                            .push(WebViewPageRoute(
                                                url: data.redirectUrl!))
                                            .then((_) {
                                            !isLoadingAfterPayment
                                                ? setState(() =>
                                                    isLoadingAfterPayment =
                                                        true)
                                                : null;
                                            Future.delayed(
                                                const Duration(seconds: 3), () {
                                              widget.viewModel.historyOrderBloc
                                                  .add(HistoryOrderEvent
                                                      .fetchHistoryDetailOrder(
                                                          id: widget.viewModel
                                                              .orderId));
                                            });
                                          });
                                  } else {
                                    context.read<ProfileVm>().gotDrink();
                                    final itemId = widget.viewModel.checkout
                                            .data?.item?.id ??
                                        1;

                                    context.router
                                        .push(ReviewProviderRoute(id: itemId))
                                        .then((value) {
                                      if (context.mounted) {
                                        context.router
                                            .popUntil((route) => route.isFirst);
                                      }
                                    });
                                  }
                                  // AnalyticsService.successPaid(type: 'coffee');
                                  // showCustomSheet(
                                  //   context,
                                  //   child: Container(
                                  //     decoration: const BoxDecoration(
                                  //         color: AppColors.semanticBgSurface1,
                                  //         borderRadius: BorderRadius.vertical(
                                  //             top: Radius.circular(12))),
                                  //     child: BottomSheetContent(
                                  //       title: viewModel.isSubscription
                                  //           ? LocaleKeys.orderAccepted.tr()
                                  //           : LocaleKeys.paymentSuccessful.tr(),
                                  //       text: viewModel.isSubscription
                                  //           ? LocaleKeys.freeDrinkSuccess.tr()
                                  //           : LocaleKeys.orderPaySuccess.tr(),
                                  //       buttonText: LocaleKeys.close.tr(),
                                  //       icon: viewModel.isSubscription
                                  //           ? AppWebpImages.coffee
                                  //           : AppWebpImages.backgroundSquare,
                                  //     ),
                                  //   ),
                                  // );
                                  return null;
                                }),
                            builder: (context, state) => state.maybeWhen(
                              loading: () => const CircleLoader(),
                              orElse: () => SafeArea(
                                child: CustomButton(
                                  text: viewModel.isSubscription
                                      ? LocaleKeys.placeAnOrder.tr()
                                      : LocaleKeys.pay.tr(),
                                  onPressed: () {
                                    AnalyticsService.clickButtonPay();
                                    showCustomSheet(context,
                                        child:
                                            PaymentSheet(viewModel: viewModel),
                                        onClose: () {
                                      hasShownPaymentError = false;
                                      if (viewModel.transactionOnWebView) {
                                        context.router
                                            .push(WebViewPageRoute(
                                                url: widget
                                                        .viewModel
                                                        .addCardData
                                                        ?.data
                                                        ?.url ??
                                                    ''))
                                            .then((_) {
                                          !widget.viewModel
                                                  .isLoadingAfterPayment
                                              ? widget.viewModel
                                                  .updateLoading(true)
                                              // setState(() =>
                                              //     isLoadingAfterPayment = true)
                                              : null;
                                          Future.delayed(
                                              const Duration(seconds: 3), () {
                                            widget.viewModel.historyOrderBloc
                                                .add(HistoryOrderEvent
                                                    .fetchHistoryDetailOrder(
                                                        id: widget.viewModel
                                                            .orderId));
                                          });
                                        });
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          const ColumnSpacer(1.2),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}

// class CheckoutSandyq extends StatefulWidget {
//   const CheckoutSandyq({super.key, required this.viewModel});
//   final CheckoutVm viewModel;

//   @override
//   State<CheckoutSandyq> createState() => _CheckoutSandyqState();
// }

// class _CheckoutSandyqState extends State<CheckoutSandyq>
//     with ViewModelMixin<CheckoutSandyq, CheckoutVm>, WidgetsBindingObserver {
//   bool isLoadingAfterPayment = false;
//   @override
//   CheckoutVm get viewModel => widget.viewModel;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (widget.viewModel.orderId != 0) {
//       if (state == AppLifecycleState.resumed && viewModel.isOutOfApp) {
//         !isLoadingAfterPayment
//             ? setState(() => isLoadingAfterPayment = true)
//             : null;
//         Future.delayed(const Duration(seconds: 6), () {
//           widget.viewModel.historyOrderBloc.add(
//               HistoryOrderEvent.fetchHistoryDetailOrder(
//                   id: widget.viewModel.orderId));
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         text: LocaleKeys.yourOrder.tr(),
//         hasLeading: true,
//       ),
//       body: BlocListener<HistoryOrderBloc, HistoryOrderState>(
//         bloc: widget.viewModel.historyOrderBloc,
//         listener: (context, state) => state.maybeWhen(
//             orElse: () => null,
//             failed: (error) {
//               setState(() => isLoadingAfterPayment = false);
//               showTopSnackBar(
//                 Overlay.of(context),
//                 CustomSnackBar.error(
//                   textAlign: TextAlign.start,
//                   message: error,
//                 ),
//                 dismissType: DismissType.onSwipe,
//               );
//               return null;
//             },
//             successDetail: (data) {
//               setState(() => isLoadingAfterPayment = false);
//               if (data.data?.paymentStatus == 2) {
//                 // AnalyticsService.successPaid(type: 'order');

//                 // context.router
//                 //     .push(
//                 //       ReviewProviderRoute(
//                 //         id: widget.viewModel.checkout.data?.item?.id ?? 1,
//                 //       ),
//                 //     )
//                 //     .then((value) =>
//                 //         context.router.popUntil((route) => route.isFirst));
//                 context.read<ProfileVm>().gotDrink();
//                 final itemId = widget.viewModel.checkout.data?.item?.id ?? 1;

//                 context.router
//                     .push(ReviewProviderRoute(id: itemId))
//                     .then((value) {
//                   if (context.mounted) {
//                     context.router.popUntil((route) => route.isFirst);
//                   }
//                 });
//               } else {
//                 // AnalyticsService.failPaid(type: 'order');
//                 setState(() => isLoadingAfterPayment = false);
//                 showTopSnackBar(
//                   Overlay.of(context),
//                   const CustomSnackBar.error(
//                     textAlign: TextAlign.start,
//                     message: 'Оплата не прошла! Попробуйте еще раз',
//                   ),
//                   dismissType: DismissType.onSwipe,
//                 );
//               }
//               return null;
//             }),
//         child: BlocConsumer<ChekoutBloc, ChekoutState>(
//           bloc: viewModel.bloc,
//           listener: (context, state) => state.maybeWhen(
//             orElse: () => Container(),
//             success: (checkout) => viewModel.saveCheckout(checkout),
//             failed: (error) => context.router.pop(error),
//           ),
//           builder: (context, state) => state.maybeWhen(
//             loading: () => const ShimmerLoadingHorizontal(count: 10),
//             orElse: () => Stack(
//               children: [
//                 SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       const ColumnSpacer(1.6),
//                       Container(
//                         decoration: const BoxDecoration(
//                           color: AppColors.semanticBgSurface1,
//                           borderRadius: BorderRadius.all(Radius.circular(12)),
//                         ),
//                         child: BlockTitleWidget(
//                           title: viewModel.checkout.data?.item?.name ?? '',
//                           text:
//                               '${LocaleKeys.date.tr()}: ${dayMonthYearByDotAndTime.format(viewModel.checkout.data?.createdAt ?? DateTime.now())}',
//                           divider: false,
//                         ),
//                       ),
//                       // const ColumnSpacer(1.2),
//                       Container(
//                         decoration: BoxDecoration(
//                             color: AppComponents.blockBgColorDefault,
//                             borderRadius: BorderRadius.circular(12)),
//                         child: Column(
//                           children: [
//                             const CustomDivider(),
//                             const ColumnSpacer(1.2),
//                             Padding(
//                               padding: AppPaddings.horizontal16,
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SvgPicture.asset(AppSvgImages.storefront),
//                                   const RowSpacer(1.2),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           viewModel.checkout.data?.item
//                                                   ?.address ??
//                                               'null',
//                                           style: AppTextStyles.bodyM.copyWith(
//                                               color: AppComponents
//                                                   .listitemBodytextColorDefault),
//                                         ),
//                                         const ColumnSpacer(0.4),
//                                         Text(
//                                           '${viewModel.checkout.data?.section ?? ''}, ${LocaleKeys.table.tr()} ${viewModel.checkout.data?.table ?? ''}',
//                                           style: AppTextStyles.bodyM.copyWith(
//                                               color: AppComponents
//                                                   .listitemSubtitleColorDefault),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SeparatorContainer(),
//                       // const ColumnSpacer(1.2),
//                       Container(
//                         decoration: BoxDecoration(
//                             color: AppColors.semanticBgSurface1,
//                             borderRadius: BorderRadius.circular(12)),
//                         child: Column(
//                           children: [
//                             // const ColumnSpacer(1.2),
//                             SectionTitle(title: LocaleKeys.dishesOrder.tr()),
//                             const ColumnSpacer(1.2),
//                             const CustomDivider(),
//                             ListView.separated(
//                               padding: AppPaddings.empty,
//                               physics: const NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount:
//                                   viewModel.checkout.data?.dishes?.length ?? 0,
//                               separatorBuilder:
//                                   (BuildContext context, int index) =>
//                                       const CustomDivider(),
//                               itemBuilder: (BuildContext context, int index) =>
//                                   BlockTitleWidget2(
//                                 subtitle:
//                                     '${priceFormat(viewModel.checkout.data?.dishes?[index].totalPrice.toString() ?? '0')} ₸',
//                                 title: viewModel
//                                         .checkout.data?.dishes?[index].name ??
//                                     '',
//                                 price:
//                                     '${viewModel.checkout.data?.dishes?[index].count}х * ${priceFormat(viewModel.checkout.data?.dishes?[index].totalPrice.toString() ?? '0')}  ₸',
//                                 modifires: viewModel
//                                     .checkout.data?.dishes?[index].modifiers,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SeparatorContainer(),
//                       // const ColumnSpacer(1.2),
//                       Container(
//                         decoration: const BoxDecoration(
//                           color: AppColors.semanticBgSurface1,
//                           borderRadius: BorderRadius.all(Radius.circular(12)),
//                         ),
//                         child: Column(
//                           children: [
//                             ListItem2(
//                               title: LocaleKeys.orderAmount.tr(),
//                               subtitle:
//                                   '${priceFormat(((viewModel.checkout.data?.totalPrice ?? 0) - (viewModel.checkout.data?.serviceSum ?? 0)).toInt().toString())} ₸',
//                             ),
//                             ListView.builder(
//                               shrinkWrap: true,
//                               physics: const NeverScrollableScrollPhysics(),
//                               itemCount:
//                                   viewModel.checkout.data?.discounts?.length ??
//                                       0,
//                               itemBuilder: (context, index) => ListItem2(
//                                 title: viewModel.checkout.data
//                                         ?.discounts?[index].name ??
//                                     '',
//                                 subtitle:
//                                     '${priceFormat(viewModel.checkout.data?.discounts?[index].sum?.toInt().toString() ?? '0')} ₸',
//                               ),
//                             ),
//                             ListItem2(
//                               title: LocaleKeys.total.tr(),
//                               subtitle:
//                                   '${priceFormat(((viewModel.checkout.data?.totalPrice ?? 0)).toString())} ₸',
//                               divider: false,
//                             )
//                           ],
//                         ),
//                       ),
//                       const ColumnSpacer(1.2),
//                     ],
//                   ),
//                 ),
//                 if (isLoadingAfterPayment)
//                   Container(
//                     color: AppColors.primitiveNeutralwarm1000.withOpacity(0.5),
//                     child: const CircleLoader(),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: viewModel.checkout.data == null
//           ? const SizedBox.shrink()
//           : isLoadingAfterPayment
//               ? const SizedBox.shrink()
//               : Container(
//                   decoration: const BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Color.fromRGBO(0, 0, 0, 0.15),
//                         spreadRadius: 0,
//                         blurRadius: 10,
//                         offset: Offset(0, 1),
//                       ),
//                     ],
//                     color: AppColors.semanticBgSurface1,
//                     borderRadius:
//                         BorderRadius.vertical(top: Radius.circular(16)),
//                   ),
//                   child: Padding(
//                     padding: AppPaddings.all,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         BlocConsumer<PayBloc, PayState>(
//                           bloc: viewModel.payBloc,
//                           listener: (context, state) => state.maybeWhen(
//                               orElse: () => Container(),
//                               failed: (error) {
//                                 // AnalyticsService.failPaid(type: 'coffee');
//                                 showTopSnackBar(
//                                   Overlay.of(context),
//                                   CustomSnackBar.error(
//                                     textAlign: TextAlign.start,
//                                     message: error,
//                                   ),
//                                   dismissType: DismissType.onSwipe,
//                                 );
//                                 return null;
//                               },
//                               success: (data) {
//                                 widget.viewModel.orderId = data.orderId ?? 0;
//                                 context.router.pop();
//                                 if (data.redirectUrl != null) {
//                                   data.redirectUrl!.contains('kaspi.kz')
//                                       ? LaunchInBrowserUtil.launchUrl(
//                                           data.redirectUrl!,
//                                           LaunchMode.externalApplication,
//                                         )
//                                       : context.router
//                                           .push(WebViewPageRoute(
//                                               url: data.redirectUrl!))
//                                           .then((_) {
//                                           !isLoadingAfterPayment
//                                               ? setState(() =>
//                                                   isLoadingAfterPayment = true)
//                                               : null;
//                                           Future.delayed(
//                                               const Duration(seconds: 3), () {
//                                             widget.viewModel.historyOrderBloc
//                                                 .add(HistoryOrderEvent
//                                                     .fetchHistoryDetailOrder(
//                                                         id: widget.viewModel
//                                                             .orderId));
//                                           });
//                                         });
//                                 } else {
//                                   context.read<ProfileVm>().gotDrink();
//                                   final itemId = widget
//                                           .viewModel.checkout.data?.item?.id ??
//                                       1;

//                                   context.router
//                                       .push(ReviewProviderRoute(id: itemId))
//                                       .then((value) {
//                                     if (context.mounted) {
//                                       context.router
//                                           .popUntil((route) => route.isFirst);
//                                     }
//                                   });
//                                 }
//                                 // AnalyticsService.successPaid(type: 'coffee');
//                                 // showCustomSheet(
//                                 //   context,
//                                 //   child: Container(
//                                 //     decoration: const BoxDecoration(
//                                 //         color: AppColors.semanticBgSurface1,
//                                 //         borderRadius: BorderRadius.vertical(
//                                 //             top: Radius.circular(12))),
//                                 //     child: BottomSheetContent(
//                                 //       title: viewModel.isSubscription
//                                 //           ? LocaleKeys.orderAccepted.tr()
//                                 //           : LocaleKeys.paymentSuccessful.tr(),
//                                 //       text: viewModel.isSubscription
//                                 //           ? LocaleKeys.freeDrinkSuccess.tr()
//                                 //           : LocaleKeys.orderPaySuccess.tr(),
//                                 //       buttonText: LocaleKeys.close.tr(),
//                                 //       icon: viewModel.isSubscription
//                                 //           ? AppWebpImages.coffee
//                                 //           : AppWebpImages.backgroundSquare,
//                                 //     ),
//                                 //   ),
//                                 // );
//                                 return null;
//                               }),
//                           builder: (context, state) => state.maybeWhen(
//                             loading: () => const CircleLoader(),
//                             orElse: () => CustomButton(
//                               text: viewModel.isSubscription
//                                   ? LocaleKeys.placeAnOrder.tr()
//                                   : LocaleKeys.pay.tr(),
//                               onPressed: () {
//                                 AnalyticsService.clickButtonPay();
//                                 showCustomSheet(
//                                   context,
//                                   child: PaymentSheet(viewModel: viewModel),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         const ColumnSpacer(1.2),
//                       ],
//                     ),
//                   ),
//                 ),
//     );
//   }
// }
