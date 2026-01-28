// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_item_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailItemEvent {
  int get itemId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int itemId) fetchDetailItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int itemId)? fetchDetailItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int itemId)? fetchDetailItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDetailItem value) fetchDetailItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDetailItem value)? fetchDetailItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDetailItem value)? fetchDetailItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailItemEventCopyWith<DetailItemEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailItemEventCopyWith<$Res> {
  factory $DetailItemEventCopyWith(
          DetailItemEvent value, $Res Function(DetailItemEvent) then) =
      _$DetailItemEventCopyWithImpl<$Res, DetailItemEvent>;
  @useResult
  $Res call({int itemId});
}

/// @nodoc
class _$DetailItemEventCopyWithImpl<$Res, $Val extends DetailItemEvent>
    implements $DetailItemEventCopyWith<$Res> {
  _$DetailItemEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchDetailItemImplCopyWith<$Res>
    implements $DetailItemEventCopyWith<$Res> {
  factory _$$FetchDetailItemImplCopyWith(_$FetchDetailItemImpl value,
          $Res Function(_$FetchDetailItemImpl) then) =
      __$$FetchDetailItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int itemId});
}

/// @nodoc
class __$$FetchDetailItemImplCopyWithImpl<$Res>
    extends _$DetailItemEventCopyWithImpl<$Res, _$FetchDetailItemImpl>
    implements _$$FetchDetailItemImplCopyWith<$Res> {
  __$$FetchDetailItemImplCopyWithImpl(
      _$FetchDetailItemImpl _value, $Res Function(_$FetchDetailItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
  }) {
    return _then(_$FetchDetailItemImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchDetailItemImpl implements _FetchDetailItem {
  const _$FetchDetailItemImpl({required this.itemId});

  @override
  final int itemId;

  @override
  String toString() {
    return 'DetailItemEvent.fetchDetailItem(itemId: $itemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDetailItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchDetailItemImplCopyWith<_$FetchDetailItemImpl> get copyWith =>
      __$$FetchDetailItemImplCopyWithImpl<_$FetchDetailItemImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int itemId) fetchDetailItem,
  }) {
    return fetchDetailItem(itemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int itemId)? fetchDetailItem,
  }) {
    return fetchDetailItem?.call(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int itemId)? fetchDetailItem,
    required TResult orElse(),
  }) {
    if (fetchDetailItem != null) {
      return fetchDetailItem(itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDetailItem value) fetchDetailItem,
  }) {
    return fetchDetailItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDetailItem value)? fetchDetailItem,
  }) {
    return fetchDetailItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDetailItem value)? fetchDetailItem,
    required TResult orElse(),
  }) {
    if (fetchDetailItem != null) {
      return fetchDetailItem(this);
    }
    return orElse();
  }
}

abstract class _FetchDetailItem implements DetailItemEvent {
  const factory _FetchDetailItem({required final int itemId}) =
      _$FetchDetailItemImpl;

  @override
  int get itemId;
  @override
  @JsonKey(ignore: true)
  _$$FetchDetailItemImplCopyWith<_$FetchDetailItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DetailItemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DetailItemModel detailItemModel)
        successDetailItem,
    required TResult Function(String message) errorDetailItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DetailItemModel detailItemModel)? successDetailItem,
    TResult? Function(String message)? errorDetailItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DetailItemModel detailItemModel)? successDetailItem,
    TResult Function(String message)? errorDetailItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SuccessDetailItem value) successDetailItem,
    required TResult Function(_ErrorDetailItem value) errorDetailItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SuccessDetailItem value)? successDetailItem,
    TResult? Function(_ErrorDetailItem value)? errorDetailItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SuccessDetailItem value)? successDetailItem,
    TResult Function(_ErrorDetailItem value)? errorDetailItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailItemStateCopyWith<$Res> {
  factory $DetailItemStateCopyWith(
          DetailItemState value, $Res Function(DetailItemState) then) =
      _$DetailItemStateCopyWithImpl<$Res, DetailItemState>;
}

/// @nodoc
class _$DetailItemStateCopyWithImpl<$Res, $Val extends DetailItemState>
    implements $DetailItemStateCopyWith<$Res> {
  _$DetailItemStateCopyWithImpl(this._value, this._then);

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
    extends _$DetailItemStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'DetailItemState.initial()';
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
    required TResult Function(DetailItemModel detailItemModel)
        successDetailItem,
    required TResult Function(String message) errorDetailItem,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DetailItemModel detailItemModel)? successDetailItem,
    TResult? Function(String message)? errorDetailItem,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DetailItemModel detailItemModel)? successDetailItem,
    TResult Function(String message)? errorDetailItem,
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
    required TResult Function(_SuccessDetailItem value) successDetailItem,
    required TResult Function(_ErrorDetailItem value) errorDetailItem,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SuccessDetailItem value)? successDetailItem,
    TResult? Function(_ErrorDetailItem value)? errorDetailItem,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SuccessDetailItem value)? successDetailItem,
    TResult Function(_ErrorDetailItem value)? errorDetailItem,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DetailItemState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SuccessDetailItemImplCopyWith<$Res> {
  factory _$$SuccessDetailItemImplCopyWith(_$SuccessDetailItemImpl value,
          $Res Function(_$SuccessDetailItemImpl) then) =
      __$$SuccessDetailItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DetailItemModel detailItemModel});
}

