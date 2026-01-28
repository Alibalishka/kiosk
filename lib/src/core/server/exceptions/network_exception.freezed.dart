// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NetworkException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioException error) request,
    required TResult Function(String? error) type,
    required TResult Function(String message) connectivity,
    required TResult Function(String message) timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioException error)? request,
    TResult? Function(String? error)? type,
    TResult? Function(String message)? connectivity,
    TResult? Function(String message)? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioException error)? request,
    TResult Function(String? error)? type,
    TResult Function(String message)? connectivity,
    TResult Function(String message)? timeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponseError value) request,
    required TResult Function(_DecodingError value) type,
    required TResult Function(_Connectivity value) connectivity,
    required TResult Function(_TimeOut value) timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResponseError value)? request,
    TResult? Function(_DecodingError value)? type,
    TResult? Function(_Connectivity value)? connectivity,
    TResult? Function(_TimeOut value)? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkExceptionCopyWith<$Res> {
  factory $NetworkExceptionCopyWith(
          NetworkException value, $Res Function(NetworkException) then) =
      _$NetworkExceptionCopyWithImpl<$Res, NetworkException>;
}

/// @nodoc
class _$NetworkExceptionCopyWithImpl<$Res, $Val extends NetworkException>
    implements $NetworkExceptionCopyWith<$Res> {
  _$NetworkExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ResponseErrorImplCopyWith<$Res> {
  factory _$$ResponseErrorImplCopyWith(
          _$ResponseErrorImpl value, $Res Function(_$ResponseErrorImpl) then) =
      __$$ResponseErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DioException error});
}

/// @nodoc
class __$$ResponseErrorImplCopyWithImpl<$Res>
    extends _$NetworkExceptionCopyWithImpl<$Res, _$ResponseErrorImpl>
    implements _$$ResponseErrorImplCopyWith<$Res> {
  __$$ResponseErrorImplCopyWithImpl(
      _$ResponseErrorImpl _value, $Res Function(_$ResponseErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ResponseErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as DioException,
    ));
  }
}

/// @nodoc

class _$ResponseErrorImpl extends _ResponseError {
  const _$ResponseErrorImpl({required this.error}) : super._();

  @override
  final DioException error;

  @override
  String toString() {
    return 'NetworkException.request(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseErrorImplCopyWith<_$ResponseErrorImpl> get copyWith =>
      __$$ResponseErrorImplCopyWithImpl<_$ResponseErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioException error) request,
    required TResult Function(String? error) type,
    required TResult Function(String message) connectivity,
    required TResult Function(String message) timeOut,
  }) {
    return request(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioException error)? request,
    TResult? Function(String? error)? type,
    TResult? Function(String message)? connectivity,
    TResult? Function(String message)? timeOut,
  }) {
    return request?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioException error)? request,
    TResult Function(String? error)? type,
    TResult Function(String message)? connectivity,
    TResult Function(String message)? timeOut,
    required TResult orElse(),
  }) {
    if (request != null) {
      return request(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponseError value) request,
    required TResult Function(_DecodingError value) type,
    required TResult Function(_Connectivity value) connectivity,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return request(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResponseError value)? request,
    TResult? Function(_DecodingError value)? type,
    TResult? Function(_Connectivity value)? connectivity,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return request?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (request != null) {
      return request(this);
    }
    return orElse();
  }
}

abstract class _ResponseError extends NetworkException {
  const factory _ResponseError({required final DioException error}) =
      _$ResponseErrorImpl;
  const _ResponseError._() : super._();

  DioException get error;
  @JsonKey(ignore: true)
  _$$ResponseErrorImplCopyWith<_$ResponseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecodingErrorImplCopyWith<$Res> {
  factory _$$DecodingErrorImplCopyWith(
          _$DecodingErrorImpl value, $Res Function(_$DecodingErrorImpl) then) =
      __$$DecodingErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$DecodingErrorImplCopyWithImpl<$Res>
    extends _$NetworkExceptionCopyWithImpl<$Res, _$DecodingErrorImpl>
    implements _$$DecodingErrorImplCopyWith<$Res> {
  __$$DecodingErrorImplCopyWithImpl(
      _$DecodingErrorImpl _value, $Res Function(_$DecodingErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$DecodingErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DecodingErrorImpl extends _DecodingError {
  const _$DecodingErrorImpl({this.error}) : super._();

  @override
  final String? error;

  @override
  String toString() {
    return 'NetworkException.type(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecodingErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecodingErrorImplCopyWith<_$DecodingErrorImpl> get copyWith =>
      __$$DecodingErrorImplCopyWithImpl<_$DecodingErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioException error) request,
    required TResult Function(String? error) type,
    required TResult Function(String message) connectivity,
    required TResult Function(String message) timeOut,
  }) {
    return type(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioException error)? request,
    TResult? Function(String? error)? type,
    TResult? Function(String message)? connectivity,
    TResult? Function(String message)? timeOut,
  }) {
    return type?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioException error)? request,
    TResult Function(String? error)? type,
    TResult Function(String message)? connectivity,
    TResult Function(String message)? timeOut,
    required TResult orElse(),
  }) {
    if (type != null) {
      return type(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponseError value) request,
    required TResult Function(_DecodingError value) type,
    required TResult Function(_Connectivity value) connectivity,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return type(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResponseError value)? request,
    TResult? Function(_DecodingError value)? type,
    TResult? Function(_Connectivity value)? connectivity,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return type?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (type != null) {
      return type(this);
    }
    return orElse();
  }
}

abstract class _DecodingError extends NetworkException {
  const factory _DecodingError({final String? error}) = _$DecodingErrorImpl;
  const _DecodingError._() : super._();

