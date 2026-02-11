import 'dart:io';

import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qr_pay_app/src/core/constants/app_url.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/token_storage.dart';
import 'package:dio/dio.dart';
import 'package:qr_pay_app/src/core/server/interceptors/refresh.dart';
import 'package:qr_pay_app/src/core/server/interceptors/retry.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../logic/kiosk_token_storage.dart';

// class CommonHeadersInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     options.headers['accept'] = 'application/json';
//     options.headers['content-type'] = 'application/json';

//     options.headers['Accept-Language'] =
//         sl<SharedPreferences>().getString('locale')?.split('_')[0] ?? 'ru';

//     options.headers['X-App-Version'] = sl<PackageInfo>().version;

//     handler.next(options);
//   }
// }

// class DioSettings {
//   late final Dio dio;
//   late final Dio dioKiosk;

//   DioSettings() {
//     dio = _createDio(baseUrl: AppUrls.devUrl);

//     dioKiosk = _createDio(
//       baseUrl: 'https://${sl<HostStorage>().getHost()}.finsider.asia/api',
//     );
//   }

//   Dio _createDio({required String baseUrl}) {
//     final d = Dio(
//       BaseOptions(
//         baseUrl: baseUrl, // ✅ фикс: теперь реально используется
//         // baseUrl: 'https://${sl<HostStorage>().getHost()}.finsider.asia/api',
//         validateStatus: (_) => true,
//         headers: <String, dynamic>{
//           'accept': 'application/json',
//           'content-type': 'application/json',
//           // authorization НЕ ставим тут (ставит interceptor в onRequest)
//           'Accept-Language':
//               sl<SharedPreferences>().getString('locale')?.split('_')[0] ??
//                   'ru',
//           'X-App-Version': sl<PackageInfo>().version,
//         },
//       ),
//     );

//     // если хочешь чтобы Talker логировал ТОЛЬКО в debug:
//     const enableTalker = kDebugMode; // или true, если нужно и в release

//     d.interceptors.addAll([
//       CommonHeadersInterceptor(),

//       if (enableTalker)
//         TalkerDioLogger(
//           talker: sl<Talker>(),
//           settings: TalkerDioLoggerSettings(
//             // скрываем токены/куки в логах talker :contentReference[oaicite:0]{index=0}
//             // hiddenHeaders: const {'authorization', 'cookie', 'set-cookie'},

//             // опционально: не логировать refresh вообще
//             // requestFilter: (o) => !o.path.contains('/auth/refresh'),
//             // responseFilter: (r) =>
//             //     !r.requestOptions.path.contains('/auth/refresh'),
//             // errorFilter: (e) =>
//             //     !e.requestOptions.path.contains('/auth/refresh'),

//             printRequestHeaders: true,
//             printResponseHeaders: true,
//             printRequestData: true,
//             printResponseData: true,
//             printErrorMessage: true,
//             printErrorData: true,
//           ),
//         ),

//       // ✅ TokenRefresh ставим ПОСЛЕДНИМ — чтобы он первым ловил ошибки (401) и “гасил” их до логгера
//       TokenRefreshInterceptor(
//         d,
//         onLogout: () async {
//           // твоя навигация
//         },
//       ),
//     ]);

//     return d;
//   }
// }

// // class DioSettings {
// //   late final Dio dio;
// //   late final Dio dioKiosk;

// //   DioSettings() {
// //     dio = _createDio(baseUrl: AppUrls.devUrl);
// //     dioKiosk = _createDio(
// //       // baseUrl: 'https://${sl<HostStorage>().getHost()}.dev.qrpay.kz/api',
// //       baseUrl: 'https://${sl<HostStorage>().getHost()}.finsider.asia/api',
// //     );
// //   }

// //   Dio _createDio({required String baseUrl}) {
// //     final d = Dio(
// //       BaseOptions(
// //         baseUrl: 'https://aidos.finsider.asia/api',
// //         headers: <String, dynamic>{
// //           'accept': 'application/json',
// //           'content-type': 'application/json',
// //           // authorization НЕ ставим тут (ставит interceptor в onRequest)
// //           'Accept-Language':
// //               sl<SharedPreferences>().getString('locale')?.split('_')[0] ??
// //                   'ru',
// //           'X-App-Version': sl<PackageInfo>().version,
// //         },
// //       ),
// //     );

// //     d.interceptors.addAll([
// //       TokenRefreshInterceptor(
// //         d,
// //         onLogout: () async {
// //           // твоя навигация
// //         },
// //       ),
// //       TalkerDioLogger(
// //         talker: sl<Talker>(),
// //         settings: const TalkerDioLoggerSettings(
// //           printRequestHeaders: true,
// //           printResponseHeaders: true,
// //           printRequestData: true,
// //           printResponseData: true,
// //         ),
// //       ),
// //     ]);

// //     return d;
// //   }
// // }

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
        baseUrl: 'https://${sl<HostStorage>().getHost()}.dev.qrpay.kz/api',
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
      TalkerDioLogger(
        talker: sl<Talker>(),
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printRequestData: true,
          printResponseData: true,
        ),
      ),
    ]);
  }
}
