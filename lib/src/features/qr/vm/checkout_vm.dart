import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/extensions/analytics.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/home/vm/home_vm.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/bank_cart_bloc/bank_cart_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/history_order_bloc/history_order_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/add_bank_card.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/cards_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/payment_method.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/qr/logic/bloc/checkout_bloc/chekout_bloc.dart';
import 'package:qr_pay_app/src/features/qr/logic/bloc/pay_bloc/pay_bloc.dart';
import 'package:qr_pay_app/src/features/qr/logic/bloc/promo_code_bloc/promo_code_bloc.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/check_promo_requests.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/checkout_requests.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/pay_request.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/checkout_model.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/promo_model.dart';

class CheckoutVm extends ViewModel {
  final BuildContext context;
  final String? tableId;
  final String? posOrderId;
  final String? organizationId;
  final String? idSubscriptionOrder;
  final bool isSubscription;
  final ChekoutModel? checkoutModel;
  final bool isMenuRequest;
  final MenuCheckoutRequest? menuRequest;

  CheckoutVm({
    required this.context,
    this.tableId,
    this.posOrderId,
    this.organizationId,
    this.idSubscriptionOrder,
    required this.isSubscription,
    this.checkoutModel,
    required this.isMenuRequest,
    this.menuRequest,
  });

  late ChekoutBloc bloc;
  late PayBloc payBloc;
  late BankCartBloc bankCartBloc;
  late PromoCodeBloc promoBloc;
  late HistoryOrderBloc historyOrderBloc;
  ChekoutModel checkout = ChekoutModel();
  List<CardsDatum> dataCarts = [];
  CardsDatum currentCredit = CardsDatum();
  List<PaymentMethodDatum> paymentMethod = [];
  PromoModel? promoModel;
  AddBankCardResponse? addCardData;
  CheckPromoRequest checkPromoRequest = CheckPromoRequest();
  TextEditingController promocodeController = TextEditingController();
  int orderId = 0;
  bool isLoadingAfterPayment = false;
  bool isOutOfApp = false;
  bool transactionOnWebView = false;
  bool successTransaction = false;

  @override
  void init() {
    super.init();
    AnalyticsService.openCheckoutScreen();
    context.read<ProfileVm>().fetchUser();
    payBloc = PayBloc(cartRepository: sl());
    promoBloc = PromoCodeBloc(cartRepository: sl());
    bankCartBloc = BankCartBloc(authRepository: sl());
    bloc = ChekoutBloc(cartRepository: sl());
    historyOrderBloc = HistoryOrderBloc(authRepository: sl());
    if (isMenuRequest || isSubscription) {
      bloc.add(ChekoutEvent.fetchChekoutMenu(body: menuRequest!));
    } else {
      idSubscriptionOrder == null
          ? bloc.add(
              ChekoutEvent.fetchChekout(
                body: CheckoutRequests(
                  filters: Filters(
                    tableId: tableId,
                    posOrderId: posOrderId,
                    organizationId: organizationId,
                  ),
                ),
              ),
            )
          : bloc.add(
              ChekoutEvent.fetchChekoutSubscription(id: idSubscriptionOrder!),
            );
      // if (isSubscription) {
      //   saveCheckout(checkoutModel!);
      // } else {
      //   idSubscriptionOrder == null
      //       ? bloc.add(
      //           ChekoutEvent.fetchChekout(
      //             body: CheckoutRequests(
      //               filters: Filters(
      //                 tableId: tableId,
      //                 posOrderId: posOrderId,
      //                 organizationId: organizationId,
      //               ),
      //             ),
      //           ),
      //         )
      //       : bloc.add(
      //           ChekoutEvent.fetchChekoutSubscription(id: idSubscriptionOrder!),
      //         );
      // }
    }
  }

