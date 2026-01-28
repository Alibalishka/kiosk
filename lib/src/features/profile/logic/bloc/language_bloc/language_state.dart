part of 'language_bloc.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState.initial(Locale locale) = _Initial;

  const factory LanguageState.changeLoading() = _ChangeLoading;
  const factory LanguageState.changeSuccess() = _ChangeSuccess;
}
