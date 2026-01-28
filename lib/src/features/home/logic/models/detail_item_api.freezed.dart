// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_item_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailItemApi {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int itemId) getDetailItem,
    required TResult Function(int itemId) getDetailItemSimilar,
    required TResult Function(int itemId, int organizationId) getItemByCustomer,
    required TResult Function(int itemId) getItemReviews,
    required TResult Function(AvailableTimesRequest body) fetchTimes,
    required TResult Function(ReservRequest body) reserv,
    required TResult Function() fetchReserv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int itemId)? getDetailItem,
    TResult? Function(int itemId)? getDetailItemSimilar,
    TResult? Function(int itemId, int organizationId)? getItemByCustomer,
    TResult? Function(int itemId)? getItemReviews,
    TResult? Function(AvailableTimesRequest body)? fetchTimes,
    TResult? Function(ReservRequest body)? reserv,
    TResult? Function()? fetchReserv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int itemId)? getDetailItem,
    TResult Function(int itemId)? getDetailItemSimilar,
    TResult Function(int itemId, int organizationId)? getItemByCustomer,
    TResult Function(int itemId)? getItemReviews,
    TResult Function(AvailableTimesRequest body)? fetchTimes,
    TResult Function(ReservRequest body)? reserv,
    TResult Function()? fetchReserv,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDetailItem value) getDetailItem,
    required TResult Function(_GetDetailItemSimilar value) getDetailItemSimilar,
    required TResult Function(_GetItemByCustomer value) getItemByCustomer,
    required TResult Function(_GetItemReviews value) getItemReviews,
    required TResult Function(_FetchTimes value) fetchTimes,
    required TResult Function(_Reserv value) reserv,
    required TResult Function(_FetchReser value) fetchReserv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDetailItem value)? getDetailItem,
    TResult? Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult? Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult? Function(_GetItemReviews value)? getItemReviews,
    TResult? Function(_FetchTimes value)? fetchTimes,
    TResult? Function(_Reserv value)? reserv,
    TResult? Function(_FetchReser value)? fetchReserv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDetailItem value)? getDetailItem,
    TResult Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult Function(_GetItemReviews value)? getItemReviews,
    TResult Function(_FetchTimes value)? fetchTimes,
    TResult Function(_Reserv value)? reserv,
    TResult Function(_FetchReser value)? fetchReserv,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailItemApiCopyWith<$Res> {
  factory $DetailItemApiCopyWith(
          DetailItemApi value, $Res Function(DetailItemApi) then) =
      _$DetailItemApiCopyWithImpl<$Res, DetailItemApi>;
}

/// @nodoc
class _$DetailItemApiCopyWithImpl<$Res, $Val extends DetailItemApi>
    implements $DetailItemApiCopyWith<$Res> {
  _$DetailItemApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetDetailItemImplCopyWith<$Res> {
  factory _$$GetDetailItemImplCopyWith(
          _$GetDetailItemImpl value, $Res Function(_$GetDetailItemImpl) then) =
      __$$GetDetailItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int itemId});
}

