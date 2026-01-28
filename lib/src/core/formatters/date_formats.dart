import 'package:easy_localization/easy_localization.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

final DateFormat yearMonthDay = DateFormat('yyyy-MM-dd');
final DateFormat yearMonthDayDot = DateFormat('yyyy.MM.dd');
final DateFormat dayMonthYearByDot = DateFormat('dd.MM.yyyy');
final DateFormat dayMonthYearByDotAndTime = DateFormat('dd.MM.yyyy, HH:mm');
final DateFormat dayMonthYearByFull = DateFormat('dd MMMM yyyy');
final DateFormat dayMonthYearBySlesh = DateFormat('dd/MM/yyyy');
final DateFormat hourMinutes = DateFormat('HH:mm');
final DateFormat dayMonth = DateFormat('MMMMEEEEd');
final DateFormat dayMonthTime = DateFormat("d MMM E");
final DateFormat dayMonth2 = DateFormat.MMMMd('ru');
final DateFormat dayMonthYear = DateFormat.yMMMMEEEEd();

String getDayMonth2(value) {
  final DateFormat dayMonth2 =
      DateFormat.MMMMd(sl<SharedPreferences>().getString('locale') ?? 'ru');
  return dayMonth2.format(DateTime.parse(value));
}

String extractTime(String fullTime) {
  List<String> parts = fullTime.split(":");
  return "${parts[0]}:${parts[1]}";
}
