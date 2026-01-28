import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light =>
      ThemeData(scaffoldBackgroundColor: AppColors.semanticBgPage);
  static ThemeData get dark => ThemeData(scaffoldBackgroundColor: Colors.black);
}
