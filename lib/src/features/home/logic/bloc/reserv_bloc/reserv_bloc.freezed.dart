// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reserv_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReservEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AvailableTimesRequest body) fetchTimes,
    required TResult Function(ReservRequest body) reserv,
    required TResult Function() fetchReserv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AvailableTimesRequest body)? fetchTimes,
    TResult? Function(ReservRequest body)? reserv,
    TResult? Function()? fetchReserv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AvailableTimesRequest body)? fetchTimes,
    TResult Function(ReservRequest body)? reserv,
    TResult Function()? fetchReserv,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTimes value) fetchTimes,
    required TResult Function(_Reserv value) reserv,
    required TResult Function(_FetchReserv value) fetchReserv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTimes value)? fetchTimes,
    TResult? Function(_Reserv value)? reserv,
    TResult? Function(_FetchReserv value)? fetchReserv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimes value)? fetchTimes,
    TResult Function(_Reserv value)? reserv,
    TResult Function(_FetchReserv value)? fetchReserv,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservEventCopyWith<$Res> {
  factory $ReservEventCopyWith(
          ReservEvent value, $Res Function(ReservEvent) then) =
      _$ReservEventCopyWithImpl<$Res, ReservEvent>;
}

/// @nodoc
class _$ReservEventCopyWithImpl<$Res, $Val extends ReservEvent>
    implements $ReservEventCopyWith<$Res> {
  _$ReservEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchTimesImplCopyWith<$Res> {
  factory _$$FetchTimesImplCopyWith(
          _$FetchTimesImpl value, $Res Function(_$FetchTimesImpl) then) =
      __$$FetchTimesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AvailableTimesRequest body});
}

/// @nodoc
class __$$FetchTimesImplCopyWithImpl<$Res>
    extends _$ReservEventCopyWithImpl<$Res, _$FetchTimesImpl>
    implements _$$FetchTimesImplCopyWith<$Res> {
  __$$FetchTimesImplCopyWithImpl(
      _$FetchTimesImpl _value, $Res Function(_$FetchTimesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$FetchTimesImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as AvailableTimesRequest,
    ));
  }
}

/// @nodoc

class _$FetchTimesImpl implements _FetchTimes {
  const _$FetchTimesImpl({required this.body});

  @override
  final AvailableTimesRequest body;

  @override
  String toString() {
    return 'ReservEvent.fetchTimes(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchTimesImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchTimesImplCopyWith<_$FetchTimesImpl> get copyWith =>
      __$$FetchTimesImplCopyWithImpl<_$FetchTimesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AvailableTimesRequest body) fetchTimes,
    required TResult Function(ReservRequest body) reserv,
    required TResult Function() fetchReserv,
  }) {
    return fetchTimes(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AvailableTimesRequest body)? fetchTimes,
    TResult? Function(ReservRequest body)? reserv,
    TResult? Function()? fetchReserv,
  }) {
    return fetchTimes?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AvailableTimesRequest body)? fetchTimes,
    TResult Function(ReservRequest body)? reserv,
    TResult Function()? fetchReserv,
    required TResult orElse(),
  }) {
    if (fetchTimes != null) {
      return fetchTimes(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTimes value) fetchTimes,
    required TResult Function(_Reserv value) reserv,
    required TResult Function(_FetchReserv value) fetchReserv,
  }) {
    return fetchTimes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTimes value)? fetchTimes,
    TResult? Function(_Reserv value)? reserv,
    TResult? Function(_FetchReserv value)? fetchReserv,
  }) {
    return fetchTimes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimes value)? fetchTimes,
    TResult Function(_Reserv value)? reserv,
    TResult Function(_FetchReserv value)? fetchReserv,
    required TResult orElse(),
  }) {
    if (fetchTimes != null) {
      return fetchTimes(this);
    }
    return orElse();
  }
}

abstract class _FetchTimes implements ReservEvent {
  const factory _FetchTimes({required final AvailableTimesRequest body}) =
      _$FetchTimesImpl;

  AvailableTimesRequest get body;
  @JsonKey(ignore: true)
  _$$FetchTimesImplCopyWith<_$FetchTimesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReservImplCopyWith<$Res> {
  factory _$$ReservImplCopyWith(
          _$ReservImpl value, $Res Function(_$ReservImpl) then) =
      __$$ReservImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReservRequest body});
}

