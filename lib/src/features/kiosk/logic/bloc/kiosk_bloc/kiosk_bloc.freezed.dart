// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kiosk_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KioskEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KioskRequest body) register,
    required TResult Function(String deviceId) checkKiosk,
    required TResult Function(KioskStatusRequest body, String deviceId)
        sendStatusKiosk,
    required TResult Function(MenuCheckoutRequest body) payKaspi,
    required TResult Function(int orderId) checkKapiPayStatus,
    required TResult Function(String deviceId) fetchScreenSavers,
    required TResult Function() techWork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KioskRequest body)? register,
    TResult? Function(String deviceId)? checkKiosk,
    TResult? Function(KioskStatusRequest body, String deviceId)?
        sendStatusKiosk,
    TResult? Function(MenuCheckoutRequest body)? payKaspi,
    TResult? Function(int orderId)? checkKapiPayStatus,
    TResult? Function(String deviceId)? fetchScreenSavers,
    TResult? Function()? techWork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KioskRequest body)? register,
    TResult Function(String deviceId)? checkKiosk,
    TResult Function(KioskStatusRequest body, String deviceId)? sendStatusKiosk,
    TResult Function(MenuCheckoutRequest body)? payKaspi,
    TResult Function(int orderId)? checkKapiPayStatus,
    TResult Function(String deviceId)? fetchScreenSavers,
    TResult Function()? techWork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Register value) register,
    required TResult Function(_CheckKiosk value) checkKiosk,
    required TResult Function(_SendStatusKiosk value) sendStatusKiosk,
    required TResult Function(_PayKaspi value) payKaspi,
    required TResult Function(_CheckKapiPayStatus value) checkKapiPayStatus,
    required TResult Function(_FetchScreenSavers value) fetchScreenSavers,
    required TResult Function(_TechWork value) techWork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckKiosk value)? checkKiosk,
    TResult? Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult? Function(_PayKaspi value)? payKaspi,
    TResult? Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult? Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult? Function(_TechWork value)? techWork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Register value)? register,
    TResult Function(_CheckKiosk value)? checkKiosk,
    TResult Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult Function(_PayKaspi value)? payKaspi,
    TResult Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult Function(_TechWork value)? techWork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KioskEventCopyWith<$Res> {
  factory $KioskEventCopyWith(
          KioskEvent value, $Res Function(KioskEvent) then) =
      _$KioskEventCopyWithImpl<$Res, KioskEvent>;
}

/// @nodoc
class _$KioskEventCopyWithImpl<$Res, $Val extends KioskEvent>
    implements $KioskEventCopyWith<$Res> {
  _$KioskEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RegisterImplCopyWith<$Res> {
  factory _$$RegisterImplCopyWith(
          _$RegisterImpl value, $Res Function(_$RegisterImpl) then) =
      __$$RegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({KioskRequest body});
}

/// @nodoc
class __$$RegisterImplCopyWithImpl<$Res>
    extends _$KioskEventCopyWithImpl<$Res, _$RegisterImpl>
    implements _$$RegisterImplCopyWith<$Res> {
  __$$RegisterImplCopyWithImpl(
      _$RegisterImpl _value, $Res Function(_$RegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$RegisterImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as KioskRequest,
    ));
  }
}

/// @nodoc

class _$RegisterImpl implements _Register {
  const _$RegisterImpl({required this.body});

  @override
  final KioskRequest body;

  @override
  String toString() {
    return 'KioskEvent.register(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      __$$RegisterImplCopyWithImpl<_$RegisterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KioskRequest body) register,
    required TResult Function(String deviceId) checkKiosk,
    required TResult Function(KioskStatusRequest body, String deviceId)
        sendStatusKiosk,
    required TResult Function(MenuCheckoutRequest body) payKaspi,
    required TResult Function(int orderId) checkKapiPayStatus,
    required TResult Function(String deviceId) fetchScreenSavers,
    required TResult Function() techWork,
  }) {
    return register(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KioskRequest body)? register,
    TResult? Function(String deviceId)? checkKiosk,
    TResult? Function(KioskStatusRequest body, String deviceId)?
        sendStatusKiosk,
    TResult? Function(MenuCheckoutRequest body)? payKaspi,
    TResult? Function(int orderId)? checkKapiPayStatus,
    TResult? Function(String deviceId)? fetchScreenSavers,
    TResult? Function()? techWork,
  }) {
    return register?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KioskRequest body)? register,
    TResult Function(String deviceId)? checkKiosk,
    TResult Function(KioskStatusRequest body, String deviceId)? sendStatusKiosk,
    TResult Function(MenuCheckoutRequest body)? payKaspi,
    TResult Function(int orderId)? checkKapiPayStatus,
    TResult Function(String deviceId)? fetchScreenSavers,
    TResult Function()? techWork,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Register value) register,
    required TResult Function(_CheckKiosk value) checkKiosk,
    required TResult Function(_SendStatusKiosk value) sendStatusKiosk,
    required TResult Function(_PayKaspi value) payKaspi,
    required TResult Function(_CheckKapiPayStatus value) checkKapiPayStatus,
    required TResult Function(_FetchScreenSavers value) fetchScreenSavers,
    required TResult Function(_TechWork value) techWork,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckKiosk value)? checkKiosk,
    TResult? Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult? Function(_PayKaspi value)? payKaspi,
    TResult? Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult? Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult? Function(_TechWork value)? techWork,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Register value)? register,
    TResult Function(_CheckKiosk value)? checkKiosk,
    TResult Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult Function(_PayKaspi value)? payKaspi,
    TResult Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult Function(_TechWork value)? techWork,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register implements KioskEvent {
  const factory _Register({required final KioskRequest body}) = _$RegisterImpl;

  KioskRequest get body;
  @JsonKey(ignore: true)
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckKioskImplCopyWith<$Res> {
  factory _$$CheckKioskImplCopyWith(
          _$CheckKioskImpl value, $Res Function(_$CheckKioskImpl) then) =
      __$$CheckKioskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String deviceId});
}

/// @nodoc
class __$$CheckKioskImplCopyWithImpl<$Res>
    extends _$KioskEventCopyWithImpl<$Res, _$CheckKioskImpl>
    implements _$$CheckKioskImplCopyWith<$Res> {
  __$$CheckKioskImplCopyWithImpl(
      _$CheckKioskImpl _value, $Res Function(_$CheckKioskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
  }) {
    return _then(_$CheckKioskImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckKioskImpl implements _CheckKiosk {
  const _$CheckKioskImpl({required this.deviceId});

  @override
  final String deviceId;

  @override
  String toString() {
    return 'KioskEvent.checkKiosk(deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckKioskImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckKioskImplCopyWith<_$CheckKioskImpl> get copyWith =>
      __$$CheckKioskImplCopyWithImpl<_$CheckKioskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KioskRequest body) register,
    required TResult Function(String deviceId) checkKiosk,
    required TResult Function(KioskStatusRequest body, String deviceId)
        sendStatusKiosk,
    required TResult Function(MenuCheckoutRequest body) payKaspi,
    required TResult Function(int orderId) checkKapiPayStatus,
    required TResult Function(String deviceId) fetchScreenSavers,
    required TResult Function() techWork,
  }) {
    return checkKiosk(deviceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KioskRequest body)? register,
    TResult? Function(String deviceId)? checkKiosk,
    TResult? Function(KioskStatusRequest body, String deviceId)?
        sendStatusKiosk,
    TResult? Function(MenuCheckoutRequest body)? payKaspi,
    TResult? Function(int orderId)? checkKapiPayStatus,
    TResult? Function(String deviceId)? fetchScreenSavers,
    TResult? Function()? techWork,
  }) {
    return checkKiosk?.call(deviceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KioskRequest body)? register,
    TResult Function(String deviceId)? checkKiosk,
    TResult Function(KioskStatusRequest body, String deviceId)? sendStatusKiosk,
    TResult Function(MenuCheckoutRequest body)? payKaspi,
    TResult Function(int orderId)? checkKapiPayStatus,
    TResult Function(String deviceId)? fetchScreenSavers,
    TResult Function()? techWork,
    required TResult orElse(),
  }) {
    if (checkKiosk != null) {
      return checkKiosk(deviceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Register value) register,
    required TResult Function(_CheckKiosk value) checkKiosk,
    required TResult Function(_SendStatusKiosk value) sendStatusKiosk,
    required TResult Function(_PayKaspi value) payKaspi,
    required TResult Function(_CheckKapiPayStatus value) checkKapiPayStatus,
    required TResult Function(_FetchScreenSavers value) fetchScreenSavers,
    required TResult Function(_TechWork value) techWork,
  }) {
    return checkKiosk(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckKiosk value)? checkKiosk,
    TResult? Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult? Function(_PayKaspi value)? payKaspi,
    TResult? Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult? Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult? Function(_TechWork value)? techWork,
  }) {
    return checkKiosk?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Register value)? register,
    TResult Function(_CheckKiosk value)? checkKiosk,
    TResult Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult Function(_PayKaspi value)? payKaspi,
    TResult Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult Function(_TechWork value)? techWork,
    required TResult orElse(),
  }) {
    if (checkKiosk != null) {
      return checkKiosk(this);
    }
    return orElse();
  }
}

