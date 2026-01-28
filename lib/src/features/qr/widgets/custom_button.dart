import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color buttonColor;
  final bool hasIcon;
  final String? icon;
  final double? borderRadius;
  final double? padding;
  final bool isDisabled;
  final bool blackText;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor = AppColors.primitiveBrand500,
    this.hasIcon = false,
    this.icon,
    this.borderRadius,
    this.padding,
    this.isDisabled = false,
    this.blackText = false,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.circular(borderRadius ?? 16),
      onPressed: isDisabled ? null : onPressed,
      color: isDisabled
          ? AppComponents.buttongroupButtonPrimaryBgColorDisabled
          : buttonColor,
      padding: const EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: padding ?? 0),
        child: hasIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(icon ?? AppSvgImages.addCircle),
                  const RowSpacer(0.8),
                  Text(
                    text,
                    style: AppTextStyles.bodyLStrong.copyWith(
                        color: blackText
                            ? AppComponents
                                .buttongroupButtonGrayTextColorDefault
                            : AppComponents
                                .buttongroupButtonPrimaryTextColorDefault),
                  ),
                ],
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLStrong.copyWith(
                  fontSize: fontSize,
                  color: blackText
                      ? AppComponents.buttongroupButtonGrayTextColorDefault
                      : AppComponents.buttongroupButtonPrimaryTextColorDefault,
                ),
              ),
      ),
    );
  }
}




// import 'package:auto_route/auto_route.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
// import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
// import 'package:qr_pay_app/src/core/resources/app_colors.dart';
// import 'package:qr_pay_app/src/core/resources/app_components.dart';
// import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
// import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
// import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
// import 'package:qr_pay_app/src/core/resources/resources.dart';
// import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
// import 'package:qr_pay_app/src/core/widgets/bottom_sheet_appbar.dart';
// import 'package:qr_pay_app/src/core/widgets/bottom_sheet_content.dart';
// import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
// import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
// import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
// import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
// import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
// import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
// import 'package:qr_pay_app/src/core/widgets/list_item1.dart';
// import 'package:qr_pay_app/src/core/widgets/title_text_field.dart';
// import 'package:qr_pay_app/src/features/profile/logic/bloc/bank_cart_bloc/bank_cart_bloc.dart';
// import 'package:qr_pay_app/src/features/profile/widgets/shimmer_hor.dart';
// import 'package:qr_pay_app/src/features/qr/logic/bloc/pay_bloc/pay_bloc.dart';
// import 'package:qr_pay_app/src/features/qr/logic/models/requests/pay_request.dart';
// import 'package:qr_pay_app/src/features/qr/vm/checkout_vm.dart';
// import 'package:qr_pay_app/src/features/qr/widgets/choose_payment.dart';
// import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
// import 'package:qr_pay_app/src/features/qr/widgets/payment_methods.dart';

// class PaymentSheet extends StatefulWidget {
//   const PaymentSheet({super.key, required this.viewModel});
//   final CheckoutVm viewModel;

//   @override
//   State<PaymentSheet> createState() => _PaymentSheetState();
// }

// class _PaymentSheetState extends State<PaymentSheet> {
//   late BankCartBloc bloc;
//   late PayBloc payBloc;

