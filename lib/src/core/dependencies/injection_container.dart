import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/core/server/dio_settings.dart';
import 'package:qr_pay_app/src/core/server/interceptors/refresh.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/vm/service/screen_saver_cache.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/notification_bloc/notification_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qr_pay_app/src/core/logic/fisrt_start_storage.dart';
import 'package:qr_pay_app/src/core/logic/search_word_storage.dart';
import 'package:qr_pay_app/src/core/logic/token_storage.dart';
import 'package:qr_pay_app/src/core/server/layers/network_connectivity.dart';
import 'package:qr_pay_app/src/core/server/layers/network_creator.dart';
import 'package:qr_pay_app/src/core/server/layers/network_decoder.dart';
import 'package:qr_pay_app/src/core/server/layers/network_executer.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/bonus_bloc/bonus_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/free_bloc/free_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/qr_menu/qr_menu_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/reserv_bloc/reserv_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/review_bloc/review_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/history_bloc/history_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/history_order_bloc/history_order_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/subscription_bloc/subscription_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/support_bloc/support_bloc.dart';
import 'package:qr_pay_app/src/features/qr/logic/bloc/checkout_bloc/chekout_bloc.dart';
import 'package:qr_pay_app/src/features/qr/logic/bloc/pay_bloc/pay_bloc.dart';
import 'package:qr_pay_app/src/features/qr/logic/bloc/promo_code_bloc/promo_code_bloc.dart';
import 'package:qr_pay_app/src/features/qr/logic/repository/cart_repository.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/city_bloc/city_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/item_bloc/item_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/news_bloc/news_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/detail_item_bloc/detail_item_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/detail_item_repository.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/home_repository.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/address_bloc/address_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/bank_cart_bloc/bank_cart_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/user_bloc/user_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';
import 'package:qr_pay_app/src/features/search/logic/bloc/search/search_bloc.dart';
import 'package:qr_pay_app/src/features/search/logic/repository/search_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

GetIt sl = GetIt.instance;

Future<void> initGetIt() async {
  /// Talker Service
  final talker = TalkerFlutter.init();
  sl.registerSingleton<Talker>(talker);
  talker.verbose('Talker initialization completed');

  /// Other Services
  sl.registerLazySingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  await GetIt.instance.isReady<SharedPreferences>();
  sl.registerLazySingleton<ITokenStorage>(
      () => SharedPrefsTokenStorage(preferences: sl<SharedPreferences>()));
  sl.registerLazySingleton<FirstStartStorage>(
      () => SharedPrefsFirstStartStorage(preferences: sl<SharedPreferences>()));
  sl.registerLazySingleton<IWordStorage>(
      () => SharedPrefsWordStorage(preferences: sl<SharedPreferences>()));
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<NetworkConnectivity>(
      () => NetworkConnectivity(connectivity: sl()));
  sl.registerLazySingleton<NetworkCreator>(() => NetworkCreator());
  sl.registerLazySingleton<NetworkDecoder>(() => NetworkDecoder());
  sl.registerSingletonAsync<PackageInfo>(() => PackageInfo.fromPlatform());
  sl.registerLazySingleton<NetworkExecuter>(
    () => NetworkExecuter(
      // dio: DioSettings().dio,
      connectionChecker: sl(),
      decoder: sl(),
      creator: sl(),
    ),
  );

  sl.registerLazySingleton<KioskAuthManager>(
    () => KioskAuthManager(
      sl<KTokenStorage>(),
      sl<HostStorage>(),
      sl<AppRouter>(),
    ),
  );
  // sl.registerLazySingleton(() => ScreenSaverVideoCache());

  /// KIOSK
  sl.registerLazySingleton<KTokenStorage>(
      () => SharedPrefsKTokenStorage(preferences: sl<SharedPreferences>()));
  sl.registerLazySingleton<HostStorage>(
      () => SharedPrefsHostStorage(preferences: sl<SharedPreferences>()));
  sl.registerLazySingleton<DioSettings>(() => DioSettings());

  /// BLoCs
  sl.registerFactory<AuthBloc>(
      () => AuthBloc(authRepository: sl(), localStorage: sl<ITokenStorage>()));
  sl.registerFactory<ItemBloc>(() => ItemBloc(homeRepository: sl()));
  sl.registerFactory<UserBloc>(() => UserBloc(authRepository: sl()));
  sl.registerFactory<DetailItemBloc>(
      () => DetailItemBloc(detailItemRepository: sl()));
  // sl.registerFactory<CartBloc>(() => CartBloc(cartRepository: sl()));
  sl.registerFactory<NewsBloc>(() => NewsBloc(homeRepository: sl()));
  sl.registerFactory<SearchBloc>(() => SearchBloc(searchRepository: sl()));
  sl.registerFactory<AddressBloc>(() => AddressBloc(authRepository: sl()));
  sl.registerFactory<BankCartBloc>(() => BankCartBloc(authRepository: sl()));
  sl.registerFactory<ChekoutBloc>(() => ChekoutBloc(cartRepository: sl()));
  sl.registerFactory<CityBloc>(() => CityBloc(homeRepository: sl()));
  sl.registerFactory<PayBloc>(() => PayBloc(cartRepository: sl()));
  sl.registerFactory<HistoryBloc>(() => HistoryBloc(authRepository: sl()));
  sl.registerFactory<SubscriptionBloc>(
      () => SubscriptionBloc(authRepository: sl()));
  sl.registerFactory<BonusBloc>(() => BonusBloc(homeRepository: sl()));
  sl.registerFactory<FreeBloc>(() => FreeBloc(homeRepository: sl()));
  sl.registerFactory<HistoryOrderBloc>(
      () => HistoryOrderBloc(authRepository: sl()));
  sl.registerFactory<SupportBloc>(() => SupportBloc(authRepository: sl()));
  sl.registerFactory<PromoCodeBloc>(() => PromoCodeBloc(cartRepository: sl()));
  sl.registerFactory<ReviewBloc>(() => ReviewBloc(homeRepository: sl()));
  // sl.registerFactory<NotificationBloc>(
  //     () => NotificationBloc(authRepository: sl()));
  sl.registerFactory<ReservBloc>(() => ReservBloc(detailItemRepository: sl()));
  sl.registerFactory<QrMenuBloc>(() => QrMenuBloc(homeRepository: sl()));

  /// Reposirory
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(client: sl()));
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(client: sl()));
  sl.registerLazySingleton<DetailItemRepository>(
      () => DetailItemRepositoryImpl(client: sl()));
  sl.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(client: sl()));
  sl.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(client: sl()));
  sl.registerLazySingleton<KioskRepository>(
      () => KioskRepositoryImpl(client: sl()));
}
