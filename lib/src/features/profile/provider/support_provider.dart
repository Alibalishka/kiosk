import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/features/profile/pages/support.dart';
import 'package:qr_pay_app/src/features/profile/vm/support_vm.dart';

class SupportProvider extends StatelessWidget {
  const SupportProvider({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<SupportVm>(
      create: (_) => SupportVm(context: context),
      child: Consumer<SupportVm>(
        builder: (context, value, child) => SupportPage(viewModel: value),
      ));
}
