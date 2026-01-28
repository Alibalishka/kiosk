import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/extensions/analytics.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/features/home/widgets/purchasing_subscription.dart';
import 'package:qr_pay_app/src/features/home/widgets/subscription_information.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/user_bloc/user_bloc.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/profile/vm/subscription_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({
    super.key,
    required this.viewModel,
  });
  final SubscriptionVm viewModel;

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage>
    with
        ViewModelMixin<SubscriptionPage, SubscriptionVm>,
        WidgetsBindingObserver {
  @override
  SubscriptionVm get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    AnalyticsService.visitSubscriptionScreen();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed &&
        context.read<ProfileVm>().user?.data?.subscription == null) {
      // widget.viewModel.dataCarts.isEmpty || !context.read<HomeVm>().isApplePay
      //     ? null
      //     :
      viewModel.changeLoadinfAfetrPayment(true);
      Future.delayed(
        const Duration(milliseconds: 100),
        () =>
            // widget.viewModel.dataCarts.isEmpty ||
            //         !context.read<HomeVm>().isApplePay
            //     ? null
            //     :
            viewModel.userBloc.add(
          UserEvent.checkSubscripton(
            idSubscroption: viewModel.data!.data!.id!,
            userSubId: viewModel.userSubId,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileVm>(
      builder: (context, value, state) {
        return Scaffold(
          appBar: value.user?.data?.subscription != null
              ? CustomAppBar(
                  text: LocaleKeys.subscriptionInformation.tr(),
                  hasLeading: true,
                )
              : null,
          body: value.user?.data?.subscription != null
              ? SubscriptionInformation(viewModel: viewModel)
              : PurchasingSubscription(viewModel: viewModel),
        );
      },
    );
  }
}
