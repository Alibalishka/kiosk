// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubscriptionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function(int id) cancelSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function(int id)? cancelSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function(int id)? cancelSubscription,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_CancelSubscription value) cancelSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionEventCopyWith<$Res> {
  factory $SubscriptionEventCopyWith(
          SubscriptionEvent value, $Res Function(SubscriptionEvent) then) =
      _$SubscriptionEventCopyWithImpl<$Res, SubscriptionEvent>;
}

/// @nodoc
class _$SubscriptionEventCopyWithImpl<$Res, $Val extends SubscriptionEvent>
    implements $SubscriptionEventCopyWith<$Res> {
  _$SubscriptionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchSubscriptionImplCopyWith<$Res> {
  factory _$$FetchSubscriptionImplCopyWith(_$FetchSubscriptionImpl value,
          $Res Function(_$FetchSubscriptionImpl) then) =
      __$$FetchSubscriptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchSubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res, _$FetchSubscriptionImpl>
    implements _$$FetchSubscriptionImplCopyWith<$Res> {
  __$$FetchSubscriptionImplCopyWithImpl(_$FetchSubscriptionImpl _value,
      $Res Function(_$FetchSubscriptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchSubscriptionImpl implements _FetchSubscription {
  const _$FetchSubscriptionImpl();

  @override
  String toString() {
    return 'SubscriptionEvent.fetchSubscription()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchSubscriptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function(int id) cancelSubscription,
  }) {
    return fetchSubscription();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function(int id)? cancelSubscription,
  }) {
    return fetchSubscription?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function(int id)? cancelSubscription,
    required TResult orElse(),
  }) {
    if (fetchSubscription != null) {
      return fetchSubscription();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_CancelSubscription value) cancelSubscription,
  }) {
    return fetchSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
  }) {
    return fetchSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    required TResult orElse(),
  }) {
    if (fetchSubscription != null) {
      return fetchSubscription(this);
    }
    return orElse();
  }
}

abstract class _FetchSubscription implements SubscriptionEvent {
  const factory _FetchSubscription() = _$FetchSubscriptionImpl;
}

/// @nodoc
abstract class _$$PaySubscriptionImplCopyWith<$Res> {
  factory _$$PaySubscriptionImplCopyWith(_$PaySubscriptionImpl value,
          $Res Function(_$PaySubscriptionImpl) then) =
      __$$PaySubscriptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SubscriptionPayRequest payRequest, int id});
}

