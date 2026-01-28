// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';

import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/core/server/dio_settings.dart';
import 'package:qr_pay_app/src/core/server/exceptions/network_exception.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_client_generator.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:qr_pay_app/src/core/server/layers/network_connectivity.dart';
import 'package:qr_pay_app/src/core/server/layers/network_creator.dart';
import 'package:qr_pay_app/src/core/server/layers/network_decoder.dart';
import 'package:qr_pay_app/src/core/server/network_options/network_options.dart';
import 'package:qr_pay_app/src/core/server/result.dart';
import 'package:qr_pay_app/src/core/utils/error_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:l/l.dart';

class NetworkExecuter {
  // final Dio _dio;
  final NetworkConnectivity _connectionChecker;
  final NetworkDecoder _decoder;
  final NetworkCreator _creator;

  NetworkExecuter({
    // required Dio dio,
    required NetworkConnectivity connectionChecker,
    required NetworkDecoder decoder,
    required NetworkCreator creator,
  })  :
        // _dio = dio,
        _connectionChecker = connectionChecker,
        _creator = creator,
        _decoder = decoder;

  bool _isTimeOut(DioException err) =>
      err.type == (DioException.receiveTimeout) ||
      err.type == DioException.sendTimeout ||
      err.type == DioException.connectionTimeout;

  Future<Result<K>> execute<K, T>({
    required BaseClientGenerator route,
    T? responseType,
    NetworkOptions? options,
  }) async {
    if (kDebugMode) {
      l.d(route);
    }

    if (await _connectionChecker.status) {
      try {
        final response = await _creator.request(
          route: route,
          options: options,
          dio: sl<HostStorage>().hasHost()
              ? DioSettings().dioKiosk
              : DioSettings().dio,
        );
        if (responseType != null) {
          final data = _decoder.decode<K, T>(
            response: response,
            responseType: responseType as BaseModel,
          );

          return Result<K>.success(data);
        } else {
          return Result<K>.success('' as K);
        }

        /// Dio error
      } on DioException catch (err) {
        if (kDebugMode) {
          l.d('$route => ${NetworkException.request(error: err)}');
        }

        return _isTimeOut(err)
            ? Result<K>.failure(const NetworkException.timeOut())
            : Result<K>.failure(NetworkException.request(error: err));

        /// dynamic error
      } on Object catch (e, stackTrace) {
        if (kDebugMode) {
          l.d('$route => ${NetworkException.type(error: e.toString())}');
        }

        // Отправляем ошибку в Sentry
        ErrorUtil.logError(
          e,
          stackTrace: stackTrace,
          hint: '$route => ${NetworkException.type(error: e.toString())}',
        );

        return Result<K>.failure(NetworkException.type(error: e.toString()));
      }

      /// No Internet Connection
    } else {
      if (kDebugMode) {
        l.d(const NetworkException.connectivity());
      }

      return Result<K>.failure(const NetworkException.connectivity());
    }
  }
}
