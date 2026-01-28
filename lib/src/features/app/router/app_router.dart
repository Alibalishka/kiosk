import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:qr_pay_app/src/core/resources/web_view_page.dart';
import 'package:qr_pay_app/src/features/app_index.dart';
import 'package:qr_pay_app/src/features/booking/pages/booking_calendar.dart';
import 'package:qr_pay_app/src/features/booking/pages/booking_time.dart';
import 'package:qr_pay_app/src/features/booking/provider/booking_provider.dart';
import 'package:qr_pay_app/src/features/booking/vm/booking_vm.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';
import 'package:qr_pay_app/src/features/home/pages/drinks.dart';
import 'package:qr_pay_app/src/features/home/pages/menu_checkout.dart';
import 'package:qr_pay_app/src/features/home/pages/story.dart';
import 'package:qr_pay_app/src/features/home/pages/tablet_checkout.dart';
import 'package:qr_pay_app/src/features/home/provider/map_provider.dart';
import 'package:qr_pay_app/src/features/home/provider/qr_menu_provider.dart';
import 'package:qr_pay_app/src/features/home/provider/review_provider.dart';
import 'package:qr_pay_app/src/features/home/vm/detail_vm.dart';
import 'package:qr_pay_app/src/features/home/vm/story_vm.dart';
import 'package:qr_pay_app/src/features/kiosk/pages/kiosk_kaspi_pay.dart';
import 'package:qr_pay_app/src/features/kiosk/pages/kiosk_success.dart';
import 'package:qr_pay_app/src/features/kiosk/pages/kiosk_tech_work.dart';
import 'package:qr_pay_app/src/features/kiosk/provider/kiosk_kaspi_provider.dart';
import 'package:qr_pay_app/src/features/kiosk/provider/kiosk_provider.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/reservation_response.dart';
import 'package:qr_pay_app/src/features/profile/pages/bonus_page.dart';
import 'package:qr_pay_app/src/features/profile/pages/company_info.dart';
import 'package:qr_pay_app/src/features/profile/pages/history_booking.dart';
import 'package:qr_pay_app/src/features/profile/pages/history_booking_detail.dart';
import 'package:qr_pay_app/src/features/profile/pages/history_order_detail.dart';
import 'package:qr_pay_app/src/features/profile/pages/my_details.dart';
import 'package:qr_pay_app/src/features/profile/pages/order_history.dart';
import 'package:qr_pay_app/src/features/profile/pages/referral_program.dart';
import 'package:qr_pay_app/src/features/profile/provider/subscription_provider.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/pages/restaurants.dart';
import 'package:qr_pay_app/src/features/home/provider/detail_provider.dart';
import 'package:qr_pay_app/src/features/home/provider/home_provider.dart';
import 'package:qr_pay_app/src/features/home/vm/home_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/barcode_widget.dart';
import 'package:qr_pay_app/src/features/home/pages/product_images.dart';
import 'package:qr_pay_app/src/features/profile/pages/choose_language.dart';
import 'package:qr_pay_app/src/features/profile/pages/notifications.dart';
import 'package:qr_pay_app/src/features/profile/pages/bonus_history.dart';
import 'package:qr_pay_app/src/features/profile/provider/bank_card_provider.dart';
import 'package:qr_pay_app/src/features/profile/provider/profile_provider.dart';
import 'package:qr_pay_app/src/features/profile/provider/support_provider.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/checkout_model.dart';
import 'package:qr_pay_app/src/features/qr/provider/checkout_provider.dart';
import 'package:qr_pay_app/src/features/qr/provider/qr_provider.dart';
import 'package:qr_pay_app/src/features/search/pages/filter_watch_all.dart';
import 'package:qr_pay_app/src/features/search/pages/result.dart';
import 'package:flutter/widgets.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen,Provider',
  routes: [
    AutoRoute(page: BarcodeWidget, path: 'barcode'),
    AutoRoute(page: ProductImagesWidget, path: 'product-images'),
    AutoRoute(page: DetailProvider, path: 'product-detail'),
    AutoRoute(page: ReviewProvider, path: 'rating-page'),
    AutoRoute(page: QrMenuCheckoutPage, path: 'menu-checkout'),
    AutoRoute(page: QrMenuProvider, path: 'qr-menu'),
    // AutoRoute(page: ProductPage, path: 'product-page'),
    AutoRoute(page: ResultPage, path: 'result'),
    AutoRoute(page: FilterWatchAll, path: 'filter'),
    AutoRoute(page: BonusHistoryPage, path: 'orders'),
    AutoRoute(page: ChooseLanguagePage, path: 'choose-language'),
    AutoRoute(page: SupportProvider, path: 'support'),
    AutoRoute(page: BankCardProvider, path: 'Payment-methods'),
    AutoRoute(page: SubscriptionProvider, path: 'subscriptionPage'),
    AutoRoute(page: CheckoutProvider, path: 'checkout'),
    AutoRoute(page: QrProvider, path: 'qr'),
    AutoRoute(page: MapProvider, path: 'map'),
    AutoRoute(page: MyDetailsPage, path: 'my-details'),
    // AutoRoute(page: CoffeeShopsPage, path: 'free-coffe'),
    AutoRoute(page: DrinksPage, path: 'drinks'),
    AutoRoute(page: OrderHistoryPage, path: 'order-history'),
    AutoRoute(page: HistoryOrderDetailPage, path: 'order-history-detail'),
    AutoRoute(page: StoryPage, path: 'story-view'),
    AutoRoute(page: BonusPage, path: 'bonus'),
    AutoRoute(page: MyNotificationsPage, path: 'notification'),

    AutoRoute(page: BookingProvider, path: 'booking-provider'),
    AutoRoute(page: BookingCalendarPage, path: 'booking-calendar'),
    AutoRoute(page: BookingTimePage, path: 'booking-time'),
    AutoRoute(page: HistoryBookinPage, path: 'history-booking'),
    AutoRoute(page: HistoryBookingDetailPage, path: 'history-booking-detail'),
    AutoRoute(page: ReferralProgram, path: 'Referral-program'),
    AutoRoute(page: RestaurantsPage, path: 'restaurants-page'),
    AutoRoute(page: CompanyInfo, path: 'company-info'),
    AutoRoute(page: WebViewPage, path: 'webview-page'),
    AutoRoute(page: TabletCheckoutPage, path: 'tablet-checkout'),
    AutoRoute(page: KioskKaspiProvider, path: 'kiosk-kaspi-pay'),
    AutoRoute(page: KioskSuccessPage, path: 'kiosk-success'),
    AutoRoute(page: KioskTechWorkPage, path: 'kiosk-tech-work'),

    // KIOSK
    AutoRoute(page: KioskProvider, path: 'kiosk-register'),

    //[MAIN NAV BAR]
    AutoRoute(
      page: AppIndexScreen,
      path: '/',
      initial: true,
      children: [
        AutoRoute(
          page: EmptyRouterPage,
          path: 'home',
          name: 'HomeRouter',
          children: [
            AutoRoute(page: HomeProvider, path: ''),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          path: 'profile',
          name: 'ProfileRouter',
          children: [
            AutoRoute(
              page: ProfileProvider,
              path: '',
            ),
          ],
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
