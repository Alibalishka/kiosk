// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_orders_poll.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TableOrdersPoll {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TableOrdersData data, String? etag) loaded,
    required TResult Function() notModified,
    required TResult Function(Duration? retryAfter) rateLimited,
    required TResult Function() forbidden,
    required TResult Function() invalidTable,
    required TResult Function() failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TableOrdersData data, String? etag)? loaded,
    TResult? Function()? notModified,
    TResult? Function(Duration? retryAfter)? rateLimited,
    TResult? Function()? forbidden,
    TResult? Function()? invalidTable,
    TResult? Function()? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TableOrdersData data, String? etag)? loaded,
    TResult Function()? notModified,
    TResult Function(Duration? retryAfter)? rateLimited,
    TResult Function()? forbidden,
    TResult Function()? invalidTable,
    TResult Function()? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_NotModified value) notModified,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_InvalidTable value) invalidTable,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NotModified value)? notModified,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_InvalidTable value)? invalidTable,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_NotModified value)? notModified,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_InvalidTable value)? invalidTable,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableOrdersPollCopyWith<$Res> {
  factory $TableOrdersPollCopyWith(
          TableOrdersPoll value, $Res Function(TableOrdersPoll) then) =
      _$TableOrdersPollCopyWithImpl<$Res, TableOrdersPoll>;
}

/// @nodoc
class _$TableOrdersPollCopyWithImpl<$Res, $Val extends TableOrdersPoll>
    implements $TableOrdersPollCopyWith<$Res> {
  _$TableOrdersPollCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TableOrdersData data, String? etag});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$TableOrdersPollCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? etag = freezed,
  }) {
    return _then(_$LoadedImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TableOrdersData,
      etag: freezed == etag
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required this.data, this.etag});

  @override
  final TableOrdersData data;
  @override
  final String? etag;

  @override
  String toString() {
    return 'TableOrdersPoll.loaded(data: $data, etag: $etag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.etag, etag) || other.etag == etag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, etag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TableOrdersData data, String? etag) loaded,
    required TResult Function() notModified,
    required TResult Function(Duration? retryAfter) rateLimited,
    required TResult Function() forbidden,
    required TResult Function() invalidTable,
    required TResult Function() failed,
  }) {
    return loaded(data, etag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TableOrdersData data, String? etag)? loaded,
    TResult? Function()? notModified,
    TResult? Function(Duration? retryAfter)? rateLimited,
    TResult? Function()? forbidden,
    TResult? Function()? invalidTable,
    TResult? Function()? failed,
  }) {
    return loaded?.call(data, etag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TableOrdersData data, String? etag)? loaded,
    TResult Function()? notModified,
    TResult Function(Duration? retryAfter)? rateLimited,
    TResult Function()? forbidden,
    TResult Function()? invalidTable,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data, etag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_NotModified value) notModified,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_InvalidTable value) invalidTable,
    required TResult Function(_Failed value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NotModified value)? notModified,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_InvalidTable value)? invalidTable,
    TResult? Function(_Failed value)? failed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_NotModified value)? notModified,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_InvalidTable value)? invalidTable,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements TableOrdersPoll {
  const factory _Loaded(
      {required final TableOrdersData data, final String? etag}) = _$LoadedImpl;

  TableOrdersData get data;
  String? get etag;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotModifiedImplCopyWith<$Res> {
  factory _$$NotModifiedImplCopyWith(
          _$NotModifiedImpl value, $Res Function(_$NotModifiedImpl) then) =
      __$$NotModifiedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotModifiedImplCopyWithImpl<$Res>
    extends _$TableOrdersPollCopyWithImpl<$Res, _$NotModifiedImpl>
    implements _$$NotModifiedImplCopyWith<$Res> {
  __$$NotModifiedImplCopyWithImpl(
      _$NotModifiedImpl _value, $Res Function(_$NotModifiedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotModifiedImpl implements _NotModified {
  const _$NotModifiedImpl();

  @override
  String toString() {
    return 'TableOrdersPoll.notModified()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotModifiedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TableOrdersData data, String? etag) loaded,
    required TResult Function() notModified,
    required TResult Function(Duration? retryAfter) rateLimited,
    required TResult Function() forbidden,
    required TResult Function() invalidTable,
    required TResult Function() failed,
  }) {
    return notModified();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TableOrdersData data, String? etag)? loaded,
    TResult? Function()? notModified,
    TResult? Function(Duration? retryAfter)? rateLimited,
    TResult? Function()? forbidden,
    TResult? Function()? invalidTable,
    TResult? Function()? failed,
  }) {
    return notModified?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TableOrdersData data, String? etag)? loaded,
    TResult Function()? notModified,
    TResult Function(Duration? retryAfter)? rateLimited,
    TResult Function()? forbidden,
    TResult Function()? invalidTable,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (notModified != null) {
      return notModified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_NotModified value) notModified,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_InvalidTable value) invalidTable,
    required TResult Function(_Failed value) failed,
  }) {
    return notModified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NotModified value)? notModified,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_InvalidTable value)? invalidTable,
    TResult? Function(_Failed value)? failed,
  }) {
    return notModified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_NotModified value)? notModified,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_InvalidTable value)? invalidTable,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (notModified != null) {
      return notModified(this);
    }
    return orElse();
  }
}

