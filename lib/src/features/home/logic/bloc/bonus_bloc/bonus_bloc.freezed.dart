// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bonus_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BonusEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchSubscriptionItems,
    required TResult Function(BonusRequest body) orderSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? fetchSubscriptionItems,
    TResult? Function(BonusRequest body)? orderSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchSubscriptionItems,
    TResult Function(BonusRequest body)? orderSubscription,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSubscriptionItems value)
        fetchSubscriptionItems,
    required TResult Function(_OrderSubscription value) orderSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult? Function(_OrderSubscription value)? orderSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult Function(_OrderSubscription value)? orderSubscription,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BonusEventCopyWith<$Res> {
  factory $BonusEventCopyWith(
          BonusEvent value, $Res Function(BonusEvent) then) =
      _$BonusEventCopyWithImpl<$Res, BonusEvent>;
}

/// @nodoc
class _$BonusEventCopyWithImpl<$Res, $Val extends BonusEvent>
    implements $BonusEventCopyWith<$Res> {
  _$BonusEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchSubscriptionItemsImplCopyWith<$Res> {
  factory _$$FetchSubscriptionItemsImplCopyWith(
          _$FetchSubscriptionItemsImpl value,
          $Res Function(_$FetchSubscriptionItemsImpl) then) =
      __$$FetchSubscriptionItemsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$FetchSubscriptionItemsImplCopyWithImpl<$Res>
    extends _$BonusEventCopyWithImpl<$Res, _$FetchSubscriptionItemsImpl>
    implements _$$FetchSubscriptionItemsImplCopyWith<$Res> {
  __$$FetchSubscriptionItemsImplCopyWithImpl(
      _$FetchSubscriptionItemsImpl _value,
      $Res Function(_$FetchSubscriptionItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchSubscriptionItemsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchSubscriptionItemsImpl implements _FetchSubscriptionItems {
  const _$FetchSubscriptionItemsImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'BonusEvent.fetchSubscriptionItems(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchSubscriptionItemsImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchSubscriptionItemsImplCopyWith<_$FetchSubscriptionItemsImpl>
      get copyWith => __$$FetchSubscriptionItemsImplCopyWithImpl<
          _$FetchSubscriptionItemsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchSubscriptionItems,
    required TResult Function(BonusRequest body) orderSubscription,
  }) {
    return fetchSubscriptionItems(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? fetchSubscriptionItems,
    TResult? Function(BonusRequest body)? orderSubscription,
  }) {
    return fetchSubscriptionItems?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchSubscriptionItems,
    TResult Function(BonusRequest body)? orderSubscription,
    required TResult orElse(),
  }) {
    if (fetchSubscriptionItems != null) {
      return fetchSubscriptionItems(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSubscriptionItems value)
        fetchSubscriptionItems,
    required TResult Function(_OrderSubscription value) orderSubscription,
  }) {
    return fetchSubscriptionItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult? Function(_OrderSubscription value)? orderSubscription,
  }) {
    return fetchSubscriptionItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult Function(_OrderSubscription value)? orderSubscription,
    required TResult orElse(),
  }) {
    if (fetchSubscriptionItems != null) {
      return fetchSubscriptionItems(this);
    }
    return orElse();
  }
}

abstract class _FetchSubscriptionItems implements BonusEvent {
  const factory _FetchSubscriptionItems({required final int id}) =
      _$FetchSubscriptionItemsImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$FetchSubscriptionItemsImplCopyWith<_$FetchSubscriptionItemsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderSubscriptionImplCopyWith<$Res> {
  factory _$$OrderSubscriptionImplCopyWith(_$OrderSubscriptionImpl value,
          $Res Function(_$OrderSubscriptionImpl) then) =
      __$$OrderSubscriptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BonusRequest body});
}

