import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';

/// Полноэкранное предупреждение: низкий заряд, нужно подключить к сети.
class BatteryLowScreen extends StatelessWidget {
  const BatteryLowScreen({
    super.key,
    required this.batteryPercent,
  });

  final int batteryPercent;

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFFFF8F0);

    return Material(
      color: AppColors.primitiveNeutralcold0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              const DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x33E65100),
                      blurRadius: 24,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    Icons.battery_alert_rounded,
                    size: 72,
                    color: Color(0xFFE65100),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Низкий заряд батареи',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Подключите устройство к зарядке.\nОсталось примерно $batteryPercent%.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'После подключения к сети это сообщение скроется автоматически.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
