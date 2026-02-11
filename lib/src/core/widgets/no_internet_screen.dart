import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        child: Stack(
          children: [
            // UI
            const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.wifi_off_rounded, size: 72),
                    SizedBox(height: 16),
                    Text(
                      'Нет подключения к интернету',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Мы продолжим автоматически, когда интернет появится.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 18),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            ),

            // ✅ Секретная зона (5 тапов за 2 сек)
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                width: 100,
                height: 100,
                child: SecretTapTrigger(
                  taps: 7,
                  window: const Duration(seconds: 3),
                  onTriggered: () => _openWifi(context),
                  child: const SizedBox.expand(), // невидимая кнопка
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecretTapTrigger extends StatefulWidget {
  const SecretTapTrigger({
    super.key,
    required this.child,
    required this.onTriggered,
    this.taps = 5,
    this.window = const Duration(seconds: 2),
  });

  final Widget child;
  final VoidCallback onTriggered;
  final int taps;
  final Duration window;

  @override
  State<SecretTapTrigger> createState() => _SecretTapTriggerState();
}

class _SecretTapTriggerState extends State<SecretTapTrigger> {
  int _count = 0;
  Timer? _timer;

  void _tap() {
    _timer?.cancel();
    _count++;

    if (_count >= widget.taps) {
      _count = 0;
      widget.onTriggered();
      return;
    }

    _timer = Timer(widget.window, () {
      _count = 0; // если не успел — сброс
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _tap,
      child: widget.child,
    );
  }
}