//   TextEditingController promocodeController = TextEditingController();
//   bool isButtonDisabled = true;
//   String? errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     bloc = BankCartBloc(authRepository: sl())
//       ..add(const BankCartEvent.fetchCards())
//       ..add(const BankCartEvent.fetchPaymentMethods());
//     payBloc = PayBloc(cartRepository: sl());
//     promocodeController.addListener(() {
//       setState(() {
//         if (promocodeController.text.isEmpty) {
//           isButtonDisabled = true;
//           errorMessage = null;
//         } else {
//           isButtonDisabled = false;
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<BankCartBloc, BankCartState>(
//       bloc: bloc,
//       listener: (context, state) => state.maybeWhen(
//           orElse: () => Container(),
//           successPaymentMehods: (paymentMethod) =>
//               widget.viewModel.savePaymentMethod(paymentMethod.data ?? []),
//           successCards: (creditCarts) =>
//               widget.viewModel.saveBankCarts(creditCarts.data ?? [])),
//       builder: (context, state) => state.maybeWhen(
//         loading: () => Container(
//           decoration: const BoxDecoration(
//               color: AppColors.semanticBgSurface1,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
//           child: const Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ShimmerLoadingHorizontal(),
//             ],
//           ),
//         ),
//         orElse: () => Container(
//           decoration: const BoxDecoration(
//               color: AppColors.semanticBgSurface1,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const BottomSheetAppBar(
//                 title: 'Выберите способ оплаты',
//                 isIcon: false,
//                 svg: AppSvgImages.addCircle,
//               ),
//               const ColumnSpacer(2.8),
//               widget.viewModel.dataCarts.isEmpty
//                   ? ListItem1(
//                       title: LocaleKeys.addCards.tr(),
//                       leftIcon: AppSvgImages.addCircle,
//                       onTap: () => context.router.pop(context).then(
//                             (_) => showCustomSheet(
//                               context,
//                               child: PaymentMethods(
//                                   paymentMethod:
//                                       widget.viewModel.paymentMethod),
//                             ),
//                           ),
//                     )
//                   : GestureDetector(
//                       onTap: () => context.router.pop().then((_) =>
//                           showCustomSheet(context,
//                               child:
//                                   ChoosePayment(viewModel: widget.viewModel))),
//                       child: ListItem1(
//                         title: widget.viewModel.currentCredit.number ?? '',
//                         leftIcon: AppSvgImages.logoVisa,
//                       ),
//                     ),
//               // Padding(
//               //   padding: AppPaddings.horizontal16,
//               //   child: const CustomDivider(),
//               // ),
//               // Padding(
//               //   padding: AppPaddings.all,
//               //   child: Row(
//               //     crossAxisAlignment: CrossAxisAlignment.start,
//               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //     children: [
//               //       Column(
//               //         crossAxisAlignment: CrossAxisAlignment.start,
//               //         children: [
//               //           Text(
//               //             'Потратить 2 500 бонусов',
//               //             style: AppTextStyles.headingH4.copyWith(
//               //                 color: AppComponents.listitemTitleColorDefault),
//               //           ),
//               //           const ColumnSpacer(0.4),
//               //           Text(
//               //             'Можно оплачивать до 50% счета',
//               //             style: AppTextStyles.bodyM.copyWith(
//               //                 color: AppComponents.listitemSubtitleColorDefault),
//               //           ),
//               //         ],
//               //       ),
//               //       SizedBox(
//               //         height: 30,
//               //         child: FittedBox(
//               //           fit: BoxFit.contain,
//               //           child: CupertinoSwitch(
//               //             activeColor:
//               //                 AppComponents.switchTrackColorCheckedDefault,
//               //             value: switchValue,
//               //             onChanged: (bool? value) {
//               //               setState(() {
//               //                 switchValue = value ?? false;
//               //               });
//               //             },
//               //           ),
//               //         ),
//               //       )
//               //     ],
//               //   ),
//               // ),
//               Padding(
//                 padding: AppPaddings.horizontal16,
//                 child: const CustomDivider(),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   showCustomSheet(
//                     context,
//                     child: Container(
//                       padding: AppPaddings.horizontal16,
//                       decoration: const BoxDecoration(
//                           color: AppColors.semanticBgSurface1,
//                           borderRadius:
//                               BorderRadius.vertical(top: Radius.circular(12))),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           const ColumnSpacer(0.8),
//                           const CustomBar(),
//                           const ColumnSpacer(2),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               SvgPicture.asset(AppSvgImages.chevronBack),
//                               Text(
//                                 'Промокод',
//                                 textAlign: TextAlign.center,
//                                 style: AppTextStyles.headingH3.copyWith(
//                                     color: AppColors.semanticFgDefault),
//                               ),
//                               const SizedBox(
//                                 width: 24,
//                               ),
//                             ],
//                           ),
//                           //const ColumnSpacer(1.2),
//                           TitleTextField(
//                             title: '',
//                             controller: promocodeController,
//                             placeholder: 'Введите промокод',
//                             error: errorMessage,
//                           ),
//                           const ColumnSpacer(1.6),
//                           CustomButton(
//                             text: 'Применить',
//                             onPressed: isButtonDisabled
//                                 ? null
//                                 : () {
//                                     // Валидация при нажатии
//                                     if (promocodeController.text !=
//                                         'правильный_код') {
//                                       setState(() {
//                                         errorMessage = 'Неверный промокод';
//                                       });
//                                     } else {
//                                       context.router.pop();
//                                     }
//                                   },
//                             isDisabled: isButtonDisabled,
//                           ),
//                           const ColumnSpacer(3.2),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//                 child: Padding(
//                   padding: AppPaddings.all,
//                   child: Row(
//                     children: [
//                       Text(
//                         'Есть промокод?',
//                         style: AppTextStyles.headingH4.copyWith(
//                             color: AppComponents.listitemTitleColorDefault),
//                       ),
//                       const Spacer(),
//                       SvgPicture.asset(AppSvgImages.chevronForward)
//                     ],
//                   ),
//                 ),
//               ),


//               Padding(
//                 padding: AppPaddings.horizontal16,
//                 child: const CustomDivider(),
//               ),
//               Padding(
//                 padding: AppPaddings.all,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           LocaleKeys.totalPrice.tr(),
//                           style: AppTextStyles.headingH4.copyWith(
//                               color: AppComponents.listitemTitleColorDefault),
//                         ),
//                         // const ColumnSpacer(0.4),
//                         // Text(
//                         //   'Накопим бонусов + 4 000',
//                         //   style: AppTextStyles.bodyM.copyWith(
//                         //       color: AppComponents.listitemSubtitleColorDefault),
//                         // ),
//                       ],
//                     ),
//                     Text(
//                       '${priceFormat((widget.viewModel.checkout.data?.totalPrice ?? 0).toString())} ₸',
//                       style: AppTextStyles.bodyLStrong.copyWith(
//                           color: AppComponents.listitemPricetextColorDefault),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: AppPaddings.all,
//                 child: BlocConsumer<PayBloc, PayState>(
//                     bloc: payBloc,
//                     listener: (context, state) => state.maybeWhen(
//                         orElse: () => Container(),
//                         failed: (error) => showTopSnackBar(
//                               Overlay.of(context),
//                               CustomSnackBar.error(
//                                 textAlign: TextAlign.start,
//                                 message: error,
//                               ),
//                               dismissType: DismissType.onSwipe,
//                             ),
//                         success: () {
//                           context.router.popUntil((route) => route.isFirst);
//                           showCustomSheet(
//                             context,
//                             child: Container(
//                               decoration: const BoxDecoration(
//                                   color: AppColors.semanticBgSurface1,
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(12))),
//                               child: BottomSheetContent(
//                                 title: 'Оплата прошла успешно',
//                                 text: 'Поздравляем! Ваш заказ оплачен',
//                                 buttonText: LocaleKeys.close.tr(),
//                                 icon: AppImages.backgroundSquare,
//                               ),
//                             ),
//                           );
//                           return null;
//                         }),
//                     builder: (context, state) => state.maybeWhen(
//                           loading: () => const CircleLoader(),
//                           orElse: () => CustomButton(
//                             text: 'Оплатить',
//                             onPressed: widget.viewModel.currentCredit.cardId ==
//                                     null
//                                 ? null
//                                 : () {
//                                     // showCustomSheet(
//                                     //   context,
//                                     //   child: Container(
//                                     //     decoration: const BoxDecoration(
//                                     //         color: AppColors.semanticBgSurface1,
//                                     //         borderRadius: BorderRadius.vertical(
//                                     //             top: Radius.circular(12))),
//                                     //     child: const BottomSheetContent(
//                                     //       title: 'Оплата прошла успешно',
//                                     //       text:
//                                     //           'Поздравляем! Ваш заказ оплачен',
//                                     //       buttonText: 'Закрыть',
//                                     //       icon: AppImages.backgroundSquare,
//                                     //     ),
//                                     //   ),
//                                     // );

//                                     payBloc.add(PayEvent.payByCart(
//                                         body: PayRequest(
//                                       filters: Filters(
//                                         // itemId: 3,
//                                         organizationId:
//                                             widget.viewModel.organizationId!,
//                                         iikoOrderId: widget.viewModel.checkout
//                                             .data!.iikoOrderId!,
//                                         // isTestIiko: 1,
//                                         // tableId: widget.viewModel.tableId ?? '',
//                                         // widget
//                                         //     .viewModel.checkout.data!.tableId!,
//                                       ),
//                                       // testTotalPrice: 10,
//                                       bankcardId:
//                                           widget.viewModel.currentCredit.id!,
//                                       paymentMethodId: widget
//                                           .viewModel.paymentMethod
//                                           .firstWhere((e) =>
//                                               e.provider ==
//                                               widget.viewModel.currentCredit
//                                                   .provider)
//                                           .id!,
//                                     )));
//                                   },
//                           ),
//                         )),
//               ),
//               const ColumnSpacer(2.4),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
