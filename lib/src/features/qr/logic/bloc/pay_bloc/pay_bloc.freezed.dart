// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pay_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PayEvent {
  Object get body => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayEventCopyWith<$Res> {
  factory $PayEventCopyWith(PayEvent value, $Res Function(PayEvent) then) =
      _$PayEventCopyWithImpl<$Res, PayEvent>;
}

/// @nodoc
class _$PayEventCopyWithImpl<$Res, $Val extends PayEvent>
    implements $PayEventCopyWith<$Res> {
  _$PayEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PayByCartImplCopyWith<$Res> {
  factory _$$PayByCartImplCopyWith(
          _$PayByCartImpl value, $Res Function(_$PayByCartImpl) then) =
      __$$PayByCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PayRequest body});
}

/// @nodoc
class __$$PayByCartImplCopyWithImpl<$Res>
    extends _$PayEventCopyWithImpl<$Res, _$PayByCartImpl>
    implements _$$PayByCartImplCopyWith<$Res> {
  __$$PayByCartImplCopyWithImpl(
      _$PayByCartImpl _value, $Res Function(_$PayByCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$PayByCartImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as PayRequest,
    ));
  }
}

/// @nodoc

class _$PayByCartImpl implements _PayByCart {
  const _$PayByCartImpl({required this.body});

  @override
  final PayRequest body;

  @override
  String toString() {
    return 'PayEvent.payByCart(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayByCartImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayByCartImplCopyWith<_$PayByCartImpl> get copyWith =>
      __$$PayByCartImplCopyWithImpl<_$PayByCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
  }) {
    return payByCart(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
  }) {
    return payByCart?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    required TResult orElse(),
  }) {
    if (payByCart != null) {
      return payByCart(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
  }) {
    return payByCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
  }) {
    return payByCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    required TResult orElse(),
  }) {
    if (payByCart != null) {
      return payByCart(this);
    }
    return orElse();
  }
}

abstract class _PayByCart implements PayEvent {
  const factory _PayByCart({required final PayRequest body}) = _$PayByCartImpl;

  @override
  PayRequest get body;
  @JsonKey(ignore: true)
  _$$PayByCartImplCopyWith<_$PayByCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PayBonusImplCopyWith<$Res> {
  factory _$$PayBonusImplCopyWith(
          _$PayBonusImpl value, $Res Function(_$PayBonusImpl) then) =
      __$$PayBonusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BonusRequest body});
}

/// @nodoc
class __$$PayBonusImplCopyWithImpl<$Res>
    extends _$PayEventCopyWithImpl<$Res, _$PayBonusImpl>
    implements _$$PayBonusImplCopyWith<$Res> {
  __$$PayBonusImplCopyWithImpl(
      _$PayBonusImpl _value, $Res Function(_$PayBonusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$PayBonusImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as BonusRequest,
    ));
  }
}

/// @nodoc

class _$PayBonusImpl implements _PayBonus {
  const _$PayBonusImpl({required this.body});

  @override
  final BonusRequest body;

  @override
  String toString() {
    return 'PayEvent.payBonus(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayBonusImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayBonusImplCopyWith<_$PayBonusImpl> get copyWith =>
      __$$PayBonusImplCopyWithImpl<_$PayBonusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
  }) {
    return payBonus(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
  }) {
    return payBonus?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    required TResult orElse(),
  }) {
    if (payBonus != null) {
      return payBonus(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
  }) {
    return payBonus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
  }) {
    return payBonus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    required TResult orElse(),
  }) {
    if (payBonus != null) {
      return payBonus(this);
    }
    return orElse();
  }
}

abstract class _PayBonus implements PayEvent {
  const factory _PayBonus({required final BonusRequest body}) = _$PayBonusImpl;