/// @nodoc
class __$$OrderSubscriptionImplCopyWithImpl<$Res>
    extends _$BonusEventCopyWithImpl<$Res, _$OrderSubscriptionImpl>
    implements _$$OrderSubscriptionImplCopyWith<$Res> {
  __$$OrderSubscriptionImplCopyWithImpl(_$OrderSubscriptionImpl _value,
      $Res Function(_$OrderSubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$OrderSubscriptionImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as BonusRequest,
    ));
  }
}

/// @nodoc

class _$OrderSubscriptionImpl implements _OrderSubscription {
  const _$OrderSubscriptionImpl({required this.body});

  @override
  final BonusRequest body;

  @override
  String toString() {
    return 'BonusEvent.orderSubscription(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSubscriptionImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSubscriptionImplCopyWith<_$OrderSubscriptionImpl> get copyWith =>
      __$$OrderSubscriptionImplCopyWithImpl<_$OrderSubscriptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchSubscriptionItems,
    required TResult Function(BonusRequest body) orderSubscription,
  }) {
    return orderSubscription(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? fetchSubscriptionItems,
    TResult? Function(BonusRequest body)? orderSubscription,
  }) {
    return orderSubscription?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchSubscriptionItems,
    TResult Function(BonusRequest body)? orderSubscription,
    required TResult orElse(),
  }) {
    if (orderSubscription != null) {
      return orderSubscription(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSubscriptionItems value)
        fetchSubscriptionItems,
    required TResult Function(_OrderSubscription value) orderSubscription,
  }) {
    return orderSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult? Function(_OrderSubscription value)? orderSubscription,
  }) {
    return orderSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult Function(_OrderSubscription value)? orderSubscription,
    required TResult orElse(),
  }) {
    if (orderSubscription != null) {
      return orderSubscription(this);
    }
    return orElse();
  }
}

abstract class _OrderSubscription implements BonusEvent {
  const factory _OrderSubscription({required final BonusRequest body}) =
      _$OrderSubscriptionImpl;

  BonusRequest get body;
  @JsonKey(ignore: true)
  _$$OrderSubscriptionImplCopyWith<_$OrderSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BonusState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ItemsModel items) success,
    required TResult Function(ChekoutModel model) successOrder,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ItemsModel items)? success,
    TResult? Function(ChekoutModel model)? successOrder,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ItemsModel items)? success,
    TResult Function(ChekoutModel model)? successOrder,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessOrder value) successOrder,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessOrder value)? successOrder,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessOrder value)? successOrder,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BonusStateCopyWith<$Res> {
  factory $BonusStateCopyWith(
          BonusState value, $Res Function(BonusState) then) =
      _$BonusStateCopyWithImpl<$Res, BonusState>;
}

/// @nodoc
class _$BonusStateCopyWithImpl<$Res, $Val extends BonusState>
    implements $BonusStateCopyWith<$Res> {
  _$BonusStateCopyWithImpl(this._value, this._then);

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
    extends _$BonusStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'BonusState.initial()';
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
    required TResult Function(ItemsModel items) success,
    required TResult Function(ChekoutModel model) successOrder,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ItemsModel items)? success,
    TResult? Function(ChekoutModel model)? successOrder,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ItemsModel items)? success,
    TResult Function(ChekoutModel model)? successOrder,
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
    required TResult Function(_SuccessOrder value) successOrder,
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
    TResult? Function(_SuccessOrder value)? successOrder,
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
    TResult Function(_SuccessOrder value)? successOrder,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BonusState {
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
    extends _$BonusStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'BonusState.loading()';
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
    required TResult Function(ItemsModel items) success,
    required TResult Function(ChekoutModel model) successOrder,
    required TResult Function(String message) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ItemsModel items)? success,
    TResult? Function(ChekoutModel model)? successOrder,
    TResult? Function(String message)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ItemsModel items)? success,
    TResult Function(ChekoutModel model)? successOrder,
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
    required TResult Function(_SuccessOrder value) successOrder,
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
    TResult? Function(_SuccessOrder value)? successOrder,
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
    TResult Function(_SuccessOrder value)? successOrder,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements BonusState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ItemsModel items});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$BonusStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$SuccessImpl(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as ItemsModel,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.items});

  @override
  final ItemsModel items;

  @override
  String toString() {
    return 'BonusState.success(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.items, items) || other.items == items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, items);

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
    required TResult Function(ItemsModel items) success,
    required TResult Function(ChekoutModel model) successOrder,
    required TResult Function(String message) failed,
  }) {
    return success(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ItemsModel items)? success,
    TResult? Function(ChekoutModel model)? successOrder,
    TResult? Function(String message)? failed,
  }) {
    return success?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ItemsModel items)? success,
    TResult Function(ChekoutModel model)? successOrder,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessOrder value) successOrder,
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
    TResult? Function(_SuccessOrder value)? successOrder,
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
    TResult Function(_SuccessOrder value)? successOrder,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements BonusState {
  const factory _Success({required final ItemsModel items}) = _$SuccessImpl;

  ItemsModel get items;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessOrderImplCopyWith<$Res> {
  factory _$$SuccessOrderImplCopyWith(
          _$SuccessOrderImpl value, $Res Function(_$SuccessOrderImpl) then) =
      __$$SuccessOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChekoutModel model});
}