abstract class _NotModified implements TableOrdersPoll {
  const factory _NotModified() = _$NotModifiedImpl;
}

/// @nodoc
abstract class _$$RateLimitedImplCopyWith<$Res> {
  factory _$$RateLimitedImplCopyWith(
          _$RateLimitedImpl value, $Res Function(_$RateLimitedImpl) then) =
      __$$RateLimitedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration? retryAfter});
}

/// @nodoc
class __$$RateLimitedImplCopyWithImpl<$Res>
    extends _$TableOrdersPollCopyWithImpl<$Res, _$RateLimitedImpl>
    implements _$$RateLimitedImplCopyWith<$Res> {
  __$$RateLimitedImplCopyWithImpl(
      _$RateLimitedImpl _value, $Res Function(_$RateLimitedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retryAfter = freezed,
  }) {
    return _then(_$RateLimitedImpl(
      retryAfter: freezed == retryAfter
          ? _value.retryAfter
          : retryAfter // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class _$RateLimitedImpl implements _RateLimited {
  const _$RateLimitedImpl({this.retryAfter});

  @override
  final Duration? retryAfter;

  @override
  String toString() {
    return 'TableOrdersPoll.rateLimited(retryAfter: $retryAfter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateLimitedImpl &&
            (identical(other.retryAfter, retryAfter) ||
                other.retryAfter == retryAfter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retryAfter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RateLimitedImplCopyWith<_$RateLimitedImpl> get copyWith =>
      __$$RateLimitedImplCopyWithImpl<_$RateLimitedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TableOrdersData data, String? etag) loaded,
    required TResult Function() notModified,
    required TResult Function(Duration? retryAfter) rateLimited,
    required TResult Function() forbidden,
    required TResult Function() invalidTable,
    required TResult Function() failed,
  }) {
    return rateLimited(retryAfter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TableOrdersData data, String? etag)? loaded,
    TResult? Function()? notModified,
    TResult? Function(Duration? retryAfter)? rateLimited,
    TResult? Function()? forbidden,
    TResult? Function()? invalidTable,
    TResult? Function()? failed,
  }) {
    return rateLimited?.call(retryAfter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TableOrdersData data, String? etag)? loaded,
    TResult Function()? notModified,
    TResult Function(Duration? retryAfter)? rateLimited,
    TResult Function()? forbidden,
    TResult Function()? invalidTable,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (rateLimited != null) {
      return rateLimited(retryAfter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_NotModified value) notModified,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_InvalidTable value) invalidTable,
    required TResult Function(_Failed value) failed,
  }) {
    return rateLimited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NotModified value)? notModified,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_InvalidTable value)? invalidTable,
    TResult? Function(_Failed value)? failed,
  }) {
    return rateLimited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_NotModified value)? notModified,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_InvalidTable value)? invalidTable,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (rateLimited != null) {
      return rateLimited(this);
    }
    return orElse();
  }
}

abstract class _RateLimited implements TableOrdersPoll {
  const factory _RateLimited({final Duration? retryAfter}) = _$RateLimitedImpl;

