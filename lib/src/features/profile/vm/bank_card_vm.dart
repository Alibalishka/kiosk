import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/bank_cart_bloc/bank_cart_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/cards_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/payment_method.dart';

class BacnkCardVm extends ViewModel {
  final BuildContext context;

  BacnkCardVm({required this.context});
  late BankCartBloc bloc;
  late BankCartBloc blocPaymentMethod;
  late BankCartBloc blocAddCard;
  List<PaymentMethodDatum> paymentMethod = [];
  List<CardsDatum> dataCards = [];
  bool uodateDataStatus = false;
  CardsDatum? itemRemove;
  // List<CardsDatum> cards = [];

  @override
  void init() {
    super.init();
    bloc = BankCartBloc(authRepository: sl())
      ..add(const BankCartEvent.fetchCards());
    blocPaymentMethod = BankCartBloc(authRepository: sl())
      ..add(const BankCartEvent.fetchPaymentMethods());
    blocAddCard = BankCartBloc(authRepository: sl());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  Future<void> onRefresh() async {
    bloc.add(const BankCartEvent.fetchCards());
    blocPaymentMethod.add(const BankCartEvent.fetchPaymentMethods());
  }

  Future<void> savePaymentMethod(List<PaymentMethodDatum> paymentMethod) async {
    this.paymentMethod = paymentMethod;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> changeStatus(bool val) async {
    uodateDataStatus = val;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> updateCardList() async {
    dataCards.remove(dataCards.firstWhere((e) => e.id == itemRemove!.id));
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  void selectCrad(CardsDatum? item) => itemRemove = item;

  void removeCard() => bloc.add(BankCartEvent.removeCard(id: itemRemove!.id!));

  Future<void> saveCrdsData(List<CardsDatum> dataCards) async {
    this.dataCards = dataCards;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }
}