/// @nodoc
class __$$SuccessDetailItemImplCopyWithImpl<$Res>
    extends _$DetailItemStateCopyWithImpl<$Res, _$SuccessDetailItemImpl>
    implements _$$SuccessDetailItemImplCopyWith<$Res> {
  __$$SuccessDetailItemImplCopyWithImpl(_$SuccessDetailItemImpl _value,
      $Res Function(_$SuccessDetailItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailItemModel = null,
  }) {
    return _then(_$SuccessDetailItemImpl(
      detailItemModel: null == detailItemModel
          ? _value.detailItemModel
          : detailItemModel // ignore: cast_nullable_to_non_nullable
              as DetailItemModel,
    ));
  }
}

/// @nodoc

class _$SuccessDetailItemImpl implements _SuccessDetailItem {
  const _$SuccessDetailItemImpl({required this.detailItemModel});

  @override
  final DetailItemModel detailItemModel;

  @override
  String toString() {
    return 'DetailItemState.successDetailItem(detailItemModel: $detailItemModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessDetailItemImpl &&
            (identical(other.detailItemModel, detailItemModel) ||
                other.detailItemModel == detailItemModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detailItemModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessDetailItemImplCopyWith<_$SuccessDetailItemImpl> get copyWith =>
      __$$SuccessDetailItemImplCopyWithImpl<_$SuccessDetailItemImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DetailItemModel detailItemModel)
        successDetailItem,
    required TResult Function(String message) errorDetailItem,
  }) {
    return successDetailItem(detailItemModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DetailItemModel detailItemModel)? successDetailItem,
    TResult? Function(String message)? errorDetailItem,
  }) {
    return successDetailItem?.call(detailItemModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DetailItemModel detailItemModel)? successDetailItem,
    TResult Function(String message)? errorDetailItem,
    required TResult orElse(),
  }) {
    if (successDetailItem != null) {
      return successDetailItem(detailItemModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SuccessDetailItem value) successDetailItem,
    required TResult Function(_ErrorDetailItem value) errorDetailItem,
  }) {
    return successDetailItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SuccessDetailItem value)? successDetailItem,
    TResult? Function(_ErrorDetailItem value)? errorDetailItem,
  }) {
    return successDetailItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SuccessDetailItem value)? successDetailItem,
    TResult Function(_ErrorDetailItem value)? errorDetailItem,
    required TResult orElse(),
  }) {
    if (successDetailItem != null) {
      return successDetailItem(this);
    }
    return orElse();
  }
}

abstract class _SuccessDetailItem implements DetailItemState {
  const factory _SuccessDetailItem(
          {required final DetailItemModel detailItemModel}) =
      _$SuccessDetailItemImpl;

  DetailItemModel get detailItemModel;
  @JsonKey(ignore: true)
  _$$SuccessDetailItemImplCopyWith<_$SuccessDetailItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorDetailItemImplCopyWith<$Res> {
  factory _$$ErrorDetailItemImplCopyWith(_$ErrorDetailItemImpl value,
          $Res Function(_$ErrorDetailItemImpl) then) =
      __$$ErrorDetailItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorDetailItemImplCopyWithImpl<$Res>
    extends _$DetailItemStateCopyWithImpl<$Res, _$ErrorDetailItemImpl>
    implements _$$ErrorDetailItemImplCopyWith<$Res> {
  __$$ErrorDetailItemImplCopyWithImpl(
      _$ErrorDetailItemImpl _value, $Res Function(_$ErrorDetailItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorDetailItemImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorDetailItemImpl implements _ErrorDetailItem {
  const _$ErrorDetailItemImpl({this.message = 'Произошла ошибка'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'DetailItemState.errorDetailItem(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDetailItemImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDetailItemImplCopyWith<_$ErrorDetailItemImpl> get copyWith =>
      __$$ErrorDetailItemImplCopyWithImpl<_$ErrorDetailItemImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DetailItemModel detailItemModel)
        successDetailItem,
    required TResult Function(String message) errorDetailItem,
  }) {
    return errorDetailItem(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DetailItemModel detailItemModel)? successDetailItem,
    TResult? Function(String message)? errorDetailItem,
  }) {
    return errorDetailItem?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DetailItemModel detailItemModel)? successDetailItem,
    TResult Function(String message)? errorDetailItem,
    required TResult orElse(),
  }) {
    if (errorDetailItem != null) {
      return errorDetailItem(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SuccessDetailItem value) successDetailItem,
    required TResult Function(_ErrorDetailItem value) errorDetailItem,
  }) {
    return errorDetailItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SuccessDetailItem value)? successDetailItem,
    TResult? Function(_ErrorDetailItem value)? errorDetailItem,
  }) {
    return errorDetailItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SuccessDetailItem value)? successDetailItem,
    TResult Function(_ErrorDetailItem value)? errorDetailItem,
    required TResult orElse(),
  }) {
    if (errorDetailItem != null) {
      return errorDetailItem(this);
    }
    return orElse();
  }
}

abstract class _ErrorDetailItem implements DetailItemState {
  const factory _ErrorDetailItem({final String message}) =
      _$ErrorDetailItemImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorDetailItemImplCopyWith<_$ErrorDetailItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