/// @nodoc
class __$$PaySubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res, _$PaySubscriptionImpl>
    implements _$$PaySubscriptionImplCopyWith<$Res> {
  __$$PaySubscriptionImplCopyWithImpl(
      _$PaySubscriptionImpl _value, $Res Function(_$PaySubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payRequest = null,
    Object? id = null,
  }) {
    return _then(_$PaySubscriptionImpl(
      payRequest: null == payRequest
          ? _value.payRequest
          : payRequest // ignore: cast_nullable_to_non_nullable
              as SubscriptionPayRequest,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PaySubscriptionImpl implements _PaySubscription {
  const _$PaySubscriptionImpl({required this.payRequest, required this.id});

  @override
  final SubscriptionPayRequest payRequest;
  @override
  final int id;

  @override
  String toString() {
    return 'SubscriptionEvent.paySubscription(payRequest: $payRequest, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaySubscriptionImpl &&
            (identical(other.payRequest, payRequest) ||
                other.payRequest == payRequest) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payRequest, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaySubscriptionImplCopyWith<_$PaySubscriptionImpl> get copyWith =>
      __$$PaySubscriptionImplCopyWithImpl<_$PaySubscriptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function(int id) cancelSubscription,
  }) {
    return paySubscription(payRequest, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function(int id)? cancelSubscription,
  }) {
    return paySubscription?.call(payRequest, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function(int id)? cancelSubscription,
    required TResult orElse(),
  }) {
    if (paySubscription != null) {
      return paySubscription(payRequest, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_CancelSubscription value) cancelSubscription,
  }) {
    return paySubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
  }) {
    return paySubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    required TResult orElse(),
  }) {
    if (paySubscription != null) {
      return paySubscription(this);
    }
    return orElse();
  }
}

abstract class _PaySubscription implements SubscriptionEvent {
  const factory _PaySubscription(
      {required final SubscriptionPayRequest payRequest,
      required final int id}) = _$PaySubscriptionImpl;

  SubscriptionPayRequest get payRequest;
  int get id;
  @JsonKey(ignore: true)
  _$$PaySubscriptionImplCopyWith<_$PaySubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelSubscriptionImplCopyWith<$Res> {
  factory _$$CancelSubscriptionImplCopyWith(_$CancelSubscriptionImpl value,
          $Res Function(_$CancelSubscriptionImpl) then) =
      __$$CancelSubscriptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$CancelSubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res, _$CancelSubscriptionImpl>
    implements _$$CancelSubscriptionImplCopyWith<$Res> {
  __$$CancelSubscriptionImplCopyWithImpl(_$CancelSubscriptionImpl _value,
      $Res Function(_$CancelSubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$CancelSubscriptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CancelSubscriptionImpl implements _CancelSubscription {
  const _$CancelSubscriptionImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'SubscriptionEvent.cancelSubscription(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelSubscriptionImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelSubscriptionImplCopyWith<_$CancelSubscriptionImpl> get copyWith =>
      __$$CancelSubscriptionImplCopyWithImpl<_$CancelSubscriptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function(int id) cancelSubscription,
  }) {
    return cancelSubscription(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function(int id)? cancelSubscription,
  }) {
    return cancelSubscription?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function(int id)? cancelSubscription,
    required TResult orElse(),
  }) {
    if (cancelSubscription != null) {
      return cancelSubscription(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_CancelSubscription value) cancelSubscription,
  }) {
    return cancelSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
  }) {
    return cancelSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    required TResult orElse(),
  }) {
    if (cancelSubscription != null) {
      return cancelSubscription(this);
    }
    return orElse();
  }
}

abstract class _CancelSubscription implements SubscriptionEvent {
  const factory _CancelSubscription({required final int id}) =
      _$CancelSubscriptionImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$CancelSubscriptionImplCopyWith<_$CancelSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SubscriptionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SubscriptionModel subscription) success,
    required TResult Function(SubsPayModel subsPayModel) paySuccess,
    required TResult Function() cancelSuccess,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SubscriptionModel subscription)? success,
    TResult? Function(SubsPayModel subsPayModel)? paySuccess,
    TResult? Function()? cancelSuccess,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SubscriptionModel subscription)? success,
    TResult Function(SubsPayModel subsPayModel)? paySuccess,
    TResult Function()? cancelSuccess,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_PaySuccess value) paySuccess,
    required TResult Function(_CancelSuccess value) cancelSuccess,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_PaySuccess value)? paySuccess,
    TResult? Function(_CancelSuccess value)? cancelSuccess,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_PaySuccess value)? paySuccess,
    TResult Function(_CancelSuccess value)? cancelSuccess,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionStateCopyWith<$Res> {
  factory $SubscriptionStateCopyWith(
          SubscriptionState value, $Res Function(SubscriptionState) then) =
      _$SubscriptionStateCopyWithImpl<$Res, SubscriptionState>;
}

