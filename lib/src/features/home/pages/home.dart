import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/features/home/vm/home_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/home_appbar.dart';
import 'package:qr_pay_app/src/features/home/widgets/home_content.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/user_bloc/user_bloc.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:upgrader/upgrader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.viewModel});
  final HomeVm viewModel;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with ViewModelMixin<HomePage, HomeVm> {
  @override
  HomeVm get viewModel => widget.viewModel;
  @override
  Widget build(BuildContext context) => MyUpgradeAlert(
        upgrader: viewModel.upgrader,
        child: Scaffold(
          body: MultiBlocListener(
            listeners: [
              BlocListener<UserBloc, UserState>(
                bloc: context.read<ProfileVm>().userBloc,
                listener: (context, state) => state.maybeWhen(
                  orElse: () => null,
                  error: (_) => context.read<ProfileVm>().logout(context),
                  success: (user) => context.read<ProfileVm>().syncUserData(user),
                  configurationSuccess: (response) =>
                      context.read<ProfileVm>().initCinfiguration(response),
                ),
              ),
              // BlocListener<NotificationBloc, NotificationState>(
              //   bloc: context.read<ProfileVm>().notificationBloc,
              //   listener: (context, state) => state.maybeWhen(
              //       orElse: () => null,
              //       successUread: (response) => context
              //           .read<ProfileVm>()
              //           .syncUnread(response.data?.count ?? 0)),
              // ),
              // BlocListener<SubscriptionBloc, SubscriptionState>(
              //   bloc: context.read<ProfileVm>().subscriptionBloc
              //     ..add(const SubscriptionEvent.fetchSubscription()),
              //   listener: (context, state) => state.maybeWhen(
              //     orElse: () => null,
              //     success: (subscription) =>
              //         context.read<ProfileVm>().saveSubscription(subscription),
              //   ),
              // )
            ],
            child: Column(
              children: [
                HomeAppBar(viewModel: viewModel),
                HomeContent(viewModel: viewModel),
              ],
            ),
          ),
        ),
      );
}

class MyUpgradeAlert extends UpgradeAlert {
  MyUpgradeAlert({super.key, super.upgrader, super.child});

  @override
  UpgradeAlertState createState() => MyUpgradeAlertState();
}

class MyUpgradeAlertState extends UpgradeAlertState {
  @override
  void showTheDialog({
    Key? key,
    required BuildContext context,
    required String? title,
    required String message,
    required String? releaseNotes,
    required bool barrierDismissible,
    required UpgraderMessages messages,
  }) {
    Platform.isIOS
        ? showCupertinoDialog(
            context: context,
            builder: (_) => CupertinoAlertDialog(
              title: const Text("Обновить приложение?"),
              content: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  "Доступна новая версия ${context.read<ProfileVm>().configuration?.data?.organizationName} ${widget.upgrader.currentAppStoreVersion}",
                  style: AppTextStyles.bodyM,
                ),
              ),
              actions: [
                CupertinoButton(
                  child: Text(
                    'Позже',
                    style: AppTextStyles.bodyL
                        .copyWith(color: AppColors.primitiveBlue500),
                  ),
                  onPressed: () => context.router.pop(),
                ),
                CupertinoButton(
                  child: Text(
                    'Обновить',
                    style: AppTextStyles.bodyL
                        .copyWith(color: AppColors.primitiveBlue500),
                  ),
                  onPressed: () =>
                      onUserUpdated(context, !widget.upgrader.blocked()),
                ),
              ],
            ),
          )
        : showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                key: key,
                title: const Text('Обновить приложение?'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(
                        "Доступна новая версия ${context.read<ProfileVm>().configuration?.data?.organizationName} ${widget.upgrader.currentAppStoreVersion}",
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Позже'),
                    onPressed: () => onUserIgnored(context, true),
                  ),
                  TextButton(
                    child: const Text('Обновить'),
                    onPressed: () =>
                        onUserUpdated(context, !widget.upgrader.blocked()),
                  ),
                ],
              );
            },
          );
  }
}
