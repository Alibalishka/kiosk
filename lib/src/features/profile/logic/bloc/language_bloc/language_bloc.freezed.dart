// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LanguageEvent {
  String get code => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String code) languageChangeTapped,
    required TResult Function(String code) languageChangeTappedMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String code)? languageChangeTapped,
    TResult? Function(String code)? languageChangeTappedMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String code)? languageChangeTapped,
    TResult Function(String code)? languageChangeTappedMenu,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LanguageChangeTapped value) languageChangeTapped,
    required TResult Function(_LanguageChangeTappedMenu value)
        languageChangeTappedMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LanguageChangeTapped value)? languageChangeTapped,
    TResult? Function(_LanguageChangeTappedMenu value)?
        languageChangeTappedMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LanguageChangeTapped value)? languageChangeTapped,
    TResult Function(_LanguageChangeTappedMenu value)? languageChangeTappedMenu,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LanguageEventCopyWith<LanguageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageEventCopyWith<$Res> {
  factory $LanguageEventCopyWith(
          LanguageEvent value, $Res Function(LanguageEvent) then) =
      _$LanguageEventCopyWithImpl<$Res, LanguageEvent>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class _$LanguageEventCopyWithImpl<$Res, $Val extends LanguageEvent>
    implements $LanguageEventCopyWith<$Res> {
  _$LanguageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageChangeTappedImplCopyWith<$Res>
    implements $LanguageEventCopyWith<$Res> {
  factory _$$LanguageChangeTappedImplCopyWith(_$LanguageChangeTappedImpl value,
          $Res Function(_$LanguageChangeTappedImpl) then) =
      __$$LanguageChangeTappedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$LanguageChangeTappedImplCopyWithImpl<$Res>
    extends _$LanguageEventCopyWithImpl<$Res, _$LanguageChangeTappedImpl>
    implements _$$LanguageChangeTappedImplCopyWith<$Res> {
  __$$LanguageChangeTappedImplCopyWithImpl(_$LanguageChangeTappedImpl _value,
      $Res Function(_$LanguageChangeTappedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$LanguageChangeTappedImpl(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LanguageChangeTappedImpl implements _LanguageChangeTapped {
  const _$LanguageChangeTappedImpl(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'LanguageEvent.languageChangeTapped(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageChangeTappedImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageChangeTappedImplCopyWith<_$LanguageChangeTappedImpl>
      get copyWith =>
          __$$LanguageChangeTappedImplCopyWithImpl<_$LanguageChangeTappedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String code) languageChangeTapped,
    required TResult Function(String code) languageChangeTappedMenu,
  }) {
    return languageChangeTapped(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String code)? languageChangeTapped,
    TResult? Function(String code)? languageChangeTappedMenu,
  }) {
    return languageChangeTapped?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String code)? languageChangeTapped,
    TResult Function(String code)? languageChangeTappedMenu,
    required TResult orElse(),
  }) {
    if (languageChangeTapped != null) {
      return languageChangeTapped(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LanguageChangeTapped value) languageChangeTapped,
    required TResult Function(_LanguageChangeTappedMenu value)
        languageChangeTappedMenu,
  }) {
    return languageChangeTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LanguageChangeTapped value)? languageChangeTapped,
    TResult? Function(_LanguageChangeTappedMenu value)?
        languageChangeTappedMenu,
  }) {
    return languageChangeTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LanguageChangeTapped value)? languageChangeTapped,
    TResult Function(_LanguageChangeTappedMenu value)? languageChangeTappedMenu,
    required TResult orElse(),
  }) {
    if (languageChangeTapped != null) {
      return languageChangeTapped(this);
    }
    return orElse();
  }
}

