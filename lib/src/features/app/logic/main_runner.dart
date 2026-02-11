// ignore_for_file: avoid-ignoring-return-values
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
// import 'package:qr_pay_app/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:qr_pay_app/src/core/base/bloc_observer.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/resources/localization_loader.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/features/app/logic/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef AsyncDependencies<D> = Future<D> Function();

typedef AppBuilder<D> = Widget Function(D dependencies);

mixin MainRunner {
  static Future<Widget> _initApp<D>(
      AsyncDependencies<D> asyncDependencies, AppBuilder<D> app) async {
    final dependencies = await asyncDependencies();

    return app(dependencies);
  }

  static Future<void> run<D>({
    required AsyncDependencies<D> asyncDependencies,
    required AppBuilder<D> appBuilder,
  }) async {
    runZonedGuarded<void>(
      () => Logger.runLogging(
        () async {
          WidgetsFlutterBinding.ensureInitialized();
          //   await Firebase.initializeApp(
          //     options: DefaultFirebaseOptions.currentPlatform,
          //   );

          // if (Platform.isAndroid) {
          //   await Firebase.initializeApp(
          //     options: DefaultFirebaseOptions.currentPlatform,
          //   );
          // } else if (Platform.isIOS) {
          //   final app = await Firebase.initializeApp();
          //   log(app.options.toString());
          // }

          // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
          await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          await SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp]);

          FlutterError.onError = Logger.logFlutterError;

          final app = await _initApp(asyncDependencies, appBuilder);

          /// Все ошибки BLoC'ов перенаправляются в Observer
          Bloc.observer = AppBlocObserver();

          /// Добавляется чтобы избежать несколько одновременных ивентов
          Bloc.transformer = bloc_concurrency.sequential<Object?>();

          /// Иницализация GetIt
          await initGetIt();

          // await Upgrader.clearSavedSettings();

          // runApp(app);

          // await NotificationService.instance.initilize();
          runApp(
            EasyLocalization(
              supportedLocales: const [
                Locale('ru', 'RU'),
                Locale('kk', 'KK'),
                Locale('en', 'US'),
              ],
              path:
                  'assets/translations', // <-- change the path of the translation files
              assetLoader: const CodegenLoader(),
              fallbackLocale: const Locale('kk', 'KK'),
              startLocale: getLocale(
                  sl<SharedPreferences>().getString('locale') ?? 'ru'),
              // Locale(sl<SharedPreferences>().getString('locale') ?? 'ru'),
              child: Phoenix(child: app),
            ),
          );
        },
      ),
      Logger.logZoneError,
    );
  }
}

Locale getLocale(String locale) {
  if (locale.contains(AppLanguages.kk)) {
    return const Locale('kk', 'KK');
  } else if (locale.contains(AppLanguages.ru)) {
    return const Locale('ru', 'RU');
  } else {
    return const Locale('en', 'US');
  }
}
