// ignore_for_file: lines_longer_than_80_chars

import 'package:qr_pay_app/src/core/constants/status_codes.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exception.freezed.dart';

@freezed
class NetworkException with _$NetworkException implements Exception {
  const NetworkException._() : super();

  /// Вызывается если случился [DioException]
  const factory NetworkException.request({required DioException error}) =
      _ResponseError;

  /// Вызывается при общих ошибках
  const factory NetworkException.type({String? error}) = _DecodingError;

  /// Вызывается если нету доступа в интернет
  const factory NetworkException.connectivity({
    @Default('Нет доступа к интернету!') String message,
  }) = _Connectivity;

  /// Вызывается при тайм ауте запроса
  const factory NetworkException.timeOut({
    @Default('Время запроса истекло!') String message,
  }) = _TimeOut;

  /// Сообщение ошибки
  String? get msg => when<String?>(
        type: (String? error) => error,
        connectivity: (String message) => message,
        timeOut: (String message) => message,
        request: _parseDioError,
      );

  /// Код ошибки (если есть)
  int? get errorCode => when<int?>(
        type: (_) => null,
        connectivity: (_) => null,
        timeOut: (_) => null,
        request: (error) => error.response?.statusCode,
      );

  /// Возвращаем тексты в зависимости от статус кода
  String _parseDioError(DioException error) {
    switch (error.response?.statusCode) {
      case StatusCodes.unAuthenticated:
        return 'Не авторизован. Пожалуйста авторизуйтесь еще раз!';
      case StatusCodes.notFound:
        return 'Контент который вы ищите, не найден!';
      case StatusCodes.serverError:
        return 'Что-то не так с нашими серверами, проблема будет решена в ближайшее время!';
      case StatusCodes.badRequest:
        final data = error.response?.data['data'];
        final message = data?['message'] ?? 'Что-то пошло не так!';
        final titleError = data?['errors']?['title'];

        if (titleError != null) {
          return '$message: $titleError';
        } else {
          return message;
        }
      case StatusCodes.updateRequired:
        return error.response?.data['data']['message'] ??
            'Что то пошло не так!';
      case StatusCodes.unprocessable:
        final data = error.response?.data;

        final message = data?['message'];
        final message2 = data?['data']?['errors'];

        if (message != null) return message;
        if (message2 != null) return message2.toString();

        return 'Что-то пошло не так!';
      default:
        return 'Что то пошло не так!\n Код ошибки: ${error.response?.statusCode}';
    }
  }
}
