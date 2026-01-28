import 'package:flutter/cupertino.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({
    super.key,
    this.color,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 48,
        height: 4,
        decoration: BoxDecoration(
            color: color ?? AppComponents.modalGrabberIconColor,
            borderRadius: const BorderRadius.all(Radius.circular(100))),
      ),
    );
  }
}
