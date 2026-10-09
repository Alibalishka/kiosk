import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/core/server/api_error_codes.dart';
import 'package:qr_pay_app/src/core/server/exceptions/network_exception.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_client_generator.dart';
import 'package:qr_pay_app/src/core/server/layers/network_executer.dart';
import 'package:qr_pay_app/src/core/server/result.dart';
import 'package:qr_pay_app/src/core/server/retry_after.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/kiosk_api.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/table_orders_poll.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';

/// Отдаёт заранее заданный ответ и запоминает маршрут.
class _Executer extends Fake implements NetworkExecuter {
  _Executer(this.result);

  final Result<Response<dynamic>> result;
  BaseClientGenerator? route;

  @override
  Future<Result<Response<dynamic>>> executeRaw({
    required BaseClientGenerator route,
  }) async {
    this.route = route;
    return result;
  }
}

Response<dynamic> _response(
  int status, {
  Object? data,
  Map<String, List<String>> headers = const {},
}) =>
    Response<dynamic>(
      requestOptions: RequestOptions(path: '/orders/table'),
      statusCode: status,
      data: data,
      headers: Headers.fromMap(headers),
    );

/// Ответ, который Dio счёл ошибкой (статус вне [isSuccessStatus]).
Result<Response<dynamic>> _httpError(
  int status, {
  Object? data,
  Map<String, List<String>> headers = const {},
}) {
  final response = _response(status, data: data, headers: headers);
  return Result.failure(NetworkException.request(
    error: DioException.badResponse(
      statusCode: status,
      requestOptions: response.requestOptions,
      response: response,
    ),
  ));
}

Future<TableOrdersPoll> _fetch(
  Result<Response<dynamic>> result, {
  String? etag,
}) =>
    KioskRepositoryImpl(client: _Executer(result))
        .fetchTableOrders(venueId: 7, tableId: '12', etag: etag);

