import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/deeplink_init.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_content.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QrVm extends ViewModel {
  final BuildContext context;
  final bool isSubscribed;
  final String type;

  QrVm({
    required this.context,
    required this.isSubscribed,
    required this.type,
  });

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isExpanded = false;
  QRViewController? controller;
  // bool isTorchOn = false;
  // bool isTorchAvailable = false;

  @override
  void init() {
    // Future.delayed(const Duration(milliseconds: 10),
    //     () async => isTorchAvailable = await TorchLight.isTorchAvailable());
    super.init();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scanData) async {
        if (isExpanded || scanData.code == null) return;

        isExpanded = true;
        final url = scanData.code!;
        debugPrint('Scanned URL: $url');
        // isTorchAvailable ? await TorchLight.disableTorch() : null;
        // isTorchOn = false;

        if (!_isValidUrl(url)) {
          _showBottomSheet(
            title: LocaleKeys.qrNotFound.tr(),
            text: LocaleKeys.qrNotFoundDesc.tr(),
            icon: AppWebpImages.noOrder,
          );
          return;
        }

        await _handleScannedUrl(Uri.parse(ApplinkInit.init(url)));
        // final modifiedUrl = ApplinkInit.init(url);
        // debugPrint('Modified URL: $modifiedUrl');

        // await _handleScannedUrl(Uri.parse(modifiedUrl));
        notifyListeners();
      },
    );
  }

  bool _isValidUrl(String url) {
    return url.contains('https://qr.sandyq.kz/');
  }

  Future<void> _handleScannedUrl(Uri uri) async {
    try {
      // isTorchAvailable ? await TorchLight.disableTorch() : null;
      // if (type == 'coffee') {
      //   await _processCoffeeFlow(uri);
      // } else
      if (type == 'menu') {
        await _processMenuFlow(uri);
      } else {
        await _processDefaultFlow(uri);
      }
    } catch (e) {
      log('Error processing QR code: $e');
    } finally {
      // isExpanded = false;
    }
  }

  Future<void> _processMenuFlow(Uri uri) async {
    final String organizationId = uri.queryParameters['organization_id'] ?? '';
    final String tableId = uri.queryParameters['table_id'] ?? '';
    debugPrint("OrgId: $organizationId");
    debugPrint("TableId: $tableId");

    if (organizationId.isEmpty || tableId.isEmpty) {
      _showBottomSheet(
        title: LocaleKeys.qrNotFound.tr(),
        text: LocaleKeys.qrNotFoundDesc.tr(),
      );
      return;
    }

    final qrMenuVm =
        context.read<QrMenuVm>(); // Избегаем повторных вызовов context.read()
    qrMenuVm.organizationId = organizationId;
    qrMenuVm.tableId = tableId;

    if (context.mounted) {
      context.router.pop(); // Проверяем, что context все еще валиден
    }
  }

  Future<void> _processDefaultFlow(Uri uri) async {
    await context.router
        .push(
          CheckoutProviderRoute(
            tableId: uri.queryParameters['table_id'],
            posOrderId: uri.queryParameters['pos_order_id'],
            organizationId: uri.queryParameters['organization_id'],
          ),
        )
        .then(
          (value) => Future.delayed(const Duration(milliseconds: 10), () {
            if (value != null) {
              debugPrint(value.toString());
              value == LocaleKeys.upgradeRequired.tr()
                  ? _showBottomSheet(
                      title: value.toString(),
                      icon: AppWebpImages.error,
                      buttonText: LocaleKeys.upgrade.tr(),
                      onTap: () {
                        LaunchInBrowserUtil.launchUrl(
                          Platform.isIOS
                              ? 'https://apps.apple.com/kz/app/sandyq-prime/id6608978477'
                              : 'https://play.google.com/store/apps/details?id=com.sandyq.prime',
                        );
                      })
                  : _showBottomSheet(
                      title: value.toString().contains('null')
                          ? LocaleKeys.networkError.tr()
                          : LocaleKeys.noBillsPay.tr(),
                      text: value.toString().contains('null')
                          ? LocaleKeys.networkErrorDescription.tr()
                          : value.toString(),
                      icon: value.toString().contains('null')
                          ? AppWebpImages.error
                          : AppWebpImages.noOrder,
                    );
            } else {
              isExpanded = false;
            }
          }),
        );
  }

  void _showBottomSheet({
    required String title,
    // String? subTitle,
    String? text,
    String? icon,
    String? buttonText,
    Function()? onTap,
  }) {
    showCustomSheet(
      context,
      onClose: () => isExpanded = false,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.semanticBgSurface1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: BottomSheetContent(
          title: title,
          // subTitle: subTitle,
          text: text ?? '',
          buttonText: buttonText ?? LocaleKeys.close.tr(),
          icon: icon ?? AppWebpImages.error,
          onTap: () {
            onTap?.call();
            isExpanded = false;
          },
        ),
      ),
    );
  }
}
