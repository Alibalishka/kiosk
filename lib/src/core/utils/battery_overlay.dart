import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/widgets/battery_low_screen.dart';

import 'battery_status_service.dart';

/// Поверх всего контента: предупреждение при заряде &lt; 10% (если не на зарядке).
class BatteryOverlay extends StatefulWidget {
  const BatteryOverlay({
    super.key,
    required this.child,
    required this.service,
  });

  final Widget child;
  final BatteryStatusService service;

  @override
  State<BatteryOverlay> createState() => _BatteryOverlayState();
}

class _BatteryOverlayState extends State<BatteryOverlay>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.service.init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      widget.service.refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: widget.service.stream,
      initialData: widget.service.showLowBatteryWarning,
      builder: (_, snap) {
        final show = snap.data ?? false;
        final pct = widget.service.lastBatteryLevel;

        return Stack(
          children: [
            widget.child,
            if (show)
              Positioned.fill(
                child: BatteryLowScreen(
                  batteryPercent: pct > 0 ? pct : 1,
                ),
              ),
          ],
        );
      },
    );
  }
}
