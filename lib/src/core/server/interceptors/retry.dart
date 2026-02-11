import 'dart:developer';

import 'package:dio/dio.dart';

/// Interceptor that retries requests on connection errors (DNS failures,
/// socket errors) with exponential backoff.
///
/// Useful after device reboot when the network interface is up but DNS
/// resolution is not yet available.
class RetryOnConnectionErrorInterceptor extends Interceptor {
  final Dio _dio;
  final int maxRetries;
  final Duration initialDelay;

  static const _retryCountKey = '__retryCount__';

  RetryOnConnectionErrorInterceptor({
    required Dio dio,
    this.maxRetries = 3,
    this.initialDelay = const Duration(seconds: 2),
  }) : _dio = dio;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final isConnectionError =
        err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout;

    if (!isConnectionError) {
      return handler.next(err);
    }

    final retryCount = (err.requestOptions.extra[_retryCountKey] as int?) ?? 0;

    if (retryCount >= maxRetries) {
      log('[RETRY] max retries ($maxRetries) reached for ${err.requestOptions.uri}');
      return handler.next(err);
    }

    final delay = initialDelay * (1 << retryCount); // 2s, 4s, 8s
    log('[RETRY] attempt ${retryCount + 1}/$maxRetries for ${err.requestOptions.uri} '
        'after ${delay.inSeconds}s');

    await Future<void>.delayed(delay);

    err.requestOptions.extra[_retryCountKey] = retryCount + 1;

    try {
      final response = await _dio.fetch(err.requestOptions);
      return handler.resolve(response);
    } on DioException catch (e) {
      return handler.next(e);
    }
  }
}
