import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/core/extensions/analytics.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/notification_bloc/notification_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/token_storage.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/vibration.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/profile/widgets/enter_phone_bottom_sheet.dart';
import 'package:qr_pay_app/src/features/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/features/qr/pages/qr.dart';

class AppIndexScreen extends StatefulWidget {
  const AppIndexScreen({super.key});

  @override
  State<AppIndexScreen> createState() => _AppIndexScreenState();
}

class _AppIndexScreenState extends State<AppIndexScreen> {
  // late AppLinks _appLinks;
  late ScrollController _scrollController;

  // Future<void> initDeepLinks() async {
  //   _appLinks = AppLinks();

  //   _appLinks.uriLinkStream.listen((uri) async {
  //     debugPrint('onAppLink: $uri');
  //     String url = uri.toString();

  //     await openAppLink(Uri.parse(ApplinkInit.init(url)));
  //   });
  // }

  Future<void> openAppLink(Uri uri) async =>
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (sl<ITokenStorage>().getToken()?.isNotEmpty ?? false) {
          context.router.push(
            CheckoutProviderRoute(
              tableId: uri.queryParameters['table_id'],
              posOrderId: uri.queryParameters['pos_order_id'],
              organizationId: uri.queryParameters['organization_id'],
            ),
          );
        } else {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            useRootNavigator: true,
            backgroundColor: AppComponents.modalBgColorDefault,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            builder: (context) => const EnterPhoneBottomSheet(),
          );
        }
      });

  // Future<void> initializeNotification() async =>
  //     await NotificationService.instance.initilize(context);

  @override
  void initState() {
    super.initState();
    // initializeNotification();
    // FlutterAppBadge.count(0);
    AnalyticsService.logAppOpen();
    // initDeepLinks();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void showQrModal(
    BuildContext context, {
    required bool isSubscribed,
  }) {
    showCustomSheet(
      context,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.semanticBgSurface1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ColumnSpacer(0.8),
              const CustomBar(),
              const ColumnSpacer(2),
              Text(
                LocaleKeys.whatDoYouWantToDo.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.headingH2.copyWith(
                  color: AppComponents.navbarTitleColorDefault,
                ),
              ),
              const ColumnSpacer(2.8),
              ModalQrButton(
                  text: LocaleKeys.payOrder.tr(),
                  image: AppWebpImages.cardsLittle,
                  onTap: () => context.router.popAndPush(
                        QrProviderRoute(
                          isSubscribed: context
                                      .read<ProfileVm>()
                                      .user
                                      ?.data
                                      ?.subscription ==
                                  null
                              ? false
                              : true,
                        ),
                      )
                  // context.router.pop().then((value) => context.router.push(
                  //       QrProviderRoute(
                  //         isSubscribed: context
                  //                     .read<ProfileVm>()
                  //                     .user
                  //                     ?.data
                  //                     ?.subscription ==
                  //                 null
                  //             ? false
                  //             : true,
                  //       ),
                  //     )),
                  ),
              // const ColumnSpacer(1.6),
              // ModalQrButton(
              //   text: LocaleKeys.getAFreeDrink.tr(),
              //   image: AppWebpImages.coffeeLittle,
              //   onTap: () =>
              //       context.router.pop().then((value) => context.router.push(
              //             QrProviderRoute(
              //               type: 'coffee',
              //               isSubscribed: context
              //                           .read<ProfileVm>()
              //                           .user
              //                           ?.data
              //                           ?.subscription ==
              //                       null
              //                   ? false
              //                   : true,
              //             ),
              //           )),
              // ),
              // const ColumnSpacer(3.6),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AutoTabsRouter(
          routes: const [
            HomeRouter(),
            ProfileRouter(),
          ],
          builder: (context, child, animation) => Scaffold(
            body: FadeTransition(opacity: animation, child: child),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: NavbarWidget(),
              ),
            ),
          ),
        ),
        Positioned.fill(
          bottom: 16,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    backgroundColor: AppColors.primitiveBrand500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onPressed: () {
                      Vibration.vibrate();
                      final isSubscribed =
                          context.read<ProfileVm>().user?.data?.subscription !=
                              null;
                      final isOrder = context
                              .read<ProfileVm>()
                              .user
                              ?.data
                              ?.subscription
                              ?.isOrder ??
                          false;
                      if (sl<ITokenStorage>().getToken() == null) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          isDismissible: true,
                          useRootNavigator: true,
                          backgroundColor: AppComponents.modalBgColorDefault,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12))),
                          builder: (context) => const EnterPhoneBottomSheet(),
                        );
                      } else if (!isSubscribed || isOrder) {
                        context.router.push(
                          QrProviderRoute(
                            isSubscribed: context
                                        .read<ProfileVm>()
                                        .user
                                        ?.data
                                        ?.subscription ==
                                    null
                                ? false
                                : true,
                          ),
                        );
                      } else {
                        showQrModal(
                          context,
                          isSubscribed: isSubscribed,
                        );
                      }
                    },
                    elevation: 0,
                    splashColor: AppColors.none,
                    child: SvgPicture.asset(AppSvgImages.qrIcon),
                  ),
                  const ColumnSpacer(0.8),
                  Text(
                    'QR',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyM.copyWith(
                        color: AppColors.semanticFgDefault,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