abstract class _CheckKiosk implements KioskEvent {
  const factory _CheckKiosk({required final String deviceId}) =
      _$CheckKioskImpl;

  String get deviceId;
  @JsonKey(ignore: true)
  _$$CheckKioskImplCopyWith<_$CheckKioskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendStatusKioskImplCopyWith<$Res> {
  factory _$$SendStatusKioskImplCopyWith(_$SendStatusKioskImpl value,
          $Res Function(_$SendStatusKioskImpl) then) =
      __$$SendStatusKioskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({KioskStatusRequest body, String deviceId});
}

/// @nodoc
class __$$SendStatusKioskImplCopyWithImpl<$Res>
    extends _$KioskEventCopyWithImpl<$Res, _$SendStatusKioskImpl>
    implements _$$SendStatusKioskImplCopyWith<$Res> {
  __$$SendStatusKioskImplCopyWithImpl(
      _$SendStatusKioskImpl _value, $Res Function(_$SendStatusKioskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? deviceId = null,
  }) {
    return _then(_$SendStatusKioskImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as KioskStatusRequest,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendStatusKioskImpl implements _SendStatusKiosk {
  const _$SendStatusKioskImpl({required this.body, required this.deviceId});

  @override
  final KioskStatusRequest body;
  @override
  final String deviceId;

  @override
  String toString() {
    return 'KioskEvent.sendStatusKiosk(body: $body, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendStatusKioskImpl &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendStatusKioskImplCopyWith<_$SendStatusKioskImpl> get copyWith =>
      __$$SendStatusKioskImplCopyWithImpl<_$SendStatusKioskImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KioskRequest body) register,
    required TResult Function(String deviceId) checkKiosk,
    required TResult Function(KioskStatusRequest body, String deviceId)
        sendStatusKiosk,
    required TResult Function(MenuCheckoutRequest body) payKaspi,
    required TResult Function(int orderId) checkKapiPayStatus,
    required TResult Function(String deviceId) fetchScreenSavers,
    required TResult Function() techWork,
  }) {
    return sendStatusKiosk(body, deviceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KioskRequest body)? register,
    TResult? Function(String deviceId)? checkKiosk,
    TResult? Function(KioskStatusRequest body, String deviceId)?
        sendStatusKiosk,
    TResult? Function(MenuCheckoutRequest body)? payKaspi,
    TResult? Function(int orderId)? checkKapiPayStatus,
    TResult? Function(String deviceId)? fetchScreenSavers,
    TResult? Function()? techWork,
  }) {
    return sendStatusKiosk?.call(body, deviceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KioskRequest body)? register,
    TResult Function(String deviceId)? checkKiosk,
    TResult Function(KioskStatusRequest body, String deviceId)? sendStatusKiosk,
    TResult Function(MenuCheckoutRequest body)? payKaspi,
    TResult Function(int orderId)? checkKapiPayStatus,
    TResult Function(String deviceId)? fetchScreenSavers,
    TResult Function()? techWork,
    required TResult orElse(),
  }) {
    if (sendStatusKiosk != null) {
      return sendStatusKiosk(body, deviceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Register value) register,
    required TResult Function(_CheckKiosk value) checkKiosk,
    required TResult Function(_SendStatusKiosk value) sendStatusKiosk,
    required TResult Function(_PayKaspi value) payKaspi,
    required TResult Function(_CheckKapiPayStatus value) checkKapiPayStatus,
    required TResult Function(_FetchScreenSavers value) fetchScreenSavers,
    required TResult Function(_TechWork value) techWork,
  }) {
    return sendStatusKiosk(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckKiosk value)? checkKiosk,
    TResult? Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult? Function(_PayKaspi value)? payKaspi,
    TResult? Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult? Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult? Function(_TechWork value)? techWork,
  }) {
    return sendStatusKiosk?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Register value)? register,
    TResult Function(_CheckKiosk value)? checkKiosk,
    TResult Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult Function(_PayKaspi value)? payKaspi,
    TResult Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult Function(_TechWork value)? techWork,
    required TResult orElse(),
  }) {
    if (sendStatusKiosk != null) {
      return sendStatusKiosk(this);
    }
    return orElse();
  }
}

abstract class _SendStatusKiosk implements KioskEvent {
  const factory _SendStatusKiosk(
      {required final KioskStatusRequest body,
      required final String deviceId}) = _$SendStatusKioskImpl;

  KioskStatusRequest get body;
  String get deviceId;
  @JsonKey(ignore: true)
  _$$SendStatusKioskImplCopyWith<_$SendStatusKioskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PayKaspiImplCopyWith<$Res> {
  factory _$$PayKaspiImplCopyWith(
          _$PayKaspiImpl value, $Res Function(_$PayKaspiImpl) then) =
      __$$PayKaspiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MenuCheckoutRequest body});
}

/// @nodoc
class __$$PayKaspiImplCopyWithImpl<$Res>
    extends _$KioskEventCopyWithImpl<$Res, _$PayKaspiImpl>
    implements _$$PayKaspiImplCopyWith<$Res> {
  __$$PayKaspiImplCopyWithImpl(
      _$PayKaspiImpl _value, $Res Function(_$PayKaspiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$PayKaspiImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as MenuCheckoutRequest,
    ));
  }
}

/// @nodoc

class _$PayKaspiImpl implements _PayKaspi {
  const _$PayKaspiImpl({required this.body});

  @override
  final MenuCheckoutRequest body;

  @override
  String toString() {
    return 'KioskEvent.payKaspi(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayKaspiImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayKaspiImplCopyWith<_$PayKaspiImpl> get copyWith =>
      __$$PayKaspiImplCopyWithImpl<_$PayKaspiImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KioskRequest body) register,
    required TResult Function(String deviceId) checkKiosk,
    required TResult Function(KioskStatusRequest body, String deviceId)
        sendStatusKiosk,
    required TResult Function(MenuCheckoutRequest body) payKaspi,
    required TResult Function(int orderId) checkKapiPayStatus,
    required TResult Function(String deviceId) fetchScreenSavers,
    required TResult Function() techWork,
  }) {
    return payKaspi(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KioskRequest body)? register,
    TResult? Function(String deviceId)? checkKiosk,
    TResult? Function(KioskStatusRequest body, String deviceId)?
        sendStatusKiosk,
    TResult? Function(MenuCheckoutRequest body)? payKaspi,
    TResult? Function(int orderId)? checkKapiPayStatus,
    TResult? Function(String deviceId)? fetchScreenSavers,
    TResult? Function()? techWork,
  }) {
    return payKaspi?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KioskRequest body)? register,
    TResult Function(String deviceId)? checkKiosk,
    TResult Function(KioskStatusRequest body, String deviceId)? sendStatusKiosk,
    TResult Function(MenuCheckoutRequest body)? payKaspi,
    TResult Function(int orderId)? checkKapiPayStatus,
    TResult Function(String deviceId)? fetchScreenSavers,
    TResult Function()? techWork,
    required TResult orElse(),
  }) {
    if (payKaspi != null) {
      return payKaspi(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Register value) register,
    required TResult Function(_CheckKiosk value) checkKiosk,
    required TResult Function(_SendStatusKiosk value) sendStatusKiosk,
    required TResult Function(_PayKaspi value) payKaspi,
    required TResult Function(_CheckKapiPayStatus value) checkKapiPayStatus,
    required TResult Function(_FetchScreenSavers value) fetchScreenSavers,
    required TResult Function(_TechWork value) techWork,
  }) {
    return payKaspi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckKiosk value)? checkKiosk,
    TResult? Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult? Function(_PayKaspi value)? payKaspi,
    TResult? Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult? Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult? Function(_TechWork value)? techWork,
  }) {
    return payKaspi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Register value)? register,
    TResult Function(_CheckKiosk value)? checkKiosk,
    TResult Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult Function(_PayKaspi value)? payKaspi,
    TResult Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult Function(_TechWork value)? techWork,
    required TResult orElse(),
  }) {
    if (payKaspi != null) {
      return payKaspi(this);
    }
    return orElse();
  }
}

abstract class _PayKaspi implements KioskEvent {
  const factory _PayKaspi({required final MenuCheckoutRequest body}) =
      _$PayKaspiImpl;

  MenuCheckoutRequest get body;
  @JsonKey(ignore: true)
  _$$PayKaspiImplCopyWith<_$PayKaspiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckKapiPayStatusImplCopyWith<$Res> {
  factory _$$CheckKapiPayStatusImplCopyWith(_$CheckKapiPayStatusImpl value,
          $Res Function(_$CheckKapiPayStatusImpl) then) =
      __$$CheckKapiPayStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int orderId});
}

