import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_event.dart';
part 'language_state.dart';
part 'language_bloc.freezed.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final SharedPreferences _sharedPreferences;
  final BuildContext _context;
  LanguageBloc({
    required final SharedPreferences sharedPreferences,
    required final BuildContext context,
  })  : _sharedPreferences = sharedPreferences,
        _context = context,
        super(_Initial(context.locale)) {
    on<LanguageEvent>(
      (event, emit) => event.map(
        languageChangeTapped: (event) => _languageChangeTapped(event, emit),
        languageChangeTappedMenu: (event) =>
            _languageChangeTappedMenu(event, emit),
      ),
    );
  }

  void _languageChangeTappedMenu(
    _LanguageChangeTappedMenu event,
    Emitter<LanguageState> emit,
  ) {
    emit(const LanguageState.changeLoading());
    _sharedPreferences.setString('locale', event.code);

    if (event.code == AppLanguages.kk) {
      _context.setLocale(const Locale('kk', 'KK'));
    } else if (event.code == AppLanguages.ru) {
      _context.setLocale(const Locale('ru', 'RU'));
    } else {
      _context.setLocale(const Locale('en', 'US'));
    }

    emit(const LanguageState.changeSuccess());
  }

  void _languageChangeTapped(
    _LanguageChangeTapped event,
    Emitter<LanguageState> emit,
  ) {
    _sharedPreferences.setString('locale', event.code);

    if (event.code == AppLanguages.kk) {
      _context.setLocale(const Locale('kk', 'KK'));
    } else if (event.code == AppLanguages.ru) {
      _context.setLocale(const Locale('ru', 'RU'));
    } else {
      _context.setLocale(const Locale('en', 'US'));
    }

    Phoenix.rebirth(_context);
    emit(_Initial(Locale(event.code)));
  }
}
