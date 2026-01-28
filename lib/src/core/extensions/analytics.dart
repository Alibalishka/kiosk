import 'dart:developer';

// import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  // static final instance = FirebaseAnalytics.instance;

  /// Logs the app open event.
  static Future<void> logAppOpen() async {
    // try {
    //   await instance.logAppOpen();
    // } catch (e) {
    //   log("Error logging app open: $e");
    // }
  }

  /// Logs when content is opened.
  static Future<void> openContent({
    required int id,
    required String name,
  }) async {
    // try {
    //   await instance.logEvent(
    //     name: "open_content",
    //     parameters: {
    //       "item_id": id,
    //       "content_name": name,
    //     },
    //   );
    // } catch (e) {
    //   log("Error logging open content: $e");
    // }
  }

  /// Logs when content menu is opened.
  static Future<void> openContentMenu({
    required int id,
    required String name,
  }) async {
    // try {
    //   await instance.logEvent(
    //     name: "open_content_menu",
    //     parameters: {
    //       "item_id": id,
    //       "content_name": name,
    //     },
    //   );
    // } catch (e) {
    //   log("Error logging open content menu: $e");
    // }
  }

  /// Logs when a referral code is shared.
  static Future<void> shareReferralCode({
    required int id,
    required String code,
  }) async {
    // try {
    //   await instance.logEvent(
    //     name: "share_referal_code",
    //     parameters: {
    //       "user_id": id,
    //       "referal_code": code,
    //     },
    //   );
    // } catch (e) {
    //   log("Error logging share referral code: $e");
    // }
  }

  static Future<void> visitSubscriptionScreen() async {
    // try {
    //   await instance.logEvent(name: "visit_subscription_screen");
    // } catch (e) {
    //   log("Error logging visit subscription screen: $e");
    // }
  }

  static Future<void> buySubscription({
    required int amount,
    required int activeMonth,
  }) async {
    // try {
    //   await instance.logEvent(
    //     name: "buy_subscription",
    //     parameters: {
    //       "currency": "KZT",
    //       "active_month": activeMonth,
    //       "amount": amount,
    //     },
    //   );
    // } catch (e) {
    //   log("Error logging buy subscription: $e");
    // }
  }

  static Future<void> openCheckoutScreen() async {
    // try {
    //   await instance.logEvent(name: "open_checkout_screen");
    // } catch (e) {
    //   log("Error logging open checkout screen: $e");
    // }
  }

  static Future<void> clickButtonPay() async {
    // try {
    //   await instance.logEvent(name: "click_button_pay");
    // } catch (e) {
    //   log("Error logging click button pay: $e");
    // }
  }

  static Future<void> successPaid({required String type}) async {
    // try {
    //   await instance.logEvent(
    //     name: "success_paid",
    //     parameters: {'type': type},
    //   );
    // } catch (e) {
    //   log("Error logging success paid: $e");
    // }
  }

  static Future<void> failPaid({required String type}) async {
    // try {
    //   await instance.logEvent(
    //     name: "fail_paid",
    //     parameters: {'type': type},
    //   );
    // } catch (e) {
    //   log("Error logging fail paid: $e");
    // }
  }
}
