import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/core/widgets/loading.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';

typedef CreateRouter = AppRouter Function(BuildContext context);

typedef RouterWidgetBuilder = Widget Function(
  BuildContext context,
  RouteInformationParser<UrlState> informationParser,
  RouterDelegate<UrlState> routerDelegate,
);

@immutable
class AppRouterBuilder extends StatefulWidget {
  final CreateRouter createRouter;
  final RouterWidgetBuilder builder;

  const AppRouterBuilder({
    required this.createRouter,
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  State<AppRouterBuilder> createState() => _AppRouterBuilderState();
}

class _AppRouterBuilderState extends State<AppRouterBuilder> {
  late final AppRouter router = widget.createRouter(context);
  // late final AppRouter router = widget.createRouter(context);
  // late final tokenStorage = context.dependencies.tokenStorage;

  void _initHive() {
    Hive.initFlutter();
  }

  // Future<void> initUniLinks() async {
  //   _sub = uriLinkStream.listen((Uri? uri) {
  //     if (uri != null) {
  //       Navigator.pushNamed(context, uri.path);
  //     }
  //   }, onError: (err) {
  //     print('Error listening to links: $err');
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _initHive();
    // один раз регистрируем в GetIt ту же инстанцию
    if (!sl.isRegistered<AppRouter>()) {
      sl.registerSingleton<AppRouter>(router);
    } else {
      sl.unregister<AppRouter>();
      sl.registerSingleton<AppRouter>(router);
    }
  }

  @override
  void dispose() {
    router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(
        context,
        router.defaultRouteParser(),
        router.delegate(
          initialRoutes: <PageRouteInfo>[
            const KioskProviderRoute()
            // sl<KTokenStorage>().hasToken()
            //     ? const KioskProviderRoute()
            //     : const AppIndexScreenRoute()
          ],
          placeholder: (BuildContext context) =>
              const Scaffold(body: Loading()),
        ),
      );
}