void main() {
  group('Retry-After', () {
    test('секунды', () {
      expect(parseRetryAfter('30'), const Duration(seconds: 30));
      expect(parseRetryAfter(' 0 '), Duration.zero);
    });

    test('HTTP-дата — сколько до неё осталось', () {
      final now = DateTime.utc(2026, 10, 8, 12);
      final at = HttpDate.format(now.add(const Duration(seconds: 90)));
      expect(parseRetryAfter(at, now: now), const Duration(seconds: 90));

      final past = HttpDate.format(now.subtract(const Duration(minutes: 1)));
      expect(parseRetryAfter(past, now: now), Duration.zero);
    });

    test('нет заголовка или мусор — null', () {
      expect(parseRetryAfter(null), isNull);
      expect(parseRetryAfter(''), isNull);
      expect(parseRetryAfter('-5'), isNull);
      expect(parseRetryAfter('скоро'), isNull);
    });
  });

  group('код ошибки в ответе', () {
    test('находится, в каком бы поле ни пришёл', () {
      for (final body in [
        {
          'data': {'message': 'Касса занята', 'code': 'pay_at_venue_busy'},
        },
        {
          'data': {'message': 'Касса занята', 'error': 'pay_at_venue_busy'},
        },
        {'message': 'Касса занята', 'error_code': 'pay_at_venue_busy'},
        {
          'data': {
            'errors': {
              'pay_at_venue_busy': ['Касса занята'],
            },
          },
        },
        {
          'data': {
            'errors': [
              {'reason': 'pay_at_venue_busy'},
            ],
          },
        },
        {
          'data': {'message': 'pay_at_venue_busy'},
        },
      ]) {
        expect(ApiErrorCodes.find(body), ApiErrorCodes.payAtVenueBusy,
            reason: '$body');
      }
    });

    test('текст для гостя и чужие коды — не код', () {
      expect(
        ApiErrorCodes.find({
          'data': {'message': 'Заведение скоро закрывается', 'code': 'closing'},
        }),
        isNull,
      );
      expect(ApiErrorCodes.find(null), isNull);
      expect(ApiErrorCodes.find('<html>502</html>'), isNull);
    });

    test('NetworkException отдаёт код и отличает обрыв связи от отказа', () {
      final rejected = _httpError(400, data: {
        'data': {
          'message': 'Онлайн-оплата отключена',
          'code': 'online_payment_disabled',
        },
      }).whenOrNull(failure: (error) => error)!;
      expect(rejected.reason, ApiErrorCodes.onlinePaymentDisabled);
      expect(rejected.msg, 'Онлайн-оплата отключена');
      expect(rejected.isNoResponse, isFalse);

      final dropped = NetworkException.request(
        error: DioException.connectionError(
          requestOptions: RequestOptions(path: '/orders/pay-order'),
          reason: 'connection reset',
        ),
      );
      expect(dropped.reason, isNull);
      expect(dropped.isNoResponse, isTrue);
      expect(const NetworkException.connectivity().isNoResponse, isTrue);
    });
  });

  group('маршрут опроса', () {
    test('i и t в запросе, ETag — в If-None-Match', () {
      const route =
          KioskApi.tableOrders(venueId: 7, tableId: '12', etag: '"v1"');
      expect(route.method, 'GET');
      expect(route.path, '/orders/table');
      expect(route.queryParameters, {'i': 7, 't': '12'});
      expect(route.headers, {'If-None-Match': '"v1"'});

      const first = KioskApi.tableOrders(venueId: 7, tableId: '12');
      expect(first.headers, isNull, reason: 'без ETag заголовка нет');
    });

    test('304 — ответ, а не ошибка; у остальных маршрутов как раньше', () {
      const route = KioskApi.tableOrders(venueId: 7, tableId: '12');
      expect(route.isSuccessStatus(304), isTrue);
      expect(route.isSuccessStatus(200), isTrue);
      expect(route.isSuccessStatus(429), isFalse);

      expect(const KioskApi.techWork().isSuccessStatus(304), isFalse);
      expect(const KioskApi.techWork().isSuccessStatus(200), isTrue);
    });

    test('подвисший запрос не держит опрос часами', () {
      const route = KioskApi.tableOrders(venueId: 7, tableId: '12');
      expect(route.receiveTimeOut, 20000);
    });
  });

  group('ответ опроса', () {
    test('200 — заказы и ETag', () async {
      final poll = await _fetch(Result.success(_response(
        200,
        data: {
          'data': {'poll_after': 60, 'orders': <Object>[]},
        },
        headers: {
          'etag': ['"abc"'],
        },
      )));

      poll.maybeWhen(
        loaded: (data, etag) {
          expect(data.pollAfter, 60);
          expect(data.orders, isEmpty);
          expect(etag, '"abc"');
        },
        orElse: () => fail('ожидался loaded, пришёл $poll'),
      );
    });

    test('304 — данные не изменились', () async {
      final poll = await _fetch(Result.success(_response(304)), etag: '"abc"');
      expect(poll, const TableOrdersPoll.notModified());
    });

    test('429 — ждём сколько сказано в Retry-After', () async {
      final poll = await _fetch(_httpError(429, headers: {
        'retry-after': ['40'],
      }));
      expect(
        poll,
        const TableOrdersPoll.rateLimited(retryAfter: Duration(seconds: 40)),
      );

      final noHeader = await _fetch(_httpError(429));
      expect(noHeader, const TableOrdersPoll.rateLimited());
    });

    test('403 — переподключение, 400 — неверный стол', () async {
      expect(await _fetch(_httpError(403)), const TableOrdersPoll.forbidden());
      expect(
        await _fetch(_httpError(400)),
        const TableOrdersPoll.invalidTable(),
      );
    });

    test('сеть, 5xx и непонятный ответ — failed', () async {
      expect(
        await _fetch(const Result.failure(NetworkException.connectivity())),
        const TableOrdersPoll.failed(),
      );
      expect(await _fetch(_httpError(500)), const TableOrdersPoll.failed());
      expect(
        await _fetch(Result.success(_response(200, data: '<html>'))),
        const TableOrdersPoll.failed(),
      );
      expect(
        await _fetch(Result.success(_response(200, data: {
          'data': {'orders': 'nope'},
        }))),
        const TableOrdersPoll.failed(),
      );
    });
  });
}
