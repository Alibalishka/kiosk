part of 'language_bloc.dart';

@freezed
class LanguageEvent with _$LanguageEvent {
  const factory LanguageEvent.languageChangeTapped(String code) =
      _LanguageChangeTapped;

  const factory LanguageEvent.languageChangeTappedMenu(String code) =
      _LanguageChangeTappedMenu;
}
