import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  static const MethodChannel _dpc = MethodChannel('dpc');

  Future<void> _openWifi(BuildContext context) async {
    try {
      await _dpc.invokeMethod('openWifi');
    } catch (e) {
      ScaffoldMessenger.maybeOf(context)
          ?.showSnackBar(SnackBar(content: Text('Ошибка Wi-Fi: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              const Icon(Icons.wifi_off_rounded, size: 72),
              const SizedBox(height: 16),
              const Text(
                'Нет подключения к интернету',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                'Мы продолжим автоматически, когда интернет появится.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              const CircleLoader(),
              const Spacer(),
              if (Platform.isAndroid)
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      text: 'Сменить Wi-Fi',
                      onPressed: () => _openWifi(context)),
                )
            ],
          ),
        ),
      ),
    );
  }
}
