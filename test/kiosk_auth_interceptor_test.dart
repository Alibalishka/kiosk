import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/core/server/interceptors/refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef _Handler = FutureOr<ResponseBody> Function(RequestOptions options);

/// Сервер по сценарию: каждый запрос отвечает [handler].
class _Adapter implements HttpClientAdapter {
  _Adapter(this.handler);

  _Handler handler;
  final requests = <RequestOptions>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    return handler(options);
  }

  @override
  void close({bool force = false}) {}
}

ResponseBody _json(int status, Object body) => ResponseBody.fromString(
      jsonEncode(body),
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );

class _AuthManager extends Fake implements KioskAuthManager {
  final logouts = <String>[];

  @override
  Future<void> forceLogoutOnce({required String reason}) async =>
      logouts.add(reason);
}

/// API принимает только токен `new`, остальные — 401.
ResponseBody _api(RequestOptions options) =>
    options.headers['authorization'] == 'Bearer new'
        ? _json(200, {'ok': true})
        : _json(401, {'message': 'Unauthenticated.'});

void main() {
  late _Adapter api;
  late _Adapter refresh;
  late _AuthManager auth;
  late Dio dio;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    await sl.reset();
    sl
      ..registerSingleton<SharedPreferences>(prefs)
      ..registerSingleton<KTokenStorage>(
        SharedPrefsKTokenStorage(preferences: prefs),
      )
      ..registerSingleton<HostStorage>(
        SharedPrefsHostStorage(preferences: prefs),
      )
      ..registerSingleton<KioskAuthManager>(auth = _AuthManager());
    await sl<HostStorage>().saveHost('test');
    await sl<KTokenStorage>().saveToken('old');

    api = _Adapter(_api);
    refresh = _Adapter((_) => _json(200, {'data': 'new'}));
    dio = Dio()..httpClientAdapter = api;
    dio.interceptors.add(KioskAuthInterceptor(dio, refreshAdapter: refresh));
  });

  tearDown(() => sl.reset());

  test('401 — refresh, новый токен сохранён, запрос повторён', () async {
    final response = await dio.get<dynamic>('/menu');

    expect(response.statusCode, 200);
    expect(refresh.requests, hasLength(1));
    expect(refresh.requests.single.headers['authorization'], 'Bearer old');
    expect(sl<KTokenStorage>().getToken(), 'new');
    expect(auth.logouts, isEmpty);
  });

  test('параллельные 401 ждут один refresh, а не шлют второй', () async {
    // Старый токен сервер обменивает только один раз.
    final release = Completer<void>();
    var exchanged = false;
    refresh.handler = (options) async {
      await release.future;
      if (exchanged) return _json(401, {'message': 'Token blacklisted'});
      exchanged = true;
      return _json(200, {'data': 'new'});
    };

    final requests = [
      dio.get<dynamic>('/kiosk-status'),
      dio.get<dynamic>('/orders/table'),
      dio.get<dynamic>('/tech-work'),
    ];
    await pumpEventQueue();
    expect(api.requests, hasLength(3), reason: 'все трое уже получили 401');
    release.complete();
    final responses = await Future.wait(requests);

    expect(responses.map((r) => r.statusCode), everyElement(200));
    expect(refresh.requests, hasLength(1));
    expect(auth.logouts, isEmpty);
  });

  test('токен обновили, пока запрос был в пути, — повтор без refresh',
      () async {
    api.handler = (options) async {
      if (options.headers['authorization'] == 'Bearer old') {
        // Другой запрос успел обновить токен.
        await sl<KTokenStorage>().saveToken('new');
      }
      return _api(options);
    };

    final response = await dio.get<dynamic>('/menu');

    expect(response.statusCode, 200);
    expect(refresh.requests, isEmpty);
    expect(auth.logouts, isEmpty);
  });

  for (final status in [408, 429, 500, 503]) {
    test('refresh ответил $status — временный сбой, не разлогиниваем',
        () async {
      refresh.handler = (_) => _json(status, {'message': 'busy'});

      await expectLater(
        dio.get<dynamic>('/menu'),
        throwsA(isA<DioException>()
            .having((e) => e.response?.statusCode, 'status', 401)),
      );
      expect(auth.logouts, isEmpty);
      expect(sl<KTokenStorage>().getToken(), 'old');
    });
  }

  test('refresh не дошёл до сервера — не разлогиниваем', () async {
    refresh.handler = (options) => throw DioException.connectionError(
          requestOptions: options,
          reason: 'Failed host lookup',
        );

    await expectLater(dio.get<dynamic>('/menu'), throwsA(isA<DioException>()));
    expect(auth.logouts, isEmpty);
  });

  test('refresh 200 без токена — не разлогиниваем', () async {
    refresh.handler = (_) => _json(200, {'data': null});

    await expectLater(dio.get<dynamic>('/menu'), throwsA(isA<DioException>()));
    expect(auth.logouts, isEmpty);
    expect(sl<KTokenStorage>().getToken(), 'old');
  });

  for (final status in [401, 403, 422]) {
    test('refresh отклонён ($status) — сессия кончилась, разлогиниваем',
        () async {
      refresh.handler = (_) => _json(status, {'message': 'Token expired'});

      await expectLater(
        dio.get<dynamic>('/menu'),
        throwsA(isA<DioException>()
            .having((e) => e.response?.statusCode, 'status', 401)),
      );
      expect(auth.logouts, ['refresh rejected with $status']);
    });
  }

  test('повтор после refresh упал — ошибка запроса, а не выход', () async {
    api.handler = (options) => options.headers['authorization'] == 'Bearer new'
        ? _json(500, {'message': 'Server Error'})
        : _api(options);

    await expectLater(
      dio.get<dynamic>('/menu'),
      throwsA(isA<DioException>()
          .having((e) => e.response?.statusCode, 'status', 500)),
    );
    expect(auth.logouts, isEmpty);
    expect(sl<KTokenStorage>().getToken(), 'new');
  });

  test('повтор снова получил 401 — второй refresh не шлём', () async {
    api.handler = (_) => _json(401, {'message': 'Unauthenticated.'});

    await expectLater(dio.get<dynamic>('/menu'), throwsA(isA<DioException>()));
    expect(refresh.requests, hasLength(1));
    expect(auth.logouts, isEmpty);
  });
}
