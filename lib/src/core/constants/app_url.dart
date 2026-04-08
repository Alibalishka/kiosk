// import 'package:yandex_geocoder/yandex_geocoder.dart';

abstract class AppUrls {
  /// Переключатель окружения в одном месте.
  /// false = dev, true = prod.
  static const bool isProd = false;

  static String get _apiZone => isProd ? 'admin' : 'dev';
  static String get _otaChannel => isProd ? 'prod' : 'dev';

  static String get devUrl => 'https://sandyq.$_apiZone.qrpay.kz/api';
  static String get kBaseUrl => devUrl;
  static String apiByHost(String host) => 'https://$host.$_apiZone.qrpay.kz/api';
  static String get otaApkUrl => 'https://kiosk.qrpay.kz/apk/app/$_otaChannel';

  // static const kBaseUrl = 'https://chayla.admin.qrpay.kz/api';
  static const notFoundUrl =
      'https://s3.amazonaws.com/thetech-production/images/web_photos/web/4429_image_not_found.png?1460712165';
  // static final geoCoder =
  //     YandexGeocoder(apiKey: 'ac1e09ba-e6e1-4fb9-addc-5b44608b74a8');
  static const userAgreement =
      'https://minio.daladev.kz/tenant-sandyq/terms/Политика_конфиденциальности_Sandyq_prime.pdf';
  static const publicContract =
      'https://minio.naprocat.com/tenant-sandyq/terms/%D0%9F%D1%83%D0%B1%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D0%B8%CC%86%20%D0%B4%D0%BE%D0%B3%D0%BE%D0%B2%D0%BE%D1%80%20SANDYQ%20PRIME.pdf';
}
