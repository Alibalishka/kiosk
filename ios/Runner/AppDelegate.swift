import UIKit
import Flutter
import YandexMapsMobile
// import app_links

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Установка API ключа для Yandex Maps
    YMKMapKit.setApiKey("68428e34-3d85-439d-bc8b-d5f8f85b89b6")

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