  Future<void> saveCheckout(ChekoutModel checkout) async {
    this.checkout = checkout;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> saveBankCarts(List<CardsDatum> dataCarts) async {
    this.dataCarts = dataCarts;
    dataCarts.isNotEmpty && currentCredit.cardId == null
        ? currentCredit = dataCarts.first
        : null;
    if (currentCredit.cardId == null) {
      context.read<HomeVm>().isApplePay = true;
    }
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> savePaymentMethod(List<PaymentMethodDatum> paymentMethod) async {
    this.paymentMethod = paymentMethod;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> switchCart(CardsDatum currentCredit) async {
    this.currentCredit = currentCredit;
    context.read<HomeVm>().isApplePay = false;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> savePromoData(PromoModel data) async {
    promoModel = data;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> checkPromoCode() async {
    checkPromoRequest = CheckPromoRequest(discountCode: '', dishes: []);
    checkPromoRequest.discountCode = promocodeController.text;
    checkPromoRequest.dishes?.addAll(
      (checkout.data?.dishes
              ?.map((e) => DishesData(
                    id: 38,
                    totalPrice: e.totalPrice.toString(),
                  ))
              .toList()) ??
          [],
    );
    promoBloc.add(PromoCodeEvent.checkPromoCode(body: checkPromoRequest));
  }

  void fetchBankDetails() => bankCartBloc
    ..add(const BankCartEvent.fetchCards())
    ..add(const BankCartEvent.fetchPaymentMethods());

  void pay(
    bool isUsedBonus, {
    required bool isFastpay,
    required bool isKaspipay,
  }) {
    isOutOfApp = isKaspipay;
    final int? paymentMethodId = _getPaymentMethodId();
    // if (paymentMethodId == null) {
    //   debugPrint("Ошибка: Не найден метод оплаты AirbaPay");
    //   return;
    // }

    if (checkout.data?.totalPrice == 0) {
      _payForMenu(isUsedBonus, null, paymentMethodId, isFastpay, isKaspipay);
      return;
    }

    final int? bankcardId = currentCredit.id;
    // if (bankcardId == null && !isKaspipay) {
    //   debugPrint("Ошибка: bankcardId не может быть null");
    //   return;
    // }
    if (isMenuRequest || isSubscription) {
      _payForMenu(
          isUsedBonus, bankcardId, paymentMethodId, isFastpay, isKaspipay);
    }
    //  else if (isSubscription) {
    //   _payForSubscription(bankcardId, paymentMethodId, isFastpay, isKaspipay);
    // }
    else {
      if (paymentMethodId == null) {
        debugPrint("Ошибка: Не найден метод оплаты AirbaPay");
        return;
      }
      _payForCart(
          isUsedBonus, bankcardId, paymentMethodId, isFastpay, isKaspipay);
    }
  }

  /// Получение ID метода оплаты
  int? _getPaymentMethodId() =>
      paymentMethod
          .firstWhere(
            (e) => e.provider == 'airba_pay',
          )
          .id ??
      0;

  /// Оплата за меню
  void _payForMenu(
    bool isUsedBonus,
    int? bankcardId,
    int? paymentMethodId,
    bool isFastpay,
    bool isKaspipay,
  ) {
    payBloc.add(
      PayEvent.payMenu(
        body: MenuCheckoutRequest(
          subscriptionId: isSubscription
              ? context.read<ProfileVm>().subscription?.data?.id ?? 0
              : null,
          organizationId: menuRequest?.organizationId,
          tableId: menuRequest?.tableId,
          items: menuRequest?.items,
          isUsedBonus: isUsedBonus,
          bankcardId: bankcardId,
          paymentMethodId: paymentMethodId,
          isFastpay: isFastpay,
          isKaspipay: isKaspipay,
        ),
      ),
    );
  }

  /// Оплата подписки
  // void _payForSubscription(
  //     int bankcardId, int paymentMethodId, bool isFastpay, bool isKaspipay) {
  //   final bonusVm = context.read<BonusVm>().bonusRequest;
  //   payBloc.add(
  //     PayEvent.payBonus(
  //       body: BonusRequest(
  //         itemId: bonusVm.itemId,
  //         tableId: bonusVm.tableId,
  //         items: bonusVm.items,
  //         bankcardId: bankcardId,
  //         paymentMethodId: paymentMethodId,
  //         isFastpay: isFastpay,
  //         isKaspipay: isKaspipay,
  //       ),
  //     ),
  //   );
  // }

  /// Оплата заказа
  void _payForCart(
    bool isUsedBonus,
    int? bankcardId,
    int paymentMethodId,
    bool isFastpay,
    bool isKaspipay,
  ) {
    if (checkout.data?.iikoOrderId == null) {
      debugPrint("Ошибка: iikoOrderId отсутствует");
      return;
    }

    payBloc.add(
      PayEvent.payByCart(
        body: PayRequest(
          filters: Filter(
            organizationId: organizationId!,
            iikoOrderId: checkout.data!.iikoOrderId!,
          ),
          isFastpay: isFastpay,
          isKaspipay: isKaspipay,
          isUsedBonus: isUsedBonus,
          bankcardId: bankcardId,
          paymentMethodId: paymentMethodId,
        ),
      ),
    );
  }

  Future<void> updateLoading(bool isLoadingAfterPayment) async {
    this.isLoadingAfterPayment = isLoadingAfterPayment;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }
}
