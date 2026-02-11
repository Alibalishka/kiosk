import 'package:easy_localization/easy_localization.dart';
import 'package:qr_pay_app/src/core/resources/app_theme.dart';
import 'package:qr_pay_app/src/core/utils/network_overlay.dart';
import 'package:qr_pay_app/src/core/utils/network_status_service.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/app/widgets/app_router_builder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

@immutable
class AppConfiguration extends StatelessWidget {
  const AppConfiguration({super.key});

  // Один сервис на всё приложение
  static final _networkService = NetworkStatusService();

  @override
  Widget build(BuildContext context) => AppRouterBuilder(
        createRouter: (context) => AppRouter(),
        builder: (_, parser, delegate) => Sizer(
          builder: (context, orientation, screenType) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routeInformationParser: parser,
            routerDelegate: delegate,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: AppTheme.light,
            builder: (context, child) => NetworkOverlay(
              service: _networkService,
              child: child!,
            ),
          ),
        ),
      );
}