  String? get error;
  @JsonKey(ignore: true)
  _$$DecodingErrorImplCopyWith<_$DecodingErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectivityImplCopyWith<$Res> {
  factory _$$ConnectivityImplCopyWith(
          _$ConnectivityImpl value, $Res Function(_$ConnectivityImpl) then) =
      __$$ConnectivityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ConnectivityImplCopyWithImpl<$Res>
    extends _$NetworkExceptionCopyWithImpl<$Res, _$ConnectivityImpl>
    implements _$$ConnectivityImplCopyWith<$Res> {
  __$$ConnectivityImplCopyWithImpl(
      _$ConnectivityImpl _value, $Res Function(_$ConnectivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ConnectivityImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConnectivityImpl extends _Connectivity {
  const _$ConnectivityImpl({this.message = 'Нет доступа к интернету!'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NetworkException.connectivity(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectivityImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectivityImplCopyWith<_$ConnectivityImpl> get copyWith =>
      __$$ConnectivityImplCopyWithImpl<_$ConnectivityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioException error) request,
    required TResult Function(String? error) type,
    required TResult Function(String message) connectivity,
    required TResult Function(String message) timeOut,
  }) {
    return connectivity(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioException error)? request,
    TResult? Function(String? error)? type,
    TResult? Function(String message)? connectivity,
    TResult? Function(String message)? timeOut,
  }) {
    return connectivity?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioException error)? request,
    TResult Function(String? error)? type,
    TResult Function(String message)? connectivity,
    TResult Function(String message)? timeOut,
    required TResult orElse(),
  }) {
    if (connectivity != null) {
      return connectivity(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponseError value) request,
    required TResult Function(_DecodingError value) type,
    required TResult Function(_Connectivity value) connectivity,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return connectivity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResponseError value)? request,
    TResult? Function(_DecodingError value)? type,
    TResult? Function(_Connectivity value)? connectivity,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return connectivity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (connectivity != null) {
      return connectivity(this);
    }
    return orElse();
  }
}

abstract class _Connectivity extends NetworkException {
  const factory _Connectivity({final String message}) = _$ConnectivityImpl;
  const _Connectivity._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$ConnectivityImplCopyWith<_$ConnectivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeOutImplCopyWith<$Res> {
  factory _$$TimeOutImplCopyWith(
          _$TimeOutImpl value, $Res Function(_$TimeOutImpl) then) =
      __$$TimeOutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TimeOutImplCopyWithImpl<$Res>
    extends _$NetworkExceptionCopyWithImpl<$Res, _$TimeOutImpl>
    implements _$$TimeOutImplCopyWith<$Res> {
  __$$TimeOutImplCopyWithImpl(
      _$TimeOutImpl _value, $Res Function(_$TimeOutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TimeOutImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TimeOutImpl extends _TimeOut {
  const _$TimeOutImpl({this.message = 'Время запроса истекло!'}) : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NetworkException.timeOut(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeOutImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeOutImplCopyWith<_$TimeOutImpl> get copyWith =>
      __$$TimeOutImplCopyWithImpl<_$TimeOutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioException error) request,
    required TResult Function(String? error) type,
    required TResult Function(String message) connectivity,
    required TResult Function(String message) timeOut,
  }) {
    return timeOut(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioException error)? request,
    TResult? Function(String? error)? type,
    TResult? Function(String message)? connectivity,
    TResult? Function(String message)? timeOut,
  }) {
    return timeOut?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioException error)? request,
    TResult Function(String? error)? type,
    TResult Function(String message)? connectivity,
    TResult Function(String message)? timeOut,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponseError value) request,
    required TResult Function(_DecodingError value) type,
    required TResult Function(_Connectivity value) connectivity,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return timeOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResponseError value)? request,
    TResult? Function(_DecodingError value)? type,
    TResult? Function(_Connectivity value)? connectivity,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return timeOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut(this);
    }
    return orElse();
  }
}

abstract class _TimeOut extends NetworkException {
  const factory _TimeOut({final String message}) = _$TimeOutImpl;
  const _TimeOut._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$TimeOutImplCopyWith<_$TimeOutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
