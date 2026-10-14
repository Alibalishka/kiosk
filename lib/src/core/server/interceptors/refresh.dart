import 'dart:async';
import 'dart:developer';
import 'dart:io' show HttpStatus;

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_pay_app/src/core/constants/app_url.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_disconnect_log.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/core/logic/locale_storage.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KioskAuthInterceptor extends Interceptor {
  final Dio _dio;
  late final Dio _refreshDio;

  /// [refreshAdapter] — транспорт refresh-запроса, подменяется в тестах.
  KioskAuthInterceptor(this._dio, {HttpClientAdapter? refreshAdapter}) {
    _refreshDio = Dio(
      BaseOptions(
        baseUrl: _dio.options.baseUrl,
        // Refresh ждут все запросы, получившие 401, — висеть он не должен.
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'accept': 'application/json',
          if (sl<HostStorage>().hasHost() && AppUrls.isProd)
            'Host': '${sl<HostStorage>().getHost()}.admin.qrpay.kz',
          // 'Host': '${sl<HostStorage>().getHost()}.dev.qrpay.kz',
          // 'Host': '${sl<HostStorage>().getHost()}.admin.qrpay.kz',

          // authorization и Accept-Language уходят в самом refresh-запросе
        },
        validateStatus: (_) => true,
      ),
    );
    if (refreshAdapter != null) _refreshDio.httpClientAdapter = refreshAdapter;
  }

  static const _retryKey = '__retry__';

  /// Обновление токена, которое уже идёт. Параллельные 401 ждут его, а не
  /// шлют свой refresh: старый токен сервер обменивает только один раз, и
  /// второй refresh с ним разлогинивал бы планшет.
  Future<String?>? _refreshing;

  /// [HostStorage] обновляется при регистрации, но [Dio.options.baseUrl]
  /// задаётся один раз в [DioSettings] — без синхронизации уходит старый tenant.
  String? _syncHostsFromStorage() {
    final host = sl<HostStorage>().getHost()?.trim();
    if (host == null || host.isEmpty) return null;

    final baseUrl = AppUrls.apiByHost(host);
    _dio.options.baseUrl = baseUrl;
    _refreshDio.options.baseUrl = baseUrl;
    if (AppUrls.isProd) {
      _refreshDio.options.headers['Host'] = '${host}.admin.qrpay.kz';
    } else {
      _refreshDio.options.headers.remove('Host');
    }
    return host;
  }

  void _applyHostFromStorage(RequestOptions options) {
    final host = _syncHostsFromStorage();
    if (host == null) return;

    options.baseUrl = AppUrls.apiByHost(host);
    if (AppUrls.isProd) {
      options.headers['Host'] = '${host}.admin.qrpay.kz';
    } else {
      options.headers.remove('Host');
    }
  }

  /// Динамически подставляем актуальный токен из KTokenStorage
  /// на каждый исходящий запрос (вместо статического значения в BaseOptions).
  /// Также динамически обновляем Accept-Language из SharedPreferences.
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _applyHostFromStorage(options);

    final token = sl<KTokenStorage>().getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['authorization'] = 'Bearer $token';
    } else {
      options.headers.remove('authorization');
    }

    // Динамически обновляем Accept-Language из SharedPreferences
    options.headers['Accept-Language'] = apiLanguage(sl<SharedPreferences>());

    handler.next(options);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    final status = err.response?.statusCode;

    if (status != 401) {
      return handler.next(err);
    }

    final req = err.requestOptions;

    // показываем инфу только при 401
    log('''
========== ❗401 intercepted ==========
URL: ${req.uri}
METHOD: ${req.method}
HEADERS: ${req.headers}
DATA: ${req.data}
=====================================
''');

    if (req.extra[_retryKey] == true) {
      log('[AUTH] second 401 → stop retry.');
      return handler.next(err);
    }

    final token = await _tokenForRetry(sentWith: _bearerOf(req));
    if (token == null) return handler.next(err);

    req.headers['authorization'] = 'Bearer $token';
    req.extra[_retryKey] = true;

    try {
      return handler.resolve(await _dio.fetch(req));
    } on DioException catch (e) {
      // Повтор не прошёл (сеть, 5xx, снова 401) — это ошибка запроса, а не
      // сессии: токен свежий, разлогинивать не за что.
      return handler.next(e);
    }
  }

  /// Токен для повтора запроса, получившего 401, или null — повторять нечем.
  Future<String?> _tokenForRetry({required String? sentWith}) async {
    final stored = sl<KTokenStorage>().getToken();
    // Пока запрос был в пути, токен уже обновил другой запрос — повторяем
    // с новым. Свой refresh со старым токеном сервер бы отклонил.
    if (stored != null && stored.isNotEmpty && stored != sentWith) {
      return stored;
    }
    return _refreshing ??= _refresh().whenComplete(() => _refreshing = null);
  }

  /// Один refresh на все запросы с 401. Новый токен сохраняем здесь же —
  /// ожидающие получают его уже записанным.
  Future<String?> _refresh() async {
    final result = await _refreshToken();
    final token = result.token;
    if (token != null) {
      try {
        await sl<KTokenStorage>().saveToken(token);
      } catch (e) {
        log('[AUTH] save refreshed token failed: $e');
      }
      return token;
    }

    if (_isSessionRejected(result.status)) {
      try {
        await sl<KioskAuthManager>().forceLogoutOnce(
          reason: 'refresh rejected with ${result.status}',
        );
      } catch (e) {
        log('[AUTH] forceLogoutOnce error: $e');
      }
    }
    return null;
  }

  /// Сервер понял refresh и отказал: токен больше не обменять, сессия
  /// кончилась. Сеть, таймаут, 429 и 5xx — временный сбой: сессия ещё жива,
  /// и разлогинивать из-за него планшет нельзя — запрос просто не удался.
  static bool _isSessionRejected(int? status) =>
      status != null &&
      status >= 400 &&
      status < 500 &&
      status != HttpStatus.requestTimeout &&
      status != HttpStatus.tooManyRequests;

  static String? _bearerOf(RequestOptions options) {
    final header = options.headers['authorization'];
    const prefix = 'Bearer ';
    if (header is! String || !header.startsWith(prefix)) return null;
    return header.substring(prefix.length);
  }

  /// Новый токен или null. [status] — код ответа refresh, null — ответа нет
  /// (сеть, таймаут).
  Future<({String? token, int? status})> _refreshToken() async {
    try {
      _syncHostsFromStorage();

      // Токен и язык — в самом запросе, а не в общих заголовках: иначе
      // при пустом хранилище ушёл бы токен прошлого refresh.
      final currentToken = sl<KTokenStorage>().getToken();
      final headers = <String, dynamic>{
        'Accept-Language': apiLanguage(sl<SharedPreferences>()),
        if (currentToken != null && currentToken.isNotEmpty)
          'authorization': 'Bearer $currentToken',
      };

      log('''
------ 🔁 REFRESH TOKEN REQUEST ------
POST /auth/refresh
Headers: ${{..._refreshDio.options.headers, ...headers}}
--------------------------------------
''');

      final res = await _refreshDio.post<dynamic>(
        '/auth/refresh',
        data: {}, // если есть body – тут покажем
        options: Options(headers: headers),
      );

      log('''
------ 🔁 REFRESH RESPONSE ------------
STATUS: ${res.statusCode}
Headers: ${res.headers.map}
DATA: ${res.data}
---------------------------------------
''');

      final status = res.statusCode;
      if (status != 200) return (token: null, status: status);

      final data = res.data;
      final token = data is Map ? data['data'] : null;
      if (token is String && token.isNotEmpty) {
        return (token: token, status: status);
      }
      // 200 без токена — сломанный ответ, а не отказ: сессию не трогаем.
      log('[AUTH] refresh 200 without token: $data');
      return (token: null, status: null);
    } catch (e) {
      log('[AUTH] refresh request failed: $e');
      return (token: null, status: null);
    }
  }

  // void _navigateToAuth() {
  //   log('[AUTH] navigate to registration page');
  //   // Future.microtask(
  //   //     () => router.root.replaceAll([const KioskProviderRoute()]));
  // }
}

