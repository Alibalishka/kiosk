import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_event.dart';
import 'package:qr_pay_app/src/features/home/vm/home_vm.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/subscription_bloc/subscription_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/user_bloc/user_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/add_bank_card.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/cards_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/payment_method.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/subscription_model.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';

class SubscriptionVm extends ViewModel {
  final BuildContext context;
  SubscriptionVm({required this.context});

  late UserBloc userBloc;
  late PromotionsBloc promotionBloc;
  late SubscriptionBloc subscriptionBloc;
  SubscriptionModel? data;
  AddBankCardResponse? addCardData;
  int valuePeriod = 0;
  int periodMonth = 1;
  List<PaymentMethodDatum> paymentMethod = [];
  List<CardsDatum> dataCarts = [];
  CardsDatum currentCredit = CardsDatum();
  int userSubId = 0;
  bool isLoadingAfterPayment = false;

  @override
  void init() {
    super.init();
    userBloc = UserBloc(authRepository: sl<AuthRepository>());
    subscriptionBloc = SubscriptionBloc(authRepository: sl<AuthRepository>());
    promotionBloc = PromotionsBloc(promotionsRepository: PromotionsRepository())
      ..add(GetPromotions());
    data = context.read<ProfileVm>().subscription;
    valuePeriod =
        data?.data?.prices?.indexWhere((e) => e.isGoodDeal ?? false) ?? 1;
    periodMonth = data?.data?.prices?[valuePeriod].activeMonth ?? 1;
  }

  Future<void> selectPeriod(valuePeriod, periodMonth) async {
    this.valuePeriod = valuePeriod;
    this.periodMonth = periodMonth;
    await Future.delayed(const Duration(milliseconds: 0));
    notifyListeners();
  }

  Future<void> savePaymentMethod(List<PaymentMethodDatum> paymentMethod) async {
    this.paymentMethod = paymentMethod;
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

  Future<void> swaithCart(CardsDatum currentCredit) async {
    this.currentCredit = currentCredit;
    context.read<HomeVm>().isApplePay = false;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> changeLoadinfAfetrPayment(bool isLoadingAfterPayment) async {
    this.isLoadingAfterPayment = isLoadingAfterPayment;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }
}