abstract class _LanguageChangeTapped implements LanguageEvent {
  const factory _LanguageChangeTapped(final String code) =
      _$LanguageChangeTappedImpl;

  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$LanguageChangeTappedImplCopyWith<_$LanguageChangeTappedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LanguageChangeTappedMenuImplCopyWith<$Res>
    implements $LanguageEventCopyWith<$Res> {
  factory _$$LanguageChangeTappedMenuImplCopyWith(
          _$LanguageChangeTappedMenuImpl value,
          $Res Function(_$LanguageChangeTappedMenuImpl) then) =
      __$$LanguageChangeTappedMenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$LanguageChangeTappedMenuImplCopyWithImpl<$Res>
    extends _$LanguageEventCopyWithImpl<$Res, _$LanguageChangeTappedMenuImpl>
    implements _$$LanguageChangeTappedMenuImplCopyWith<$Res> {
  __$$LanguageChangeTappedMenuImplCopyWithImpl(
      _$LanguageChangeTappedMenuImpl _value,
      $Res Function(_$LanguageChangeTappedMenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$LanguageChangeTappedMenuImpl(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LanguageChangeTappedMenuImpl implements _LanguageChangeTappedMenu {
  const _$LanguageChangeTappedMenuImpl(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'LanguageEvent.languageChangeTappedMenu(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageChangeTappedMenuImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageChangeTappedMenuImplCopyWith<_$LanguageChangeTappedMenuImpl>
      get copyWith => __$$LanguageChangeTappedMenuImplCopyWithImpl<
          _$LanguageChangeTappedMenuImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String code) languageChangeTapped,
    required TResult Function(String code) languageChangeTappedMenu,
  }) {
    return languageChangeTappedMenu(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String code)? languageChangeTapped,
    TResult? Function(String code)? languageChangeTappedMenu,
  }) {
    return languageChangeTappedMenu?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String code)? languageChangeTapped,
    TResult Function(String code)? languageChangeTappedMenu,
    required TResult orElse(),
  }) {
    if (languageChangeTappedMenu != null) {
      return languageChangeTappedMenu(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LanguageChangeTapped value) languageChangeTapped,
    required TResult Function(_LanguageChangeTappedMenu value)
        languageChangeTappedMenu,
  }) {
    return languageChangeTappedMenu(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LanguageChangeTapped value)? languageChangeTapped,
    TResult? Function(_LanguageChangeTappedMenu value)?
        languageChangeTappedMenu,
  }) {
    return languageChangeTappedMenu?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LanguageChangeTapped value)? languageChangeTapped,
    TResult Function(_LanguageChangeTappedMenu value)? languageChangeTappedMenu,
    required TResult orElse(),
  }) {
    if (languageChangeTappedMenu != null) {
      return languageChangeTappedMenu(this);
    }
    return orElse();
  }
}

abstract class _LanguageChangeTappedMenu implements LanguageEvent {
  const factory _LanguageChangeTappedMenu(final String code) =
      _$LanguageChangeTappedMenuImpl;

  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$LanguageChangeTappedMenuImplCopyWith<_$LanguageChangeTappedMenuImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LanguageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale) initial,
    required TResult Function() changeLoading,
    required TResult Function() changeSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale)? initial,
    TResult? Function()? changeLoading,
    TResult? Function()? changeSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale)? initial,
    TResult Function()? changeLoading,
    TResult Function()? changeSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeLoading value) changeLoading,
    required TResult Function(_ChangeSuccess value) changeSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeLoading value)? changeLoading,
    TResult? Function(_ChangeSuccess value)? changeSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeLoading value)? changeLoading,
    TResult Function(_ChangeSuccess value)? changeSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageStateCopyWith<$Res> {
  factory $LanguageStateCopyWith(
          LanguageState value, $Res Function(LanguageState) then) =
      _$LanguageStateCopyWithImpl<$Res, LanguageState>;
}