/// @nodoc
class _$SubscriptionStateCopyWithImpl<$Res, $Val extends SubscriptionState>
    implements $SubscriptionStateCopyWith<$Res> {
  _$SubscriptionStateCopyWithImpl(this._value, this._then);

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
    extends _$SubscriptionStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'SubscriptionState.initial()';
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
    required TResult Function(SubscriptionModel subscription) success,
    required TResult Function(SubsPayModel subsPayModel) paySuccess,
    required TResult Function() cancelSuccess,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SubscriptionModel subscription)? success,
    TResult? Function(SubsPayModel subsPayModel)? paySuccess,
    TResult? Function()? cancelSuccess,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SubscriptionModel subscription)? success,
    TResult Function(SubsPayModel subsPayModel)? paySuccess,
    TResult Function()? cancelSuccess,
    TResult Function(String message)? failed,
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
    required TResult Function(_Success value) success,
    required TResult Function(_PaySuccess value) paySuccess,
    required TResult Function(_CancelSuccess value) cancelSuccess,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_PaySuccess value)? paySuccess,
    TResult? Function(_CancelSuccess value)? cancelSuccess,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_PaySuccess value)? paySuccess,
    TResult Function(_CancelSuccess value)? cancelSuccess,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SubscriptionState {
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
    extends _$SubscriptionStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'SubscriptionState.loading()';
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
    required TResult Function(SubscriptionModel subscription) success,
    required TResult Function(SubsPayModel subsPayModel) paySuccess,
    required TResult Function() cancelSuccess,
    required TResult Function(String message) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SubscriptionModel subscription)? success,
    TResult? Function(SubsPayModel subsPayModel)? paySuccess,
    TResult? Function()? cancelSuccess,
    TResult? Function(String message)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SubscriptionModel subscription)? success,
    TResult Function(SubsPayModel subsPayModel)? paySuccess,
    TResult Function()? cancelSuccess,
    TResult Function(String message)? failed,
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
    required TResult Function(_Success value) success,
    required TResult Function(_PaySuccess value) paySuccess,
    required TResult Function(_CancelSuccess value) cancelSuccess,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_PaySuccess value)? paySuccess,
    TResult? Function(_CancelSuccess value)? cancelSuccess,
    TResult? Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_PaySuccess value)? paySuccess,
    TResult Function(_CancelSuccess value)? cancelSuccess,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SubscriptionState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SubscriptionModel subscription});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription = null,
  }) {
    return _then(_$SuccessImpl(
      subscription: null == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionModel,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.subscription});

  @override
  final SubscriptionModel subscription;

  @override
  String toString() {
    return 'SubscriptionState.success(subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subscription);

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
    required TResult Function(SubscriptionModel subscription) success,
    required TResult Function(SubsPayModel subsPayModel) paySuccess,
    required TResult Function() cancelSuccess,
    required TResult Function(String message) failed,
  }) {
    return success(subscription);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SubscriptionModel subscription)? success,
    TResult? Function(SubsPayModel subsPayModel)? paySuccess,
    TResult? Function()? cancelSuccess,
    TResult? Function(String message)? failed,
  }) {
    return success?.call(subscription);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SubscriptionModel subscription)? success,
    TResult Function(SubsPayModel subsPayModel)? paySuccess,
    TResult Function()? cancelSuccess,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(subscription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_PaySuccess value) paySuccess,
    required TResult Function(_CancelSuccess value) cancelSuccess,
    required TResult Function(_Failed value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_PaySuccess value)? paySuccess,
    TResult? Function(_CancelSuccess value)? cancelSuccess,
    TResult? Function(_Failed value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_PaySuccess value)? paySuccess,
    TResult Function(_CancelSuccess value)? cancelSuccess,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements SubscriptionState {
  const factory _Success({required final SubscriptionModel subscription}) =
      _$SuccessImpl;

  SubscriptionModel get subscription;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaySuccessImplCopyWith<$Res> {
  factory _$$PaySuccessImplCopyWith(
          _$PaySuccessImpl value, $Res Function(_$PaySuccessImpl) then) =
      __$$PaySuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SubsPayModel subsPayModel});
}

/// @nodoc
class __$$PaySuccessImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$PaySuccessImpl>
    implements _$$PaySuccessImplCopyWith<$Res> {
  __$$PaySuccessImplCopyWithImpl(
      _$PaySuccessImpl _value, $Res Function(_$PaySuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subsPayModel = null,
  }) {
    return _then(_$PaySuccessImpl(
      subsPayModel: null == subsPayModel
          ? _value.subsPayModel
          : subsPayModel // ignore: cast_nullable_to_non_nullable
              as SubsPayModel,
    ));
  }
}

/// @nodoc

class _$PaySuccessImpl implements _PaySuccess {
  const _$PaySuccessImpl({required this.subsPayModel});

  @override
  final SubsPayModel subsPayModel;

