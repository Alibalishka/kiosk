// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    BarcodeWidgetRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const BarcodeWidget(),
      );
    },
    ProductImagesWidgetRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ProductImagesWidget(),
      );
    },
    DetailProviderRoute.name: (routeData) {
      final args = routeData.argsAs<DetailProviderRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DetailProvider(
          key: args.key,
          id: args.id,
          images: args.images,
        ),
      );
    },
    ReviewProviderRoute.name: (routeData) {
      final args = routeData.argsAs<ReviewProviderRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ReviewProvider(
          key: args.key,
          id: args.id,
          showModal: args.showModal,
        ),
      );
    },
    QrMenuCheckoutPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const QrMenuCheckoutPage(),
      );
    },
    QrMenuProviderRoute.name: (routeData) {
      final args = routeData.argsAs<QrMenuProviderRouteArgs>(
          orElse: () => const QrMenuProviderRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: QrMenuProvider(
          key: args.key,
          detailVm: args.detailVm,
          menuId: args.menuId,
          isKiosk: args.isKiosk,
        ),
      );
    },
    ResultPageRoute.name: (routeData) {
      final args = routeData.argsAs<ResultPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ResultPage(
          key: args.key,
          searchText: args.searchText,
        ),
      );
    },
    FilterWatchAllRoute.name: (routeData) {
      final args = routeData.argsAs<FilterWatchAllRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: FilterWatchAll(
          key: args.key,
          list: args.list,
          isSelected: args.isSelected,
        ),
      );
    },
    BonusHistoryPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const BonusHistoryPage(),
      );
    },
    ChooseLanguagePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ChooseLanguagePage(),
      );
    },
    SupportProviderRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SupportProvider(),
      );
    },
    BankCardProviderRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const BankCardProvider(),
      );
    },
    SubscriptionProviderRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SubscriptionProvider(),
      );
    },
    CheckoutProviderRoute.name: (routeData) {
      final args = routeData.argsAs<CheckoutProviderRouteArgs>(
          orElse: () => const CheckoutProviderRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CheckoutProvider(
          key: args.key,
          tableId: args.tableId,
          posOrderId: args.posOrderId,
          organizationId: args.organizationId,
          idSubscriptionOrder: args.idSubscriptionOrder,
          isSubscription: args.isSubscription,
          checkoutModel: args.checkoutModel,
          isMenuRequest: args.isMenuRequest,
          menuRequest: args.menuRequest,
        ),
      );
    },
    QrProviderRoute.name: (routeData) {
      final args = routeData.argsAs<QrProviderRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: QrProvider(
          key: args.key,
          isSubscribed: args.isSubscribed,
          type: args.type,
        ),
      );
    },
    MapProviderRoute.name: (routeData) {
      final args = routeData.argsAs<MapProviderRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MapProvider(
          key: args.key,
          lat: args.lat,
          lng: args.lng,
        ),
      );
    },
    MyDetailsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MyDetailsPage(),
      );
    },
    DrinksPageRoute.name: (routeData) {
      final args = routeData.argsAs<DrinksPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DrinksPage(
          key: args.key,
          idItem: args.idItem,
          tableId: args.tableId,
        ),
      );
    },
    OrderHistoryPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OrderHistoryPage(),
      );
    },
    HistoryOrderDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryOrderDetailPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HistoryOrderDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    StoryPageRoute.name: (routeData) {
      final args = routeData.argsAs<StoryPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: StoryPage(
          key: args.key,
          storyData: args.storyData,
          initialPage: args.initialPage,
        ),
      );
    },
    BonusPageRoute.name: (routeData) {
      final args = routeData.argsAs<BonusPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: BonusPage(
          key: args.key,
          viewModel: args.viewModel,
        ),
      );
    },
    MyNotificationsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MyNotificationsPage(),
      );
    },
    BookingProviderRoute.name: (routeData) {
      final args = routeData.argsAs<BookingProviderRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: BookingProvider(
          key: args.key,
          item: args.item,
          canReserve: args.canReserve,
        ),
      );
    },
    BookingCalendarPageRoute.name: (routeData) {
      final args = routeData.argsAs<BookingCalendarPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: BookingCalendarPage(
          key: args.key,
          viewModel: args.viewModel,
        ),
      );
    },
    BookingTimePageRoute.name: (routeData) {
      final args = routeData.argsAs<BookingTimePageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: BookingTimePage(
          key: args.key,
          viewModel: args.viewModel,
        ),
      );
    },
    HistoryBookinPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HistoryBookinPage(),
      );
    },
    HistoryBookingDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryBookingDetailPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HistoryBookingDetailPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    ReferralProgramRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralProgramRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ReferralProgram(
          key: args.key,
          promocode: args.promocode,
          userId: args.userId,
        ),
      );
    },
    RestaurantsPageRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantsPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: RestaurantsPage(
          key: args.key,
          items: args.items,
          viewModel: args.viewModel,
          cxt: args.cxt,
          indexGroupValue: args.indexGroupValue,
        ),
      );
    },
    CompanyInfoRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CompanyInfo(),
      );
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WebViewPage(
          key: args.key,
          url: args.url,
          scrollY: args.scrollY,
        ),
      );
    },
    TabletCheckoutPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TabletCheckoutPage(),
      );
    },
    KioskKaspiProviderRoute.name: (routeData) {
      final args = routeData.argsAs<KioskKaspiProviderRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: KioskKaspiProvider(
          key: args.key,
          request: args.request,
        ),
      );
    },
    KioskSuccessPageRoute.name: (routeData) {
      final args = routeData.argsAs<KioskSuccessPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: KioskSuccessPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    KioskTechWorkPageRoute.name: (routeData) {
      final args = routeData.argsAs<KioskTechWorkPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: KioskTechWorkPage(
          key: args.key,
          code: args.code,
        ),
      );
    },
    KioskProviderRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const KioskProvider(),
      );
    },
    AppIndexScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AppIndexScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    HomeProviderRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeProvider(),
      );
    },
    ProfileProviderRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ProfileProvider(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          BarcodeWidgetRoute.name,
          path: 'barcode',
        ),
        RouteConfig(
          ProductImagesWidgetRoute.name,
          path: 'product-images',
        ),
        RouteConfig(
          DetailProviderRoute.name,
          path: 'product-detail',
        ),
        RouteConfig(
          ReviewProviderRoute.name,
          path: 'rating-page',
        ),
        RouteConfig(
          QrMenuCheckoutPageRoute.name,
          path: 'menu-checkout',
        ),
        RouteConfig(
          QrMenuProviderRoute.name,
          path: 'qr-menu',
        ),
        RouteConfig(
          ResultPageRoute.name,
          path: 'result',
        ),
        RouteConfig(
          FilterWatchAllRoute.name,
          path: 'filter',
        ),
        RouteConfig(
          BonusHistoryPageRoute.name,
          path: 'orders',
        ),
        RouteConfig(
          ChooseLanguagePageRoute.name,
          path: 'choose-language',
        ),
        RouteConfig(
          SupportProviderRoute.name,
          path: 'support',
        ),
        RouteConfig(
          BankCardProviderRoute.name,
          path: 'Payment-methods',
        ),
        RouteConfig(
          SubscriptionProviderRoute.name,
          path: 'subscriptionPage',
        ),
        RouteConfig(
          CheckoutProviderRoute.name,
          path: 'checkout',
        ),
        RouteConfig(
          QrProviderRoute.name,
          path: 'qr',
        ),
        RouteConfig(
          MapProviderRoute.name,
          path: 'map',
        ),
        RouteConfig(
          MyDetailsPageRoute.name,
          path: 'my-details',
        ),
        RouteConfig(
          DrinksPageRoute.name,
          path: 'drinks',
        ),
        RouteConfig(
          OrderHistoryPageRoute.name,
          path: 'order-history',
        ),
        RouteConfig(
          HistoryOrderDetailPageRoute.name,
          path: 'order-history-detail',
        ),
        RouteConfig(
          StoryPageRoute.name,
          path: 'story-view',
        ),
        RouteConfig(
          BonusPageRoute.name,
          path: 'bonus',
        ),
        RouteConfig(
          MyNotificationsPageRoute.name,
          path: 'notification',
        ),
        RouteConfig(
          BookingProviderRoute.name,
          path: 'booking-provider',
        ),
        RouteConfig(
          BookingCalendarPageRoute.name,
          path: 'booking-calendar',
        ),
        RouteConfig(
          BookingTimePageRoute.name,
          path: 'booking-time',
        ),
        RouteConfig(
          HistoryBookinPageRoute.name,
          path: 'history-booking',
        ),
        RouteConfig(
          HistoryBookingDetailPageRoute.name,
          path: 'history-booking-detail',
        ),
        RouteConfig(
          ReferralProgramRoute.name,
          path: 'Referral-program',
        ),
        RouteConfig(
          RestaurantsPageRoute.name,
          path: 'restaurants-page',
        ),
        RouteConfig(
          CompanyInfoRoute.name,
          path: 'company-info',
        ),
        RouteConfig(
          WebViewPageRoute.name,
          path: 'webview-page',
        ),
        RouteConfig(
          TabletCheckoutPageRoute.name,
          path: 'tablet-checkout',
        ),
        RouteConfig(
          KioskKaspiProviderRoute.name,
          path: 'kiosk-kaspi-pay',
        ),
        RouteConfig(
          KioskSuccessPageRoute.name,
          path: 'kiosk-success',
        ),
        RouteConfig(
          KioskTechWorkPageRoute.name,
          path: 'kiosk-tech-work',
        ),
        RouteConfig(
          KioskProviderRoute.name,
          path: 'kiosk-register',
        ),
        RouteConfig(
          AppIndexScreenRoute.name,
          path: '/',
          children: [
            RouteConfig(
              HomeRouter.name,
              path: 'home',
              parent: AppIndexScreenRoute.name,
              children: [
                RouteConfig(
                  HomeProviderRoute.name,
                  path: '',
                  parent: HomeRouter.name,
                )
              ],
            ),
            RouteConfig(
              ProfileRouter.name,
              path: 'profile',
              parent: AppIndexScreenRoute.name,
              children: [
                RouteConfig(
                  ProfileProviderRoute.name,
                  path: '',
                  parent: ProfileRouter.name,
                )
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [BarcodeWidget]
class BarcodeWidgetRoute extends PageRouteInfo<void> {
  const BarcodeWidgetRoute()
      : super(
          BarcodeWidgetRoute.name,
          path: 'barcode',
        );

  static const String name = 'BarcodeWidgetRoute';
}

/// generated route for
/// [ProductImagesWidget]
class ProductImagesWidgetRoute extends PageRouteInfo<void> {
  const ProductImagesWidgetRoute()
      : super(
          ProductImagesWidgetRoute.name,
          path: 'product-images',
        );

  static const String name = 'ProductImagesWidgetRoute';
}

/// generated route for
/// [DetailProvider]
class DetailProviderRoute extends PageRouteInfo<DetailProviderRouteArgs> {
  DetailProviderRoute({
    Key? key,
    required int id,
    List<ImageDatum>? images,
  }) : super(
          DetailProviderRoute.name,
          path: 'product-detail',
          args: DetailProviderRouteArgs(
            key: key,
            id: id,
            images: images,
          ),
        );

  static const String name = 'DetailProviderRoute';
}

class DetailProviderRouteArgs {
  const DetailProviderRouteArgs({
    this.key,
    required this.id,
    this.images,
  });

  final Key? key;

  final int id;

  final List<ImageDatum>? images;

  @override
  String toString() {
    return 'DetailProviderRouteArgs{key: $key, id: $id, images: $images}';
  }
}

/// generated route for
/// [ReviewProvider]
class ReviewProviderRoute extends PageRouteInfo<ReviewProviderRouteArgs> {
  ReviewProviderRoute({
    Key? key,
    required int id,
    bool showModal = true,
  }) : super(
          ReviewProviderRoute.name,
          path: 'rating-page',
          args: ReviewProviderRouteArgs(
            key: key,
            id: id,
            showModal: showModal,
          ),
        );

  static const String name = 'ReviewProviderRoute';
}

class ReviewProviderRouteArgs {
  const ReviewProviderRouteArgs({
    this.key,
    required this.id,
    this.showModal = true,
  });

  final Key? key;

  final int id;

  final bool showModal;

  @override
  String toString() {
    return 'ReviewProviderRouteArgs{key: $key, id: $id, showModal: $showModal}';
  }
}

/// generated route for
/// [QrMenuCheckoutPage]
class QrMenuCheckoutPageRoute extends PageRouteInfo<void> {
  const QrMenuCheckoutPageRoute()
      : super(
          QrMenuCheckoutPageRoute.name,
          path: 'menu-checkout',
        );

  static const String name = 'QrMenuCheckoutPageRoute';
}

/// generated route for
/// [QrMenuProvider]
class QrMenuProviderRoute extends PageRouteInfo<QrMenuProviderRouteArgs> {
  QrMenuProviderRoute({
    Key? key,
    DetailVm? detailVm,
    int? menuId,
    bool? isKiosk = false,
  }) : super(
          QrMenuProviderRoute.name,
          path: 'qr-menu',
          args: QrMenuProviderRouteArgs(
            key: key,
            detailVm: detailVm,
            menuId: menuId,
            isKiosk: isKiosk,
          ),
        );

  static const String name = 'QrMenuProviderRoute';
}

class QrMenuProviderRouteArgs {
  const QrMenuProviderRouteArgs({
    this.key,
    this.detailVm,
    this.menuId,
    this.isKiosk = false,
  });

  final Key? key;

  final DetailVm? detailVm;

  final int? menuId;

  final bool? isKiosk;

  @override
  String toString() {
    return 'QrMenuProviderRouteArgs{key: $key, detailVm: $detailVm, menuId: $menuId, isKiosk: $isKiosk}';
  }
}

/// generated route for
/// [ResultPage]
class ResultPageRoute extends PageRouteInfo<ResultPageRouteArgs> {
  ResultPageRoute({
    Key? key,
    required String searchText,
  }) : super(
          ResultPageRoute.name,
          path: 'result',
          args: ResultPageRouteArgs(
            key: key,
            searchText: searchText,
          ),
        );

  static const String name = 'ResultPageRoute';
}

class ResultPageRouteArgs {
  const ResultPageRouteArgs({
    this.key,
    required this.searchText,
  });

  final Key? key;

  final String searchText;

  @override
  String toString() {
    return 'ResultPageRouteArgs{key: $key, searchText: $searchText}';
  }
}

/// generated route for
/// [FilterWatchAll]
class FilterWatchAllRoute extends PageRouteInfo<FilterWatchAllRouteArgs> {
  FilterWatchAllRoute({
    Key? key,
    required List<String> list,
    required List<String> isSelected,
  }) : super(
          FilterWatchAllRoute.name,
          path: 'filter',
          args: FilterWatchAllRouteArgs(
            key: key,
            list: list,
            isSelected: isSelected,
          ),
        );

  static const String name = 'FilterWatchAllRoute';
}

class FilterWatchAllRouteArgs {
  const FilterWatchAllRouteArgs({
    this.key,
    required this.list,
    required this.isSelected,
  });

  final Key? key;

  final List<String> list;

  final List<String> isSelected;

  @override
  String toString() {
    return 'FilterWatchAllRouteArgs{key: $key, list: $list, isSelected: $isSelected}';
  }
}

/// generated route for
/// [BonusHistoryPage]
class BonusHistoryPageRoute extends PageRouteInfo<void> {
  const BonusHistoryPageRoute()
      : super(
          BonusHistoryPageRoute.name,
          path: 'orders',
        );

  static const String name = 'BonusHistoryPageRoute';
}

/// generated route for
/// [ChooseLanguagePage]
class ChooseLanguagePageRoute extends PageRouteInfo<void> {
  const ChooseLanguagePageRoute()
      : super(
          ChooseLanguagePageRoute.name,
          path: 'choose-language',
        );

  static const String name = 'ChooseLanguagePageRoute';
}

/// generated route for
/// [SupportProvider]
class SupportProviderRoute extends PageRouteInfo<void> {
  const SupportProviderRoute()
      : super(
          SupportProviderRoute.name,
          path: 'support',
        );

  static const String name = 'SupportProviderRoute';
}

/// generated route for
/// [BankCardProvider]
class BankCardProviderRoute extends PageRouteInfo<void> {
  const BankCardProviderRoute()
      : super(
          BankCardProviderRoute.name,
          path: 'Payment-methods',
        );

  static const String name = 'BankCardProviderRoute';
}

/// generated route for
/// [SubscriptionProvider]
class SubscriptionProviderRoute extends PageRouteInfo<void> {
  const SubscriptionProviderRoute()
      : super(
          SubscriptionProviderRoute.name,
          path: 'subscriptionPage',
        );

  static const String name = 'SubscriptionProviderRoute';
}

/// generated route for
/// [CheckoutProvider]
class CheckoutProviderRoute extends PageRouteInfo<CheckoutProviderRouteArgs> {
  CheckoutProviderRoute({
    Key? key,
    String? tableId,
    String? posOrderId,
    String? organizationId,
    String? idSubscriptionOrder,
    bool isSubscription = false,
    ChekoutModel? checkoutModel,
    bool isMenuRequest = false,
    MenuCheckoutRequest? menuRequest,
  }) : super(
          CheckoutProviderRoute.name,
          path: 'checkout',
          args: CheckoutProviderRouteArgs(
            key: key,
            tableId: tableId,
            posOrderId: posOrderId,
            organizationId: organizationId,
            idSubscriptionOrder: idSubscriptionOrder,
            isSubscription: isSubscription,
            checkoutModel: checkoutModel,
            isMenuRequest: isMenuRequest,
            menuRequest: menuRequest,
          ),
        );

  static const String name = 'CheckoutProviderRoute';
}

class CheckoutProviderRouteArgs {
  const CheckoutProviderRouteArgs({
    this.key,
    this.tableId,
    this.posOrderId,
    this.organizationId,
    this.idSubscriptionOrder,
    this.isSubscription = false,
    this.checkoutModel,
    this.isMenuRequest = false,
    this.menuRequest,
  });

  final Key? key;

  final String? tableId;

  final String? posOrderId;

  final String? organizationId;

  final String? idSubscriptionOrder;

  final bool isSubscription;

  final ChekoutModel? checkoutModel;

  final bool isMenuRequest;

  final MenuCheckoutRequest? menuRequest;

  @override
  String toString() {
    return 'CheckoutProviderRouteArgs{key: $key, tableId: $tableId, posOrderId: $posOrderId, organizationId: $organizationId, idSubscriptionOrder: $idSubscriptionOrder, isSubscription: $isSubscription, checkoutModel: $checkoutModel, isMenuRequest: $isMenuRequest, menuRequest: $menuRequest}';
  }
}

/// generated route for
/// [QrProvider]
class QrProviderRoute extends PageRouteInfo<QrProviderRouteArgs> {
  QrProviderRoute({
    Key? key,
    required bool isSubscribed,
    String type = 'order',
  }) : super(
          QrProviderRoute.name,
          path: 'qr',
          args: QrProviderRouteArgs(
            key: key,
            isSubscribed: isSubscribed,
            type: type,
          ),
        );

  static const String name = 'QrProviderRoute';
}

class QrProviderRouteArgs {
  const QrProviderRouteArgs({
    this.key,
    required this.isSubscribed,
    this.type = 'order',
  });

  final Key? key;

  final bool isSubscribed;

  final String type;

  @override
  String toString() {
    return 'QrProviderRouteArgs{key: $key, isSubscribed: $isSubscribed, type: $type}';
  }
}

/// generated route for
/// [MapProvider]
class MapProviderRoute extends PageRouteInfo<MapProviderRouteArgs> {
  MapProviderRoute({
    Key? key,
    required String lat,
    required String lng,
  }) : super(
          MapProviderRoute.name,
          path: 'map',
          args: MapProviderRouteArgs(
            key: key,
            lat: lat,
            lng: lng,
          ),
        );

  static const String name = 'MapProviderRoute';
}

class MapProviderRouteArgs {
  const MapProviderRouteArgs({
    this.key,
    required this.lat,
    required this.lng,
  });

  final Key? key;

  final String lat;

  final String lng;

  @override
  String toString() {
    return 'MapProviderRouteArgs{key: $key, lat: $lat, lng: $lng}';
  }
}

/// generated route for
/// [MyDetailsPage]
class MyDetailsPageRoute extends PageRouteInfo<void> {
  const MyDetailsPageRoute()
      : super(
          MyDetailsPageRoute.name,
          path: 'my-details',
        );

  static const String name = 'MyDetailsPageRoute';
}

/// generated route for
/// [DrinksPage]
class DrinksPageRoute extends PageRouteInfo<DrinksPageRouteArgs> {
  DrinksPageRoute({
    Key? key,
    required String idItem,
    required String tableId,
  }) : super(
          DrinksPageRoute.name,
          path: 'drinks',
          args: DrinksPageRouteArgs(
            key: key,
            idItem: idItem,
            tableId: tableId,
          ),
        );

  static const String name = 'DrinksPageRoute';
}

class DrinksPageRouteArgs {
  const DrinksPageRouteArgs({
    this.key,
    required this.idItem,
    required this.tableId,
  });

  final Key? key;

  final String idItem;

  final String tableId;

  @override
  String toString() {
    return 'DrinksPageRouteArgs{key: $key, idItem: $idItem, tableId: $tableId}';
  }
}

/// generated route for
/// [OrderHistoryPage]
class OrderHistoryPageRoute extends PageRouteInfo<void> {
  const OrderHistoryPageRoute()
      : super(
          OrderHistoryPageRoute.name,
          path: 'order-history',
        );

  static const String name = 'OrderHistoryPageRoute';
}

/// generated route for
/// [HistoryOrderDetailPage]
class HistoryOrderDetailPageRoute
    extends PageRouteInfo<HistoryOrderDetailPageRouteArgs> {
  HistoryOrderDetailPageRoute({
    Key? key,
    required int id,
  }) : super(
          HistoryOrderDetailPageRoute.name,
          path: 'order-history-detail',
          args: HistoryOrderDetailPageRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'HistoryOrderDetailPageRoute';
}

class HistoryOrderDetailPageRouteArgs {
  const HistoryOrderDetailPageRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'HistoryOrderDetailPageRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [StoryPage]
class StoryPageRoute extends PageRouteInfo<StoryPageRouteArgs> {
  StoryPageRoute({
    Key? key,
    required List<StoryModel> storyData,
    required int initialPage,
  }) : super(
          StoryPageRoute.name,
          path: 'story-view',
          args: StoryPageRouteArgs(
            key: key,
            storyData: storyData,
            initialPage: initialPage,
          ),
        );

  static const String name = 'StoryPageRoute';
}

class StoryPageRouteArgs {
  const StoryPageRouteArgs({
    this.key,
    required this.storyData,
    required this.initialPage,
  });

  final Key? key;

  final List<StoryModel> storyData;

  final int initialPage;

  @override
  String toString() {
    return 'StoryPageRouteArgs{key: $key, storyData: $storyData, initialPage: $initialPage}';
  }
}

/// generated route for
/// [BonusPage]
class BonusPageRoute extends PageRouteInfo<BonusPageRouteArgs> {
  BonusPageRoute({
    Key? key,
    required ProfileVm viewModel,
  }) : super(
          BonusPageRoute.name,
          path: 'bonus',
          args: BonusPageRouteArgs(
            key: key,
            viewModel: viewModel,
          ),
        );

  static const String name = 'BonusPageRoute';
}

class BonusPageRouteArgs {
  const BonusPageRouteArgs({
    this.key,
    required this.viewModel,
  });

  final Key? key;

  final ProfileVm viewModel;

  @override
  String toString() {
    return 'BonusPageRouteArgs{key: $key, viewModel: $viewModel}';
  }
}

/// generated route for
/// [MyNotificationsPage]
class MyNotificationsPageRoute extends PageRouteInfo<void> {
  const MyNotificationsPageRoute()
      : super(
          MyNotificationsPageRoute.name,
          path: 'notification',
        );

  static const String name = 'MyNotificationsPageRoute';
}

/// generated route for
/// [BookingProvider]
class BookingProviderRoute extends PageRouteInfo<BookingProviderRouteArgs> {
  BookingProviderRoute({
    Key? key,
    required DetailItemModel item,
    required bool canReserve,
  }) : super(
          BookingProviderRoute.name,
          path: 'booking-provider',
          args: BookingProviderRouteArgs(
            key: key,
            item: item,
            canReserve: canReserve,
          ),
        );

  static const String name = 'BookingProviderRoute';
}

class BookingProviderRouteArgs {
  const BookingProviderRouteArgs({
    this.key,
    required this.item,
    required this.canReserve,
  });

  final Key? key;

  final DetailItemModel item;

  final bool canReserve;

  @override
  String toString() {
    return 'BookingProviderRouteArgs{key: $key, item: $item, canReserve: $canReserve}';
  }
}

/// generated route for
/// [BookingCalendarPage]
class BookingCalendarPageRoute
    extends PageRouteInfo<BookingCalendarPageRouteArgs> {
  BookingCalendarPageRoute({
    Key? key,
    required BookingVm viewModel,
  }) : super(
          BookingCalendarPageRoute.name,
          path: 'booking-calendar',
          args: BookingCalendarPageRouteArgs(
            key: key,
            viewModel: viewModel,
          ),
        );

  static const String name = 'BookingCalendarPageRoute';
}

class BookingCalendarPageRouteArgs {
  const BookingCalendarPageRouteArgs({
    this.key,
    required this.viewModel,
  });

  final Key? key;

  final BookingVm viewModel;

  @override
  String toString() {
    return 'BookingCalendarPageRouteArgs{key: $key, viewModel: $viewModel}';
  }
}

/// generated route for
/// [BookingTimePage]
class BookingTimePageRoute extends PageRouteInfo<BookingTimePageRouteArgs> {
  BookingTimePageRoute({
    Key? key,
    required BookingVm viewModel,
  }) : super(
          BookingTimePageRoute.name,
          path: 'booking-time',
          args: BookingTimePageRouteArgs(
            key: key,
            viewModel: viewModel,
          ),
        );

  static const String name = 'BookingTimePageRoute';
}

class BookingTimePageRouteArgs {
  const BookingTimePageRouteArgs({
    this.key,
    required this.viewModel,
  });

  final Key? key;

  final BookingVm viewModel;

  @override
  String toString() {
    return 'BookingTimePageRouteArgs{key: $key, viewModel: $viewModel}';
  }
}

/// generated route for
/// [HistoryBookinPage]
class HistoryBookinPageRoute extends PageRouteInfo<void> {
  const HistoryBookinPageRoute()
      : super(
          HistoryBookinPageRoute.name,
          path: 'history-booking',
        );

  static const String name = 'HistoryBookinPageRoute';
}

/// generated route for
/// [HistoryBookingDetailPage]
class HistoryBookingDetailPageRoute
    extends PageRouteInfo<HistoryBookingDetailPageRouteArgs> {
  HistoryBookingDetailPageRoute({
    Key? key,
    required ReservationDatum? data,
  }) : super(
          HistoryBookingDetailPageRoute.name,
          path: 'history-booking-detail',
          args: HistoryBookingDetailPageRouteArgs(
            key: key,
            data: data,
          ),
        );

  static const String name = 'HistoryBookingDetailPageRoute';
}

class HistoryBookingDetailPageRouteArgs {
  const HistoryBookingDetailPageRouteArgs({
    this.key,
    required this.data,
  });

  final Key? key;

  final ReservationDatum? data;

  @override
  String toString() {
    return 'HistoryBookingDetailPageRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [ReferralProgram]
class ReferralProgramRoute extends PageRouteInfo<ReferralProgramRouteArgs> {
  ReferralProgramRoute({
    Key? key,
    required String promocode,
    required int userId,
  }) : super(
          ReferralProgramRoute.name,
          path: 'Referral-program',
          args: ReferralProgramRouteArgs(
            key: key,
            promocode: promocode,
            userId: userId,
          ),
        );

  static const String name = 'ReferralProgramRoute';
}

class ReferralProgramRouteArgs {
  const ReferralProgramRouteArgs({
    this.key,
    required this.promocode,
    required this.userId,
  });

  final Key? key;

  final String promocode;

  final int userId;

  @override
  String toString() {
    return 'ReferralProgramRouteArgs{key: $key, promocode: $promocode, userId: $userId}';
  }
}

/// generated route for
/// [RestaurantsPage]
class RestaurantsPageRoute extends PageRouteInfo<RestaurantsPageRouteArgs> {
  RestaurantsPageRoute({
    Key? key,
    required ItemsModel? items,
    required HomeVm viewModel,
    required BuildContext cxt,
    int indexGroupValue = 0,
  }) : super(
          RestaurantsPageRoute.name,
          path: 'restaurants-page',
          args: RestaurantsPageRouteArgs(
            key: key,
            items: items,
            viewModel: viewModel,
            cxt: cxt,
            indexGroupValue: indexGroupValue,
          ),
        );

  static const String name = 'RestaurantsPageRoute';
}

class RestaurantsPageRouteArgs {
  const RestaurantsPageRouteArgs({
    this.key,
    required this.items,
    required this.viewModel,
    required this.cxt,
    this.indexGroupValue = 0,
  });

  final Key? key;

  final ItemsModel? items;

  final HomeVm viewModel;

  final BuildContext cxt;

  final int indexGroupValue;

  @override
  String toString() {
    return 'RestaurantsPageRouteArgs{key: $key, items: $items, viewModel: $viewModel, cxt: $cxt, indexGroupValue: $indexGroupValue}';
  }
}

/// generated route for
/// [CompanyInfo]
class CompanyInfoRoute extends PageRouteInfo<void> {
  const CompanyInfoRoute()
      : super(
          CompanyInfoRoute.name,
          path: 'company-info',
        );

  static const String name = 'CompanyInfoRoute';
}

/// generated route for
/// [WebViewPage]
class WebViewPageRoute extends PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({
    Key? key,
    required String url,
    int? scrollY,
  }) : super(
          WebViewPageRoute.name,
          path: 'webview-page',
          args: WebViewPageRouteArgs(
            key: key,
            url: url,
            scrollY: scrollY,
          ),
        );

  static const String name = 'WebViewPageRoute';
}

class WebViewPageRouteArgs {
  const WebViewPageRouteArgs({
    this.key,
    required this.url,
    this.scrollY,
  });

  final Key? key;

  final String url;

  final int? scrollY;

  @override
  String toString() {
    return 'WebViewPageRouteArgs{key: $key, url: $url, scrollY: $scrollY}';
  }
}

/// generated route for
/// [TabletCheckoutPage]
class TabletCheckoutPageRoute extends PageRouteInfo<void> {
  const TabletCheckoutPageRoute()
      : super(
          TabletCheckoutPageRoute.name,
          path: 'tablet-checkout',
        );

  static const String name = 'TabletCheckoutPageRoute';
}

/// generated route for
/// [KioskKaspiProvider]
class KioskKaspiProviderRoute
    extends PageRouteInfo<KioskKaspiProviderRouteArgs> {
  KioskKaspiProviderRoute({
    Key? key,
    required MenuCheckoutRequest request,
  }) : super(
          KioskKaspiProviderRoute.name,
          path: 'kiosk-kaspi-pay',
          args: KioskKaspiProviderRouteArgs(
            key: key,
            request: request,
          ),
        );

  static const String name = 'KioskKaspiProviderRoute';
}

class KioskKaspiProviderRouteArgs {
  const KioskKaspiProviderRouteArgs({
    this.key,
    required this.request,
  });

  final Key? key;

  final MenuCheckoutRequest request;

  @override
  String toString() {
    return 'KioskKaspiProviderRouteArgs{key: $key, request: $request}';
  }
}

/// generated route for
/// [KioskSuccessPage]
class KioskSuccessPageRoute extends PageRouteInfo<KioskSuccessPageRouteArgs> {
  KioskSuccessPageRoute({
    Key? key,
    required int id,
  }) : super(
          KioskSuccessPageRoute.name,
          path: 'kiosk-success',
          args: KioskSuccessPageRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'KioskSuccessPageRoute';
}

class KioskSuccessPageRouteArgs {
  const KioskSuccessPageRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'KioskSuccessPageRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [KioskTechWorkPage]
class KioskTechWorkPageRoute extends PageRouteInfo<KioskTechWorkPageRouteArgs> {
  KioskTechWorkPageRoute({
    Key? key,
    required String code,
  }) : super(
          KioskTechWorkPageRoute.name,
          path: 'kiosk-tech-work',
          args: KioskTechWorkPageRouteArgs(
            key: key,
            code: code,
          ),
        );

  static const String name = 'KioskTechWorkPageRoute';
}

class KioskTechWorkPageRouteArgs {
  const KioskTechWorkPageRouteArgs({
    this.key,
    required this.code,
  });

  final Key? key;

  final String code;

  @override
  String toString() {
    return 'KioskTechWorkPageRouteArgs{key: $key, code: $code}';
  }
}

/// generated route for
/// [KioskProvider]
class KioskProviderRoute extends PageRouteInfo<void> {
  const KioskProviderRoute()
      : super(
          KioskProviderRoute.name,
          path: 'kiosk-register',
        );

  static const String name = 'KioskProviderRoute';
}

/// generated route for
/// [AppIndexScreen]
class AppIndexScreenRoute extends PageRouteInfo<void> {
  const AppIndexScreenRoute({List<PageRouteInfo>? children})
      : super(
          AppIndexScreenRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AppIndexScreenRoute';
}

/// generated route for
/// [EmptyRouterPage]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter({List<PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [EmptyRouterPage]
class ProfileRouter extends PageRouteInfo<void> {
  const ProfileRouter({List<PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [HomeProvider]
class HomeProviderRoute extends PageRouteInfo<void> {
  const HomeProviderRoute()
      : super(
          HomeProviderRoute.name,
          path: '',
        );

  static const String name = 'HomeProviderRoute';
}

/// generated route for
/// [ProfileProvider]
class ProfileProviderRoute extends PageRouteInfo<void> {
  const ProfileProviderRoute()
      : super(
          ProfileProviderRoute.name,
          path: '',
        );

  static const String name = 'ProfileProviderRoute';
}
