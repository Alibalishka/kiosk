// ignore_for_file: avoid-dynamic
/// Все API клиенты должны наследоватся от этого класса
abstract class BaseClientGenerator {
  static const _sendTimeOut = 100000000;
  static const _receiveTimeOut = 10000000;

  const BaseClientGenerator();

  String get path;
  String get method;
  dynamic get body;
  Map<String, dynamic>? get queryParameters;

  /// Заголовки конкретного запроса поверх общих заголовков Dio.
  Map<String, dynamic>? get headers => null;
  int? get sendTimeout => _sendTimeOut;
  int? get receiveTimeOut => _receiveTimeOut;
}
