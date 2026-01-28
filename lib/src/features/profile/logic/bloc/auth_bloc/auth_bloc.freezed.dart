// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest request) pinCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest request)? pinCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest request)? pinCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_PinCodeEvent value) pinCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_PinCodeEvent value)? pinCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginEvent value)? login,
    TResult Function(_PinCodeEvent value)? pinCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginEventImplCopyWith<$Res> {
  factory _$$LoginEventImplCopyWith(
          _$LoginEventImpl value, $Res Function(_$LoginEventImpl) then) =
      __$$LoginEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$LoginEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginEventImpl>
    implements _$$LoginEventImplCopyWith<$Res> {
  __$$LoginEventImplCopyWithImpl(
      _$LoginEventImpl _value, $Res Function(_$LoginEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$LoginEventImpl(
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginEventImpl implements _LoginEvent {
  const _$LoginEventImpl(this.phone);

  @override
  final String phone;

  @override
  String toString() {
    return 'AuthEvent.login(phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginEventImpl &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginEventImplCopyWith<_$LoginEventImpl> get copyWith =>
      __$$LoginEventImplCopyWithImpl<_$LoginEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest request) pinCode,
  }) {
    return login(phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest request)? pinCode,
  }) {
    return login?.call(phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest request)? pinCode,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_PinCodeEvent value) pinCode,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_PinCodeEvent value)? pinCode,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginEvent value)? login,
    TResult Function(_PinCodeEvent value)? pinCode,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _LoginEvent implements AuthEvent {
  const factory _LoginEvent(final String phone) = _$LoginEventImpl;

  String get phone;
  @JsonKey(ignore: true)
  _$$LoginEventImplCopyWith<_$LoginEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PinCodeEventImplCopyWith<$Res> {
  factory _$$PinCodeEventImplCopyWith(
          _$PinCodeEventImpl value, $Res Function(_$PinCodeEventImpl) then) =
      __$$PinCodeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterRequest request});
}

/// @nodoc
class __$$PinCodeEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PinCodeEventImpl>
    implements _$$PinCodeEventImplCopyWith<$Res> {
  __$$PinCodeEventImplCopyWithImpl(
      _$PinCodeEventImpl _value, $Res Function(_$PinCodeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$PinCodeEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RegisterRequest,
    ));
  }
}

/// @nodoc

class _$PinCodeEventImpl implements _PinCodeEvent {
  const _$PinCodeEventImpl({required this.request});

  @override
  final RegisterRequest request;

  @override
  String toString() {
    return 'AuthEvent.pinCode(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PinCodeEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PinCodeEventImplCopyWith<_$PinCodeEventImpl> get copyWith =>
      __$$PinCodeEventImplCopyWithImpl<_$PinCodeEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest request) pinCode,
  }) {
    return pinCode(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest request)? pinCode,
  }) {
    return pinCode?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest request)? pinCode,
    required TResult orElse(),
  }) {
    if (pinCode != null) {
      return pinCode(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_PinCodeEvent value) pinCode,
  }) {
    return pinCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_PinCodeEvent value)? pinCode,
  }) {
    return pinCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginEvent value)? login,
    TResult Function(_PinCodeEvent value)? pinCode,
    required TResult orElse(),
  }) {
    if (pinCode != null) {
      return pinCode(this);
    }
    return orElse();
  }
}

abstract class _PinCodeEvent implements AuthEvent {
  const factory _PinCodeEvent({required final RegisterRequest request}) =
      _$PinCodeEventImpl;

  RegisterRequest get request;
  @JsonKey(ignore: true)
  _$$PinCodeEventImplCopyWith<_$PinCodeEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAuth value) initial,
    required TResult Function(_SuccessAuth value) success,
    required TResult Function(_ErrorAuth value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAuth value)? initial,
    TResult? Function(_SuccessAuth value)? success,
    TResult? Function(_ErrorAuth value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAuth value)? initial,
    TResult Function(_SuccessAuth value)? success,
    TResult Function(_ErrorAuth value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialAuthImplCopyWith<$Res> {
  factory _$$InitialAuthImplCopyWith(
          _$InitialAuthImpl value, $Res Function(_$InitialAuthImpl) then) =
      __$$InitialAuthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialAuthImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialAuthImpl>
    implements _$$InitialAuthImplCopyWith<$Res> {
  __$$InitialAuthImplCopyWithImpl(
      _$InitialAuthImpl _value, $Res Function(_$InitialAuthImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialAuthImpl implements _InitialAuth {
  const _$InitialAuthImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialAuthImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAuth value) initial,
    required TResult Function(_SuccessAuth value) success,
    required TResult Function(_ErrorAuth value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAuth value)? initial,
    TResult? Function(_SuccessAuth value)? success,
    TResult? Function(_ErrorAuth value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAuth value)? initial,
    TResult Function(_SuccessAuth value)? success,
    TResult Function(_ErrorAuth value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialAuth implements AuthState {
  const factory _InitialAuth() = _$InitialAuthImpl;
}

/// @nodoc
abstract class _$$SuccessAuthImplCopyWith<$Res> {
  factory _$$SuccessAuthImplCopyWith(
          _$SuccessAuthImpl value, $Res Function(_$SuccessAuthImpl) then) =
      __$$SuccessAuthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessAuthImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SuccessAuthImpl>
    implements _$$SuccessAuthImplCopyWith<$Res> {
  __$$SuccessAuthImplCopyWithImpl(
      _$SuccessAuthImpl _value, $Res Function(_$SuccessAuthImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessAuthImpl implements _SuccessAuth {
  const _$SuccessAuthImpl();

  @override
  String toString() {
    return 'AuthState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessAuthImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAuth value) initial,
    required TResult Function(_SuccessAuth value) success,
    required TResult Function(_ErrorAuth value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAuth value)? initial,
    TResult? Function(_SuccessAuth value)? success,
    TResult? Function(_ErrorAuth value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAuth value)? initial,
    TResult Function(_SuccessAuth value)? success,
    TResult Function(_ErrorAuth value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessAuth implements AuthState {
  const factory _SuccessAuth() = _$SuccessAuthImpl;
}

/// @nodoc
abstract class _$$ErrorAuthImplCopyWith<$Res> {
  factory _$$ErrorAuthImplCopyWith(
          _$ErrorAuthImpl value, $Res Function(_$ErrorAuthImpl) then) =
      __$$ErrorAuthImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorAuthImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorAuthImpl>
    implements _$$ErrorAuthImplCopyWith<$Res> {
  __$$ErrorAuthImplCopyWithImpl(
      _$ErrorAuthImpl _value, $Res Function(_$ErrorAuthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorAuthImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorAuthImpl implements _ErrorAuth {
  const _$ErrorAuthImpl({this.message = 'Произошла ошибка'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorAuthImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorAuthImplCopyWith<_$ErrorAuthImpl> get copyWith =>
      __$$ErrorAuthImplCopyWithImpl<_$ErrorAuthImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAuth value) initial,
    required TResult Function(_SuccessAuth value) success,
    required TResult Function(_ErrorAuth value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAuth value)? initial,
    TResult? Function(_SuccessAuth value)? success,
    TResult? Function(_ErrorAuth value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAuth value)? initial,
    TResult Function(_SuccessAuth value)? success,
    TResult Function(_ErrorAuth value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorAuth implements AuthState {
  const factory _ErrorAuth({final String message}) = _$ErrorAuthImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorAuthImplCopyWith<_$ErrorAuthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
