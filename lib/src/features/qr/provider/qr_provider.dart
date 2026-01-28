import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/features/qr/pages/qr.dart';
import 'package:qr_pay_app/src/features/qr/vm/qr_vm.dart';

class QrProvider extends StatelessWidget {
  const QrProvider({
    super.key,
    required this.isSubscribed,
    this.type = 'order',
    // required this.isOrder,
  });
  final bool isSubscribed;
  final String type;
  // final bool isOrder;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => QrVm(
          context: context,
          isSubscribed: isSubscribed,
          type: type,
          // isOrder: isOrder,
        ),
        child: Consumer<QrVm>(
          builder: (context, value, child) => QrPage(viewModel: value),
        ),
      );
}
