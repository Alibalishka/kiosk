// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryOrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryOrderEventCopyWith<$Res> {
  factory $HistoryOrderEventCopyWith(
          HistoryOrderEvent value, $Res Function(HistoryOrderEvent) then) =
      _$HistoryOrderEventCopyWithImpl<$Res, HistoryOrderEvent>;
}

/// @nodoc
class _$HistoryOrderEventCopyWithImpl<$Res, $Val extends HistoryOrderEvent>
    implements $HistoryOrderEventCopyWith<$Res> {
  _$HistoryOrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchHistoryOrderImplCopyWith<$Res> {
  factory _$$FetchHistoryOrderImplCopyWith(_$FetchHistoryOrderImpl value,
          $Res Function(_$FetchHistoryOrderImpl) then) =
      __$$FetchHistoryOrderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchHistoryOrderImplCopyWithImpl<$Res>
    extends _$HistoryOrderEventCopyWithImpl<$Res, _$FetchHistoryOrderImpl>
    implements _$$FetchHistoryOrderImplCopyWith<$Res> {
  __$$FetchHistoryOrderImplCopyWithImpl(_$FetchHistoryOrderImpl _value,
      $Res Function(_$FetchHistoryOrderImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchHistoryOrderImpl implements _FetchHistoryOrder {
  const _$FetchHistoryOrderImpl();

  @override
  String toString() {
    return 'HistoryOrderEvent.fetchHistoryOrder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchHistoryOrderImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
  }) {
    return fetchHistoryOrder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
  }) {
    return fetchHistoryOrder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    required TResult orElse(),
  }) {
    if (fetchHistoryOrder != null) {
      return fetchHistoryOrder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
  }) {
    return fetchHistoryOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
  }) {
    return fetchHistoryOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    required TResult orElse(),
  }) {
    if (fetchHistoryOrder != null) {
      return fetchHistoryOrder(this);
    }
    return orElse();
  }
}

abstract class _FetchHistoryOrder implements HistoryOrderEvent {
  const factory _FetchHistoryOrder() = _$FetchHistoryOrderImpl;
}

/// @nodoc
abstract class _$$FetchHistoryDetailOrderImplCopyWith<$Res> {
  factory _$$FetchHistoryDetailOrderImplCopyWith(
          _$FetchHistoryDetailOrderImpl value,
          $Res Function(_$FetchHistoryDetailOrderImpl) then) =
      __$$FetchHistoryDetailOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$FetchHistoryDetailOrderImplCopyWithImpl<$Res>
    extends _$HistoryOrderEventCopyWithImpl<$Res, _$FetchHistoryDetailOrderImpl>
    implements _$$FetchHistoryDetailOrderImplCopyWith<$Res> {
  __$$FetchHistoryDetailOrderImplCopyWithImpl(
      _$FetchHistoryDetailOrderImpl _value,
      $Res Function(_$FetchHistoryDetailOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchHistoryDetailOrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchHistoryDetailOrderImpl implements _FetchHistoryDetailOrder {
  const _$FetchHistoryDetailOrderImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'HistoryOrderEvent.fetchHistoryDetailOrder(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchHistoryDetailOrderImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchHistoryDetailOrderImplCopyWith<_$FetchHistoryDetailOrderImpl>
      get copyWith => __$$FetchHistoryDetailOrderImplCopyWithImpl<
          _$FetchHistoryDetailOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
  }) {
    return fetchHistoryDetailOrder(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
  }) {
    return fetchHistoryDetailOrder?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    required TResult orElse(),
  }) {
    if (fetchHistoryDetailOrder != null) {
      return fetchHistoryDetailOrder(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
  }) {
    return fetchHistoryDetailOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
  }) {
    return fetchHistoryDetailOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    required TResult orElse(),
  }) {
    if (fetchHistoryDetailOrder != null) {
      return fetchHistoryDetailOrder(this);
    }
    return orElse();
  }
}

abstract class _FetchHistoryDetailOrder implements HistoryOrderEvent {
  const factory _FetchHistoryDetailOrder({required final int id}) =
      _$FetchHistoryDetailOrderImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$FetchHistoryDetailOrderImplCopyWith<_$FetchHistoryDetailOrderImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HistoryOrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Map<String, List<HistoryOrderDatum>> data)
        success,
    required TResult Function(OrderDetailEntity data) successDetail,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, List<HistoryOrderDatum>> data)? success,
    TResult? Function(OrderDetailEntity data)? successDetail,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, List<HistoryOrderDatum>> data)? success,
    TResult Function(OrderDetailEntity data)? successDetail,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessDetail value) successDetail,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessDetail value)? successDetail,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessDetail value)? successDetail,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryOrderStateCopyWith<$Res> {
  factory $HistoryOrderStateCopyWith(
          HistoryOrderState value, $Res Function(HistoryOrderState) then) =
      _$HistoryOrderStateCopyWithImpl<$Res, HistoryOrderState>;
}

