import 'package:flutter/widgets.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/bonus_bloc/bonus_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/free_bloc/free_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/bonus_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/city_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/free_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/home_repository.dart';

class BonusVm extends ViewModel {
  final BuildContext context;

  BonusVm({required this.context});

  late BonusBloc bonusBloc = BonusBloc(homeRepository: sl<HomeRepository>());
  FreeBloc freeBloc = FreeBloc(homeRepository: sl<HomeRepository>());
  ItemsModel items = ItemsModel();
  FreeModel itemsFree = FreeModel();
  BonusRequest bonusRequest = BonusRequest();
  int idSubscription = 0;
  List<CityDatum> dataCity = [];
  CityDatum? currentCity;
  int valueCategory = 0;
  String title = '';

  Future<void> loadMainData({
    required int idSubscription,
    required List<CityDatum> dataCity,
    required CityDatum? currentCity,
  }) async {
    this.idSubscription = idSubscription;
    this.dataCity = dataCity;
    this.currentCity = currentCity;
  }

  Future<void> saveItems(ItemsModel items) async {
    this.items = items;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  void fetchSubscriptionItems() =>
      bonusBloc = BonusBloc(homeRepository: sl<HomeRepository>())
        ..add(BonusEvent.fetchSubscriptionItems(id: idSubscription));

  Future<void> selectCity(CityDatum currentCity) async {
    this.currentCity = currentCity;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> saveFreeItems(FreeModel itemsFree) async {
    this.itemsFree = itemsFree;
    title = itemsFree.data?[0].name ?? '';
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> selectCategory(int valueCategory, String title) async {
    this.valueCategory = valueCategory;
    this.title = title;
    await Future.delayed(const Duration(milliseconds: 0));
    notifyListeners();
  }

  void fetchFreeItems(String idItem) => freeBloc
    ..add(FreeEvent.fetchFreeItems(
        idSubscription: idSubscription, idItem: idItem));

  Future<void> selectCoffe(int id) async {
    bonusRequest = BonusRequest(
        tableId: bonusRequest.tableId, itemId: bonusRequest.itemId, items: []);
    bonusRequest.items?.add(BonusItem(id: id, options: []));
  }

  Future<void> addOption(Option? option) async {
    bonusRequest.items?[0].options?.add(BonusOption(
      id: option!.id,
      productId: option.products?[0].id,
    ));
  }

  Future<void> updateOptionProduct(int? optionId, Product? product) async {
    bonusRequest.items?[0].options
        ?.firstWhere((e) => e.id == optionId)
        .productId = product?.id ?? 0;
  }
}