/// @nodoc
class __$$CheckKapiPayStatusImplCopyWithImpl<$Res>
    extends _$KioskEventCopyWithImpl<$Res, _$CheckKapiPayStatusImpl>
    implements _$$CheckKapiPayStatusImplCopyWith<$Res> {
  __$$CheckKapiPayStatusImplCopyWithImpl(_$CheckKapiPayStatusImpl _value,
      $Res Function(_$CheckKapiPayStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
  }) {
    return _then(_$CheckKapiPayStatusImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CheckKapiPayStatusImpl implements _CheckKapiPayStatus {
  const _$CheckKapiPayStatusImpl({required this.orderId});

  @override
  final int orderId;

  @override
  String toString() {
    return 'KioskEvent.checkKapiPayStatus(orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckKapiPayStatusImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckKapiPayStatusImplCopyWith<_$CheckKapiPayStatusImpl> get copyWith =>
      __$$CheckKapiPayStatusImplCopyWithImpl<_$CheckKapiPayStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KioskRequest body) register,
    required TResult Function(String deviceId) checkKiosk,
    required TResult Function(KioskStatusRequest body, String deviceId)
        sendStatusKiosk,
    required TResult Function(MenuCheckoutRequest body) payKaspi,
    required TResult Function(int orderId) checkKapiPayStatus,
    required TResult Function(String deviceId) fetchScreenSavers,
    required TResult Function() techWork,
  }) {
    return checkKapiPayStatus(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KioskRequest body)? register,
    TResult? Function(String deviceId)? checkKiosk,
    TResult? Function(KioskStatusRequest body, String deviceId)?
        sendStatusKiosk,
    TResult? Function(MenuCheckoutRequest body)? payKaspi,
    TResult? Function(int orderId)? checkKapiPayStatus,
    TResult? Function(String deviceId)? fetchScreenSavers,
    TResult? Function()? techWork,
  }) {
    return checkKapiPayStatus?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KioskRequest body)? register,
    TResult Function(String deviceId)? checkKiosk,
    TResult Function(KioskStatusRequest body, String deviceId)? sendStatusKiosk,
    TResult Function(MenuCheckoutRequest body)? payKaspi,
    TResult Function(int orderId)? checkKapiPayStatus,
    TResult Function(String deviceId)? fetchScreenSavers,
    TResult Function()? techWork,
    required TResult orElse(),
  }) {
    if (checkKapiPayStatus != null) {
      return checkKapiPayStatus(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Register value) register,
    required TResult Function(_CheckKiosk value) checkKiosk,
    required TResult Function(_SendStatusKiosk value) sendStatusKiosk,
    required TResult Function(_PayKaspi value) payKaspi,
    required TResult Function(_CheckKapiPayStatus value) checkKapiPayStatus,
    required TResult Function(_FetchScreenSavers value) fetchScreenSavers,
    required TResult Function(_TechWork value) techWork,
  }) {
    return checkKapiPayStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckKiosk value)? checkKiosk,
    TResult? Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult? Function(_PayKaspi value)? payKaspi,
    TResult? Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult? Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult? Function(_TechWork value)? techWork,
  }) {
    return checkKapiPayStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Register value)? register,
    TResult Function(_CheckKiosk value)? checkKiosk,
    TResult Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult Function(_PayKaspi value)? payKaspi,
    TResult Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult Function(_TechWork value)? techWork,
    required TResult orElse(),
  }) {
    if (checkKapiPayStatus != null) {
      return checkKapiPayStatus(this);
    }
    return orElse();
  }
}

abstract class _CheckKapiPayStatus implements KioskEvent {
  const factory _CheckKapiPayStatus({required final int orderId}) =
      _$CheckKapiPayStatusImpl;

  int get orderId;
  @JsonKey(ignore: true)
  _$$CheckKapiPayStatusImplCopyWith<_$CheckKapiPayStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchScreenSaversImplCopyWith<$Res> {
  factory _$$FetchScreenSaversImplCopyWith(_$FetchScreenSaversImpl value,
          $Res Function(_$FetchScreenSaversImpl) then) =
      __$$FetchScreenSaversImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String deviceId});
}

/// @nodoc
class __$$FetchScreenSaversImplCopyWithImpl<$Res>
    extends _$KioskEventCopyWithImpl<$Res, _$FetchScreenSaversImpl>
    implements _$$FetchScreenSaversImplCopyWith<$Res> {
  __$$FetchScreenSaversImplCopyWithImpl(_$FetchScreenSaversImpl _value,
      $Res Function(_$FetchScreenSaversImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
  }) {
    return _then(_$FetchScreenSaversImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchScreenSaversImpl implements _FetchScreenSavers {
  const _$FetchScreenSaversImpl({required this.deviceId});

  @override
  final String deviceId;

  @override
  String toString() {
    return 'KioskEvent.fetchScreenSavers(deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchScreenSaversImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchScreenSaversImplCopyWith<_$FetchScreenSaversImpl> get copyWith =>
      __$$FetchScreenSaversImplCopyWithImpl<_$FetchScreenSaversImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KioskRequest body) register,
    required TResult Function(String deviceId) checkKiosk,
    required TResult Function(KioskStatusRequest body, String deviceId)
        sendStatusKiosk,
    required TResult Function(MenuCheckoutRequest body) payKaspi,
    required TResult Function(int orderId) checkKapiPayStatus,
    required TResult Function(String deviceId) fetchScreenSavers,
    required TResult Function() techWork,
  }) {
    return fetchScreenSavers(deviceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KioskRequest body)? register,
    TResult? Function(String deviceId)? checkKiosk,
    TResult? Function(KioskStatusRequest body, String deviceId)?
        sendStatusKiosk,
    TResult? Function(MenuCheckoutRequest body)? payKaspi,
    TResult? Function(int orderId)? checkKapiPayStatus,
    TResult? Function(String deviceId)? fetchScreenSavers,
    TResult? Function()? techWork,
  }) {
    return fetchScreenSavers?.call(deviceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KioskRequest body)? register,
    TResult Function(String deviceId)? checkKiosk,
    TResult Function(KioskStatusRequest body, String deviceId)? sendStatusKiosk,
    TResult Function(MenuCheckoutRequest body)? payKaspi,
    TResult Function(int orderId)? checkKapiPayStatus,
    TResult Function(String deviceId)? fetchScreenSavers,
    TResult Function()? techWork,
    required TResult orElse(),
  }) {
    if (fetchScreenSavers != null) {
      return fetchScreenSavers(deviceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Register value) register,
    required TResult Function(_CheckKiosk value) checkKiosk,
    required TResult Function(_SendStatusKiosk value) sendStatusKiosk,
    required TResult Function(_PayKaspi value) payKaspi,
    required TResult Function(_CheckKapiPayStatus value) checkKapiPayStatus,
    required TResult Function(_FetchScreenSavers value) fetchScreenSavers,
    required TResult Function(_TechWork value) techWork,
  }) {
    return fetchScreenSavers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckKiosk value)? checkKiosk,
    TResult? Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult? Function(_PayKaspi value)? payKaspi,
    TResult? Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult? Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult? Function(_TechWork value)? techWork,
  }) {
    return fetchScreenSavers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Register value)? register,
    TResult Function(_CheckKiosk value)? checkKiosk,
    TResult Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult Function(_PayKaspi value)? payKaspi,
    TResult Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult Function(_TechWork value)? techWork,
    required TResult orElse(),
  }) {
    if (fetchScreenSavers != null) {
      return fetchScreenSavers(this);
    }
    return orElse();
  }
}

abstract class _FetchScreenSavers implements KioskEvent {
  const factory _FetchScreenSavers({required final String deviceId}) =
      _$FetchScreenSaversImpl;