/// @nodoc
class __$$GetDetailItemImplCopyWithImpl<$Res>
    extends _$DetailItemApiCopyWithImpl<$Res, _$GetDetailItemImpl>
    implements _$$GetDetailItemImplCopyWith<$Res> {
  __$$GetDetailItemImplCopyWithImpl(
      _$GetDetailItemImpl _value, $Res Function(_$GetDetailItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
  }) {
    return _then(_$GetDetailItemImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetDetailItemImpl extends _GetDetailItem {
  const _$GetDetailItemImpl({required this.itemId}) : super._();

  @override
  final int itemId;

  @override
  String toString() {
    return 'DetailItemApi.getDetailItem(itemId: $itemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailItemImplCopyWith<_$GetDetailItemImpl> get copyWith =>
      __$$GetDetailItemImplCopyWithImpl<_$GetDetailItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int itemId) getDetailItem,
    required TResult Function(int itemId) getDetailItemSimilar,
    required TResult Function(int itemId, int organizationId) getItemByCustomer,
    required TResult Function(int itemId) getItemReviews,
    required TResult Function(AvailableTimesRequest body) fetchTimes,
    required TResult Function(ReservRequest body) reserv,
    required TResult Function() fetchReserv,
  }) {
    return getDetailItem(itemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int itemId)? getDetailItem,
    TResult? Function(int itemId)? getDetailItemSimilar,
    TResult? Function(int itemId, int organizationId)? getItemByCustomer,
    TResult? Function(int itemId)? getItemReviews,
    TResult? Function(AvailableTimesRequest body)? fetchTimes,
    TResult? Function(ReservRequest body)? reserv,
    TResult? Function()? fetchReserv,
  }) {
    return getDetailItem?.call(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int itemId)? getDetailItem,
    TResult Function(int itemId)? getDetailItemSimilar,
    TResult Function(int itemId, int organizationId)? getItemByCustomer,
    TResult Function(int itemId)? getItemReviews,
    TResult Function(AvailableTimesRequest body)? fetchTimes,
    TResult Function(ReservRequest body)? reserv,
    TResult Function()? fetchReserv,
    required TResult orElse(),
  }) {
    if (getDetailItem != null) {
      return getDetailItem(itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDetailItem value) getDetailItem,
    required TResult Function(_GetDetailItemSimilar value) getDetailItemSimilar,
    required TResult Function(_GetItemByCustomer value) getItemByCustomer,
    required TResult Function(_GetItemReviews value) getItemReviews,
    required TResult Function(_FetchTimes value) fetchTimes,
    required TResult Function(_Reserv value) reserv,
    required TResult Function(_FetchReser value) fetchReserv,
  }) {
    return getDetailItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDetailItem value)? getDetailItem,
    TResult? Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult? Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult? Function(_GetItemReviews value)? getItemReviews,
    TResult? Function(_FetchTimes value)? fetchTimes,
    TResult? Function(_Reserv value)? reserv,
    TResult? Function(_FetchReser value)? fetchReserv,
  }) {
    return getDetailItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDetailItem value)? getDetailItem,
    TResult Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult Function(_GetItemReviews value)? getItemReviews,
    TResult Function(_FetchTimes value)? fetchTimes,
    TResult Function(_Reserv value)? reserv,
    TResult Function(_FetchReser value)? fetchReserv,
    required TResult orElse(),
  }) {
    if (getDetailItem != null) {
      return getDetailItem(this);
    }
    return orElse();
  }
}

abstract class _GetDetailItem extends DetailItemApi {
  const factory _GetDetailItem({required final int itemId}) =
      _$GetDetailItemImpl;
  const _GetDetailItem._() : super._();

  int get itemId;
  @JsonKey(ignore: true)
  _$$GetDetailItemImplCopyWith<_$GetDetailItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetDetailItemSimilarImplCopyWith<$Res> {
  factory _$$GetDetailItemSimilarImplCopyWith(_$GetDetailItemSimilarImpl value,
          $Res Function(_$GetDetailItemSimilarImpl) then) =
      __$$GetDetailItemSimilarImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int itemId});
}

