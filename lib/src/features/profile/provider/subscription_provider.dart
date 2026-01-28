import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/features/home/pages/subscription.dart';
import 'package:qr_pay_app/src/features/profile/vm/subscription_vm.dart';

class SubscriptionProvider extends StatelessWidget {
  const SubscriptionProvider({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<SubscriptionVm>(
        create: (_) => SubscriptionVm(context: context),
        child: Consumer<SubscriptionVm>(
          builder: (context, value, cild) => SubscriptionPage(viewModel: value),
        ),
      );
}