  String get deviceId;
  @JsonKey(ignore: true)
  _$$FetchScreenSaversImplCopyWith<_$FetchScreenSaversImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TechWorkImplCopyWith<$Res> {
  factory _$$TechWorkImplCopyWith(
          _$TechWorkImpl value, $Res Function(_$TechWorkImpl) then) =
      __$$TechWorkImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TechWorkImplCopyWithImpl<$Res>
    extends _$KioskEventCopyWithImpl<$Res, _$TechWorkImpl>
    implements _$$TechWorkImplCopyWith<$Res> {
  __$$TechWorkImplCopyWithImpl(
      _$TechWorkImpl _value, $Res Function(_$TechWorkImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TechWorkImpl implements _TechWork {
  const _$TechWorkImpl();

  @override
  String toString() {
    return 'KioskEvent.techWork()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TechWorkImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KioskRequest body) register,
    required TResult Function(String deviceId) checkKiosk,
    required TResult Function(KioskStatusRequest body, String deviceId)
        sendStatusKiosk,
    required TResult Function(MenuCheckoutRequest body) payKaspi,
    required TResult Function(int orderId) checkKapiPayStatus,
    required TResult Function(String deviceId) fetchScreenSavers,
    required TResult Function() techWork,
  }) {
    return techWork();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KioskRequest body)? register,
    TResult? Function(String deviceId)? checkKiosk,
    TResult? Function(KioskStatusRequest body, String deviceId)?
        sendStatusKiosk,
    TResult? Function(MenuCheckoutRequest body)? payKaspi,
    TResult? Function(int orderId)? checkKapiPayStatus,
    TResult? Function(String deviceId)? fetchScreenSavers,
    TResult? Function()? techWork,
  }) {
    return techWork?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KioskRequest body)? register,
    TResult Function(String deviceId)? checkKiosk,
    TResult Function(KioskStatusRequest body, String deviceId)? sendStatusKiosk,
    TResult Function(MenuCheckoutRequest body)? payKaspi,
    TResult Function(int orderId)? checkKapiPayStatus,
    TResult Function(String deviceId)? fetchScreenSavers,
    TResult Function()? techWork,
    required TResult orElse(),
  }) {
    if (techWork != null) {
      return techWork();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Register value) register,
    required TResult Function(_CheckKiosk value) checkKiosk,
    required TResult Function(_SendStatusKiosk value) sendStatusKiosk,
    required TResult Function(_PayKaspi value) payKaspi,
    required TResult Function(_CheckKapiPayStatus value) checkKapiPayStatus,
    required TResult Function(_FetchScreenSavers value) fetchScreenSavers,
    required TResult Function(_TechWork value) techWork,
  }) {
    return techWork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckKiosk value)? checkKiosk,
    TResult? Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult? Function(_PayKaspi value)? payKaspi,
    TResult? Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult? Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult? Function(_TechWork value)? techWork,
  }) {
    return techWork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Register value)? register,
    TResult Function(_CheckKiosk value)? checkKiosk,
    TResult Function(_SendStatusKiosk value)? sendStatusKiosk,
    TResult Function(_PayKaspi value)? payKaspi,
    TResult Function(_CheckKapiPayStatus value)? checkKapiPayStatus,
    TResult Function(_FetchScreenSavers value)? fetchScreenSavers,
    TResult Function(_TechWork value)? techWork,
    required TResult orElse(),
  }) {
    if (techWork != null) {
      return techWork(this);
    }
    return orElse();
  }
}

abstract class _TechWork implements KioskEvent {
  const factory _TechWork() = _$TechWorkImpl;
}

/// @nodoc
mixin _$KioskState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingPay,
    required TResult Function() successKioskStatus,
    required TResult Function(KioskResponse response) success,
    required TResult Function(KioskResponse response) checkKioskSuccess,
    required TResult Function(PayModel response) successPayData,
    required TResult Function(KaspiStatus response) successPay,
    required TResult Function(ScreenSaversResponse response)
        successScreenSavers,
    required TResult Function(TechWorkResponse response) successTechWork,
    required TResult Function(String message, int? errorCode) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingPay,
    TResult? Function()? successKioskStatus,
    TResult? Function(KioskResponse response)? success,
    TResult? Function(KioskResponse response)? checkKioskSuccess,
    TResult? Function(PayModel response)? successPayData,
    TResult? Function(KaspiStatus response)? successPay,
    TResult? Function(ScreenSaversResponse response)? successScreenSavers,
    TResult? Function(TechWorkResponse response)? successTechWork,
    TResult? Function(String message, int? errorCode)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingPay,
    TResult Function()? successKioskStatus,
    TResult Function(KioskResponse response)? success,
    TResult Function(KioskResponse response)? checkKioskSuccess,
    TResult Function(PayModel response)? successPayData,
    TResult Function(KaspiStatus response)? successPay,
    TResult Function(ScreenSaversResponse response)? successScreenSavers,
    TResult Function(TechWorkResponse response)? successTechWork,
    TResult Function(String message, int? errorCode)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingPay value) loadingPay,
    required TResult Function(_SuccessKioskStatus value) successKioskStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_CheckKioskSuccess value) checkKioskSuccess,
    required TResult Function(_SuccessPayData value) successPayData,
    required TResult Function(_SuccessPay value) successPay,
    required TResult Function(_SuccessScreenSavers value) successScreenSavers,
    required TResult Function(_SuccessTechWork value) successTechWork,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingPay value)? loadingPay,
    TResult? Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult? Function(_SuccessPayData value)? successPayData,
    TResult? Function(_SuccessPay value)? successPay,
    TResult? Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult? Function(_SuccessTechWork value)? successTechWork,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingPay value)? loadingPay,
    TResult Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult Function(_Success value)? success,
    TResult Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult Function(_SuccessPayData value)? successPayData,
    TResult Function(_SuccessPay value)? successPay,
    TResult Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult Function(_SuccessTechWork value)? successTechWork,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KioskStateCopyWith<$Res> {
  factory $KioskStateCopyWith(
          KioskState value, $Res Function(KioskState) then) =
      _$KioskStateCopyWithImpl<$Res, KioskState>;
}

