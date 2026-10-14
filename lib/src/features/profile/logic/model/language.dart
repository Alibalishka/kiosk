import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';

@immutable
class Language {
  static final icons = <String, String>{
    AppLanguages.kk: AppSvgImages.kazakhstan,
    AppLanguages.ru: AppSvgImages.russia,
    AppLanguages.en: AppSvgImages.usa,
    AppLanguages.zh: AppSvgImages.china,
  };

  static final names = <String, String>{
    AppLanguages.kk: 'Қазақша',
    AppLanguages.ru: 'Русский',
    AppLanguages.en: 'English',
    AppLanguages.zh: '中文',
  };

  final String languageCode;

  const Language({required this.languageCode});
}