  Duration? get retryAfter;
  @JsonKey(ignore: true)
  _$$RateLimitedImplCopyWith<_$RateLimitedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForbiddenImplCopyWith<$Res> {
  factory _$$ForbiddenImplCopyWith(
          _$ForbiddenImpl value, $Res Function(_$ForbiddenImpl) then) =
      __$$ForbiddenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ForbiddenImplCopyWithImpl<$Res>
    extends _$TableOrdersPollCopyWithImpl<$Res, _$ForbiddenImpl>
    implements _$$ForbiddenImplCopyWith<$Res> {
  __$$ForbiddenImplCopyWithImpl(
      _$ForbiddenImpl _value, $Res Function(_$ForbiddenImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ForbiddenImpl implements _Forbidden {
  const _$ForbiddenImpl();

  @override
  String toString() {
    return 'TableOrdersPoll.forbidden()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ForbiddenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TableOrdersData data, String? etag) loaded,
    required TResult Function() notModified,
    required TResult Function(Duration? retryAfter) rateLimited,
    required TResult Function() forbidden,
    required TResult Function() invalidTable,
    required TResult Function() failed,
  }) {
    return forbidden();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TableOrdersData data, String? etag)? loaded,
    TResult? Function()? notModified,
    TResult? Function(Duration? retryAfter)? rateLimited,
    TResult? Function()? forbidden,
    TResult? Function()? invalidTable,
    TResult? Function()? failed,
  }) {
    return forbidden?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TableOrdersData data, String? etag)? loaded,
    TResult Function()? notModified,
    TResult Function(Duration? retryAfter)? rateLimited,
    TResult Function()? forbidden,
    TResult Function()? invalidTable,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_NotModified value) notModified,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_InvalidTable value) invalidTable,
    required TResult Function(_Failed value) failed,
  }) {
    return forbidden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NotModified value)? notModified,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_InvalidTable value)? invalidTable,
    TResult? Function(_Failed value)? failed,
  }) {
    return forbidden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_NotModified value)? notModified,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_InvalidTable value)? invalidTable,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden(this);
    }
    return orElse();
  }
}

abstract class _Forbidden implements TableOrdersPoll {
  const factory _Forbidden() = _$ForbiddenImpl;
}

/// @nodoc
abstract class _$$InvalidTableImplCopyWith<$Res> {
  factory _$$InvalidTableImplCopyWith(
          _$InvalidTableImpl value, $Res Function(_$InvalidTableImpl) then) =
      __$$InvalidTableImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidTableImplCopyWithImpl<$Res>
    extends _$TableOrdersPollCopyWithImpl<$Res, _$InvalidTableImpl>
    implements _$$InvalidTableImplCopyWith<$Res> {
  __$$InvalidTableImplCopyWithImpl(
      _$InvalidTableImpl _value, $Res Function(_$InvalidTableImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidTableImpl implements _InvalidTable {
  const _$InvalidTableImpl();

  @override
  String toString() {
    return 'TableOrdersPoll.invalidTable()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidTableImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TableOrdersData data, String? etag) loaded,
    required TResult Function() notModified,
    required TResult Function(Duration? retryAfter) rateLimited,
    required TResult Function() forbidden,
    required TResult Function() invalidTable,
    required TResult Function() failed,
  }) {
    return invalidTable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TableOrdersData data, String? etag)? loaded,
    TResult? Function()? notModified,
    TResult? Function(Duration? retryAfter)? rateLimited,
    TResult? Function()? forbidden,
    TResult? Function()? invalidTable,
    TResult? Function()? failed,
  }) {
    return invalidTable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TableOrdersData data, String? etag)? loaded,
    TResult Function()? notModified,
    TResult Function(Duration? retryAfter)? rateLimited,
    TResult Function()? forbidden,
    TResult Function()? invalidTable,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (invalidTable != null) {
      return invalidTable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_NotModified value) notModified,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_InvalidTable value) invalidTable,
    required TResult Function(_Failed value) failed,
  }) {
    return invalidTable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NotModified value)? notModified,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_InvalidTable value)? invalidTable,
    TResult? Function(_Failed value)? failed,
  }) {
    return invalidTable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_NotModified value)? notModified,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_InvalidTable value)? invalidTable,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (invalidTable != null) {
      return invalidTable(this);
    }
    return orElse();
  }
}

abstract class _InvalidTable implements TableOrdersPoll {
  const factory _InvalidTable() = _$InvalidTableImpl;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$TableOrdersPollCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl();

  @override
  String toString() {
    return 'TableOrdersPoll.failed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TableOrdersData data, String? etag) loaded,
    required TResult Function() notModified,
    required TResult Function(Duration? retryAfter) rateLimited,
    required TResult Function() forbidden,
    required TResult Function() invalidTable,
    required TResult Function() failed,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TableOrdersData data, String? etag)? loaded,
    TResult? Function()? notModified,
    TResult? Function(Duration? retryAfter)? rateLimited,
    TResult? Function()? forbidden,
    TResult? Function()? invalidTable,
    TResult? Function()? failed,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TableOrdersData data, String? etag)? loaded,
    TResult Function()? notModified,
    TResult Function(Duration? retryAfter)? rateLimited,
    TResult Function()? forbidden,
    TResult Function()? invalidTable,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_NotModified value) notModified,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_InvalidTable value) invalidTable,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NotModified value)? notModified,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_InvalidTable value)? invalidTable,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_NotModified value)? notModified,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_InvalidTable value)? invalidTable,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements TableOrdersPoll {
  const factory _Failed() = _$FailedImpl;
}
