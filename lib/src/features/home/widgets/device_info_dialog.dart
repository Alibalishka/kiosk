import 'dart:io' show Platform, Socket;

import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/kiosk_exit_confirm_dialog.dart';
import 'package:qr_pay_app/src/features/kiosk/service/device_id_service.dart';
import 'package:qr_pay_app/src/features/kiosk/service/ota_update.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

Future<bool> _hasInternetForOta() async {
  const hosts = ['1.1.1.1', '8.8.8.8', '9.9.9.9'];
  for (final host in hosts) {
    try {
      final socket = await Socket.connect(
        host,
        53,
        timeout: const Duration(seconds: 2),
      );
      socket.destroy();
      return true;
    } catch (_) {}
  }
  return false;
}

class DeviceInfoDialog {
  const DeviceInfoDialog._();

  static Future<void> show({
    required BuildContext context,
    required QrMenuVm viewModel,
    required String? appVersion,
    required bool exitInProgress,
    required TextEditingController exitConfirmController,
    required Future<void> Function() onExitFromKiosk,
  }) async {
    final deviceInfo = DeviceInfoPlugin();
    final deviceId = await const DeviceIdService().getOrCreate();
    final org = viewModel.menuData?.organization;

    String model = '';
    String osVersion = '';

    try {
      if (Platform.isAndroid) {
        final info = await deviceInfo.androidInfo;
        model = info.model;
        osVersion =
            'Android ${info.version.release} (SDK ${info.version.sdkInt})';
      } else if (Platform.isIOS) {
        final info = await deviceInfo.iosInfo;
        model = info.name;
        osVersion = '${info.systemName} ${info.systemVersion}';
      }
    } catch (_) {
      // ignore: avoid_catches_without_on_clauses
    }

    final platform = Platform.isAndroid
        ? 'Android'
        : Platform.isIOS
            ? 'iOS'
            : 'Unknown';

    final locale = context.locale.toLanguageTag();

    final text = StringBuffer()
      ..writeln('--- Organization ---')
      ..writeln('Name: ${org?.name ?? '-'}')
      ..writeln('Address: ${org?.address ?? '-'}')
      ..writeln('iiko_org_id (org_id): ${org?.orgId ?? '-'}')
      ..writeln('pos_org_id: ${org?.posOrgId ?? '-'}')
      ..writeln()
      ..writeln('--- Device ---')
      ..writeln('Platform: $platform')
      ..writeln('OS: $osVersion')
      ..writeln('Device ID: $deviceId')
      ..writeln('Model: $model')
      ..writeln('App version: ${appVersion ?? '-'}')
      ..writeln('Locale: $locale');

    if (!context.mounted) return;

    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        var otaRunning = false;

        return StatefulBuilder(
          builder: (dialogContext, setDialogState) {
            Future<void> runOta() async {
              if (otaRunning) return;
              if (!await _hasInternetForOta()) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Нет интернета. Подключите Wi-Fi.'),
                  ),
                );
                return;
              }
              setDialogState(() => otaRunning = true);
              try {
                await sl<OtaUpdateService>().downloadAndInstall();
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Обновление запущено…')),
                );
              } on PlatformException catch (e) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('OTA ошибка: ${e.message ?? e.code}')),
                );
              } catch (e) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('OTA ошибка: $e')),
                );
              } finally {
                otaRunning = false;
                if (dialogContext.mounted) {
                  setDialogState(() {});
                }
              }
            }

            return Center(
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        QrImageView(
                          data: deviceId,
                          version: QrVersions.auto,
                          size: 300,
                        ),
                        const SizedBox(height: 12),
                        SelectableText(
                          text.toString(),
                          style: AppTextStyles.bodyS,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              OutlinedButton(
                                onPressed: exitInProgress
                                    ? null
                                    : () async {
                                        final confirmed =
                                            await KioskExitConfirmDialog.show(
                                          context: context,
                                          exitConfirmController:
                                              exitConfirmController,
                                          exitInProgress: exitInProgress,
                                        );

                                        if (!context.mounted ||
                                            confirmed != true) {
                                          return;
                                        }

                                        dialogContext.router.pop();
                                        await onExitFromKiosk();
                                      },
                                child: const Text('Выйти из киоска'),
                              ),
                              if (!Platform.isIOS) ...[
                                const SizedBox(height: 8),
                                CustomButton(
                                  text: otaRunning
                                      ? 'Обновление…'
                                      : 'Обновить приложение',
                                  fontSize: 16.sp,
                                  onPressed: otaRunning ? null : runOta,
                                ),
                              ],
                              const SizedBox(height: 8),
                              TextButton(
                                onPressed: () => dialogContext.router.pop(),
                                child: Text(LocaleKeys.close.tr()),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

