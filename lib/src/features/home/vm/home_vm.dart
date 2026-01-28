import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/search_word_storage.dart';
import 'package:qr_pay_app/src/core/logic/token_storage.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/city_bloc/city_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/item_bloc/item_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/news_bloc/news_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_event.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/city_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/user_bloc/user_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:upgrader/upgrader.dart';

class HomeVm extends ViewModel {
  final BuildContext context;
  final int? qrMenuId;
  HomeVm({
    required this.context,
    this.qrMenuId,
  });

  late NewsBloc newsBloc;
  late ItemBloc itemBloc;
  late CityBloc cityBloc;
  late PromotionsBloc promotionBloc;
  UserBloc userBloc = UserBloc(authRepository: sl<AuthRepository>());
  List<CityDatum> dataCity = [];
  late ItemsModel items;
  CityDatum? currentCity;
  bool isAuthorized = false;
  ScrollController scrollController = ScrollController();
  List<Item> itemSort = [];
  final upgrader = Upgrader(
    debugLogging: true,
    durationUntilAlertAgain: const Duration(days: 1),
  );

  bool isApplePay = false;
  bool isInternetConnection = true;

  @override
  void init() {
    super.init();
    checkInternetConnection();
    context.read<ProfileVm>().fetchConfiguration();
    isAuthorized =
        sl<ITokenStorage>().getToken()?.isEmpty ?? true ? false : true;
    isAuthorized ? context.read<ProfileVm>().fetchUser() : null;

    userBloc = UserBloc(authRepository: sl())
      ..add(const UserEvent.fetchUser())
      ..add(const UserEvent.fetchConfiguration());
    newsBloc = NewsBloc(homeRepository: sl())..add(const NewsEvent.fetchNews());
    itemBloc = ItemBloc(homeRepository: sl())..add(const ItemEvent.fetchItem());
    cityBloc = CityBloc(homeRepository: sl())..add(const CityEvent.fetchCity());
    promotionBloc = PromotionsBloc(promotionsRepository: PromotionsRepository())
      ..add(GetPromotions());
    context.read<ProfileVm>().checkAuthorized();
  }

  @override
  void dispose() {
    super.dispose();
    newsBloc.close();
  }

  Future<void> refreshRequest() async {
    checkInternetConnection();
    isAuthorized =
        sl<ITokenStorage>().getToken()?.isEmpty ?? true ? false : true;
    isAuthorized ? context.read<ProfileVm>().fetchUser() : null;
    userBloc.add(const UserEvent.fetchUser());
    newsBloc.add(const NewsEvent.fetchNews());
    itemBloc.add(const ItemEvent.fetchItem());
    cityBloc.add(const CityEvent.fetchCity());
    promotionBloc.add(GetPromotions());
  }

  Future<void> saveCity(List<CityDatum> dataCity) async {
    this.dataCity = dataCity;
    String? a = sl<IWordStorage>().getWords();
    if (a != null) {
      int cityId = int.parse(a);
      currentCity = dataCity.firstWhere((e) => e.id == cityId);
    }
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> selectCity(CityDatum? currentCity) async {
    if (currentCity != null) {
      this.currentCity = currentCity;
      sl<IWordStorage>().saveWords(currentCity.id.toString());
    } else {
      sl<IWordStorage>().deleteWords();
      log(sl<IWordStorage>().getWords().toString());
      this.currentCity = null;
    }
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    log(connectivityResult.toString());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      isInternetConnection = true;
    } else {
      isInternetConnection = false;
    }
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> saveSortItem(List<Item> items) async {
    for (final item in items) {
      final name = item.catalog?.name;
      if (name == null) continue; // пропустить, если имя null
      itemSort.removeWhere((e) => e.catalog?.name == name);
      itemSort.add(item);
    }
  }
  // Future<void> saveItems(ItemsModel items) async => this.items = items;
}