/// @nodoc
class __$$GetDetailItemSimilarImplCopyWithImpl<$Res>
    extends _$DetailItemApiCopyWithImpl<$Res, _$GetDetailItemSimilarImpl>
    implements _$$GetDetailItemSimilarImplCopyWith<$Res> {
  __$$GetDetailItemSimilarImplCopyWithImpl(_$GetDetailItemSimilarImpl _value,
      $Res Function(_$GetDetailItemSimilarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
  }) {
    return _then(_$GetDetailItemSimilarImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetDetailItemSimilarImpl extends _GetDetailItemSimilar {
  const _$GetDetailItemSimilarImpl({required this.itemId}) : super._();

  @override
  final int itemId;

  @override
  String toString() {
    return 'DetailItemApi.getDetailItemSimilar(itemId: $itemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailItemSimilarImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailItemSimilarImplCopyWith<_$GetDetailItemSimilarImpl>
      get copyWith =>
          __$$GetDetailItemSimilarImplCopyWithImpl<_$GetDetailItemSimilarImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int itemId) getDetailItem,
    required TResult Function(int itemId) getDetailItemSimilar,
    required TResult Function(int itemId, int organizationId) getItemByCustomer,
    required TResult Function(int itemId) getItemReviews,
    required TResult Function(AvailableTimesRequest body) fetchTimes,
    required TResult Function(ReservRequest body) reserv,
    required TResult Function() fetchReserv,
  }) {
    return getDetailItemSimilar(itemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int itemId)? getDetailItem,
    TResult? Function(int itemId)? getDetailItemSimilar,
    TResult? Function(int itemId, int organizationId)? getItemByCustomer,
    TResult? Function(int itemId)? getItemReviews,
    TResult? Function(AvailableTimesRequest body)? fetchTimes,
    TResult? Function(ReservRequest body)? reserv,
    TResult? Function()? fetchReserv,
  }) {
    return getDetailItemSimilar?.call(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int itemId)? getDetailItem,
    TResult Function(int itemId)? getDetailItemSimilar,
    TResult Function(int itemId, int organizationId)? getItemByCustomer,
    TResult Function(int itemId)? getItemReviews,
    TResult Function(AvailableTimesRequest body)? fetchTimes,
    TResult Function(ReservRequest body)? reserv,
    TResult Function()? fetchReserv,
    required TResult orElse(),
  }) {
    if (getDetailItemSimilar != null) {
      return getDetailItemSimilar(itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDetailItem value) getDetailItem,
    required TResult Function(_GetDetailItemSimilar value) getDetailItemSimilar,
    required TResult Function(_GetItemByCustomer value) getItemByCustomer,
    required TResult Function(_GetItemReviews value) getItemReviews,
    required TResult Function(_FetchTimes value) fetchTimes,
    required TResult Function(_Reserv value) reserv,
    required TResult Function(_FetchReser value) fetchReserv,
  }) {
    return getDetailItemSimilar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDetailItem value)? getDetailItem,
    TResult? Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult? Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult? Function(_GetItemReviews value)? getItemReviews,
    TResult? Function(_FetchTimes value)? fetchTimes,
    TResult? Function(_Reserv value)? reserv,
    TResult? Function(_FetchReser value)? fetchReserv,
  }) {
    return getDetailItemSimilar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDetailItem value)? getDetailItem,
    TResult Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult Function(_GetItemReviews value)? getItemReviews,
    TResult Function(_FetchTimes value)? fetchTimes,
    TResult Function(_Reserv value)? reserv,
    TResult Function(_FetchReser value)? fetchReserv,
    required TResult orElse(),
  }) {
    if (getDetailItemSimilar != null) {
      return getDetailItemSimilar(this);
    }
    return orElse();
  }
}

abstract class _GetDetailItemSimilar extends DetailItemApi {
  const factory _GetDetailItemSimilar({required final int itemId}) =
      _$GetDetailItemSimilarImpl;
  const _GetDetailItemSimilar._() : super._();

  int get itemId;
  @JsonKey(ignore: true)
  _$$GetDetailItemSimilarImplCopyWith<_$GetDetailItemSimilarImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetItemByCustomerImplCopyWith<$Res> {
  factory _$$GetItemByCustomerImplCopyWith(_$GetItemByCustomerImpl value,
          $Res Function(_$GetItemByCustomerImpl) then) =
      __$$GetItemByCustomerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int itemId, int organizationId});
}

