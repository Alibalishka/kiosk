import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/not_authorized_view.dart';
import 'package:flutter/material.dart';

class MyNotificationsPage extends StatefulWidget {
  const MyNotificationsPage({super.key});

  @override
  State<MyNotificationsPage> createState() => _MyNotificationsPageState();
}

class _MyNotificationsPageState extends State<MyNotificationsPage> {
  // late NotificationBloc bloc;
  bool auth = false;
  List<String> svg = [
    AppSvgImages.logoSandyq,
    AppSvgImages.notifications,
    AppSvgImages.logoShopan,
    AppSvgImages.union,
  ];

  @override
  void initState() {
    super.initState();
    // bloc = NotificationBloc(authRepository: sl<AuthRepository>())
    //   ..add(const NotificationEvent.fetchNotification())
    //   ..add(const NotificationEvent.readNotification());
    context.read<ProfileVm>().syncUnread(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          text: LocaleKeys.notifications.tr(),
          hasLeading: true,
        ),
        body: Padding(
          padding: AppPaddings.horizontal16,
          child: NotAutorizedView(
            title: LocaleKeys.thereIsNothingHereYet.tr(),
            subtitle: 'Полученные уведомления будут отображаться здесь',
            buttonText: '',
            button: false,
            image: AppWebpImages.emptyBell,
          ),
        ));
    // BlocBuilder<NotificationBloc, NotificationState>(
    //   bloc: bloc,
    //   builder: (context, state) => state.maybeWhen(
    //     orElse: () => const SizedBox.shrink(),
    //     loading: () => const ShimmerLoadingHorizontal(count: 10),
    //     successFetch: (response) => response.data?.isEmpty ?? true
    //         ? Padding(
    //             padding: AppPaddings.horizontal16,
    //             child: NotAutorizedView(
    //               title: LocaleKeys.thereIsNothingHereYet.tr(),
    //               subtitle: '',
    //               buttonText: '',
    //               button: false,
    //               image: AppWebpImages.emptyBell,
    //             ),
    //           )
    //         : Padding(
    //             padding: AppPaddings.all,
    //             child: ListView.separated(
    //               itemBuilder: (BuildContext context, int index) {
    //                 return NotificationWidget(data: response.data?[index]);
    //               },
    //               separatorBuilder: (BuildContext contetx, int index) =>
    //                   const ColumnSpacer(0.8),
    //               itemCount: response.data?.length ?? 0,
    //             ),
    //           ),
    //   ),
    // ));
  }
}