/// @nodoc
class _$HistoryOrderStateCopyWithImpl<$Res, $Val extends HistoryOrderState>
    implements $HistoryOrderStateCopyWith<$Res> {
  _$HistoryOrderStateCopyWithImpl(this._value, this._then);

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
    extends _$HistoryOrderStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'HistoryOrderState.initial()';
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
    required TResult Function(Map<String, List<HistoryOrderDatum>> data)
        success,
    required TResult Function(OrderDetailEntity data) successDetail,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, List<HistoryOrderDatum>> data)? success,
    TResult? Function(OrderDetailEntity data)? successDetail,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, List<HistoryOrderDatum>> data)? success,
    TResult Function(OrderDetailEntity data)? successDetail,
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
    required TResult Function(_SuccessDetail value) successDetail,
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
    TResult? Function(_SuccessDetail value)? successDetail,
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
    TResult Function(_SuccessDetail value)? successDetail,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HistoryOrderState {
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
    extends _$HistoryOrderStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'HistoryOrderState.loading()';
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
    required TResult Function(Map<String, List<HistoryOrderDatum>> data)
        success,
    required TResult Function(OrderDetailEntity data) successDetail,
    required TResult Function(String message) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, List<HistoryOrderDatum>> data)? success,
    TResult? Function(OrderDetailEntity data)? successDetail,
    TResult? Function(String message)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, List<HistoryOrderDatum>> data)? success,
    TResult Function(OrderDetailEntity data)? successDetail,
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
    required TResult Function(_SuccessDetail value) successDetail,
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
    TResult? Function(_SuccessDetail value)? successDetail,
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
    TResult Function(_SuccessDetail value)? successDetail,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HistoryOrderState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, List<HistoryOrderDatum>> data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$HistoryOrderStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, List<HistoryOrderDatum>>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
      {required final Map<String, List<HistoryOrderDatum>> data})
      : _data = data;

  final Map<String, List<HistoryOrderDatum>> _data;
  @override
  Map<String, List<HistoryOrderDatum>> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'HistoryOrderState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

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
    required TResult Function(Map<String, List<HistoryOrderDatum>> data)
        success,
    required TResult Function(OrderDetailEntity data) successDetail,
    required TResult Function(String message) failed,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, List<HistoryOrderDatum>> data)? success,
    TResult? Function(OrderDetailEntity data)? successDetail,
    TResult? Function(String message)? failed,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, List<HistoryOrderDatum>> data)? success,
    TResult Function(OrderDetailEntity data)? successDetail,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessDetail value) successDetail,
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
    TResult? Function(_SuccessDetail value)? successDetail,
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
    TResult Function(_SuccessDetail value)? successDetail,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements HistoryOrderState {
  const factory _Success(
          {required final Map<String, List<HistoryOrderDatum>> data}) =
      _$SuccessImpl;

  Map<String, List<HistoryOrderDatum>> get data;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessDetailImplCopyWith<$Res> {
  factory _$$SuccessDetailImplCopyWith(
          _$SuccessDetailImpl value, $Res Function(_$SuccessDetailImpl) then) =
      __$$SuccessDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderDetailEntity data});
}

/// @nodoc
class __$$SuccessDetailImplCopyWithImpl<$Res>
    extends _$HistoryOrderStateCopyWithImpl<$Res, _$SuccessDetailImpl>
    implements _$$SuccessDetailImplCopyWith<$Res> {
  __$$SuccessDetailImplCopyWithImpl(
      _$SuccessDetailImpl _value, $Res Function(_$SuccessDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessDetailImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as OrderDetailEntity,
    ));
  }
}

/// @nodoc

class _$SuccessDetailImpl implements _SuccessDetail {
  const _$SuccessDetailImpl({required this.data});

  @override
  final OrderDetailEntity data;

  @override
  String toString() {
    return 'HistoryOrderState.successDetail(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessDetailImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessDetailImplCopyWith<_$SuccessDetailImpl> get copyWith =>
      __$$SuccessDetailImplCopyWithImpl<_$SuccessDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Map<String, List<HistoryOrderDatum>> data)
        success,
    required TResult Function(OrderDetailEntity data) successDetail,
    required TResult Function(String message) failed,
  }) {
    return successDetail(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, List<HistoryOrderDatum>> data)? success,
    TResult? Function(OrderDetailEntity data)? successDetail,
    TResult? Function(String message)? failed,
  }) {
    return successDetail?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, List<HistoryOrderDatum>> data)? success,
    TResult Function(OrderDetailEntity data)? successDetail,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successDetail != null) {
      return successDetail(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessDetail value) successDetail,
    required TResult Function(_Failed value) failed,
  }) {
    return successDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessDetail value)? successDetail,
    TResult? Function(_Failed value)? failed,
  }) {
    return successDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessDetail value)? successDetail,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successDetail != null) {
      return successDetail(this);
    }
    return orElse();
  }
}

abstract class _SuccessDetail implements HistoryOrderState {
  const factory _SuccessDetail({required final OrderDetailEntity data}) =
      _$SuccessDetailImpl;

  OrderDetailEntity get data;
  @JsonKey(ignore: true)
  _$$SuccessDetailImplCopyWith<_$SuccessDetailImpl> get copyWith =>
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
    extends _$HistoryOrderStateCopyWithImpl<$Res, _$FailedImpl>
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
    return 'HistoryOrderState.failed(message: $message)';
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
    required TResult Function(Map<String, List<HistoryOrderDatum>> data)
        success,
    required TResult Function(OrderDetailEntity data) successDetail,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, List<HistoryOrderDatum>> data)? success,
    TResult? Function(OrderDetailEntity data)? successDetail,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, List<HistoryOrderDatum>> data)? success,
    TResult Function(OrderDetailEntity data)? successDetail,
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
    required TResult Function(_SuccessDetail value) successDetail,
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
    TResult? Function(_SuccessDetail value)? successDetail,
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
    TResult Function(_SuccessDetail value)? successDetail,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements HistoryOrderState {
  const factory _Failed({final String message}) = _$FailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