/// @nodoc
class _$KioskStateCopyWithImpl<$Res, $Val extends KioskState>
    implements $KioskStateCopyWith<$Res> {
  _$KioskStateCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$KioskStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'KioskState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingPay,
    required TResult Function() successKioskStatus,
    required TResult Function(KioskResponse response) success,
    required TResult Function(KioskResponse response) checkKioskSuccess,
    required TResult Function(PayModel response) successPayData,
    required TResult Function(KaspiStatus response) successPay,
    required TResult Function(ScreenSaversResponse response)
        successScreenSavers,
    required TResult Function(TechWorkResponse response) successTechWork,
    required TResult Function(String message, int? errorCode) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingPay,
    TResult? Function()? successKioskStatus,
    TResult? Function(KioskResponse response)? success,
    TResult? Function(KioskResponse response)? checkKioskSuccess,
    TResult? Function(PayModel response)? successPayData,
    TResult? Function(KaspiStatus response)? successPay,
    TResult? Function(ScreenSaversResponse response)? successScreenSavers,
    TResult? Function(TechWorkResponse response)? successTechWork,
    TResult? Function(String message, int? errorCode)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingPay,
    TResult Function()? successKioskStatus,
    TResult Function(KioskResponse response)? success,
    TResult Function(KioskResponse response)? checkKioskSuccess,
    TResult Function(PayModel response)? successPayData,
    TResult Function(KaspiStatus response)? successPay,
    TResult Function(ScreenSaversResponse response)? successScreenSavers,
    TResult Function(TechWorkResponse response)? successTechWork,
    TResult Function(String message, int? errorCode)? failed,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingPay value) loadingPay,
    required TResult Function(_SuccessKioskStatus value) successKioskStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_CheckKioskSuccess value) checkKioskSuccess,
    required TResult Function(_SuccessPayData value) successPayData,
    required TResult Function(_SuccessPay value) successPay,
    required TResult Function(_SuccessScreenSavers value) successScreenSavers,
    required TResult Function(_SuccessTechWork value) successTechWork,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingPay value)? loadingPay,
    TResult? Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult? Function(_SuccessPayData value)? successPayData,
    TResult? Function(_SuccessPay value)? successPay,
    TResult? Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult? Function(_SuccessTechWork value)? successTechWork,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingPay value)? loadingPay,
    TResult Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult Function(_Success value)? success,
    TResult Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult Function(_SuccessPayData value)? successPayData,
    TResult Function(_SuccessPay value)? successPay,
    TResult Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult Function(_SuccessTechWork value)? successTechWork,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements KioskState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$KioskStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'KioskState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingPay,
    required TResult Function() successKioskStatus,
    required TResult Function(KioskResponse response) success,
    required TResult Function(KioskResponse response) checkKioskSuccess,
    required TResult Function(PayModel response) successPayData,
    required TResult Function(KaspiStatus response) successPay,
    required TResult Function(ScreenSaversResponse response)
        successScreenSavers,
    required TResult Function(TechWorkResponse response) successTechWork,
    required TResult Function(String message, int? errorCode) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingPay,
    TResult? Function()? successKioskStatus,
    TResult? Function(KioskResponse response)? success,
    TResult? Function(KioskResponse response)? checkKioskSuccess,
    TResult? Function(PayModel response)? successPayData,
    TResult? Function(KaspiStatus response)? successPay,
    TResult? Function(ScreenSaversResponse response)? successScreenSavers,
    TResult? Function(TechWorkResponse response)? successTechWork,
    TResult? Function(String message, int? errorCode)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingPay,
    TResult Function()? successKioskStatus,
    TResult Function(KioskResponse response)? success,
    TResult Function(KioskResponse response)? checkKioskSuccess,
    TResult Function(PayModel response)? successPayData,
    TResult Function(KaspiStatus response)? successPay,
    TResult Function(ScreenSaversResponse response)? successScreenSavers,
    TResult Function(TechWorkResponse response)? successTechWork,
    TResult Function(String message, int? errorCode)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingPay value) loadingPay,
    required TResult Function(_SuccessKioskStatus value) successKioskStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_CheckKioskSuccess value) checkKioskSuccess,
    required TResult Function(_SuccessPayData value) successPayData,
    required TResult Function(_SuccessPay value) successPay,
    required TResult Function(_SuccessScreenSavers value) successScreenSavers,
    required TResult Function(_SuccessTechWork value) successTechWork,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingPay value)? loadingPay,
    TResult? Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult? Function(_SuccessPayData value)? successPayData,
    TResult? Function(_SuccessPay value)? successPay,
    TResult? Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult? Function(_SuccessTechWork value)? successTechWork,
    TResult? Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingPay value)? loadingPay,
    TResult Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult Function(_Success value)? success,
    TResult Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult Function(_SuccessPayData value)? successPayData,
    TResult Function(_SuccessPay value)? successPay,
    TResult Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult Function(_SuccessTechWork value)? successTechWork,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements KioskState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadingPayImplCopyWith<$Res> {
  factory _$$LoadingPayImplCopyWith(
          _$LoadingPayImpl value, $Res Function(_$LoadingPayImpl) then) =
      __$$LoadingPayImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingPayImplCopyWithImpl<$Res>
    extends _$KioskStateCopyWithImpl<$Res, _$LoadingPayImpl>
    implements _$$LoadingPayImplCopyWith<$Res> {
  __$$LoadingPayImplCopyWithImpl(
      _$LoadingPayImpl _value, $Res Function(_$LoadingPayImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingPayImpl implements _LoadingPay {
  const _$LoadingPayImpl();

  @override
  String toString() {
    return 'KioskState.loadingPay()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingPayImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingPay,
    required TResult Function() successKioskStatus,
    required TResult Function(KioskResponse response) success,
    required TResult Function(KioskResponse response) checkKioskSuccess,
    required TResult Function(PayModel response) successPayData,
    required TResult Function(KaspiStatus response) successPay,
    required TResult Function(ScreenSaversResponse response)
        successScreenSavers,
    required TResult Function(TechWorkResponse response) successTechWork,
    required TResult Function(String message, int? errorCode) failed,
  }) {
    return loadingPay();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingPay,
    TResult? Function()? successKioskStatus,
    TResult? Function(KioskResponse response)? success,
    TResult? Function(KioskResponse response)? checkKioskSuccess,
    TResult? Function(PayModel response)? successPayData,
    TResult? Function(KaspiStatus response)? successPay,
    TResult? Function(ScreenSaversResponse response)? successScreenSavers,
    TResult? Function(TechWorkResponse response)? successTechWork,
    TResult? Function(String message, int? errorCode)? failed,
  }) {
    return loadingPay?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingPay,
    TResult Function()? successKioskStatus,
    TResult Function(KioskResponse response)? success,
    TResult Function(KioskResponse response)? checkKioskSuccess,
    TResult Function(PayModel response)? successPayData,
    TResult Function(KaspiStatus response)? successPay,
    TResult Function(ScreenSaversResponse response)? successScreenSavers,
    TResult Function(TechWorkResponse response)? successTechWork,
    TResult Function(String message, int? errorCode)? failed,
    required TResult orElse(),
  }) {
    if (loadingPay != null) {
      return loadingPay();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingPay value) loadingPay,
    required TResult Function(_SuccessKioskStatus value) successKioskStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_CheckKioskSuccess value) checkKioskSuccess,
    required TResult Function(_SuccessPayData value) successPayData,
    required TResult Function(_SuccessPay value) successPay,
    required TResult Function(_SuccessScreenSavers value) successScreenSavers,
    required TResult Function(_SuccessTechWork value) successTechWork,
    required TResult Function(_Failed value) failed,
  }) {
    return loadingPay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingPay value)? loadingPay,
    TResult? Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult? Function(_SuccessPayData value)? successPayData,
    TResult? Function(_SuccessPay value)? successPay,
    TResult? Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult? Function(_SuccessTechWork value)? successTechWork,
    TResult? Function(_Failed value)? failed,
  }) {
    return loadingPay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingPay value)? loadingPay,
    TResult Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult Function(_Success value)? success,
    TResult Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult Function(_SuccessPayData value)? successPayData,
    TResult Function(_SuccessPay value)? successPay,
    TResult Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult Function(_SuccessTechWork value)? successTechWork,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loadingPay != null) {
      return loadingPay(this);
    }
    return orElse();
  }
}

abstract class _LoadingPay implements KioskState {
  const factory _LoadingPay() = _$LoadingPayImpl;
}

/// @nodoc
abstract class _$$SuccessKioskStatusImplCopyWith<$Res> {
  factory _$$SuccessKioskStatusImplCopyWith(_$SuccessKioskStatusImpl value,
          $Res Function(_$SuccessKioskStatusImpl) then) =
      __$$SuccessKioskStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessKioskStatusImplCopyWithImpl<$Res>
    extends _$KioskStateCopyWithImpl<$Res, _$SuccessKioskStatusImpl>
    implements _$$SuccessKioskStatusImplCopyWith<$Res> {
  __$$SuccessKioskStatusImplCopyWithImpl(_$SuccessKioskStatusImpl _value,
      $Res Function(_$SuccessKioskStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessKioskStatusImpl implements _SuccessKioskStatus {
  const _$SuccessKioskStatusImpl();

  @override
  String toString() {
    return 'KioskState.successKioskStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessKioskStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingPay,
    required TResult Function() successKioskStatus,
    required TResult Function(KioskResponse response) success,
    required TResult Function(KioskResponse response) checkKioskSuccess,
    required TResult Function(PayModel response) successPayData,
    required TResult Function(KaspiStatus response) successPay,
    required TResult Function(ScreenSaversResponse response)
        successScreenSavers,
    required TResult Function(TechWorkResponse response) successTechWork,
    required TResult Function(String message, int? errorCode) failed,
  }) {
    return successKioskStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingPay,
    TResult? Function()? successKioskStatus,
    TResult? Function(KioskResponse response)? success,
    TResult? Function(KioskResponse response)? checkKioskSuccess,
    TResult? Function(PayModel response)? successPayData,
    TResult? Function(KaspiStatus response)? successPay,
    TResult? Function(ScreenSaversResponse response)? successScreenSavers,
    TResult? Function(TechWorkResponse response)? successTechWork,
    TResult? Function(String message, int? errorCode)? failed,
  }) {
    return successKioskStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingPay,
    TResult Function()? successKioskStatus,
    TResult Function(KioskResponse response)? success,
    TResult Function(KioskResponse response)? checkKioskSuccess,
    TResult Function(PayModel response)? successPayData,
    TResult Function(KaspiStatus response)? successPay,
    TResult Function(ScreenSaversResponse response)? successScreenSavers,
    TResult Function(TechWorkResponse response)? successTechWork,
    TResult Function(String message, int? errorCode)? failed,
    required TResult orElse(),
  }) {
    if (successKioskStatus != null) {
      return successKioskStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingPay value) loadingPay,
    required TResult Function(_SuccessKioskStatus value) successKioskStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_CheckKioskSuccess value) checkKioskSuccess,
    required TResult Function(_SuccessPayData value) successPayData,
    required TResult Function(_SuccessPay value) successPay,
    required TResult Function(_SuccessScreenSavers value) successScreenSavers,
    required TResult Function(_SuccessTechWork value) successTechWork,
    required TResult Function(_Failed value) failed,
  }) {
    return successKioskStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingPay value)? loadingPay,
    TResult? Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult? Function(_SuccessPayData value)? successPayData,
    TResult? Function(_SuccessPay value)? successPay,
    TResult? Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult? Function(_SuccessTechWork value)? successTechWork,
    TResult? Function(_Failed value)? failed,
  }) {
    return successKioskStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingPay value)? loadingPay,
    TResult Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult Function(_Success value)? success,
    TResult Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult Function(_SuccessPayData value)? successPayData,
    TResult Function(_SuccessPay value)? successPay,
    TResult Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult Function(_SuccessTechWork value)? successTechWork,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successKioskStatus != null) {
      return successKioskStatus(this);
    }
    return orElse();
  }
}