/// @nodoc
class __$$GetItemByCustomerImplCopyWithImpl<$Res>
    extends _$DetailItemApiCopyWithImpl<$Res, _$GetItemByCustomerImpl>
    implements _$$GetItemByCustomerImplCopyWith<$Res> {
  __$$GetItemByCustomerImplCopyWithImpl(_$GetItemByCustomerImpl _value,
      $Res Function(_$GetItemByCustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? organizationId = null,
  }) {
    return _then(_$GetItemByCustomerImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetItemByCustomerImpl extends _GetItemByCustomer {
  const _$GetItemByCustomerImpl(
      {required this.itemId, required this.organizationId})
      : super._();

  @override
  final int itemId;
  @override
  final int organizationId;

  @override
  String toString() {
    return 'DetailItemApi.getItemByCustomer(itemId: $itemId, organizationId: $organizationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemByCustomerImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId, organizationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemByCustomerImplCopyWith<_$GetItemByCustomerImpl> get copyWith =>
      __$$GetItemByCustomerImplCopyWithImpl<_$GetItemByCustomerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int itemId) getDetailItem,
    required TResult Function(int itemId) getDetailItemSimilar,
    required TResult Function(int itemId, int organizationId) getItemByCustomer,
    required TResult Function(int itemId) getItemReviews,
    required TResult Function(AvailableTimesRequest body) fetchTimes,
    required TResult Function(ReservRequest body) reserv,
    required TResult Function() fetchReserv,
  }) {
    return getItemByCustomer(itemId, organizationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int itemId)? getDetailItem,
    TResult? Function(int itemId)? getDetailItemSimilar,
    TResult? Function(int itemId, int organizationId)? getItemByCustomer,
    TResult? Function(int itemId)? getItemReviews,
    TResult? Function(AvailableTimesRequest body)? fetchTimes,
    TResult? Function(ReservRequest body)? reserv,
    TResult? Function()? fetchReserv,
  }) {
    return getItemByCustomer?.call(itemId, organizationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int itemId)? getDetailItem,
    TResult Function(int itemId)? getDetailItemSimilar,
    TResult Function(int itemId, int organizationId)? getItemByCustomer,
    TResult Function(int itemId)? getItemReviews,
    TResult Function(AvailableTimesRequest body)? fetchTimes,
    TResult Function(ReservRequest body)? reserv,
    TResult Function()? fetchReserv,
    required TResult orElse(),
  }) {
    if (getItemByCustomer != null) {
      return getItemByCustomer(itemId, organizationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDetailItem value) getDetailItem,
    required TResult Function(_GetDetailItemSimilar value) getDetailItemSimilar,
    required TResult Function(_GetItemByCustomer value) getItemByCustomer,
    required TResult Function(_GetItemReviews value) getItemReviews,
    required TResult Function(_FetchTimes value) fetchTimes,
    required TResult Function(_Reserv value) reserv,
    required TResult Function(_FetchReser value) fetchReserv,
  }) {
    return getItemByCustomer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDetailItem value)? getDetailItem,
    TResult? Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult? Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult? Function(_GetItemReviews value)? getItemReviews,
    TResult? Function(_FetchTimes value)? fetchTimes,
    TResult? Function(_Reserv value)? reserv,
    TResult? Function(_FetchReser value)? fetchReserv,
  }) {
    return getItemByCustomer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDetailItem value)? getDetailItem,
    TResult Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult Function(_GetItemReviews value)? getItemReviews,
    TResult Function(_FetchTimes value)? fetchTimes,
    TResult Function(_Reserv value)? reserv,
    TResult Function(_FetchReser value)? fetchReserv,
    required TResult orElse(),
  }) {
    if (getItemByCustomer != null) {
      return getItemByCustomer(this);
    }
    return orElse();
  }
}

abstract class _GetItemByCustomer extends DetailItemApi {
  const factory _GetItemByCustomer(
      {required final int itemId,
      required final int organizationId}) = _$GetItemByCustomerImpl;
  const _GetItemByCustomer._() : super._();

  int get itemId;
  int get organizationId;
  @JsonKey(ignore: true)
  _$$GetItemByCustomerImplCopyWith<_$GetItemByCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetItemReviewsImplCopyWith<$Res> {
  factory _$$GetItemReviewsImplCopyWith(_$GetItemReviewsImpl value,
          $Res Function(_$GetItemReviewsImpl) then) =
      __$$GetItemReviewsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int itemId});
}

