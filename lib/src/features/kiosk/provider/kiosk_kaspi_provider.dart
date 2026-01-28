import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/kiosk/pages/kiosk_kaspi_pay.dart';
import 'package:qr_pay_app/src/features/kiosk/vm/kiosk_kaspi_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KioskKaspiProvider extends StatelessWidget {
  const KioskKaspiProvider({
    super.key,
    required this.request,
  });
  final MenuCheckoutRequest request;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<KioskKaspiVm>(
        create: (_) => KioskKaspiVm(
          context: context,
          request: request,
        ),
        child: Consumer<KioskKaspiVm>(
          builder: (_, value, child) => KioskKaspiPayPage(viewModel: value),
        ),
      );
}
