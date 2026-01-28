// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chekout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChekoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CheckoutRequests body) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CheckoutRequests body)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CheckoutRequests body)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChekoutEventCopyWith<$Res> {
  factory $ChekoutEventCopyWith(
          ChekoutEvent value, $Res Function(ChekoutEvent) then) =
      _$ChekoutEventCopyWithImpl<$Res, ChekoutEvent>;
}

/// @nodoc
class _$ChekoutEventCopyWithImpl<$Res, $Val extends ChekoutEvent>
    implements $ChekoutEventCopyWith<$Res> {
  _$ChekoutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchChekoutImplCopyWith<$Res> {
  factory _$$FetchChekoutImplCopyWith(
          _$FetchChekoutImpl value, $Res Function(_$FetchChekoutImpl) then) =
      __$$FetchChekoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CheckoutRequests body});
}

/// @nodoc
class __$$FetchChekoutImplCopyWithImpl<$Res>
    extends _$ChekoutEventCopyWithImpl<$Res, _$FetchChekoutImpl>
    implements _$$FetchChekoutImplCopyWith<$Res> {
  __$$FetchChekoutImplCopyWithImpl(
      _$FetchChekoutImpl _value, $Res Function(_$FetchChekoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$FetchChekoutImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as CheckoutRequests,
    ));
  }
}

/// @nodoc

class _$FetchChekoutImpl implements _FetchChekout {
  const _$FetchChekoutImpl({required this.body});

  @override
  final CheckoutRequests body;

  @override
  String toString() {
    return 'ChekoutEvent.fetchChekout(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchChekoutImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchChekoutImplCopyWith<_$FetchChekoutImpl> get copyWith =>
      __$$FetchChekoutImplCopyWithImpl<_$FetchChekoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CheckoutRequests body) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
  }) {
    return fetchChekout(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CheckoutRequests body)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
  }) {
    return fetchChekout?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CheckoutRequests body)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    required TResult orElse(),
  }) {
    if (fetchChekout != null) {
      return fetchChekout(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
  }) {
    return fetchChekout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
  }) {
    return fetchChekout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    required TResult orElse(),
  }) {
    if (fetchChekout != null) {
      return fetchChekout(this);
    }
    return orElse();
  }
}

abstract class _FetchChekout implements ChekoutEvent {
  const factory _FetchChekout({required final CheckoutRequests body}) =
      _$FetchChekoutImpl;

  CheckoutRequests get body;
  @JsonKey(ignore: true)
  _$$FetchChekoutImplCopyWith<_$FetchChekoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchChekoutSubscriptionImplCopyWith<$Res> {
  factory _$$FetchChekoutSubscriptionImplCopyWith(
          _$FetchChekoutSubscriptionImpl value,
          $Res Function(_$FetchChekoutSubscriptionImpl) then) =
      __$$FetchChekoutSubscriptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$FetchChekoutSubscriptionImplCopyWithImpl<$Res>
    extends _$ChekoutEventCopyWithImpl<$Res, _$FetchChekoutSubscriptionImpl>
    implements _$$FetchChekoutSubscriptionImplCopyWith<$Res> {
  __$$FetchChekoutSubscriptionImplCopyWithImpl(
      _$FetchChekoutSubscriptionImpl _value,
      $Res Function(_$FetchChekoutSubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchChekoutSubscriptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchChekoutSubscriptionImpl implements _FetchChekoutSubscription {
  const _$FetchChekoutSubscriptionImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'ChekoutEvent.fetchChekoutSubscription(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchChekoutSubscriptionImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchChekoutSubscriptionImplCopyWith<_$FetchChekoutSubscriptionImpl>
      get copyWith => __$$FetchChekoutSubscriptionImplCopyWithImpl<
          _$FetchChekoutSubscriptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CheckoutRequests body) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
  }) {
    return fetchChekoutSubscription(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CheckoutRequests body)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
  }) {
    return fetchChekoutSubscription?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CheckoutRequests body)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    required TResult orElse(),
  }) {
    if (fetchChekoutSubscription != null) {
      return fetchChekoutSubscription(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
  }) {
    return fetchChekoutSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
  }) {
    return fetchChekoutSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    required TResult orElse(),
  }) {
    if (fetchChekoutSubscription != null) {
      return fetchChekoutSubscription(this);
    }
    return orElse();
  }
}

abstract class _FetchChekoutSubscription implements ChekoutEvent {
  const factory _FetchChekoutSubscription({required final String id}) =
      _$FetchChekoutSubscriptionImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$FetchChekoutSubscriptionImplCopyWith<_$FetchChekoutSubscriptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchChekoutMenuImplCopyWith<$Res> {
  factory _$$FetchChekoutMenuImplCopyWith(_$FetchChekoutMenuImpl value,
          $Res Function(_$FetchChekoutMenuImpl) then) =
      __$$FetchChekoutMenuImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MenuCheckoutRequest body});
}

