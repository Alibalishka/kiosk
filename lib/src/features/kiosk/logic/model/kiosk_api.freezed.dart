// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kiosk_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KioskApi {
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
abstract class $KioskApiCopyWith<$Res> {
  factory $KioskApiCopyWith(KioskApi value, $Res Function(KioskApi) then) =
      _$KioskApiCopyWithImpl<$Res, KioskApi>;
}

/// @nodoc
class _$KioskApiCopyWithImpl<$Res, $Val extends KioskApi>
    implements $KioskApiCopyWith<$Res> {
  _$KioskApiCopyWithImpl(this._value, this._then);

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
    extends _$KioskApiCopyWithImpl<$Res, _$RegisterImpl>
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

class _$RegisterImpl extends _Register {
  const _$RegisterImpl({required this.body}) : super._();

  @override
  final KioskRequest body;

  @override
  String toString() {
    return 'KioskApi.register(body: $body)';
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

abstract class _Register extends KioskApi {
  const factory _Register({required final KioskRequest body}) = _$RegisterImpl;
  const _Register._() : super._();

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
    extends _$KioskApiCopyWithImpl<$Res, _$CheckKioskImpl>
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

class _$CheckKioskImpl extends _CheckKiosk {
  const _$CheckKioskImpl({required this.deviceId}) : super._();

  @override
  final String deviceId;

  @override
  String toString() {
    return 'KioskApi.checkKiosk(deviceId: $deviceId)';
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

abstract class _CheckKiosk extends KioskApi {
  const factory _CheckKiosk({required final String deviceId}) =
      _$CheckKioskImpl;
  const _CheckKiosk._() : super._();

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
    extends _$KioskApiCopyWithImpl<$Res, _$SendStatusKioskImpl>
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

class _$SendStatusKioskImpl extends _SendStatusKiosk {
  const _$SendStatusKioskImpl({required this.body, required this.deviceId})
      : super._();

  @override
  final KioskStatusRequest body;
  @override
  final String deviceId;

  @override
  String toString() {
    return 'KioskApi.sendStatusKiosk(body: $body, deviceId: $deviceId)';
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

abstract class _SendStatusKiosk extends KioskApi {
  const factory _SendStatusKiosk(
      {required final KioskStatusRequest body,
      required final String deviceId}) = _$SendStatusKioskImpl;
  const _SendStatusKiosk._() : super._();

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
    extends _$KioskApiCopyWithImpl<$Res, _$PayKaspiImpl>
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

class _$PayKaspiImpl extends _PayKaspi {
  const _$PayKaspiImpl({required this.body}) : super._();

  @override
  final MenuCheckoutRequest body;

  @override
  String toString() {
    return 'KioskApi.payKaspi(body: $body)';
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

abstract class _PayKaspi extends KioskApi {
  const factory _PayKaspi({required final MenuCheckoutRequest body}) =
      _$PayKaspiImpl;
  const _PayKaspi._() : super._();

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
    extends _$KioskApiCopyWithImpl<$Res, _$CheckKapiPayStatusImpl>
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

class _$CheckKapiPayStatusImpl extends _CheckKapiPayStatus {
  const _$CheckKapiPayStatusImpl({required this.orderId}) : super._();

  @override
  final int orderId;

  @override
  String toString() {
    return 'KioskApi.checkKapiPayStatus(orderId: $orderId)';
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

abstract class _CheckKapiPayStatus extends KioskApi {
  const factory _CheckKapiPayStatus({required final int orderId}) =
      _$CheckKapiPayStatusImpl;
  const _CheckKapiPayStatus._() : super._();

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
    extends _$KioskApiCopyWithImpl<$Res, _$FetchScreenSaversImpl>
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

class _$FetchScreenSaversImpl extends _FetchScreenSavers {
  const _$FetchScreenSaversImpl({required this.deviceId}) : super._();

  @override
  final String deviceId;

  @override
  String toString() {
    return 'KioskApi.fetchScreenSavers(deviceId: $deviceId)';
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

abstract class _FetchScreenSavers extends KioskApi {
  const factory _FetchScreenSavers({required final String deviceId}) =
      _$FetchScreenSaversImpl;
  const _FetchScreenSavers._() : super._();

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
    extends _$KioskApiCopyWithImpl<$Res, _$TechWorkImpl>
    implements _$$TechWorkImplCopyWith<$Res> {
  __$$TechWorkImplCopyWithImpl(
      _$TechWorkImpl _value, $Res Function(_$TechWorkImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TechWorkImpl extends _TechWork {
  const _$TechWorkImpl() : super._();

  @override
  String toString() {
    return 'KioskApi.techWork()';
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

abstract class _TechWork extends KioskApi {
  const factory _TechWork() = _$TechWorkImpl;
  const _TechWork._() : super._();
}
