import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:flutter/cupertino.dart';

class ModalGrabberBar extends StatelessWidget {
  const ModalGrabberBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 48,
        height: 4,
        decoration: const BoxDecoration(
            color: AppComponents.modalGrabberIconColor,
            borderRadius: BorderRadius.all(Radius.circular(100))),
      ),
    );
  }
}
