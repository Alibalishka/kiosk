import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/widgets/no_internet_screen.dart';
import 'network_status_service.dart';

class NetworkOverlay extends StatefulWidget {
  final Widget child;
  final NetworkStatusService service;

  const NetworkOverlay({
    super.key,
    required this.child,
    required this.service,
  });

  @override
  State<NetworkOverlay> createState() => _NetworkOverlayState();
}

class _NetworkOverlayState extends State<NetworkOverlay> {
  @override
  void initState() {
    super.initState();
    widget.service.init();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: widget.service.stream,
      initialData: widget.service.isOnline,
      builder: (_, snap) {
        final online = snap.data ?? true;

        return Stack(
          children: [
            widget.child,
            if (!online) const Positioned.fill(child: NoInternetScreen()),
          ],
        );
      },
    );
  }
}
