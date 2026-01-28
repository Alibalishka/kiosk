import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/features/home/vm/service/kiosk_service.dart';

class KioskInteractionListener extends StatelessWidget {
  final Widget child;
  final KioskService kioskService;

  const KioskInteractionListener({
    super.key,
    required this.child,
    required this.kioskService,
  });

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerDown: (_) {
        kioskService.onUserInteraction();
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          kioskService.onUserInteraction();
          return false;
        },
        child: child,
      ),
    );
  }
}
