import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/kiosk/pages/kiosk_card_pay.dart';
import 'package:qr_pay_app/src/features/kiosk/vm/kiosk_card_vm.dart';

class KioskCardProvider extends StatelessWidget {
  const KioskCardProvider({
    super.key,
    required this.request,
  });

  final MenuCheckoutRequest request;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<KioskCardVm>(
        create: (_) => KioskCardVm(
          context: context,
          request: request,
        ),
        child: Consumer<KioskCardVm>(
          builder: (_, value, __) => KioskCardPayPage(viewModel: value),
        ),
      );
}