  @override
  BonusRequest get body;
  @JsonKey(ignore: true)
  _$$PayBonusImplCopyWith<_$PayBonusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PayMenuImplCopyWith<$Res> {
  factory _$$PayMenuImplCopyWith(
          _$PayMenuImpl value, $Res Function(_$PayMenuImpl) then) =
      __$$PayMenuImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MenuCheckoutRequest body});
}

/// @nodoc
class __$$PayMenuImplCopyWithImpl<$Res>
    extends _$PayEventCopyWithImpl<$Res, _$PayMenuImpl>
    implements _$$PayMenuImplCopyWith<$Res> {
  __$$PayMenuImplCopyWithImpl(
      _$PayMenuImpl _value, $Res Function(_$PayMenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$PayMenuImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as MenuCheckoutRequest,
    ));
  }
}

/// @nodoc

class _$PayMenuImpl implements _PayMenu {
  const _$PayMenuImpl({required this.body});

  @override
  final MenuCheckoutRequest body;

  @override
  String toString() {
    return 'PayEvent.payMenu(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayMenuImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayMenuImplCopyWith<_$PayMenuImpl> get copyWith =>
      __$$PayMenuImplCopyWithImpl<_$PayMenuImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
  }) {
    return payMenu(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
  }) {
    return payMenu?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    required TResult orElse(),
  }) {
    if (payMenu != null) {
      return payMenu(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
  }) {
    return payMenu(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
  }) {
    return payMenu?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    required TResult orElse(),
  }) {
    if (payMenu != null) {
      return payMenu(this);
    }
    return orElse();
  }
}

abstract class _PayMenu implements PayEvent {
  const factory _PayMenu({required final MenuCheckoutRequest body}) =
      _$PayMenuImpl;

  @override
  MenuCheckoutRequest get body;
  @JsonKey(ignore: true)
  _$$PayMenuImplCopyWith<_$PayMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PayState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PayModel payModel) success,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PayModel payModel)? success,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PayModel payModel)? success,
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
abstract class $PayStateCopyWith<$Res> {
  factory $PayStateCopyWith(PayState value, $Res Function(PayState) then) =
      _$PayStateCopyWithImpl<$Res, PayState>;
}

/// @nodoc
class _$PayStateCopyWithImpl<$Res, $Val extends PayState>
    implements $PayStateCopyWith<$Res> {
  _$PayStateCopyWithImpl(this._value, this._then);

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
    extends _$PayStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'PayState.initial()';
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
    required TResult Function(PayModel payModel) success,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PayModel payModel)? success,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PayModel payModel)? success,
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

abstract class _Initial implements PayState {
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
    extends _$PayStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'PayState.loading()';
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
    required TResult Function(PayModel payModel) success,
    required TResult Function(String message) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PayModel payModel)? success,
    TResult? Function(String message)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PayModel payModel)? success,
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

abstract class _Loading implements PayState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PayModel payModel});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PayStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payModel = null,
  }) {
    return _then(_$SuccessImpl(
      payModel: null == payModel
          ? _value.payModel
          : payModel // ignore: cast_nullable_to_non_nullable
              as PayModel,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.payModel});

  @override
  final PayModel payModel;

  @override
  String toString() {
    return 'PayState.success(payModel: $payModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.payModel, payModel) ||
                other.payModel == payModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payModel);

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
    required TResult Function(PayModel payModel) success,
    required TResult Function(String message) failed,
  }) {
    return success(payModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PayModel payModel)? success,
    TResult? Function(String message)? failed,
  }) {
    return success?.call(payModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PayModel payModel)? success,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(payModel);
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

abstract class _Success implements PayState {
  const factory _Success({required final PayModel payModel}) = _$SuccessImpl;

  PayModel get payModel;
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
    extends _$PayStateCopyWithImpl<$Res, _$FailedImpl>
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
    return 'PayState.failed(message: $message)';
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
    required TResult Function(PayModel payModel) success,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PayModel payModel)? success,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PayModel payModel)? success,
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

abstract class _Failed implements PayState {
  const factory _Failed({final String message}) = _$FailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
