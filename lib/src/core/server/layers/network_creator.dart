// ignore_for_file: avoid-non-null-assertion, lines_longer_than_80_chars

import 'dart:io';

import 'package:qr_pay_app/src/core/server/interfaces/base_client_generator.dart';
import 'package:qr_pay_app/src/core/server/network_options/network_options.dart';
import 'package:dio/dio.dart';

class NetworkCreator {
  /// Делаем запрос
  Future<Response> request({
    required BaseClientGenerator route,
    required Dio dio,
    NetworkOptions? options,
  }) =>
      dio.fetch(
        RequestOptions(
          headers: dio.options.headers,
          baseUrl: dio.options.baseUrl,
          method: route.method,
          path: route.path,
          queryParameters: route.queryParameters,
          data: route.body,
          sendTimeout: Duration(milliseconds: route.sendTimeout ?? 10000),
          receiveTimeout: Duration(milliseconds: route.receiveTimeOut ?? 10000),
          onReceiveProgress: options?.onReceiveProgress,
          onSendProgress: options?.onSendProgress,
          validateStatus: (statusCode) =>
              statusCode! >= HttpStatus.ok &&
              statusCode <= HttpStatus.multipleChoices,
        ),
      );
}
