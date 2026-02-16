import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
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
        TalkerDioLogger(
          talker: sl<Talker>(),
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
            printRequestData: true,
            printResponseData: true,
          ),
        ),
      ],
    );

  DioSettings() {
    dioKiosk = Dio(
      BaseOptions(
        // baseUrl: 'https://${sl<HostStorage>().getHost()}.finsider.asia/api',
        // baseUrl: 'https://aidos.finsider.asia/api',
        // baseUrl: 'https://${sl<HostStorage>().getHost()}.dev.qrpay.kz/api',
        baseUrl: 'https://${sl<HostStorage>().getHost()}.admin.qrpay.kz/api',
        headers: <String, String>{
          'accept': 'application/json',
          "content-type": "application/json",
          // authorization ставится динамически в KioskAuthInterceptor.onRequest
          'Accept-Language':
              sl<SharedPreferences>().getString('locale')?.split('_')[0] ??
                  'ru',
          'X-App-Version': sl<PackageInfo>().version,
        },
      ),
    );

    dioKiosk.interceptors.addAll([
      RetryOnConnectionErrorInterceptor(dio: dioKiosk),
      KioskAuthInterceptor(dioKiosk),
      // TalkerDioLogger(
      //   talker: sl<Talker>(),
      //   settings: const TalkerDioLoggerSettings(
      //     printRequestHeaders: true,
      //     printResponseHeaders: true,
      //     printRequestData: true,
      //     printResponseData: true,
      //   ),
      // ),
    ]);
  }
}