/// @nodoc
class __$$FetchChekoutMenuImplCopyWithImpl<$Res>
    extends _$ChekoutEventCopyWithImpl<$Res, _$FetchChekoutMenuImpl>
    implements _$$FetchChekoutMenuImplCopyWith<$Res> {
  __$$FetchChekoutMenuImplCopyWithImpl(_$FetchChekoutMenuImpl _value,
      $Res Function(_$FetchChekoutMenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$FetchChekoutMenuImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as MenuCheckoutRequest,
    ));
  }
}

/// @nodoc

class _$FetchChekoutMenuImpl implements _FetchChekoutMenu {
  const _$FetchChekoutMenuImpl({required this.body});

  @override
  final MenuCheckoutRequest body;

  @override
  String toString() {
    return 'ChekoutEvent.fetchChekoutMenu(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchChekoutMenuImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchChekoutMenuImplCopyWith<_$FetchChekoutMenuImpl> get copyWith =>
      __$$FetchChekoutMenuImplCopyWithImpl<_$FetchChekoutMenuImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CheckoutRequests body) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
  }) {
    return fetchChekoutMenu(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CheckoutRequests body)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
  }) {
    return fetchChekoutMenu?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CheckoutRequests body)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    required TResult orElse(),
  }) {
    if (fetchChekoutMenu != null) {
      return fetchChekoutMenu(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
  }) {
    return fetchChekoutMenu(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
  }) {
    return fetchChekoutMenu?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    required TResult orElse(),
  }) {
    if (fetchChekoutMenu != null) {
      return fetchChekoutMenu(this);
    }
    return orElse();
  }
}

abstract class _FetchChekoutMenu implements ChekoutEvent {
  const factory _FetchChekoutMenu({required final MenuCheckoutRequest body}) =
      _$FetchChekoutMenuImpl;

  MenuCheckoutRequest get body;
  @JsonKey(ignore: true)
  _$$FetchChekoutMenuImplCopyWith<_$FetchChekoutMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChekoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ChekoutModel chekoutModel) success,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChekoutModel chekoutModel)? success,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChekoutModel chekoutModel)? success,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChekoutStateCopyWith<$Res> {
  factory $ChekoutStateCopyWith(
          ChekoutState value, $Res Function(ChekoutState) then) =
      _$ChekoutStateCopyWithImpl<$Res, ChekoutState>;
}

/// @nodoc
class _$ChekoutStateCopyWithImpl<$Res, $Val extends ChekoutState>
    implements $ChekoutStateCopyWith<$Res> {
  _$ChekoutStateCopyWithImpl(this._value, this._then);

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
    extends _$ChekoutStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ChekoutState.initial()';
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
    required TResult Function(ChekoutModel chekoutModel) success,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChekoutModel chekoutModel)? success,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChekoutModel chekoutModel)? success,
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
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ChekoutState {
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
    extends _$ChekoutStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'ChekoutState.loading()';
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
    required TResult Function(ChekoutModel chekoutModel) success,
    required TResult Function(String message) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChekoutModel chekoutModel)? success,
    TResult? Function(String message)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChekoutModel chekoutModel)? success,
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
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ChekoutState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChekoutModel chekoutModel});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ChekoutStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chekoutModel = null,
  }) {
    return _then(_$SuccessImpl(
      chekoutModel: null == chekoutModel
          ? _value.chekoutModel
          : chekoutModel // ignore: cast_nullable_to_non_nullable
              as ChekoutModel,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.chekoutModel});

  @override
  final ChekoutModel chekoutModel;

  @override
  String toString() {
    return 'ChekoutState.success(chekoutModel: $chekoutModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.chekoutModel, chekoutModel) ||
                other.chekoutModel == chekoutModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chekoutModel);

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
    required TResult Function(ChekoutModel chekoutModel) success,
    required TResult Function(String message) failed,
  }) {
    return success(chekoutModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChekoutModel chekoutModel)? success,
    TResult? Function(String message)? failed,
  }) {
    return success?.call(chekoutModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChekoutModel chekoutModel)? success,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(chekoutModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
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
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ChekoutState {
  const factory _Success({required final ChekoutModel chekoutModel}) =
      _$SuccessImpl;

  ChekoutModel get chekoutModel;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$ChekoutStateCopyWithImpl<$Res, _$FailedImpl>
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
    return 'ChekoutState.failed(message: $message)';
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
    required TResult Function(ChekoutModel chekoutModel) success,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChekoutModel chekoutModel)? success,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChekoutModel chekoutModel)? success,
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
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements ChekoutState {
  const factory _Failed({final String message}) = _$FailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