/// @nodoc
class __$$GetItemReviewsImplCopyWithImpl<$Res>
    extends _$DetailItemApiCopyWithImpl<$Res, _$GetItemReviewsImpl>
    implements _$$GetItemReviewsImplCopyWith<$Res> {
  __$$GetItemReviewsImplCopyWithImpl(
      _$GetItemReviewsImpl _value, $Res Function(_$GetItemReviewsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
  }) {
    return _then(_$GetItemReviewsImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetItemReviewsImpl extends _GetItemReviews {
  const _$GetItemReviewsImpl({required this.itemId}) : super._();

  @override
  final int itemId;

  @override
  String toString() {
    return 'DetailItemApi.getItemReviews(itemId: $itemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemReviewsImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemReviewsImplCopyWith<_$GetItemReviewsImpl> get copyWith =>
      __$$GetItemReviewsImplCopyWithImpl<_$GetItemReviewsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int itemId) getDetailItem,
    required TResult Function(int itemId) getDetailItemSimilar,
    required TResult Function(int itemId, int organizationId) getItemByCustomer,
    required TResult Function(int itemId) getItemReviews,
    required TResult Function(AvailableTimesRequest body) fetchTimes,
    required TResult Function(ReservRequest body) reserv,
    required TResult Function() fetchReserv,
  }) {
    return getItemReviews(itemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int itemId)? getDetailItem,
    TResult? Function(int itemId)? getDetailItemSimilar,
    TResult? Function(int itemId, int organizationId)? getItemByCustomer,
    TResult? Function(int itemId)? getItemReviews,
    TResult? Function(AvailableTimesRequest body)? fetchTimes,
    TResult? Function(ReservRequest body)? reserv,
    TResult? Function()? fetchReserv,
  }) {
    return getItemReviews?.call(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int itemId)? getDetailItem,
    TResult Function(int itemId)? getDetailItemSimilar,
    TResult Function(int itemId, int organizationId)? getItemByCustomer,
    TResult Function(int itemId)? getItemReviews,
    TResult Function(AvailableTimesRequest body)? fetchTimes,
    TResult Function(ReservRequest body)? reserv,
    TResult Function()? fetchReserv,
    required TResult orElse(),
  }) {
    if (getItemReviews != null) {
      return getItemReviews(itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDetailItem value) getDetailItem,
    required TResult Function(_GetDetailItemSimilar value) getDetailItemSimilar,
    required TResult Function(_GetItemByCustomer value) getItemByCustomer,
    required TResult Function(_GetItemReviews value) getItemReviews,
    required TResult Function(_FetchTimes value) fetchTimes,
    required TResult Function(_Reserv value) reserv,
    required TResult Function(_FetchReser value) fetchReserv,
  }) {
    return getItemReviews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDetailItem value)? getDetailItem,
    TResult? Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult? Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult? Function(_GetItemReviews value)? getItemReviews,
    TResult? Function(_FetchTimes value)? fetchTimes,
    TResult? Function(_Reserv value)? reserv,
    TResult? Function(_FetchReser value)? fetchReserv,
  }) {
    return getItemReviews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDetailItem value)? getDetailItem,
    TResult Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult Function(_GetItemReviews value)? getItemReviews,
    TResult Function(_FetchTimes value)? fetchTimes,
    TResult Function(_Reserv value)? reserv,
    TResult Function(_FetchReser value)? fetchReserv,
    required TResult orElse(),
  }) {
    if (getItemReviews != null) {
      return getItemReviews(this);
    }
    return orElse();
  }
}

abstract class _GetItemReviews extends DetailItemApi {
  const factory _GetItemReviews({required final int itemId}) =
      _$GetItemReviewsImpl;
  const _GetItemReviews._() : super._();

  int get itemId;
  @JsonKey(ignore: true)
  _$$GetItemReviewsImplCopyWith<_$GetItemReviewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$DetailItemApiCopyWithImpl<$Res, _$FetchTimesImpl>
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

class _$FetchTimesImpl extends _FetchTimes {
  const _$FetchTimesImpl({required this.body}) : super._();

  @override
  final AvailableTimesRequest body;

