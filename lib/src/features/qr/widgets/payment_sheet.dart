import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_appbar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/bank_cart_bloc/bank_cart_bloc.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/profile/widgets/shimmer_hor.dart';
import 'package:qr_pay_app/src/features/qr/logic/bloc/pay_bloc/pay_bloc.dart';
import 'package:qr_pay_app/src/features/qr/vm/checkout_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/choose_payment.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:qr_pay_app/src/features/qr/widgets/promo_code_modal.dart';

class PaymentSheet extends StatefulWidget {
  const PaymentSheet({super.key, required this.viewModel});
  final CheckoutVm viewModel;

  @override
  State<PaymentSheet> createState() => _PaymentSheetState();
}

class _PaymentSheetState extends State<PaymentSheet> {
  bool isUsedBonus = false;

  @override
  void initState() {
    super.initState();
    widget.viewModel.transactionOnWebView = false;
    widget.viewModel.fetchBankDetails();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankCartBloc, BankCartState>(
      bloc: widget.viewModel.bankCartBloc,
      listener: (context, state) => state.maybeWhen(
        orElse: () => Container(),
        successPaymentMehods: (paymentMethod) {
          widget.viewModel.savePaymentMethod(paymentMethod.data ?? []);
          widget.viewModel.bankCartBloc.add(BankCartEvent.addBankCard(
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
        orElse: () => Consumer<ProfileVm>(
          builder: (context, value, state) {
            return Container(
              decoration: const BoxDecoration(
                  color: AppColors.semanticBgSurface1,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12))),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BottomSheetAppBar(
                      title: LocaleKeys.selectPaymentMethod.tr(),
                      isIcon: false,
                      svg: AppSvgImages.addCircle,
                    ),
                    const ColumnSpacer(1.2),
                    value.user?.data?.balance?.bonus == 0
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: AppPaddings.horizontal16,
                            child: const CustomDivider(),
                          ),
                    widget.viewModel.isSubscription
                        ? const SizedBox.shrink()
                        : value.user?.data?.balance?.bonus == 0
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: AppPaddings.all,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${LocaleKeys.spend.tr()} ${priceFormat(value.user?.data?.balance?.bonus.toString() ?? '0')} ${LocaleKeys.bonuses.tr()}',
                                          style: AppTextStyles.headingH4.copyWith(
                                              color: AppComponents
                                                  .listitemTitleColorDefault),
                                        ),
                                        const ColumnSpacer(0.4),
                                        Text(
                                          '${LocaleKeys.spendDescFirst.tr()} ${value.user?.data?.maxBonusPercent ?? 50}% ${LocaleKeys.spendDescSecond.tr()}',
                                          style: AppTextStyles.bodyM.copyWith(
                                              color: AppComponents
                                                  .listitemSubtitleColorDefault),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: CupertinoSwitch(
                                          activeColor: AppComponents
                                              .switchTrackColorCheckedDefault,
                                          value: isUsedBonus,
                                          onChanged: (bool? value) => setState(
                                              () => isUsedBonus = !isUsedBonus),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                    widget.viewModel.isSubscription
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: AppPaddings.horizontal16,
                            child: const CustomDivider(),
                          ),
                    widget.viewModel.isSubscription
                        ? const SizedBox.shrink()
                        : GestureDetector(
                            onTap: () {
                              showCustomSheet(
                                context,
                                child:
                                    PromoCodeModal(viewModel: widget.viewModel),
                                onClose: () => setState(() {}),
                              );
                            },
                            child: Padding(
                              padding: AppPaddings.all,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          widget.viewModel.promoModel == null
                                              ? LocaleKeys.hasPromoCode.tr()
                                              : widget.viewModel.promoModel
                                                      ?.data?.code ??
                                                  '',
                                          style: AppTextStyles.headingH4.copyWith(
                                              color: AppComponents
                                                  .listitemTitleColorDefault),
                                        ),
                                        widget.viewModel.promoModel == null
                                            ? const SizedBox.shrink()
                                            : const ColumnSpacer(0.4),
                                        widget.viewModel.promoModel == null
                                            ? const SizedBox.shrink()
                                            : Text(
                                                '${LocaleKeys.addBonus.tr()} + ${double.parse(widget.viewModel.promoModel?.data?.bonus ?? '0').toInt()}',
                                                style: AppTextStyles.bodyM.copyWith(
                                                    color: AppComponents
                                                        .listitemSubtitleColorDefault),
                                              ),
                                      ],
                                    ),
                                  ),
                                  SvgPicture.asset(AppSvgImages.chevronForward)
                                ],
                              ),
                            ),
                          ),
                    widget.viewModel.isSubscription
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: AppPaddings.horizontal16,
                            child: const CustomDivider(),
                          ),
                    Padding(
                      padding: AppPaddings.all,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.totalPrice.tr(),
                                style: AppTextStyles.headingH4.copyWith(
                                    color: AppComponents
                                        .listitemTitleColorDefault),
                              ),
                              widget.viewModel.isSubscription
                                  ? const SizedBox.shrink()
                                  : const ColumnSpacer(0.4),
                              widget.viewModel.isSubscription
                                  ? const SizedBox.shrink()
                                  : Text(
                                      '${LocaleKeys.accumulateBonuses.tr()} + ${priceFormat(value.calculateBonus(isUsedBonus ? value.calculateResult(
                                            (widget.viewModel.checkout.data
                                                        ?.totalPrice ??
                                                    0)
                                                .toDouble(),
                                            (value.user?.data?.balance?.bonus ??
                                                    0)
                                                .toDouble(),
                                          ).toInt() : widget.viewModel.checkout.data?.totalPrice ?? 0))}',
                                      style: AppTextStyles.bodyM.copyWith(
                                          color: AppComponents
                                              .listitemSubtitleColorDefault),
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${priceFormat(widget.viewModel.checkout.data?.totalPrice.toString() ?? '0')} ₸',
                                style: AppTextStyles.bodyLStrong.copyWith(
                                  color: isUsedBonus
                                      ? AppComponents
                                          .listitemSubtitleColorDefault
                                      : AppComponents
                                          .listitemPricetextColorDefault,
                                  decoration: isUsedBonus
                                      ? TextDecoration.lineThrough
                                      : null,
                                  decorationColor: isUsedBonus
                                      ? AppComponents
                                          .listitemSubtitleColorDefault
                                      : null,
                                ),
                              ),
                              const RowSpacer(0.8),
                              isUsedBonus
                                  ? Text(
                                      '${priceFormat(value.calculateResult(
                                            (widget.viewModel.checkout.data
                                                        ?.totalPrice ??
                                                    0)
                                                .toDouble(),
                                            (value.user?.data?.balance?.bonus ??
                                                    0)
                                                .toDouble(),
                                          ).toInt().toString())} ₸',
                                      style: AppTextStyles.bodyLStrong.copyWith(
                                          color: AppComponents
                                              .listitemPricetextColorDefault),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: AppPaddings.all,
                      child: BlocBuilder<PayBloc, PayState>(
                        bloc: widget.viewModel.payBloc,
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading: () => const CircleLoader(),
                            orElse: () {
                              final checkoutData =
                                  widget.viewModel.checkout.data;
                              final hasAmountToPay =
                                  (checkoutData?.totalPrice ?? 0) > 0;
                              final kaspiPayReady =
                                  checkoutData?.kaspiPayReady ?? false;
                              final cardPayReady =
                                  checkoutData?.cardPayReady ?? false;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Оплата через Kaspi.kz
                                  buildPaymentButton(
                                    visible: kaspiPayReady && hasAmountToPay,
                                    color: const Color(0xffF24634),
                                    text: 'Оплатить с',
                                    image: Image.asset(AppWebpImages.kaspiLogo,
                                        height: 32),
                                    onPressed: () => widget.viewModel.pay(
                                      isUsedBonus,
                                      isFastpay: false,
                                      isKaspipay: true,
                                    ),
                                  ),

                                  // Оплата картой (Apple Pay / Google Pay)
                                  buildPaymentButton(
                                    visible: cardPayReady && hasAmountToPay,
                                    color: AppColors.primitiveNeutralwarm0,
                                    text: 'Оплатить c',
                                    image: SvgPicture.asset(
                                      Platform.isIOS
                                          ? AppSvgImages.applePay
                                          : AppSvgImages.gPay,
                                    ),
                                    textColor:
                                        AppColors.primitiveNeutralwarm1000,
                                    onPressed: () => widget.viewModel.pay(
                                      isUsedBonus,
                                      isFastpay: true,
                                      isKaspipay: false,
                                    ),
                                  ),

                                  // Оплата привязанной картой или выбор другой карты
                                  if (cardPayReady && hasAmountToPay)
                                    widget.viewModel.dataCarts.isEmpty
                                        ? CustomButton(
                                            text: 'Оплатить картой',
                                            onPressed: () {
                                              widget.viewModel
                                                  .transactionOnWebView = true;
                                              context.router.pop();
                                            },
                                          )
                                        : Row(
                                            children: [
                                              Expanded(
                                                child: CustomButton(
                                                  text:
                                                      'Оплатить картой ${widget.viewModel.currentCredit.number ?? ''}',
                                                  onPressed: () =>
                                                      widget.viewModel.pay(
                                                    isUsedBonus,
                                                    isFastpay: false,
                                                    isKaspipay: false,
                                                  ),
                                                ),
                                              ),
                                              const RowSpacer(0.8),
                                              GestureDetector(
                                                onTap: () {
                                                  context.router.pop().then(
                                                        (_) => showCustomSheet(
                                                          context,
                                                          child: ChoosePayment(
                                                              viewModel: widget
                                                                  .viewModel),
                                                        ),
                                                      );
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: AppComponents
                                                        .buttongroupButtonGrayBgColorDefault,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(AppComponents
                                                          .buttongroupButtonLBorderradius),
                                                    ),
                                                  ),
                                                  child: SvgPicture.asset(
                                                      AppSvgImages.options),
                                                ),
                                              ),
                                            ],
                                          ),

                                  // Оплата на кассе (если нет Kaspi Pay и карт)
                                  if (!kaspiPayReady && !cardPayReady)
                                    CustomButton(
                                        text: 'Оплатите на кассе',
                                        onPressed: () {}),

                                  // Кнопка "Забрать кофе" (если сумма = 0)
                                  if (!hasAmountToPay)
                                    CustomButton(
                                      text: 'Забрать заказ',
                                      onPressed: () => widget.viewModel.pay(
                                        isUsedBonus,
                                        isFastpay: true,
                                        isKaspipay: false,
                                      ),
                                    ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const ColumnSpacer(2.4),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Функция для создания кнопки оплаты
  Widget buildPaymentButton({
    required bool visible,
    required Color color,
    required String text,
    required Widget image,
    required VoidCallback onPressed,
    Color? textColor,
  }) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: CupertinoButton(
          color: color,
          padding: const EdgeInsets.symmetric(vertical: 8),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppTextStyles.bodyLStrong.copyWith(
                  color: textColor ??
                      AppComponents.buttongroupButtonPrimaryTextColorDefault,
                ),
              ),
              const RowSpacer(0.8),
              image,
            ],
          ),
        ),
      ),
    );
  }
}
