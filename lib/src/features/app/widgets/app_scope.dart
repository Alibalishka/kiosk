import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_bloc.dart';
import 'package:qr_pay_app/src/features/home/vm/bonus_vm.dart';
import 'package:qr_pay_app/src/features/home/vm/home_vm.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/vm/service/basket_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/menu_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/scroll_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/video_service.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/language_bloc/language_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/subscription_bloc/subscription_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/user_bloc/user_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';
import 'package:qr_pay_app/src/features/profile/pages/auth_vm.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class AppScope extends StatelessWidget {
  final Widget child;

  const AppScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (_) => UserBloc(authRepository: sl<AuthRepository>()),
          ),
          BlocProvider<SubscriptionBloc>(
            create: (_) =>
                SubscriptionBloc(authRepository: sl<AuthRepository>()),
          ),
          BlocProvider<PromotionsBloc>(
            create: (_) =>
                PromotionsBloc(promotionsRepository: PromotionsRepository()),
          ),
          BlocProvider<LanguageBloc>(
            create: (_) => LanguageBloc(
              sharedPreferences: sl<SharedPreferences>(),
              context: context,
            ),
          ),
          // BlocProvider<NotificationBloc>(
          //   create: (_) =>
          //       NotificationBloc(authRepository: sl<AuthRepository>()),
          // ),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => AuthVm(context: _),
            ),
            ChangeNotifierProvider(
              create: (_) => ProfileVm(context: context),
            ),
            ChangeNotifierProvider(
              create: (_) => HomeVm(context: _),
            ),
            ChangeNotifierProvider(
              create: (_) => BonusVm(context: _),
            ),
            ChangeNotifierProvider(
              create: (_) => QrMenuVm(
                context: _,
                basketService: BasketService(),
                scrollService: ScrollService(),
                videoService: VideoPreviewService(),
                menuDataService: MenuDataService(),
              ),
            ),
          ],
          child: child,
        ),
      );
}