abstract class _SuccessKioskStatus implements KioskState {
  const factory _SuccessKioskStatus() = _$SuccessKioskStatusImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({KioskResponse response});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$KioskStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$SuccessImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as KioskResponse,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.response});

  @override
  final KioskResponse response;

  @override
  String toString() {
    return 'KioskState.success(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingPay,
    required TResult Function() successKioskStatus,
    required TResult Function(KioskResponse response) success,
    required TResult Function(KioskResponse response) checkKioskSuccess,
    required TResult Function(PayModel response) successPayData,
    required TResult Function(KaspiStatus response) successPay,
    required TResult Function(ScreenSaversResponse response)
        successScreenSavers,
    required TResult Function(TechWorkResponse response) successTechWork,
    required TResult Function(String message, int? errorCode) failed,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingPay,
    TResult? Function()? successKioskStatus,
    TResult? Function(KioskResponse response)? success,
    TResult? Function(KioskResponse response)? checkKioskSuccess,
    TResult? Function(PayModel response)? successPayData,
    TResult? Function(KaspiStatus response)? successPay,
    TResult? Function(ScreenSaversResponse response)? successScreenSavers,
    TResult? Function(TechWorkResponse response)? successTechWork,
    TResult? Function(String message, int? errorCode)? failed,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingPay,
    TResult Function()? successKioskStatus,
    TResult Function(KioskResponse response)? success,
    TResult Function(KioskResponse response)? checkKioskSuccess,
    TResult Function(PayModel response)? successPayData,
    TResult Function(KaspiStatus response)? successPay,
    TResult Function(ScreenSaversResponse response)? successScreenSavers,
    TResult Function(TechWorkResponse response)? successTechWork,
    TResult Function(String message, int? errorCode)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingPay value) loadingPay,
    required TResult Function(_SuccessKioskStatus value) successKioskStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_CheckKioskSuccess value) checkKioskSuccess,
    required TResult Function(_SuccessPayData value) successPayData,
    required TResult Function(_SuccessPay value) successPay,
    required TResult Function(_SuccessScreenSavers value) successScreenSavers,
    required TResult Function(_SuccessTechWork value) successTechWork,
    required TResult Function(_Failed value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingPay value)? loadingPay,
    TResult? Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult? Function(_SuccessPayData value)? successPayData,
    TResult? Function(_SuccessPay value)? successPay,
    TResult? Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult? Function(_SuccessTechWork value)? successTechWork,
    TResult? Function(_Failed value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingPay value)? loadingPay,
    TResult Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult Function(_Success value)? success,
    TResult Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult Function(_SuccessPayData value)? successPayData,
    TResult Function(_SuccessPay value)? successPay,
    TResult Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult Function(_SuccessTechWork value)? successTechWork,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements KioskState {
  const factory _Success({required final KioskResponse response}) =
      _$SuccessImpl;

  KioskResponse get response;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckKioskSuccessImplCopyWith<$Res> {
  factory _$$CheckKioskSuccessImplCopyWith(_$CheckKioskSuccessImpl value,
          $Res Function(_$CheckKioskSuccessImpl) then) =
      __$$CheckKioskSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({KioskResponse response});
}

/// @nodoc
class __$$CheckKioskSuccessImplCopyWithImpl<$Res>
    extends _$KioskStateCopyWithImpl<$Res, _$CheckKioskSuccessImpl>
    implements _$$CheckKioskSuccessImplCopyWith<$Res> {
  __$$CheckKioskSuccessImplCopyWithImpl(_$CheckKioskSuccessImpl _value,
      $Res Function(_$CheckKioskSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$CheckKioskSuccessImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as KioskResponse,
    ));
  }
}

/// @nodoc

class _$CheckKioskSuccessImpl implements _CheckKioskSuccess {
  const _$CheckKioskSuccessImpl({required this.response});

  @override
  final KioskResponse response;

  @override
  String toString() {
    return 'KioskState.checkKioskSuccess(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckKioskSuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckKioskSuccessImplCopyWith<_$CheckKioskSuccessImpl> get copyWith =>
      __$$CheckKioskSuccessImplCopyWithImpl<_$CheckKioskSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingPay,
    required TResult Function() successKioskStatus,
    required TResult Function(KioskResponse response) success,
    required TResult Function(KioskResponse response) checkKioskSuccess,
    required TResult Function(PayModel response) successPayData,
    required TResult Function(KaspiStatus response) successPay,
    required TResult Function(ScreenSaversResponse response)
        successScreenSavers,
    required TResult Function(TechWorkResponse response) successTechWork,
    required TResult Function(String message, int? errorCode) failed,
  }) {
    return checkKioskSuccess(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingPay,
    TResult? Function()? successKioskStatus,
    TResult? Function(KioskResponse response)? success,
    TResult? Function(KioskResponse response)? checkKioskSuccess,
    TResult? Function(PayModel response)? successPayData,
    TResult? Function(KaspiStatus response)? successPay,
    TResult? Function(ScreenSaversResponse response)? successScreenSavers,
    TResult? Function(TechWorkResponse response)? successTechWork,
    TResult? Function(String message, int? errorCode)? failed,
  }) {
    return checkKioskSuccess?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingPay,
    TResult Function()? successKioskStatus,
    TResult Function(KioskResponse response)? success,
    TResult Function(KioskResponse response)? checkKioskSuccess,
    TResult Function(PayModel response)? successPayData,
    TResult Function(KaspiStatus response)? successPay,
    TResult Function(ScreenSaversResponse response)? successScreenSavers,
    TResult Function(TechWorkResponse response)? successTechWork,
    TResult Function(String message, int? errorCode)? failed,
    required TResult orElse(),
  }) {
    if (checkKioskSuccess != null) {
      return checkKioskSuccess(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingPay value) loadingPay,
    required TResult Function(_SuccessKioskStatus value) successKioskStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_CheckKioskSuccess value) checkKioskSuccess,
    required TResult Function(_SuccessPayData value) successPayData,
    required TResult Function(_SuccessPay value) successPay,
    required TResult Function(_SuccessScreenSavers value) successScreenSavers,
    required TResult Function(_SuccessTechWork value) successTechWork,
    required TResult Function(_Failed value) failed,
  }) {
    return checkKioskSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingPay value)? loadingPay,
    TResult? Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult? Function(_SuccessPayData value)? successPayData,
    TResult? Function(_SuccessPay value)? successPay,
    TResult? Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult? Function(_SuccessTechWork value)? successTechWork,
    TResult? Function(_Failed value)? failed,
  }) {
    return checkKioskSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingPay value)? loadingPay,
    TResult Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult Function(_Success value)? success,
    TResult Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult Function(_SuccessPayData value)? successPayData,
    TResult Function(_SuccessPay value)? successPay,
    TResult Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult Function(_SuccessTechWork value)? successTechWork,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (checkKioskSuccess != null) {
      return checkKioskSuccess(this);
    }
    return orElse();
  }
}

abstract class _CheckKioskSuccess implements KioskState {
  const factory _CheckKioskSuccess({required final KioskResponse response}) =
      _$CheckKioskSuccessImpl;

  KioskResponse get response;
  @JsonKey(ignore: true)
  _$$CheckKioskSuccessImplCopyWith<_$CheckKioskSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessPayDataImplCopyWith<$Res> {
  factory _$$SuccessPayDataImplCopyWith(_$SuccessPayDataImpl value,
          $Res Function(_$SuccessPayDataImpl) then) =
      __$$SuccessPayDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PayModel response});
}

/// @nodoc
class __$$SuccessPayDataImplCopyWithImpl<$Res>
    extends _$KioskStateCopyWithImpl<$Res, _$SuccessPayDataImpl>
    implements _$$SuccessPayDataImplCopyWith<$Res> {
  __$$SuccessPayDataImplCopyWithImpl(
      _$SuccessPayDataImpl _value, $Res Function(_$SuccessPayDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$SuccessPayDataImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as PayModel,
    ));
  }
}

/// @nodoc

class _$SuccessPayDataImpl implements _SuccessPayData {
  const _$SuccessPayDataImpl({required this.response});

  @override
  final PayModel response;

