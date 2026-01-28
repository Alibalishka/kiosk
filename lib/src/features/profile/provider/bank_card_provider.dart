import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/features/profile/pages/bank_cards.dart';
import 'package:qr_pay_app/src/features/profile/vm/bank_card_vm.dart';

class BankCardProvider extends StatelessWidget {
  const BankCardProvider({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<BacnkCardVm>(
        create: (_) => BacnkCardVm(context: context),
        child: Consumer<BacnkCardVm>(
          builder: (context, value, child) => PaymentMethodes(viewModel: value),
        ),
      );
}
