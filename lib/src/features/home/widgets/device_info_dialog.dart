import 'dart:io' show Platform;

import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/kiosk_exit_confirm_dialog.dart';
import 'package:qr_pay_app/src/features/kiosk/service/device_id_service.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';

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
      builder: (ctx) => Center(
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
                                      confirmed != true) return;

                                  ctx.router.pop();
                                  await onExitFromKiosk();
                                },
                          child: const Text('Выйти из киоска'),
                        ),
                        const SizedBox(height: 8),
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
    );
  }
}