  @override
  String toString() {
    return 'KioskState.successPayData(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessPayDataImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessPayDataImplCopyWith<_$SuccessPayDataImpl> get copyWith =>
      __$$SuccessPayDataImplCopyWithImpl<_$SuccessPayDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingPay,
    required TResult Function() successKioskStatus,
    required TResult Function(KioskResponse response) success,
    required TResult Function(KioskResponse response) checkKioskSuccess,
    required TResult Function(PayModel response) successPayData,
    required TResult Function(KaspiStatus response) successPay,
    required TResult Function(ScreenSaversResponse response)
        successScreenSavers,
    required TResult Function(TechWorkResponse response) successTechWork,
    required TResult Function(String message, int? errorCode) failed,
  }) {
    return successPayData(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingPay,
    TResult? Function()? successKioskStatus,
    TResult? Function(KioskResponse response)? success,
    TResult? Function(KioskResponse response)? checkKioskSuccess,
    TResult? Function(PayModel response)? successPayData,
    TResult? Function(KaspiStatus response)? successPay,
    TResult? Function(ScreenSaversResponse response)? successScreenSavers,
    TResult? Function(TechWorkResponse response)? successTechWork,
    TResult? Function(String message, int? errorCode)? failed,
  }) {
    return successPayData?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingPay,
    TResult Function()? successKioskStatus,
    TResult Function(KioskResponse response)? success,
    TResult Function(KioskResponse response)? checkKioskSuccess,
    TResult Function(PayModel response)? successPayData,
    TResult Function(KaspiStatus response)? successPay,
    TResult Function(ScreenSaversResponse response)? successScreenSavers,
    TResult Function(TechWorkResponse response)? successTechWork,
    TResult Function(String message, int? errorCode)? failed,
    required TResult orElse(),
  }) {
    if (successPayData != null) {
      return successPayData(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingPay value) loadingPay,
    required TResult Function(_SuccessKioskStatus value) successKioskStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_CheckKioskSuccess value) checkKioskSuccess,
    required TResult Function(_SuccessPayData value) successPayData,
    required TResult Function(_SuccessPay value) successPay,
    required TResult Function(_SuccessScreenSavers value) successScreenSavers,
    required TResult Function(_SuccessTechWork value) successTechWork,
    required TResult Function(_Failed value) failed,
  }) {
    return successPayData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingPay value)? loadingPay,
    TResult? Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult? Function(_SuccessPayData value)? successPayData,
    TResult? Function(_SuccessPay value)? successPay,
    TResult? Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult? Function(_SuccessTechWork value)? successTechWork,
    TResult? Function(_Failed value)? failed,
  }) {
    return successPayData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingPay value)? loadingPay,
    TResult Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult Function(_Success value)? success,
    TResult Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult Function(_SuccessPayData value)? successPayData,
    TResult Function(_SuccessPay value)? successPay,
    TResult Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult Function(_SuccessTechWork value)? successTechWork,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successPayData != null) {
      return successPayData(this);
    }
    return orElse();
  }
}

abstract class _SuccessPayData implements KioskState {
  const factory _SuccessPayData({required final PayModel response}) =
      _$SuccessPayDataImpl;

  PayModel get response;
  @JsonKey(ignore: true)
  _$$SuccessPayDataImplCopyWith<_$SuccessPayDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessPayImplCopyWith<$Res> {
  factory _$$SuccessPayImplCopyWith(
          _$SuccessPayImpl value, $Res Function(_$SuccessPayImpl) then) =
      __$$SuccessPayImplCopyWithImpl<$Res>;
  @useResult
  $Res call({KaspiStatus response});
}

/// @nodoc
class __$$SuccessPayImplCopyWithImpl<$Res>
    extends _$KioskStateCopyWithImpl<$Res, _$SuccessPayImpl>
    implements _$$SuccessPayImplCopyWith<$Res> {
  __$$SuccessPayImplCopyWithImpl(
      _$SuccessPayImpl _value, $Res Function(_$SuccessPayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$SuccessPayImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as KaspiStatus,
    ));
  }
}

/// @nodoc

class _$SuccessPayImpl implements _SuccessPay {
  const _$SuccessPayImpl({required this.response});

  @override
  final KaspiStatus response;

  @override
  String toString() {
    return 'KioskState.successPay(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessPayImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessPayImplCopyWith<_$SuccessPayImpl> get copyWith =>
      __$$SuccessPayImplCopyWithImpl<_$SuccessPayImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingPay,
    required TResult Function() successKioskStatus,
    required TResult Function(KioskResponse response) success,
    required TResult Function(KioskResponse response) checkKioskSuccess,
    required TResult Function(PayModel response) successPayData,
    required TResult Function(KaspiStatus response) successPay,
    required TResult Function(ScreenSaversResponse response)
        successScreenSavers,
    required TResult Function(TechWorkResponse response) successTechWork,
    required TResult Function(String message, int? errorCode) failed,
  }) {
    return successPay(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingPay,
    TResult? Function()? successKioskStatus,
    TResult? Function(KioskResponse response)? success,
    TResult? Function(KioskResponse response)? checkKioskSuccess,
    TResult? Function(PayModel response)? successPayData,
    TResult? Function(KaspiStatus response)? successPay,
    TResult? Function(ScreenSaversResponse response)? successScreenSavers,
    TResult? Function(TechWorkResponse response)? successTechWork,
    TResult? Function(String message, int? errorCode)? failed,
  }) {
    return successPay?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingPay,
    TResult Function()? successKioskStatus,
    TResult Function(KioskResponse response)? success,
    TResult Function(KioskResponse response)? checkKioskSuccess,
    TResult Function(PayModel response)? successPayData,
    TResult Function(KaspiStatus response)? successPay,
    TResult Function(ScreenSaversResponse response)? successScreenSavers,
    TResult Function(TechWorkResponse response)? successTechWork,
    TResult Function(String message, int? errorCode)? failed,
    required TResult orElse(),
  }) {
    if (successPay != null) {
      return successPay(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingPay value) loadingPay,
    required TResult Function(_SuccessKioskStatus value) successKioskStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_CheckKioskSuccess value) checkKioskSuccess,
    required TResult Function(_SuccessPayData value) successPayData,
    required TResult Function(_SuccessPay value) successPay,
    required TResult Function(_SuccessScreenSavers value) successScreenSavers,
    required TResult Function(_SuccessTechWork value) successTechWork,
    required TResult Function(_Failed value) failed,
  }) {
    return successPay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingPay value)? loadingPay,
    TResult? Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult? Function(_SuccessPayData value)? successPayData,
    TResult? Function(_SuccessPay value)? successPay,
    TResult? Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult? Function(_SuccessTechWork value)? successTechWork,
    TResult? Function(_Failed value)? failed,
  }) {
    return successPay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingPay value)? loadingPay,
    TResult Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult Function(_Success value)? success,
    TResult Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult Function(_SuccessPayData value)? successPayData,
    TResult Function(_SuccessPay value)? successPay,
    TResult Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult Function(_SuccessTechWork value)? successTechWork,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successPay != null) {
      return successPay(this);
    }
    return orElse();
  }
}

abstract class _SuccessPay implements KioskState {
  const factory _SuccessPay({required final KaspiStatus response}) =
      _$SuccessPayImpl;

  KaspiStatus get response;
  @JsonKey(ignore: true)
  _$$SuccessPayImplCopyWith<_$SuccessPayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessScreenSaversImplCopyWith<$Res> {
  factory _$$SuccessScreenSaversImplCopyWith(_$SuccessScreenSaversImpl value,
          $Res Function(_$SuccessScreenSaversImpl) then) =
      __$$SuccessScreenSaversImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ScreenSaversResponse response});
}

/// @nodoc
class __$$SuccessScreenSaversImplCopyWithImpl<$Res>
    extends _$KioskStateCopyWithImpl<$Res, _$SuccessScreenSaversImpl>
    implements _$$SuccessScreenSaversImplCopyWith<$Res> {
  __$$SuccessScreenSaversImplCopyWithImpl(_$SuccessScreenSaversImpl _value,
      $Res Function(_$SuccessScreenSaversImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$SuccessScreenSaversImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ScreenSaversResponse,
    ));
  }
}

/// @nodoc

class _$SuccessScreenSaversImpl implements _SuccessScreenSavers {
  const _$SuccessScreenSaversImpl({required this.response});

  @override
  final ScreenSaversResponse response;

  @override
  String toString() {
    return 'KioskState.successScreenSavers(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessScreenSaversImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessScreenSaversImplCopyWith<_$SuccessScreenSaversImpl> get copyWith =>
      __$$SuccessScreenSaversImplCopyWithImpl<_$SuccessScreenSaversImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingPay,
    required TResult Function() successKioskStatus,
    required TResult Function(KioskResponse response) success,
    required TResult Function(KioskResponse response) checkKioskSuccess,
    required TResult Function(PayModel response) successPayData,
    required TResult Function(KaspiStatus response) successPay,
    required TResult Function(ScreenSaversResponse response)
        successScreenSavers,
    required TResult Function(TechWorkResponse response) successTechWork,
    required TResult Function(String message, int? errorCode) failed,
  }) {
    return successScreenSavers(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingPay,
    TResult? Function()? successKioskStatus,
    TResult? Function(KioskResponse response)? success,
    TResult? Function(KioskResponse response)? checkKioskSuccess,
    TResult? Function(PayModel response)? successPayData,
    TResult? Function(KaspiStatus response)? successPay,
    TResult? Function(ScreenSaversResponse response)? successScreenSavers,
    TResult? Function(TechWorkResponse response)? successTechWork,
    TResult? Function(String message, int? errorCode)? failed,
  }) {
    return successScreenSavers?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingPay,
    TResult Function()? successKioskStatus,
    TResult Function(KioskResponse response)? success,
    TResult Function(KioskResponse response)? checkKioskSuccess,
    TResult Function(PayModel response)? successPayData,
    TResult Function(KaspiStatus response)? successPay,
    TResult Function(ScreenSaversResponse response)? successScreenSavers,
    TResult Function(TechWorkResponse response)? successTechWork,
    TResult Function(String message, int? errorCode)? failed,
    required TResult orElse(),
  }) {
    if (successScreenSavers != null) {
      return successScreenSavers(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingPay value) loadingPay,
    required TResult Function(_SuccessKioskStatus value) successKioskStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_CheckKioskSuccess value) checkKioskSuccess,
    required TResult Function(_SuccessPayData value) successPayData,
    required TResult Function(_SuccessPay value) successPay,
    required TResult Function(_SuccessScreenSavers value) successScreenSavers,
    required TResult Function(_SuccessTechWork value) successTechWork,
    required TResult Function(_Failed value) failed,
  }) {
    return successScreenSavers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingPay value)? loadingPay,
    TResult? Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult? Function(_SuccessPayData value)? successPayData,
    TResult? Function(_SuccessPay value)? successPay,
    TResult? Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult? Function(_SuccessTechWork value)? successTechWork,
    TResult? Function(_Failed value)? failed,
  }) {
    return successScreenSavers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingPay value)? loadingPay,
    TResult Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult Function(_Success value)? success,
    TResult Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult Function(_SuccessPayData value)? successPayData,
    TResult Function(_SuccessPay value)? successPay,
    TResult Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult Function(_SuccessTechWork value)? successTechWork,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successScreenSavers != null) {
      return successScreenSavers(this);
    }
    return orElse();
  }
}

