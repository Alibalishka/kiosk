import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

const _dpc = MethodChannel('dpc');

Future<void> downloadAndInstallOta() async {
  const url = 'https://sandyq.dev.qrpay.kz/ota.apk';

  final dir = await getTemporaryDirectory();
  final filePath = p.join(dir.path, 'ota.apk');

  final dio = Dio(BaseOptions(
    followRedirects: true,
    // важно: если сервер отвечает 302 — это НЕ ошибка
    validateStatus: (s) => s != null && s >= 200 && s < 400,
    receiveTimeout: const Duration(minutes: 5),
    sendTimeout: const Duration(minutes: 1),
  ));

  try {
    final resp = await dio.download(
      url,
      filePath,
      onReceiveProgress: (r, t) {
        if (t > 0) debugPrint('OTA: ${(r * 100 / t).toStringAsFixed(0)}%');
      },
    );

    debugPrint('OTA downloaded to: $filePath');
    debugPrint('OTA realUri: ${resp.realUri}');

    await _dpc.invokeMethod('installApk', {'path': filePath});
  } on DioException catch (e) {
    debugPrint('OTA DioException: type=${e.type} msg=${e.message}');
    debugPrint('OTA response: ${e.response?.statusCode} ${e.response?.data}');
    rethrow;
  }
}
