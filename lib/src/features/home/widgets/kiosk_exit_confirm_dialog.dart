import 'package:flutter/material.dart';

class KioskExitConfirmDialog {
  const KioskExitConfirmDialog._();

  static Future<bool?> show({
    required BuildContext context,
    required TextEditingController exitConfirmController,
    required bool exitInProgress,
  }) {
    exitConfirmController.clear();

    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => AlertDialog(
        title: const Text('Подтверждение выхода'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Это действие завершит сессию киоска и вернёт экран регистрации.\n\n'
              'Чтобы подтвердить, введите слово EXIT.',
            ),
            const SizedBox(height: 12),
            TextField(
              controller: exitConfirmController,
              textCapitalization: TextCapitalization.characters,
              decoration: const InputDecoration(
                hintText: 'Введите EXIT',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed:
                exitInProgress ? null : () => Navigator.of(ctx).pop(false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: exitInProgress
                ? null
                : () {
                    final v = exitConfirmController.text.trim().toUpperCase();
                    if (v != 'EXIT') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Введите EXIT, чтобы подтвердить'),
                        ),
                      );
                      return;
                    }
                    Navigator.of(ctx).pop(true);
                  },
            child: const Text('Подтвердить'),
          ),
        ],
      ),
    );
  }
}