  @override
  String toString() {
    return 'DetailItemApi.fetchTimes(body: $body)';
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
    required TResult Function(int itemId) getDetailItem,
    required TResult Function(int itemId) getDetailItemSimilar,
    required TResult Function(int itemId, int organizationId) getItemByCustomer,
    required TResult Function(int itemId) getItemReviews,
    required TResult Function(AvailableTimesRequest body) fetchTimes,
    required TResult Function(ReservRequest body) reserv,
    required TResult Function() fetchReserv,
  }) {
    return fetchTimes(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int itemId)? getDetailItem,
    TResult? Function(int itemId)? getDetailItemSimilar,
    TResult? Function(int itemId, int organizationId)? getItemByCustomer,
    TResult? Function(int itemId)? getItemReviews,
    TResult? Function(AvailableTimesRequest body)? fetchTimes,
    TResult? Function(ReservRequest body)? reserv,
    TResult? Function()? fetchReserv,
  }) {
    return fetchTimes?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int itemId)? getDetailItem,
    TResult Function(int itemId)? getDetailItemSimilar,
    TResult Function(int itemId, int organizationId)? getItemByCustomer,
    TResult Function(int itemId)? getItemReviews,
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
    required TResult Function(_GetDetailItem value) getDetailItem,
    required TResult Function(_GetDetailItemSimilar value) getDetailItemSimilar,
    required TResult Function(_GetItemByCustomer value) getItemByCustomer,
    required TResult Function(_GetItemReviews value) getItemReviews,
    required TResult Function(_FetchTimes value) fetchTimes,
    required TResult Function(_Reserv value) reserv,
    required TResult Function(_FetchReser value) fetchReserv,
  }) {
    return fetchTimes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDetailItem value)? getDetailItem,
    TResult? Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult? Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult? Function(_GetItemReviews value)? getItemReviews,
    TResult? Function(_FetchTimes value)? fetchTimes,
    TResult? Function(_Reserv value)? reserv,
    TResult? Function(_FetchReser value)? fetchReserv,
  }) {
    return fetchTimes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDetailItem value)? getDetailItem,
    TResult Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult Function(_GetItemReviews value)? getItemReviews,
    TResult Function(_FetchTimes value)? fetchTimes,
    TResult Function(_Reserv value)? reserv,
    TResult Function(_FetchReser value)? fetchReserv,
    required TResult orElse(),
  }) {
    if (fetchTimes != null) {
      return fetchTimes(this);
    }
    return orElse();
  }
}

abstract class _FetchTimes extends DetailItemApi {
  const factory _FetchTimes({required final AvailableTimesRequest body}) =
      _$FetchTimesImpl;
  const _FetchTimes._() : super._();

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
    extends _$DetailItemApiCopyWithImpl<$Res, _$ReservImpl>
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

class _$ReservImpl extends _Reserv {
  const _$ReservImpl({required this.body}) : super._();

  @override
  final ReservRequest body;

  @override
  String toString() {
    return 'DetailItemApi.reserv(body: $body)';
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
    required TResult Function(int itemId) getDetailItem,
    required TResult Function(int itemId) getDetailItemSimilar,
    required TResult Function(int itemId, int organizationId) getItemByCustomer,
    required TResult Function(int itemId) getItemReviews,
    required TResult Function(AvailableTimesRequest body) fetchTimes,
    required TResult Function(ReservRequest body) reserv,
    required TResult Function() fetchReserv,
  }) {
    return reserv(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int itemId)? getDetailItem,
    TResult? Function(int itemId)? getDetailItemSimilar,
    TResult? Function(int itemId, int organizationId)? getItemByCustomer,
    TResult? Function(int itemId)? getItemReviews,
    TResult? Function(AvailableTimesRequest body)? fetchTimes,
    TResult? Function(ReservRequest body)? reserv,
    TResult? Function()? fetchReserv,
  }) {
    return reserv?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int itemId)? getDetailItem,
    TResult Function(int itemId)? getDetailItemSimilar,
    TResult Function(int itemId, int organizationId)? getItemByCustomer,
    TResult Function(int itemId)? getItemReviews,
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
    required TResult Function(_GetDetailItem value) getDetailItem,
    required TResult Function(_GetDetailItemSimilar value) getDetailItemSimilar,
    required TResult Function(_GetItemByCustomer value) getItemByCustomer,
    required TResult Function(_GetItemReviews value) getItemReviews,
    required TResult Function(_FetchTimes value) fetchTimes,
    required TResult Function(_Reserv value) reserv,
    required TResult Function(_FetchReser value) fetchReserv,
  }) {
    return reserv(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDetailItem value)? getDetailItem,
    TResult? Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult? Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult? Function(_GetItemReviews value)? getItemReviews,
    TResult? Function(_FetchTimes value)? fetchTimes,
    TResult? Function(_Reserv value)? reserv,
    TResult? Function(_FetchReser value)? fetchReserv,
  }) {
    return reserv?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDetailItem value)? getDetailItem,
    TResult Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult Function(_GetItemReviews value)? getItemReviews,
    TResult Function(_FetchTimes value)? fetchTimes,
    TResult Function(_Reserv value)? reserv,
    TResult Function(_FetchReser value)? fetchReserv,
    required TResult orElse(),
  }) {
    if (reserv != null) {
      return reserv(this);
    }
    return orElse();
  }
}