  @override
  String toString() {
    return 'SubscriptionState.paySuccess(subsPayModel: $subsPayModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaySuccessImpl &&
            (identical(other.subsPayModel, subsPayModel) ||
                other.subsPayModel == subsPayModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subsPayModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaySuccessImplCopyWith<_$PaySuccessImpl> get copyWith =>
      __$$PaySuccessImplCopyWithImpl<_$PaySuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SubscriptionModel subscription) success,
    required TResult Function(SubsPayModel subsPayModel) paySuccess,
    required TResult Function() cancelSuccess,
    required TResult Function(String message) failed,
  }) {
    return paySuccess(subsPayModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SubscriptionModel subscription)? success,
    TResult? Function(SubsPayModel subsPayModel)? paySuccess,
    TResult? Function()? cancelSuccess,
    TResult? Function(String message)? failed,
  }) {
    return paySuccess?.call(subsPayModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SubscriptionModel subscription)? success,
    TResult Function(SubsPayModel subsPayModel)? paySuccess,
    TResult Function()? cancelSuccess,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (paySuccess != null) {
      return paySuccess(subsPayModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_PaySuccess value) paySuccess,
    required TResult Function(_CancelSuccess value) cancelSuccess,
    required TResult Function(_Failed value) failed,
  }) {
    return paySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_PaySuccess value)? paySuccess,
    TResult? Function(_CancelSuccess value)? cancelSuccess,
    TResult? Function(_Failed value)? failed,
  }) {
    return paySuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_PaySuccess value)? paySuccess,
    TResult Function(_CancelSuccess value)? cancelSuccess,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (paySuccess != null) {
      return paySuccess(this);
    }
    return orElse();
  }
}

abstract class _PaySuccess implements SubscriptionState {
  const factory _PaySuccess({required final SubsPayModel subsPayModel}) =
      _$PaySuccessImpl;

  SubsPayModel get subsPayModel;
  @JsonKey(ignore: true)
  _$$PaySuccessImplCopyWith<_$PaySuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelSuccessImplCopyWith<$Res> {
  factory _$$CancelSuccessImplCopyWith(
          _$CancelSuccessImpl value, $Res Function(_$CancelSuccessImpl) then) =
      __$$CancelSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelSuccessImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$CancelSuccessImpl>
    implements _$$CancelSuccessImplCopyWith<$Res> {
  __$$CancelSuccessImplCopyWithImpl(
      _$CancelSuccessImpl _value, $Res Function(_$CancelSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CancelSuccessImpl implements _CancelSuccess {
  const _$CancelSuccessImpl();

  @override
  String toString() {
    return 'SubscriptionState.cancelSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SubscriptionModel subscription) success,
    required TResult Function(SubsPayModel subsPayModel) paySuccess,
    required TResult Function() cancelSuccess,
    required TResult Function(String message) failed,
  }) {
    return cancelSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SubscriptionModel subscription)? success,
    TResult? Function(SubsPayModel subsPayModel)? paySuccess,
    TResult? Function()? cancelSuccess,
    TResult? Function(String message)? failed,
  }) {
    return cancelSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SubscriptionModel subscription)? success,
    TResult Function(SubsPayModel subsPayModel)? paySuccess,
    TResult Function()? cancelSuccess,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (cancelSuccess != null) {
      return cancelSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_PaySuccess value) paySuccess,
    required TResult Function(_CancelSuccess value) cancelSuccess,
    required TResult Function(_Failed value) failed,
  }) {
    return cancelSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_PaySuccess value)? paySuccess,
    TResult? Function(_CancelSuccess value)? cancelSuccess,
    TResult? Function(_Failed value)? failed,
  }) {
    return cancelSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_PaySuccess value)? paySuccess,
    TResult Function(_CancelSuccess value)? cancelSuccess,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (cancelSuccess != null) {
      return cancelSuccess(this);
    }
    return orElse();
  }
}

abstract class _CancelSuccess implements SubscriptionState {
  const factory _CancelSuccess() = _$CancelSuccessImpl;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl({this.message = 'Произошла ошибка'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'SubscriptionState.failed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

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
    required TResult Function(SubscriptionModel subscription) success,
    required TResult Function(SubsPayModel subsPayModel) paySuccess,
    required TResult Function() cancelSuccess,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SubscriptionModel subscription)? success,
    TResult? Function(SubsPayModel subsPayModel)? paySuccess,
    TResult? Function()? cancelSuccess,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SubscriptionModel subscription)? success,
    TResult Function(SubsPayModel subsPayModel)? paySuccess,
    TResult Function()? cancelSuccess,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_PaySuccess value) paySuccess,
    required TResult Function(_CancelSuccess value) cancelSuccess,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_PaySuccess value)? paySuccess,
    TResult? Function(_CancelSuccess value)? cancelSuccess,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_PaySuccess value)? paySuccess,
    TResult Function(_CancelSuccess value)? cancelSuccess,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements SubscriptionState {
  const factory _Failed({final String message}) = _$FailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
