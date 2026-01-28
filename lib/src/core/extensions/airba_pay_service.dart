import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AirbaPayService {
  static const MethodChannel _channel =
      MethodChannel("com.example.app/airbapay");

  // Метод для вызова нативного метода (например, для перехода на страницу SDK)
  Future<void> startAirbaPay() async {
    try {
      final result = await _channel.invokeMethod('pay');
      debugPrint(result); // Лог результата
    } on PlatformException catch (e) {
      debugPrint("Failed to invoke AirbaPay: ${e.message}");
    }
  }
}
