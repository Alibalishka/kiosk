import 'package:qr_pay_app/src/features/home/pages/home.dart';
import 'package:qr_pay_app/src/features/home/vm/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) => Consumer<HomeVm>(
        builder: (_, value, child) => HomePage(viewModel: value),
      );
}