/// @nodoc
class __$$SuccessOrderImplCopyWithImpl<$Res>
    extends _$BonusStateCopyWithImpl<$Res, _$SuccessOrderImpl>
    implements _$$SuccessOrderImplCopyWith<$Res> {
  __$$SuccessOrderImplCopyWithImpl(
      _$SuccessOrderImpl _value, $Res Function(_$SuccessOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$SuccessOrderImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ChekoutModel,
    ));
  }
}

/// @nodoc

class _$SuccessOrderImpl implements _SuccessOrder {
  const _$SuccessOrderImpl({required this.model});

  @override
  final ChekoutModel model;

  @override
  String toString() {
    return 'BonusState.successOrder(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessOrderImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessOrderImplCopyWith<_$SuccessOrderImpl> get copyWith =>
      __$$SuccessOrderImplCopyWithImpl<_$SuccessOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ItemsModel items) success,
    required TResult Function(ChekoutModel model) successOrder,
    required TResult Function(String message) failed,
  }) {
    return successOrder(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ItemsModel items)? success,
    TResult? Function(ChekoutModel model)? successOrder,
    TResult? Function(String message)? failed,
  }) {
    return successOrder?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ItemsModel items)? success,
    TResult Function(ChekoutModel model)? successOrder,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successOrder != null) {
      return successOrder(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessOrder value) successOrder,
    required TResult Function(_Failed value) failed,
  }) {
    return successOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessOrder value)? successOrder,
    TResult? Function(_Failed value)? failed,
  }) {
    return successOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessOrder value)? successOrder,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successOrder != null) {
      return successOrder(this);
    }
    return orElse();
  }
}

abstract class _SuccessOrder implements BonusState {
  const factory _SuccessOrder({required final ChekoutModel model}) =
      _$SuccessOrderImpl;

  ChekoutModel get model;
  @JsonKey(ignore: true)
  _$$SuccessOrderImplCopyWith<_$SuccessOrderImpl> get copyWith =>
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
    extends _$BonusStateCopyWithImpl<$Res, _$FailedImpl>
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
    return 'BonusState.failed(message: $message)';
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
    required TResult Function(ItemsModel items) success,
    required TResult Function(ChekoutModel model) successOrder,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ItemsModel items)? success,
    TResult? Function(ChekoutModel model)? successOrder,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ItemsModel items)? success,
    TResult Function(ChekoutModel model)? successOrder,
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
    required TResult Function(_SuccessOrder value) successOrder,
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
    TResult? Function(_SuccessOrder value)? successOrder,
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
    TResult Function(_SuccessOrder value)? successOrder,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements BonusState {
  const factory _Failed({final String message}) = _$FailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
