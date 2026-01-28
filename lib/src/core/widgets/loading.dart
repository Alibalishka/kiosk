import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
import 'package:flutter/material.dart';

@immutable
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(child: CircleLoader());
}
