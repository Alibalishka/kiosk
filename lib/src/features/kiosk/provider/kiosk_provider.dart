import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/features/kiosk/pages/kiosk.dart';
import 'package:qr_pay_app/src/features/kiosk/vm/kiosk_vm.dart';

class KioskProvider extends StatelessWidget {
  const KioskProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KioskVm>(
      create: (_) => KioskVm(context: context),
      child: Consumer<KioskVm>(
        builder: (_, value, child) => KioskRegister(viewModel: value),
      ),
    );
  }
}
