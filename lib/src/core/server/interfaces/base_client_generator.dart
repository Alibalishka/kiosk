// ignore_for_file: avoid-dynamic
/// Все API клиенты должны наследоватся от этого класса
abstract class BaseClientGenerator {
  static const _sendTimeOut = 10000;
  static const _receiveTimeOut = 10000;

  const BaseClientGenerator();

  String get path;
  String get method;
  dynamic get body;
  Map<String, dynamic>? get queryParameters;
  int? get sendTimeout => _sendTimeOut;
  int? get receiveTimeOut => _receiveTimeOut;
}