/// @nodoc
class _$LanguageStateCopyWithImpl<$Res, $Val extends LanguageState>
    implements $LanguageStateCopyWith<$Res> {
  _$LanguageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LanguageStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$InitialImpl(
      null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.locale);

  @override
  final Locale locale;

  @override
  String toString() {
    return 'LanguageState.initial(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale) initial,
    required TResult Function() changeLoading,
    required TResult Function() changeSuccess,
  }) {
    return initial(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale)? initial,
    TResult? Function()? changeLoading,
    TResult? Function()? changeSuccess,
  }) {
    return initial?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale)? initial,
    TResult Function()? changeLoading,
    TResult Function()? changeSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeLoading value) changeLoading,
    required TResult Function(_ChangeSuccess value) changeSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeLoading value)? changeLoading,
    TResult? Function(_ChangeSuccess value)? changeSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeLoading value)? changeLoading,
    TResult Function(_ChangeSuccess value)? changeSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LanguageState {
  const factory _Initial(final Locale locale) = _$InitialImpl;

  Locale get locale;
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeLoadingImplCopyWith<$Res> {
  factory _$$ChangeLoadingImplCopyWith(
          _$ChangeLoadingImpl value, $Res Function(_$ChangeLoadingImpl) then) =
      __$$ChangeLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeLoadingImplCopyWithImpl<$Res>
    extends _$LanguageStateCopyWithImpl<$Res, _$ChangeLoadingImpl>
    implements _$$ChangeLoadingImplCopyWith<$Res> {
  __$$ChangeLoadingImplCopyWithImpl(
      _$ChangeLoadingImpl _value, $Res Function(_$ChangeLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeLoadingImpl implements _ChangeLoading {
  const _$ChangeLoadingImpl();

  @override
  String toString() {
    return 'LanguageState.changeLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangeLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale) initial,
    required TResult Function() changeLoading,
    required TResult Function() changeSuccess,
  }) {
    return changeLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale)? initial,
    TResult? Function()? changeLoading,
    TResult? Function()? changeSuccess,
  }) {
    return changeLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale)? initial,
    TResult Function()? changeLoading,
    TResult Function()? changeSuccess,
    required TResult orElse(),
  }) {
    if (changeLoading != null) {
      return changeLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeLoading value) changeLoading,
    required TResult Function(_ChangeSuccess value) changeSuccess,
  }) {
    return changeLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeLoading value)? changeLoading,
    TResult? Function(_ChangeSuccess value)? changeSuccess,
  }) {
    return changeLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeLoading value)? changeLoading,
    TResult Function(_ChangeSuccess value)? changeSuccess,
    required TResult orElse(),
  }) {
    if (changeLoading != null) {
      return changeLoading(this);
    }
    return orElse();
  }
}

abstract class _ChangeLoading implements LanguageState {
  const factory _ChangeLoading() = _$ChangeLoadingImpl;
}

/// @nodoc
abstract class _$$ChangeSuccessImplCopyWith<$Res> {
  factory _$$ChangeSuccessImplCopyWith(
          _$ChangeSuccessImpl value, $Res Function(_$ChangeSuccessImpl) then) =
      __$$ChangeSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeSuccessImplCopyWithImpl<$Res>
    extends _$LanguageStateCopyWithImpl<$Res, _$ChangeSuccessImpl>
    implements _$$ChangeSuccessImplCopyWith<$Res> {
  __$$ChangeSuccessImplCopyWithImpl(
      _$ChangeSuccessImpl _value, $Res Function(_$ChangeSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeSuccessImpl implements _ChangeSuccess {
  const _$ChangeSuccessImpl();

  @override
  String toString() {
    return 'LanguageState.changeSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangeSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale) initial,
    required TResult Function() changeLoading,
    required TResult Function() changeSuccess,
  }) {
    return changeSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale)? initial,
    TResult? Function()? changeLoading,
    TResult? Function()? changeSuccess,
  }) {
    return changeSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale)? initial,
    TResult Function()? changeLoading,
    TResult Function()? changeSuccess,
    required TResult orElse(),
  }) {
    if (changeSuccess != null) {
      return changeSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeLoading value) changeLoading,
    required TResult Function(_ChangeSuccess value) changeSuccess,
  }) {
    return changeSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeLoading value)? changeLoading,
    TResult? Function(_ChangeSuccess value)? changeSuccess,
  }) {
    return changeSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeLoading value)? changeLoading,
    TResult Function(_ChangeSuccess value)? changeSuccess,
    required TResult orElse(),
  }) {
    if (changeSuccess != null) {
      return changeSuccess(this);
    }
    return orElse();
  }
}

abstract class _ChangeSuccess implements LanguageState {
  const factory _ChangeSuccess() = _$ChangeSuccessImpl;
}
