import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

const _dpc = MethodChannel('dpc');

// ─────────────────── OTA Status ───────────────────

enum OtaStage { idle, downloading, installing }

class OtaStatus {
  final bool isUpdating;
  final double progress; // 0.0 .. 1.0
  final OtaStage stage;

  const OtaStatus({
    this.isUpdating = false,
    this.progress = 0.0,
    this.stage = OtaStage.idle,
  });

  const OtaStatus.idle()
      : isUpdating = false,
        progress = 0.0,
        stage = OtaStage.idle;

  const OtaStatus.downloading(this.progress)
      : isUpdating = true,
        stage = OtaStage.downloading;

  const OtaStatus.installing()
      : isUpdating = true,
        progress = 1.0,
        stage = OtaStage.installing;
}

// ─────────────────── OtaUpdateService ───────────────────

class OtaUpdateService {
  final ValueNotifier<OtaStatus> status =
      ValueNotifier(const OtaStatus.idle());

  bool _busy = false;

  /// Скачивает APK и устанавливает через DPC.
  /// Уведомляет UI о прогрессе через [status].
  Future<void> downloadAndInstall() async {
    if (_busy) return;
    _busy = true;

    status.value = const OtaStatus.downloading(0);

    const url = 'https://sandyq.dev.qrpay.kz/ota.apk';

    final dir = await getTemporaryDirectory();
    final filePath = p.join(dir.path, 'ota.apk');

    final dio = Dio(BaseOptions(
      followRedirects: true,
      validateStatus: (s) => s != null && s >= 200 && s < 400,
      receiveTimeout: const Duration(minutes: 5),
      sendTimeout: const Duration(minutes: 1),
    ));

    try {
      final resp = await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total > 0) {
            final pct = received / total;
            status.value = OtaStatus.downloading(pct.clamp(0.0, 1.0));
          }
        },
      );

      debugPrint('OTA downloaded to: $filePath');
      debugPrint('OTA realUri: ${resp.realUri}');

      // Стадия: установка
      status.value = const OtaStatus.installing();

      await _dpc.invokeMethod('installApk', {'path': filePath});

      // installApk возвращается сразу после session.commit() —
      // реальная установка идёт асинхронно через PackageInstaller.
      // Polling: опрашиваем результат каждые 2 сек (до 60 сек).
      // При self-update (SUCCESS) процесс будет убит Android'ом,
      // polling прервётся — это нормально.
      await _pollInstallResult();
    } on DioException catch (e) {
      debugPrint('OTA DioException: type=${e.type} msg=${e.message}');
      debugPrint(
          'OTA response: ${e.response?.statusCode} ${e.response?.data}');
      rethrow;
    } on PlatformException catch (e) {
      debugPrint('OTA PlatformException: code=${e.code} msg=${e.message}');
      rethrow;
    } finally {
      // Всегда сбрасываем оверлей и флаг при выходе из метода
      // (ошибка загрузки, ошибка установки, таймаут polling).
      status.value = const OtaStatus.idle();
      _busy = false;
    }
  }

  /// Опрашивает native-сторону на результат PackageInstaller.
  /// При SUCCESS — ждём убийства процесса (self-update).
  /// При ошибке — бросает [PlatformException].
  /// При таймауте (60 сек) — бросает [PlatformException].
  Future<void> _pollInstallResult() async {
    const pollInterval = Duration(seconds: 2);
    const maxAttempts = 30; // 30 * 2 сек = 60 сек

    for (var i = 0; i < maxAttempts; i++) {
      await Future.delayed(pollInterval);

      final result =
          await _dpc.invokeMethod<Map<dynamic, dynamic>?>('getInstallResult');

      if (result != null) {
        final installStatus = result['status'] as int? ?? -1;
        final message = result['message'] as String? ?? '';

        // PackageInstaller.STATUS_SUCCESS == 0
        if (installStatus == 0) {
          debugPrint('OTA install SUCCESS — ожидаем перезапуск');
          // При self-update Android убьёт процесс.
          // Ждём немного, чтобы не сбросить оверлей раньше времени.
          await Future.delayed(const Duration(seconds: 10));
          return;
        } else {
          debugPrint('OTA install FAILED: status=$installStatus msg=$message');
          throw PlatformException(
            code: 'INSTALL_FAILED',
            message: 'Ошибка установки: $message (status=$installStatus)',
          );
        }
      }
    }

    // Таймаут — результат так и не пришёл
    debugPrint('OTA install polling timeout (60s)');
    throw PlatformException(
      code: 'INSTALL_TIMEOUT',
      message: 'Превышено время ожидания установки (60 сек)',
    );
  }
}
