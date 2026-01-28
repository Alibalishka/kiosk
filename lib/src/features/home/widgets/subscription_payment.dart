import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/extensions/analytics.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_appbar.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_content.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/widgets/choose_payment_subscription.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/bank_cart_bloc/bank_cart_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/subscription_bloc/subscription_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/subscription_pay.dart';
import 'package:qr_pay_app/src/features/profile/vm/subscription_vm.dart';
import 'package:qr_pay_app/src/features/profile/widgets/shimmer_hor.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

class SubscriptionPayment extends StatefulWidget {
  const SubscriptionPayment({
    super.key,
    required this.viewModel,
  });
  final SubscriptionVm viewModel;

  @override
  State<SubscriptionPayment> createState() => _SubscriptionPaymentState();
}

class _SubscriptionPaymentState extends State<SubscriptionPayment>
    with WidgetsBindingObserver {
  late BankCartBloc bloc;
  late SubscriptionBloc subscriptionBloc;

  @override
  void initState() {
    super.initState();
    bloc = BankCartBloc(authRepository: sl())
      ..add(const BankCartEvent.fetchCards())
      ..add(const BankCartEvent.fetchPaymentMethods());
    subscriptionBloc = SubscriptionBloc(authRepository: sl());
    WidgetsBinding.instance.addObserver(this);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (widget.viewModel.dataCarts.isEmpty) {
    //     bloc.add(BankCartEvent.addBankCard(
    //         id: widget.viewModel.paymentMethod[0].id!));
    //   }
    // });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     log('ALIIII OOOOO');
  //     // context.router.pop();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankCartBloc, BankCartState>(
      bloc: bloc,
      listener: (context, state) => state.maybeWhen(
        orElse: () => null,
        successPaymentMehods: (paymentMethod) {
          widget.viewModel.savePaymentMethod(paymentMethod.data ?? []);
          bloc.add(BankCartEvent.addBankCard(
              id: paymentMethod.data
                      ?.firstWhere((e) => e.provider == 'airba_pay')
                      .id ??
                  0));
          return null;
        },
        successCards: (creditCarts) =>
            widget.viewModel.saveBankCarts(creditCarts.data ?? []),
        successAdd: (data) => widget.viewModel.addCardData = data,
      ),
      builder: (context, state) => state.maybeWhen(
        loading: () => Container(
          decoration: const BoxDecoration(
              color: AppColors.semanticBgSurface1,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [ShimmerLoadingHorizontal()],
          ),
        ),
        orElse: () => Container(
          decoration: const BoxDecoration(
              color: AppColors.semanticBgSurface1,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BottomSheetAppBar(
                title: LocaleKeys.selectPaymentMethod.tr(),
                isIcon: false,
                svg: AppSvgImages.addCircle,
              ),
              // const ColumnSpacer(3.2),
              // widget.viewModel.dataCarts.isEmpty
              //     ? Column(
              //         children: [
              //           ListItem1(
              //             title: Platform.isIOS ? 'Apple Pay' : 'Google Pay',
              //             leftIcon: Platform.isIOS
              //                 ? AppWebpImages.logoApple
              //                 : AppWebpImages.logoGooglePay,
              //             hasRigftIcon: false,
              //             isOn: true,
              //           ),
              //           Padding(
              //             padding: AppPaddings.horizontal16,
              //             child: const CustomDivider(),
              //           ),
              //           ListItem1(
              //             title: LocaleKeys.addCards.tr(),
              //             leftIcon: AppSvgImages.addCircle,
              //             onTap: () {
              //               subscriptionBloc.add(
              //                 SubscriptionEvent.paySubscription(
              //                   payRequest: SubscriptionPayRequest(
              //                       isFastpay:
              //                           context.read<HomeVm>().isApplePay,
              //                       bankcardId: widget
              //                           .viewModel.currentCredit.id
              //                           .toString(),
              //                       paymentMethodId: widget
              //                           .viewModel.paymentMethod
              //                           .firstWhere(
              //                               (e) => e.provider == 'airba_pay')
              //                           .id!
              //                           .toString(),
              //                       activeMonth: widget.viewModel.periodMonth
              //                           .toString()),
              //                   id: widget.viewModel.data?.data?.id ?? 0,
              //                 ),
              //               );
              //               // context.read<HomeVm>().isApplePay = false;
              //               // LaunchInBrowserUtil.launchUrl(
              //               //         widget.viewModel.addCardData?.data?.url ??
              //               //             '')
              //               //     .then((_) => context.router.pop());
              //             },
              //             // bloc.add(BankCartEvent.addBankCard(
              //             //     id: widget.viewModel.paymentMethod[0].id!)),

              //             // () => context.router.pop(context).then(
              //             //       (_) =>
              //             //           //bloc.add(BankCartEvent.addBankCard(
              //             //           //     id: widget.viewModel.paymentMethod[1].id!)),

              //             //           showCustomSheet(
              //             //         context,
              //             //         child: PaymentMethods(
              //             //             paymentMethod:
              //             //                 widget.viewModel.paymentMethod),
              //             //       ),
              //             //     ),
              //           ),
              //         ],
              //       )
              //     : context.read<HomeVm>().isApplePay
              //         ? ListItem1(
              //             title: Platform.isIOS ? 'Apple Pay' : 'Google Pay',
              //             leftIcon: Platform.isIOS
              //                 ? AppWebpImages.logoApple
              //                 : AppWebpImages.logoGooglePay,
              //             onTap: () => context.router.pop().then((_) =>
              //                 showCustomSheet(context,
              //                     child: ChoosePaymentSubscription(
              //                         viewModel: widget.viewModel))),
              //           )
              //         : GestureDetector(
              //             onTap: () => context.router.pop().then((_) =>
              //                 showCustomSheet(context,
              //                     child: ChoosePaymentSubscription(
              //                         viewModel: widget.viewModel))),
              //             child: ListItem1(
              //               title: widget.viewModel.currentCredit.number ?? '',
              //               leftIcon: AppSvgImages.logoVisa,
              //             ),
              //           ),
              const ColumnSpacer(1.2),
              Padding(
                padding: AppPaddings.horizontal16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.toPay.tr(),
                      style: AppTextStyles.headingH4.copyWith(
                          color: AppComponents.listitemTitleColorDefault),
                    ),
                    Text(
                      '${priceFormat(widget.viewModel.data?.data?.prices?.firstWhere((e) => e.activeMonth == widget.viewModel.periodMonth).price.toString() ?? '0')} ₸',
                      style: AppTextStyles.bodyLStrong.copyWith(
                          color: AppComponents.listitemPricetextColorDefault),
                    )
                  ],
                ),
              ),
              const ColumnSpacer(1.2),
              BlocConsumer<SubscriptionBloc, SubscriptionState>(
                bloc: subscriptionBloc,
                listener: (context, state) => state.maybeWhen(
                  orElse: () => null,
                  failed: (error) => showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                      textAlign: TextAlign.start,
                      message: error,
                    ),
                    dismissType: DismissType.onSwipe,
                  ),
                  paySuccess: (data) {
                    if (data.redirectUrl != null) {
                      context.router.pop();
                      widget.viewModel.userSubId = data.userSubscriptionId!;
                      LaunchInBrowserUtil.launchUrl(data.redirectUrl!);
                    } else {
                      AnalyticsService.buySubscription(
                        amount: widget.viewModel.data?.data?.prices
                                ?.firstWhere((e) =>
                                    e.activeMonth ==
                                    widget.viewModel.periodMonth)
                                .price ??
                            0,
                        activeMonth: widget.viewModel.periodMonth,
                      );
                      context.router.popUntil((route) => route.isFirst);
                      showCustomSheet(
                        context,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: AppColors.semanticBgSurface1,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12))),
                          child: BottomSheetContent(
                            title: 'Оплата прошла успешно',
                            text: 'Поздравляем! Ваша подписка оформлено',
                            buttonText: LocaleKeys.close.tr(),
                            icon: AppWebpImages.backgroundSquare,
                          ),
                        ),
                      );
                    }
                    return null;
                  },
                ),
                builder: (context, state) => state.maybeWhen(
                  loading: () => const CircleLoader(),
                  orElse: () => Padding(
                    padding: AppPaddings.all,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // CustomButton(
                        //   text: 'Оплатить',
                        //   onPressed: () {
                        //     subscriptionBloc.add(
                        //       SubscriptionEvent.paySubscription(
                        //         payRequest: SubscriptionPayRequest(
                        //             isFastpay:
                        //                 context.read<HomeVm>().isApplePay,
                        //             bankcardId: widget
                        //                 .viewModel.currentCredit.id
                        //                 .toString(),
                        //             paymentMethodId: widget
                        //                 .viewModel.paymentMethod
                        //                 .firstWhere(
                        //                     (e) => e.provider == 'airba_pay')
                        //                 .id!
                        //                 .toString(),
                        //             activeMonth: widget.viewModel.periodMonth
                        //                 .toString()),
                        //         id: widget.viewModel.data?.data?.id ?? 0,
                        //       ),
                        //     );
                        //   },
                        // ),

                        CupertinoButton(
                          color: AppColors.primitiveNeutralwarm0,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Оплатить c',
                                style: AppTextStyles.bodyLStrong.copyWith(
                                    color: AppColors.primitiveNeutralwarm1000),
                              ),
                              const RowSpacer(0.8),
                              SvgPicture.asset(
                                Platform.isIOS
                                    ? AppSvgImages.applePay
                                    : AppSvgImages.gPay,
                              ),
                            ],
                          ),
                          onPressed: () {
                            subscriptionBloc.add(
                              SubscriptionEvent.paySubscription(
                                payRequest: SubscriptionPayRequest(
                                    isFastpay: true,
                                    bankcardId: widget
                                        .viewModel.currentCredit.id
                                        .toString(),
                                    paymentMethodId: widget
                                        .viewModel.paymentMethod
                                        .firstWhere(
                                            (e) => e.provider == 'airba_pay')
                                        .id!
                                        .toString(),
                                    activeMonth: widget.viewModel.periodMonth
                                        .toString()),
                                id: widget.viewModel.data?.data?.id ?? 0,
                              ),
                            );
                          },
                        ),
                        const ColumnSpacer(1.6),
                        widget.viewModel.dataCarts.isEmpty
                            ? CustomButton(
                                text: 'Оплатить картой',
                                onPressed: () {
                                  subscriptionBloc.add(
                                    SubscriptionEvent.paySubscription(
                                      payRequest: SubscriptionPayRequest(
                                          isFastpay: true,
                                          bankcardId: widget
                                              .viewModel.currentCredit.id
                                              .toString(),
                                          paymentMethodId: widget
                                              .viewModel.paymentMethod
                                              .firstWhere((e) =>
                                                  e.provider == 'airba_pay')
                                              .id!
                                              .toString(),
                                          activeMonth: widget
                                              .viewModel.periodMonth
                                              .toString()),
                                      id: widget.viewModel.data?.data?.id ?? 0,
                                    ),
                                  );
                                },
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      text:
                                          'Оплатить картой ${widget.viewModel.currentCredit.number ?? ''}',
                                      onPressed: () {
                                        subscriptionBloc.add(
                                          SubscriptionEvent.paySubscription(
                                            payRequest: SubscriptionPayRequest(
                                                isFastpay: false,
                                                bankcardId: widget
                                                    .viewModel.currentCredit.id
                                                    .toString(),
                                                paymentMethodId: widget
                                                    .viewModel.paymentMethod
                                                    .firstWhere((e) =>
                                                        e.provider ==
                                                        'airba_pay')
                                                    .id!
                                                    .toString(),
                                                activeMonth: widget
                                                    .viewModel.periodMonth
                                                    .toString()),
                                            id: widget
                                                    .viewModel.data?.data?.id ??
                                                0,
                                          ),
                                        );
                                      },
                                      // onPressed: () => context.router
                                      //     .pop()
                                      //     .then((_) => showCustomSheet(context,
                                      //         child: ChoosePaymentSubscription(
                                      //             viewModel:
                                      //                 widget.viewModel))),
                                    ),
                                  ),
                                  const RowSpacer(0.8),
                                  GestureDetector(
                                    onTap: () {
                                      context.router.pop().then((_) =>
                                          showCustomSheet(context,
                                              child: ChoosePaymentSubscription(
                                                  viewModel:
                                                      widget.viewModel)));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: const BoxDecoration(
                                        color: AppComponents
                                            .buttongroupButtonGrayBgColorDefault,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(AppComponents
                                                .buttongroupButtonLBorderradius)),
                                      ),
                                      child: SvgPicture.asset(
                                          AppSvgImages.options),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              const ColumnSpacer(2.4),
            ],
          ),
        ),
      ),
    );
  }
}