/// @nodoc
class __$$ReservImplCopyWithImpl<$Res>
    extends _$ReservEventCopyWithImpl<$Res, _$ReservImpl>
    implements _$$ReservImplCopyWith<$Res> {
  __$$ReservImplCopyWithImpl(
      _$ReservImpl _value, $Res Function(_$ReservImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$ReservImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as ReservRequest,
    ));
  }
}

/// @nodoc

class _$ReservImpl implements _Reserv {
  const _$ReservImpl({required this.body});

  @override
  final ReservRequest body;

  @override
  String toString() {
    return 'ReservEvent.reserv(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservImplCopyWith<_$ReservImpl> get copyWith =>
      __$$ReservImplCopyWithImpl<_$ReservImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AvailableTimesRequest body) fetchTimes,
    required TResult Function(ReservRequest body) reserv,
    required TResult Function() fetchReserv,
  }) {
    return reserv(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AvailableTimesRequest body)? fetchTimes,
    TResult? Function(ReservRequest body)? reserv,
    TResult? Function()? fetchReserv,
  }) {
    return reserv?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AvailableTimesRequest body)? fetchTimes,
    TResult Function(ReservRequest body)? reserv,
    TResult Function()? fetchReserv,
    required TResult orElse(),
  }) {
    if (reserv != null) {
      return reserv(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTimes value) fetchTimes,
    required TResult Function(_Reserv value) reserv,
    required TResult Function(_FetchReserv value) fetchReserv,
  }) {
    return reserv(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTimes value)? fetchTimes,
    TResult? Function(_Reserv value)? reserv,
    TResult? Function(_FetchReserv value)? fetchReserv,
  }) {
    return reserv?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimes value)? fetchTimes,
    TResult Function(_Reserv value)? reserv,
    TResult Function(_FetchReserv value)? fetchReserv,
    required TResult orElse(),
  }) {
    if (reserv != null) {
      return reserv(this);
    }
    return orElse();
  }
}

abstract class _Reserv implements ReservEvent {
  const factory _Reserv({required final ReservRequest body}) = _$ReservImpl;

  ReservRequest get body;
  @JsonKey(ignore: true)
  _$$ReservImplCopyWith<_$ReservImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchReservImplCopyWith<$Res> {
  factory _$$FetchReservImplCopyWith(
          _$FetchReservImpl value, $Res Function(_$FetchReservImpl) then) =
      __$$FetchReservImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchReservImplCopyWithImpl<$Res>
    extends _$ReservEventCopyWithImpl<$Res, _$FetchReservImpl>
    implements _$$FetchReservImplCopyWith<$Res> {
  __$$FetchReservImplCopyWithImpl(
      _$FetchReservImpl _value, $Res Function(_$FetchReservImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchReservImpl implements _FetchReserv {
  const _$FetchReservImpl();

  @override
  String toString() {
    return 'ReservEvent.fetchReserv()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchReservImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AvailableTimesRequest body) fetchTimes,
    required TResult Function(ReservRequest body) reserv,
    required TResult Function() fetchReserv,
  }) {
    return fetchReserv();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AvailableTimesRequest body)? fetchTimes,
    TResult? Function(ReservRequest body)? reserv,
    TResult? Function()? fetchReserv,
  }) {
    return fetchReserv?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AvailableTimesRequest body)? fetchTimes,
    TResult Function(ReservRequest body)? reserv,
    TResult Function()? fetchReserv,
    required TResult orElse(),
  }) {
    if (fetchReserv != null) {
      return fetchReserv();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTimes value) fetchTimes,
    required TResult Function(_Reserv value) reserv,
    required TResult Function(_FetchReserv value) fetchReserv,
  }) {
    return fetchReserv(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTimes value)? fetchTimes,
    TResult? Function(_Reserv value)? reserv,
    TResult? Function(_FetchReserv value)? fetchReserv,
  }) {
    return fetchReserv?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimes value)? fetchTimes,
    TResult Function(_Reserv value)? reserv,
    TResult Function(_FetchReserv value)? fetchReserv,
    required TResult orElse(),
  }) {
    if (fetchReserv != null) {
      return fetchReserv(this);
    }
    return orElse();
  }
}

abstract class _FetchReserv implements ReservEvent {
  const factory _FetchReserv() = _$FetchReservImpl;
}

