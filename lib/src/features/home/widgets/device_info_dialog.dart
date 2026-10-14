import 'dart:io' show Platform;

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';

import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/kiosk_exit_confirm_dialog.dart';
import 'package:qr_pay_app/src/features/kiosk/service/ota_update.dart';
import 'package:qr_pay_app/src/features/kiosk/service/device_id_service.dart';
import 'package:qr_pay_app/src/features/kiosk/service/device_info_text.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';

class DeviceInfoDialog {
  const DeviceInfoDialog._();

  static const MethodChannel _dpc = MethodChannel('dpc');

  static Future<void> show({
    required BuildContext context,
    required QrMenuVm viewModel,
    required String? appVersion,
    required bool exitInProgress,
    required TextEditingController exitConfirmController,
    required Future<void> Function() onExitFromKiosk,
  }) async {
    var otaRunning = false;
    var lockRunning = false;
    final locale = context.locale.toLanguageTag();
    final deviceId = await const DeviceIdService().getOrCreate();
    final org = viewModel.menuData?.organization;

    final device = await deviceInfoText(locale: locale, appVersion: appVersion);

    final text = StringBuffer()
      ..writeln('--- Organization ---')
      ..writeln('Name: ${org?.name ?? '-'}')
      ..writeln('Address: ${org?.address ?? '-'}')
      ..writeln('iiko_org_id (org_id): ${org?.orgId ?? '-'}')
      ..writeln('pos_org_id: ${org?.posOrgId ?? '-'}')
      ..writeln()
      ..write(device);

    if (!context.mounted) return;

    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setStateDialog) => Center(
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

                                    if (!context.mounted || confirmed != true)
                                      return;

                                    ctx.router.pop();
                                    await onExitFromKiosk();
                                  },
                            child: const Text('Выйти из киоска'),
                          ),
                          const SizedBox(height: 8),
                          if (!Platform.isIOS)
                            FilledButton(
                              onPressed: otaRunning
                                  ? null
                                  : () async {
                                      setStateDialog(() => otaRunning = true);
                                      try {
                                        await sl<OtaUpdateService>()
                                            .downloadAndInstall();
                                        if (!ctx.mounted) return;
                                        ScaffoldMessenger.of(ctx).showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('Обновление завершено'),
                                          ),
                                        );
                                      } on PlatformException catch (e) {
                                        if (!ctx.mounted) return;
                                        ScaffoldMessenger.of(ctx).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              e.message?.trim().isNotEmpty ==
                                                      true
                                                  ? e.message!
                                                  : 'Не удалось обновить',
                                            ),
                                          ),
                                        );
                                      } catch (_) {
                                        if (!ctx.mounted) return;
                                        ScaffoldMessenger.of(ctx).showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('Не удалось обновить'),
                                          ),
                                        );
                                      } finally {
                                        if (ctx.mounted) {
                                          setStateDialog(
                                              () => otaRunning = false);
                                        }
                                      }
                                    },
                              child: Text(
                                otaRunning
                                    ? 'Обновление…'
                                    : 'Обновить приложение',
                              ),
                            ),
                          if (!Platform.isIOS) const SizedBox(height: 8),
                          if (Platform.isAndroid)
                            OutlinedButton(
                              onPressed: lockRunning
                                  ? null
                                  : () async {
                                      setStateDialog(() => lockRunning = true);
                                      try {
                                        await _dpc.invokeMethod('lockDevice');
                                        if (ctx.mounted) ctx.router.pop();
                                      } on PlatformException catch (e) {
                                        if (!ctx.mounted) return;
                                        ScaffoldMessenger.of(ctx).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              e.message?.trim().isNotEmpty ==
                                                      true
                                                  ? 'Не удалось заблокировать: ${e.message}'
                                                  : 'Не удалось заблокировать устройство',
                                            ),
                                          ),
                                        );
                                      } catch (_) {
                                        if (!ctx.mounted) return;
                                        ScaffoldMessenger.of(ctx).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Не удалось заблокировать устройство'),
                                          ),
                                        );
                                      } finally {
                                        if (ctx.mounted) {
                                          setStateDialog(
                                              () => lockRunning = false);
                                        }
                                      }
                                    },
                              child: Text(
                                lockRunning
                                    ? 'Блокировка…'
                                    : 'Отключить устройство',
                              ),
                            ),
                          if (Platform.isAndroid) const SizedBox(height: 8),
                          TextButton(
                            onPressed: () => ctx.router.pop(),
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
        ),
      ),
    );
  }
}
