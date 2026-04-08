import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qr_pay_app/src/core/constants/app_url.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/token_storage.dart';
import 'package:dio/dio.dart';
import 'package:qr_pay_app/src/core/server/interceptors/refresh.dart';
import 'package:qr_pay_app/src/core/server/interceptors/retry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

class DioSettings {
  static const MethodChannel _dpc = MethodChannel('dpc');
  static const String _keyboardPackage = 'rkr.simplekeyboard.inputmethod';
  late final PackageInfo packageInfo;
  late final Dio dioKiosk;
  // final Dio dio = Dio();
  // PackageInfo packageInfo = PackageInfo.fromPlatform();

  final Dio dio = Dio()
    ..options = BaseOptions(
      baseUrl: AppUrls.devUrl,
      headers: <String, String>{
        'accept': 'application/json',
        "content-type": "application/json",
        'authorization': 'Bearer ${sl<ITokenStorage>().getToken() ?? ''}',
        'Accept-Language':
            sl<SharedPreferences>().getString('locale')?.split('_')[0] ?? 'ru',
        'X-App-Version': sl<PackageInfo>().version,
      },
    )
    ..interceptors.addAll(
      <Interceptor>[
        // LogInterceptor(
        //   request: true,
        //   requestHeader: true,
        //   requestBody: true,
        //   responseHeader: true,
        //   responseBody: true,
        //   error: true,
        // ),
      ],
    );

  DioSettings() {
    dioKiosk = Dio(
      BaseOptions(
        baseUrl: AppUrls.apiByHost(sl<HostStorage>().getHost() ?? 'sandyq'),
        headers: <String, dynamic>{
          'accept': 'application/json',
          "content-type": "application/json",
          // authorization ставится динамически в KioskAuthInterceptor.onRequest
          'Accept-Language':
              sl<SharedPreferences>().getString('locale')?.split('_')[0] ??
                  'ru',
          'X-App-Version': sl<PackageInfo>().version,
          'X-Keyboard-Version': null,
        },
      ),
    );
    _initKeyboardVersionHeader();

    dioKiosk.interceptors.addAll([
      RetryOnConnectionErrorInterceptor(dio: dioKiosk),
      KioskAuthInterceptor(dioKiosk),
      TalkerDioLogger(
        talker: sl<Talker>(),
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printRequestData: true,
          printResponseData: true,
        ),
      ),
      // LogInterceptor(
      //   request: true,
      //   requestHeader: true,
      //   requestBody: true,
      //   responseHeader: true,
      //   responseBody: true,
      //   error: true,
      // ),
    ]);
  }

  Future<void> _initKeyboardVersionHeader() async {
    try {
      final dynamic raw = await _dpc.invokeMethod(
        'getPackageVersion',
        <String, dynamic>{'packageName': _keyboardPackage},
      );
      dioKiosk.options.headers['X-Keyboard-Version'] =
          (raw is String && raw.trim().isNotEmpty) ? raw.trim() : null;
    } catch (_) {
      dioKiosk.options.headers['X-Keyboard-Version'] = null;
    }
  }
}