/// @nodoc
mixin _$ReservState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AvailableTimesResponse response)
        successFetchTimes,
    required TResult Function() successReserv,
    required TResult Function(ReservationResponse response) successFetchReserv,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AvailableTimesResponse response)? successFetchTimes,
    TResult? Function()? successReserv,
    TResult? Function(ReservationResponse response)? successFetchReserv,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AvailableTimesResponse response)? successFetchTimes,
    TResult Function()? successReserv,
    TResult Function(ReservationResponse response)? successFetchReserv,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessFetchTimes value) successFetchTimes,
    required TResult Function(_SuccessReserv value) successReserv,
    required TResult Function(_SuccessFetchReserv value) successFetchReserv,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessFetchTimes value)? successFetchTimes,
    TResult? Function(_SuccessReserv value)? successReserv,
    TResult? Function(_SuccessFetchReserv value)? successFetchReserv,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessFetchTimes value)? successFetchTimes,
    TResult Function(_SuccessReserv value)? successReserv,
    TResult Function(_SuccessFetchReserv value)? successFetchReserv,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservStateCopyWith<$Res> {
  factory $ReservStateCopyWith(
          ReservState value, $Res Function(ReservState) then) =
      _$ReservStateCopyWithImpl<$Res, ReservState>;
}

/// @nodoc
class _$ReservStateCopyWithImpl<$Res, $Val extends ReservState>
    implements $ReservStateCopyWith<$Res> {
  _$ReservStateCopyWithImpl(this._value, this._then);

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
    extends _$ReservStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ReservState.initial()';
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
    required TResult Function(AvailableTimesResponse response)
        successFetchTimes,
    required TResult Function() successReserv,
    required TResult Function(ReservationResponse response) successFetchReserv,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AvailableTimesResponse response)? successFetchTimes,
    TResult? Function()? successReserv,
    TResult? Function(ReservationResponse response)? successFetchReserv,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AvailableTimesResponse response)? successFetchTimes,
    TResult Function()? successReserv,
    TResult Function(ReservationResponse response)? successFetchReserv,
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
    required TResult Function(_SuccessFetchTimes value) successFetchTimes,
    required TResult Function(_SuccessReserv value) successReserv,
    required TResult Function(_SuccessFetchReserv value) successFetchReserv,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessFetchTimes value)? successFetchTimes,
    TResult? Function(_SuccessReserv value)? successReserv,
    TResult? Function(_SuccessFetchReserv value)? successFetchReserv,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessFetchTimes value)? successFetchTimes,
    TResult Function(_SuccessReserv value)? successReserv,
    TResult Function(_SuccessFetchReserv value)? successFetchReserv,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ReservState {
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
    extends _$ReservStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'ReservState.loading()';
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
    required TResult Function(AvailableTimesResponse response)
        successFetchTimes,
    required TResult Function() successReserv,
    required TResult Function(ReservationResponse response) successFetchReserv,
    required TResult Function(String message) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AvailableTimesResponse response)? successFetchTimes,
    TResult? Function()? successReserv,
    TResult? Function(ReservationResponse response)? successFetchReserv,
    TResult? Function(String message)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AvailableTimesResponse response)? successFetchTimes,
    TResult Function()? successReserv,
    TResult Function(ReservationResponse response)? successFetchReserv,
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
    required TResult Function(_SuccessFetchTimes value) successFetchTimes,
    required TResult Function(_SuccessReserv value) successReserv,
    required TResult Function(_SuccessFetchReserv value) successFetchReserv,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessFetchTimes value)? successFetchTimes,
    TResult? Function(_SuccessReserv value)? successReserv,
    TResult? Function(_SuccessFetchReserv value)? successFetchReserv,
    TResult? Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessFetchTimes value)? successFetchTimes,
    TResult Function(_SuccessReserv value)? successReserv,
    TResult Function(_SuccessFetchReserv value)? successFetchReserv,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ReservState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessFetchTimesImplCopyWith<$Res> {
  factory _$$SuccessFetchTimesImplCopyWith(_$SuccessFetchTimesImpl value,
          $Res Function(_$SuccessFetchTimesImpl) then) =
      __$$SuccessFetchTimesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AvailableTimesResponse response});
}

/// @nodoc
class __$$SuccessFetchTimesImplCopyWithImpl<$Res>
    extends _$ReservStateCopyWithImpl<$Res, _$SuccessFetchTimesImpl>
    implements _$$SuccessFetchTimesImplCopyWith<$Res> {
  __$$SuccessFetchTimesImplCopyWithImpl(_$SuccessFetchTimesImpl _value,
      $Res Function(_$SuccessFetchTimesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$SuccessFetchTimesImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as AvailableTimesResponse,
    ));
  }
}

/// @nodoc

class _$SuccessFetchTimesImpl implements _SuccessFetchTimes {
  const _$SuccessFetchTimesImpl({required this.response});

