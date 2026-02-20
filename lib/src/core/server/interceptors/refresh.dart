import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KioskAuthInterceptor extends Interceptor {
  final Dio _dio;
  late final Dio _refreshDio;

  KioskAuthInterceptor(this._dio) {
    _refreshDio = Dio(
      BaseOptions(
        baseUrl: _dio.options.baseUrl,
        headers: {
          'accept': 'application/json',
          if (sl<HostStorage>().hasHost())
            'Host': '${sl<HostStorage>().getHost()}.admin.qrpay.kz',
          // 'Host': '${sl<HostStorage>().getHost()}.dev.qrpay.kz',
          // 'Host': '${sl<HostStorage>().getHost()}.admin.qrpay.kz',

          // authorization ставится динамически в onRequest _refreshDio не используется напрямую
        },
        validateStatus: (_) => true,
      ),
    );
  }

  static const _retryKey = '__retry__';

  /// Динамически подставляем актуальный токен из KTokenStorage
  /// на каждый исходящий запрос (вместо статического значения в BaseOptions).
  /// Также динамически обновляем Accept-Language из SharedPreferences.
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = sl<KTokenStorage>().getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['authorization'] = 'Bearer $token';
    } else {
      options.headers.remove('authorization');
    }

    // Динамически обновляем Accept-Language из SharedPreferences
    final locale =
        sl<SharedPreferences>().getString('locale')?.split('_')[0] ?? 'ru';
    options.headers['Accept-Language'] = locale;

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

    try {
      final newToken = await _refreshToken();
      if (newToken == null) {
        throw Exception('refresh failed');
      }

      await sl<KTokenStorage>().saveToken(newToken);
      req.headers['authorization'] = 'Bearer $newToken';
      req.extra[_retryKey] = true;

      return handler.resolve(await _dio.fetch(req));
    } catch (_) {
      try {
        await sl<KioskAuthManager>().forceLogoutOnce();
      } catch (e) {
        log('[AUTH] forceLogoutOnce error: $e');
      }
      return handler.next(err);
    }
  }

  Future<String?> _refreshToken() async {
    try {
      // Подставляем актуальный токен перед refresh-запросом
      final currentToken = sl<KTokenStorage>().getToken();
      if (currentToken != null && currentToken.isNotEmpty) {
        _refreshDio.options.headers['authorization'] = 'Bearer $currentToken';
      }

      // Обновляем Accept-Language для refresh-запроса
      final locale =
          sl<SharedPreferences>().getString('locale')?.split('_')[0] ?? 'ru';
      _refreshDio.options.headers['Accept-Language'] = locale;

      log('''
------ 🔁 REFRESH TOKEN REQUEST ------
POST /auth/refresh
Headers: ${_refreshDio.options.headers}
--------------------------------------
''');

      final res = await _refreshDio.post(
        '/auth/refresh',
        data: {}, // если есть body – тут покажем
      );

      log('''
------ 🔁 REFRESH RESPONSE ------------
STATUS: ${res.statusCode}
Headers: ${res.headers.map}
DATA: ${res.data}
---------------------------------------
''');

      if (res.statusCode == 200) {
        return res.data['data'] as String?;
      }

      return null;
    } catch (e) {
      log('[AUTH] refresh request failed: $e');
      return null;
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

  Future<void> forceLogoutOnce() async {
    if (_loggingOut) return;
    _loggingOut = true;

    log('[KIOSK AUTH] force logout');

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