class KioskAuthManager {
  final KTokenStorage tokens;
  final HostStorage hostStorage;
  final RootStackRouter router;

  bool _loggingOut = false;

  KioskAuthManager(
    this.tokens,
    this.hostStorage,
    this.router,
  );

  Future<void> forceLogoutOnce({required String reason}) async {
    if (_loggingOut) return;
    _loggingOut = true;

    logKioskDisconnect(reason);

    tokens.deleteToken();
    hostStorage.deleteHost();

    // Выходим из стека Dio, принудительно запрашиваем кадр, затем навигация в postFrameCallback
    final completer = Completer<void>();
    Future<void>.delayed(Duration.zero, () {
      SchedulerBinding.instance.scheduleFrame();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        log('[KIOSK AUTH] navigating to KioskProviderRoute');
        void onDone() {
          if (!completer.isCompleted) completer.complete();
        }

        router
            .pushAndPopUntil(const KioskProviderRoute(),
                predicate: (_) => false)
            .then((_) {
          log('[KIOSK AUTH] pushAndPopUntil completed');
          onDone();
        }, onError: (e, st) {
          log('[KIOSK AUTH] pushAndPopUntil error: $e\n$st');
          router.replaceAll([const KioskProviderRoute()]).then((_) => onDone(),
              onError: (e2, st2) {
            log('[KIOSK AUTH] replaceAll fallback error: $e2\n$st2');
            onDone();
          });
        });
      });
    });
    try {
      await completer.future.timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          log('[KIOSK AUTH] navigation timeout');
          if (!completer.isCompleted) completer.complete();
        },
      );
    } catch (e) {
      log('[KIOSK AUTH] forceLogoutOnce await error: $e');
    }
  }

  /// вызвать после успешного логина
  void reset() {
    _loggingOut = false;
  }
}