abstract class _Reserv extends DetailItemApi {
  const factory _Reserv({required final ReservRequest body}) = _$ReservImpl;
  const _Reserv._() : super._();

  ReservRequest get body;
  @JsonKey(ignore: true)
  _$$ReservImplCopyWith<_$ReservImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchReserImplCopyWith<$Res> {
  factory _$$FetchReserImplCopyWith(
          _$FetchReserImpl value, $Res Function(_$FetchReserImpl) then) =
      __$$FetchReserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchReserImplCopyWithImpl<$Res>
    extends _$DetailItemApiCopyWithImpl<$Res, _$FetchReserImpl>
    implements _$$FetchReserImplCopyWith<$Res> {
  __$$FetchReserImplCopyWithImpl(
      _$FetchReserImpl _value, $Res Function(_$FetchReserImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchReserImpl extends _FetchReser {
  const _$FetchReserImpl() : super._();

  @override
  String toString() {
    return 'DetailItemApi.fetchReserv()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchReserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int itemId) getDetailItem,
    required TResult Function(int itemId) getDetailItemSimilar,
    required TResult Function(int itemId, int organizationId) getItemByCustomer,
    required TResult Function(int itemId) getItemReviews,
    required TResult Function(AvailableTimesRequest body) fetchTimes,
    required TResult Function(ReservRequest body) reserv,
    required TResult Function() fetchReserv,
  }) {
    return fetchReserv();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int itemId)? getDetailItem,
    TResult? Function(int itemId)? getDetailItemSimilar,
    TResult? Function(int itemId, int organizationId)? getItemByCustomer,
    TResult? Function(int itemId)? getItemReviews,
    TResult? Function(AvailableTimesRequest body)? fetchTimes,
    TResult? Function(ReservRequest body)? reserv,
    TResult? Function()? fetchReserv,
  }) {
    return fetchReserv?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int itemId)? getDetailItem,
    TResult Function(int itemId)? getDetailItemSimilar,
    TResult Function(int itemId, int organizationId)? getItemByCustomer,
    TResult Function(int itemId)? getItemReviews,
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
    required TResult Function(_GetDetailItem value) getDetailItem,
    required TResult Function(_GetDetailItemSimilar value) getDetailItemSimilar,
    required TResult Function(_GetItemByCustomer value) getItemByCustomer,
    required TResult Function(_GetItemReviews value) getItemReviews,
    required TResult Function(_FetchTimes value) fetchTimes,
    required TResult Function(_Reserv value) reserv,
    required TResult Function(_FetchReser value) fetchReserv,
  }) {
    return fetchReserv(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDetailItem value)? getDetailItem,
    TResult? Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult? Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult? Function(_GetItemReviews value)? getItemReviews,
    TResult? Function(_FetchTimes value)? fetchTimes,
    TResult? Function(_Reserv value)? reserv,
    TResult? Function(_FetchReser value)? fetchReserv,
  }) {
    return fetchReserv?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDetailItem value)? getDetailItem,
    TResult Function(_GetDetailItemSimilar value)? getDetailItemSimilar,
    TResult Function(_GetItemByCustomer value)? getItemByCustomer,
    TResult Function(_GetItemReviews value)? getItemReviews,
    TResult Function(_FetchTimes value)? fetchTimes,
    TResult Function(_Reserv value)? reserv,
    TResult Function(_FetchReser value)? fetchReserv,
    required TResult orElse(),
  }) {
    if (fetchReserv != null) {
      return fetchReserv(this);
    }
    return orElse();
  }
}

abstract class _FetchReser extends DetailItemApi {
  const factory _FetchReser() = _$FetchReserImpl;
  const _FetchReser._() : super._();
}
