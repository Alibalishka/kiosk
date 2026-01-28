import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/checkout_model.dart';
import 'package:qr_pay_app/src/features/qr/pages/checkout.dart';
import 'package:qr_pay_app/src/features/qr/vm/checkout_vm.dart';

class CheckoutProvider extends StatelessWidget {
  const CheckoutProvider({
    super.key,
    this.tableId,
    this.posOrderId,
    this.organizationId,
    this.idSubscriptionOrder,
    this.isSubscription = false,
    this.checkoutModel,
    this.isMenuRequest = false,
    this.menuRequest,
  });
  final String? tableId;
  final String? posOrderId;
  final String? organizationId;
  final String? idSubscriptionOrder;
  final bool isSubscription;
  final ChekoutModel? checkoutModel;
  final bool isMenuRequest;
  final MenuCheckoutRequest? menuRequest;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => CheckoutVm(
          context: context,
          tableId: tableId,
          posOrderId: posOrderId,
          organizationId: organizationId,
          idSubscriptionOrder: idSubscriptionOrder,
          isSubscription: isSubscription,
          checkoutModel: checkoutModel,
          isMenuRequest: isMenuRequest,
          menuRequest: menuRequest,
        ),
        child: Consumer<CheckoutVm>(
          builder: (context, value, child) => CheckoutSandyq(viewModel: value),
        ),
      );
}