// class TokenRefreshInterceptor extends Interceptor {
//   TokenRefreshInterceptor(
//     this._dio, {
//     required Future<void> Function() onLogout,
//   })  : _onLogout = onLogout,
//         _refreshDio = Dio(
//           BaseOptions(
//             baseUrl: _dio.options.baseUrl,
//             validateStatus: (_) => true,
//           ),
//         );

//   final Dio _dio;
//   final Dio _refreshDio;
//   final Future<void> Function() _onLogout;

//   Completer<String?>? _refreshCompleter;
//   bool _logoutTriggered = false;

//   static const _kRetried = '__token_retry__';

//   bool _isRefreshRequest(RequestOptions ro) =>
//       ro.path.contains('/auth/refresh');

//   Future<void> _logoutOnce() async {
//     if (_logoutTriggered) return;
//     _logoutTriggered = true;

//     sl<KTokenStorage>().deleteToken();
//     sl<HostStorage>().deleteHost();
//     await _onLogout();
//   }

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     final token = sl<KTokenStorage>().getToken();
//     if (token != null && token.isNotEmpty) {
//       options.headers['authorization'] = 'Bearer $token';
//     } else {
//       options.headers.remove('authorization');
//     }
//     handler.next(options);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     final ro = err.requestOptions;
//     final code = err.response?.statusCode;

//     // 1) Любая HTTP-ошибка (есть code), но НЕ 401 => logout
//     if (code != null && code != 401) {
//       await _logoutOnce();
//       return handler.next(err);
//     }

//     // 2) Не 401 (timeout/no internet и т.п.) — не разлогиниваем
//     if (code != 401) return handler.next(err);

//     // 3) Если это refresh — значит сессия умерла
//     if (_isRefreshRequest(ro)) {
//       await _logoutOnce();
//       return handler.next(err);
//     }

//     // 4) Уже ретраили и снова 401
//     if (ro.extra[_kRetried] == true) {
//       await _logoutOnce();
//       return handler.next(err);
//     }

//     try {
//       final newToken = await _refreshTokenOnce();
//       if (newToken == null || newToken.isEmpty) {
//         await _logoutOnce();
//         return handler.next(err);
//       }

//       final response = await _retry(ro, newToken);
//       return handler.resolve(response);
//     } catch (_) {
//       await _logoutOnce();
//       return handler.next(err);
//     }
//   }

//   Future<String?> _refreshTokenOnce() async {
//     if (_refreshCompleter != null) return _refreshCompleter!.future;

//     final completer = Completer<String?>();
//     _refreshCompleter = completer;

//     try {
//       _refreshDio.options.baseUrl = _dio.options.baseUrl;

//       final currentToken = sl<KTokenStorage>().getToken();

//       _refreshDio.options.headers['accept'] = 'application/json';
//       _refreshDio.options.headers['content-type'] = 'application/json';
//       _refreshDio.options.headers['Accept-Language'] =
//           sl<SharedPreferences>().getString('locale')?.split('_')[0] ?? 'ru';
//       _refreshDio.options.headers['X-App-Version'] = sl<PackageInfo>().version;

//       if (currentToken != null && currentToken.isNotEmpty) {
//         _refreshDio.options.headers['authorization'] = 'Bearer $currentToken';
//       } else {
//         _refreshDio.options.headers.remove('authorization');
//       }

//       final resp = await _refreshDio.post('/auth/refresh', data: {});
//       if (resp.statusCode != 200) {
//         completer.complete(null);
//         return completer.future;
//       }

//       final data = resp.data;

//       String? token;
//       if (data is Map) {
//         final d = data['data'];
//         if (d is String && d.isNotEmpty) token = d;
//         token ??= (data['access_token'] is String)
//             ? data['access_token'] as String
//             : null;
//         token ??= (data['token'] is String) ? data['token'] as String : null;
//       } else if (data is String && data.isNotEmpty) {
//         token = data;
//       }

//       if (token != null && token.isNotEmpty) {
//         await sl<KTokenStorage>().saveToken(token);
//         completer.complete(token);
//       } else {
//         completer.complete(null);
//       }
//     } catch (e) {
//       completer.completeError(e);
//     } finally {
//       _refreshCompleter = null;
//     }

//     return completer.future;
//   }

//   Future<Response<dynamic>> _retry(
//       RequestOptions requestOptions, String token) {
//     final newHeaders = Map<String, dynamic>.from(requestOptions.headers)
//       ..['authorization'] = 'Bearer $token';

//     final newExtra = Map<String, dynamic>.from(requestOptions.extra)
//       ..[_kRetried] = true;

//     final opts = requestOptions.copyWith(
//       headers: newHeaders,
//       extra: newExtra,
//     );

//     return _dio.fetch(opts);
//   }
// }