  @override
  final AvailableTimesResponse response;

  @override
  String toString() {
    return 'ReservState.successFetchTimes(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessFetchTimesImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessFetchTimesImplCopyWith<_$SuccessFetchTimesImpl> get copyWith =>
      __$$SuccessFetchTimesImplCopyWithImpl<_$SuccessFetchTimesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AvailableTimesResponse response)
        successFetchTimes,
    required TResult Function() successReserv,
    required TResult Function(ReservationResponse response) successFetchReserv,
    required TResult Function(String message) failed,
  }) {
    return successFetchTimes(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AvailableTimesResponse response)? successFetchTimes,
    TResult? Function()? successReserv,
    TResult? Function(ReservationResponse response)? successFetchReserv,
    TResult? Function(String message)? failed,
  }) {
    return successFetchTimes?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AvailableTimesResponse response)? successFetchTimes,
    TResult Function()? successReserv,
    TResult Function(ReservationResponse response)? successFetchReserv,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successFetchTimes != null) {
      return successFetchTimes(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessFetchTimes value) successFetchTimes,
    required TResult Function(_SuccessReserv value) successReserv,
    required TResult Function(_SuccessFetchReserv value) successFetchReserv,
    required TResult Function(_Failed value) failed,
  }) {
    return successFetchTimes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessFetchTimes value)? successFetchTimes,
    TResult? Function(_SuccessReserv value)? successReserv,
    TResult? Function(_SuccessFetchReserv value)? successFetchReserv,
    TResult? Function(_Failed value)? failed,
  }) {
    return successFetchTimes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessFetchTimes value)? successFetchTimes,
    TResult Function(_SuccessReserv value)? successReserv,
    TResult Function(_SuccessFetchReserv value)? successFetchReserv,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successFetchTimes != null) {
      return successFetchTimes(this);
    }
    return orElse();
  }
}

abstract class _SuccessFetchTimes implements ReservState {
  const factory _SuccessFetchTimes(
          {required final AvailableTimesResponse response}) =
      _$SuccessFetchTimesImpl;

  AvailableTimesResponse get response;
  @JsonKey(ignore: true)
  _$$SuccessFetchTimesImplCopyWith<_$SuccessFetchTimesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessReservImplCopyWith<$Res> {
  factory _$$SuccessReservImplCopyWith(
          _$SuccessReservImpl value, $Res Function(_$SuccessReservImpl) then) =
      __$$SuccessReservImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessReservImplCopyWithImpl<$Res>
    extends _$ReservStateCopyWithImpl<$Res, _$SuccessReservImpl>
    implements _$$SuccessReservImplCopyWith<$Res> {
  __$$SuccessReservImplCopyWithImpl(
      _$SuccessReservImpl _value, $Res Function(_$SuccessReservImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessReservImpl implements _SuccessReserv {
  const _$SuccessReservImpl();

  @override
  String toString() {
    return 'ReservState.successReserv()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessReservImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AvailableTimesResponse response)
        successFetchTimes,
    required TResult Function() successReserv,
    required TResult Function(ReservationResponse response) successFetchReserv,
    required TResult Function(String message) failed,
  }) {
    return successReserv();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AvailableTimesResponse response)? successFetchTimes,
    TResult? Function()? successReserv,
    TResult? Function(ReservationResponse response)? successFetchReserv,
    TResult? Function(String message)? failed,
  }) {
    return successReserv?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AvailableTimesResponse response)? successFetchTimes,
    TResult Function()? successReserv,
    TResult Function(ReservationResponse response)? successFetchReserv,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successReserv != null) {
      return successReserv();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessFetchTimes value) successFetchTimes,
    required TResult Function(_SuccessReserv value) successReserv,
    required TResult Function(_SuccessFetchReserv value) successFetchReserv,
    required TResult Function(_Failed value) failed,
  }) {
    return successReserv(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessFetchTimes value)? successFetchTimes,
    TResult? Function(_SuccessReserv value)? successReserv,
    TResult? Function(_SuccessFetchReserv value)? successFetchReserv,
    TResult? Function(_Failed value)? failed,
  }) {
    return successReserv?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessFetchTimes value)? successFetchTimes,
    TResult Function(_SuccessReserv value)? successReserv,
    TResult Function(_SuccessFetchReserv value)? successFetchReserv,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successReserv != null) {
      return successReserv(this);
    }
    return orElse();
  }
}

abstract class _SuccessReserv implements ReservState {
  const factory _SuccessReserv() = _$SuccessReservImpl;
}

