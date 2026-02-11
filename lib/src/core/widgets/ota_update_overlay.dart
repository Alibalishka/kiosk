import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/features/kiosk/service/ota_update.dart';

/// Глобальный оверлей, который показывается поверх всего приложения
/// во время OTA-обновления. Блокирует любые нажатия.
class OtaUpdateOverlay extends StatelessWidget {
  final Widget child;
  final OtaUpdateService service;

  const OtaUpdateOverlay({
    super.key,
    required this.child,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<OtaStatus>(
      valueListenable: service.status,
      builder: (_, status, child) {
        return Stack(
          children: [
            // Блокируем нажатия на весь контент, если идёт обновление
            IgnorePointer(
              ignoring: status.isUpdating,
              child: child!,
            ),

            // Полноэкранный оверлей с прогрессом
            if (status.isUpdating)
              Positioned.fill(
                child: _OtaProgressOverlay(status: status),
              ),
          ],
        );
      },
      child: child,
    );
  }
}

class _OtaProgressOverlay extends StatelessWidget {
  final OtaStatus status;
  const _OtaProgressOverlay({required this.status});

  @override
  Widget build(BuildContext context) {
    final percent = (status.progress * 100).toInt();
    final isInstalling = status.stage == OtaStage.installing;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xCC060709),
            Color(0xE612151B),
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.white.withOpacity(0.12),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 24,
                    offset: Offset(0, 16),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.system_update_alt_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Text(
                            isInstalling
                                ? 'Устанавливаем обновление'
                                : 'Скачиваем обновление',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Круговой прогресс
                    SizedBox(
                      width: 84,
                      height: 84,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: isInstalling ? null : status.progress,
                            strokeWidth: 6,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                            backgroundColor: Colors.white12,
                          ),
                          if (!isInstalling)
                            Text(
                              '$percent%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Подзаголовок стадии
                    Text(
                      isInstalling
                          ? 'Идёт установка, устройство может перезапуститься.'
                          : 'Файл обновления загружается, это может занять пару минут.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.4,
                        decoration: TextDecoration.none,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Divider(
                      height: 1,
                      color: Color(0x26FFFFFF),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Пожалуйста, не выключайте устройство\nи не трогайте экран до окончания обновления.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white60,
                        decoration: TextDecoration.none,
                        fontSize: 13,
                        height: 1.4,
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
