import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:l/l.dart';

@sealed
class ErrorUtil {
  ErrorUtil._();

  static void logError(
    Object exception, {
    StackTrace? stackTrace,
    String? hint,
  }) {
    if (kDebugMode) return;

    try {
      if (exception is String) {
        return logMessage(
          exception,
          stackTrace: stackTrace,
          hint: hint,
          warning: true,
        );
      }
      l.e(exception, stackTrace ?? StackTrace.current);
    } on Object catch (error, stackTrace) {
      l.e('Произошло исключение "$error" в ErrorUtil.logError', stackTrace);
    }
  }

  // ignore: long-parameter-list
  static void logMessage(
    String message, {
    StackTrace? stackTrace,
    String? hint,
    bool warning = false,
    List<String>? params,
  }) {
    try {
      l.e(message, stackTrace);
    } on Object catch (error, stackTrace) {
      l.e('Произошло исключение "$error" в ErrorUtil.logMessage', stackTrace);
    }
  }
}
