import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher.dart';

mixin LaunchInBrowserUtil {
  /// Открывает ссылку в браузере
  static Future<void> launchUrl(String url,
      [LaunchMode mode = LaunchMode.platformDefault]) async {
    final uri = Uri.parse(url);
    if (await launcher.canLaunchUrl(uri)) {
      await launcher.launchUrl(uri, mode: mode);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