/// @nodoc
abstract class _$$SuccessFetchReservImplCopyWith<$Res> {
  factory _$$SuccessFetchReservImplCopyWith(_$SuccessFetchReservImpl value,
          $Res Function(_$SuccessFetchReservImpl) then) =
      __$$SuccessFetchReservImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReservationResponse response});
}

/// @nodoc
class __$$SuccessFetchReservImplCopyWithImpl<$Res>
    extends _$ReservStateCopyWithImpl<$Res, _$SuccessFetchReservImpl>
    implements _$$SuccessFetchReservImplCopyWith<$Res> {
  __$$SuccessFetchReservImplCopyWithImpl(_$SuccessFetchReservImpl _value,
      $Res Function(_$SuccessFetchReservImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$SuccessFetchReservImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ReservationResponse,
    ));
  }
}

/// @nodoc

class _$SuccessFetchReservImpl implements _SuccessFetchReserv {
  const _$SuccessFetchReservImpl({required this.response});

  @override
  final ReservationResponse response;

  @override
  String toString() {
    return 'ReservState.successFetchReserv(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessFetchReservImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessFetchReservImplCopyWith<_$SuccessFetchReservImpl> get copyWith =>
      __$$SuccessFetchReservImplCopyWithImpl<_$SuccessFetchReservImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AvailableTimesResponse response)
        successFetchTimes,
    required TResult Function() successReserv,
    required TResult Function(ReservationResponse response) successFetchReserv,
    required TResult Function(String message) failed,
  }) {
    return successFetchReserv(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AvailableTimesResponse response)? successFetchTimes,
    TResult? Function()? successReserv,
    TResult? Function(ReservationResponse response)? successFetchReserv,
    TResult? Function(String message)? failed,
  }) {
    return successFetchReserv?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AvailableTimesResponse response)? successFetchTimes,
    TResult Function()? successReserv,
    TResult Function(ReservationResponse response)? successFetchReserv,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successFetchReserv != null) {
      return successFetchReserv(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessFetchTimes value) successFetchTimes,
    required TResult Function(_SuccessReserv value) successReserv,
    required TResult Function(_SuccessFetchReserv value) successFetchReserv,
    required TResult Function(_Failed value) failed,
  }) {
    return successFetchReserv(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessFetchTimes value)? successFetchTimes,
    TResult? Function(_SuccessReserv value)? successReserv,
    TResult? Function(_SuccessFetchReserv value)? successFetchReserv,
    TResult? Function(_Failed value)? failed,
  }) {
    return successFetchReserv?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessFetchTimes value)? successFetchTimes,
    TResult Function(_SuccessReserv value)? successReserv,
    TResult Function(_SuccessFetchReserv value)? successFetchReserv,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successFetchReserv != null) {
      return successFetchReserv(this);
    }
    return orElse();
  }
}

abstract class _SuccessFetchReserv implements ReservState {
  const factory _SuccessFetchReserv(
      {required final ReservationResponse response}) = _$SuccessFetchReservImpl;

  ReservationResponse get response;
  @JsonKey(ignore: true)
  _$$SuccessFetchReservImplCopyWith<_$SuccessFetchReservImpl> get copyWith =>
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
    extends _$ReservStateCopyWithImpl<$Res, _$FailedImpl>
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
    return 'ReservState.failed(message: $message)';
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
    required TResult Function(AvailableTimesResponse response)
        successFetchTimes,
    required TResult Function() successReserv,
    required TResult Function(ReservationResponse response) successFetchReserv,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AvailableTimesResponse response)? successFetchTimes,
    TResult? Function()? successReserv,
    TResult? Function(ReservationResponse response)? successFetchReserv,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AvailableTimesResponse response)? successFetchTimes,
    TResult Function()? successReserv,
    TResult Function(ReservationResponse response)? successFetchReserv,
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
    required TResult Function(_SuccessFetchTimes value) successFetchTimes,
    required TResult Function(_SuccessReserv value) successReserv,
    required TResult Function(_SuccessFetchReserv value) successFetchReserv,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessFetchTimes value)? successFetchTimes,
    TResult? Function(_SuccessReserv value)? successReserv,
    TResult? Function(_SuccessFetchReserv value)? successFetchReserv,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessFetchTimes value)? successFetchTimes,
    TResult Function(_SuccessReserv value)? successReserv,
    TResult Function(_SuccessFetchReserv value)? successFetchReserv,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements ReservState {
  const factory _Failed({final String message}) = _$FailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