abstract class _SuccessScreenSavers implements KioskState {
  const factory _SuccessScreenSavers(
          {required final ScreenSaversResponse response}) =
      _$SuccessScreenSaversImpl;

  ScreenSaversResponse get response;
  @JsonKey(ignore: true)
  _$$SuccessScreenSaversImplCopyWith<_$SuccessScreenSaversImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessTechWorkImplCopyWith<$Res> {
  factory _$$SuccessTechWorkImplCopyWith(_$SuccessTechWorkImpl value,
          $Res Function(_$SuccessTechWorkImpl) then) =
      __$$SuccessTechWorkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TechWorkResponse response});
}

/// @nodoc
class __$$SuccessTechWorkImplCopyWithImpl<$Res>
    extends _$KioskStateCopyWithImpl<$Res, _$SuccessTechWorkImpl>
    implements _$$SuccessTechWorkImplCopyWith<$Res> {
  __$$SuccessTechWorkImplCopyWithImpl(
      _$SuccessTechWorkImpl _value, $Res Function(_$SuccessTechWorkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$SuccessTechWorkImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as TechWorkResponse,
    ));
  }
}

/// @nodoc

class _$SuccessTechWorkImpl implements _SuccessTechWork {
  const _$SuccessTechWorkImpl({required this.response});

  @override
  final TechWorkResponse response;

  @override
  String toString() {
    return 'KioskState.successTechWork(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessTechWorkImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessTechWorkImplCopyWith<_$SuccessTechWorkImpl> get copyWith =>
      __$$SuccessTechWorkImplCopyWithImpl<_$SuccessTechWorkImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingPay,
    required TResult Function() successKioskStatus,
    required TResult Function(KioskResponse response) success,
    required TResult Function(KioskResponse response) checkKioskSuccess,
    required TResult Function(PayModel response) successPayData,
    required TResult Function(KaspiStatus response) successPay,
    required TResult Function(ScreenSaversResponse response)
        successScreenSavers,
    required TResult Function(TechWorkResponse response) successTechWork,
    required TResult Function(String message, int? errorCode) failed,
  }) {
    return successTechWork(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingPay,
    TResult? Function()? successKioskStatus,
    TResult? Function(KioskResponse response)? success,
    TResult? Function(KioskResponse response)? checkKioskSuccess,
    TResult? Function(PayModel response)? successPayData,
    TResult? Function(KaspiStatus response)? successPay,
    TResult? Function(ScreenSaversResponse response)? successScreenSavers,
    TResult? Function(TechWorkResponse response)? successTechWork,
    TResult? Function(String message, int? errorCode)? failed,
  }) {
    return successTechWork?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingPay,
    TResult Function()? successKioskStatus,
    TResult Function(KioskResponse response)? success,
    TResult Function(KioskResponse response)? checkKioskSuccess,
    TResult Function(PayModel response)? successPayData,
    TResult Function(KaspiStatus response)? successPay,
    TResult Function(ScreenSaversResponse response)? successScreenSavers,
    TResult Function(TechWorkResponse response)? successTechWork,
    TResult Function(String message, int? errorCode)? failed,
    required TResult orElse(),
  }) {
    if (successTechWork != null) {
      return successTechWork(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingPay value) loadingPay,
    required TResult Function(_SuccessKioskStatus value) successKioskStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_CheckKioskSuccess value) checkKioskSuccess,
    required TResult Function(_SuccessPayData value) successPayData,
    required TResult Function(_SuccessPay value) successPay,
    required TResult Function(_SuccessScreenSavers value) successScreenSavers,
    required TResult Function(_SuccessTechWork value) successTechWork,
    required TResult Function(_Failed value) failed,
  }) {
    return successTechWork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingPay value)? loadingPay,
    TResult? Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult? Function(_SuccessPayData value)? successPayData,
    TResult? Function(_SuccessPay value)? successPay,
    TResult? Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult? Function(_SuccessTechWork value)? successTechWork,
    TResult? Function(_Failed value)? failed,
  }) {
    return successTechWork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingPay value)? loadingPay,
    TResult Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult Function(_Success value)? success,
    TResult Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult Function(_SuccessPayData value)? successPayData,
    TResult Function(_SuccessPay value)? successPay,
    TResult Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult Function(_SuccessTechWork value)? successTechWork,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successTechWork != null) {
      return successTechWork(this);
    }
    return orElse();
  }
}

abstract class _SuccessTechWork implements KioskState {
  const factory _SuccessTechWork({required final TechWorkResponse response}) =
      _$SuccessTechWorkImpl;

  TechWorkResponse get response;
  @JsonKey(ignore: true)
  _$$SuccessTechWorkImplCopyWith<_$SuccessTechWorkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, int? errorCode});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$KioskStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? errorCode = freezed,
  }) {
    return _then(_$FailedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl({this.message = 'Произошла ошибка', this.errorCode});

  @override
  @JsonKey()
  final String message;
  @override
  final int? errorCode;

  @override
  String toString() {
    return 'KioskState.failed(message: $message, errorCode: $errorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, errorCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingPay,
    required TResult Function() successKioskStatus,
    required TResult Function(KioskResponse response) success,
    required TResult Function(KioskResponse response) checkKioskSuccess,
    required TResult Function(PayModel response) successPayData,
    required TResult Function(KaspiStatus response) successPay,
    required TResult Function(ScreenSaversResponse response)
        successScreenSavers,
    required TResult Function(TechWorkResponse response) successTechWork,
    required TResult Function(String message, int? errorCode) failed,
  }) {
    return failed(message, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loadingPay,
    TResult? Function()? successKioskStatus,
    TResult? Function(KioskResponse response)? success,
    TResult? Function(KioskResponse response)? checkKioskSuccess,
    TResult? Function(PayModel response)? successPayData,
    TResult? Function(KaspiStatus response)? successPay,
    TResult? Function(ScreenSaversResponse response)? successScreenSavers,
    TResult? Function(TechWorkResponse response)? successTechWork,
    TResult? Function(String message, int? errorCode)? failed,
  }) {
    return failed?.call(message, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingPay,
    TResult Function()? successKioskStatus,
    TResult Function(KioskResponse response)? success,
    TResult Function(KioskResponse response)? checkKioskSuccess,
    TResult Function(PayModel response)? successPayData,
    TResult Function(KaspiStatus response)? successPay,
    TResult Function(ScreenSaversResponse response)? successScreenSavers,
    TResult Function(TechWorkResponse response)? successTechWork,
    TResult Function(String message, int? errorCode)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message, errorCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingPay value) loadingPay,
    required TResult Function(_SuccessKioskStatus value) successKioskStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_CheckKioskSuccess value) checkKioskSuccess,
    required TResult Function(_SuccessPayData value) successPayData,
    required TResult Function(_SuccessPay value) successPay,
    required TResult Function(_SuccessScreenSavers value) successScreenSavers,
    required TResult Function(_SuccessTechWork value) successTechWork,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingPay value)? loadingPay,
    TResult? Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult? Function(_SuccessPayData value)? successPayData,
    TResult? Function(_SuccessPay value)? successPay,
    TResult? Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult? Function(_SuccessTechWork value)? successTechWork,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingPay value)? loadingPay,
    TResult Function(_SuccessKioskStatus value)? successKioskStatus,
    TResult Function(_Success value)? success,
    TResult Function(_CheckKioskSuccess value)? checkKioskSuccess,
    TResult Function(_SuccessPayData value)? successPayData,
    TResult Function(_SuccessPay value)? successPay,
    TResult Function(_SuccessScreenSavers value)? successScreenSavers,
    TResult Function(_SuccessTechWork value)? successTechWork,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements KioskState {
  const factory _Failed({final String message, final int? errorCode}) =
      _$FailedImpl;

  String get message;
  int? get errorCode;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
