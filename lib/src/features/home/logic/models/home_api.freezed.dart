// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeApi {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchItems,
    required TResult Function() fetchCity,
    required TResult Function(int id) fetchSubscriptionItems,
    required TResult Function(int idSubscription, String idItem) fetchFreeItems,
    required TResult Function(BonusRequest body) orderSubscription,
    required TResult Function() fetchRatings,
    required TResult Function(ReviewRequest body, int id) sendReview,
    required TResult Function(int id) fetchQrMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchItems,
    TResult? Function()? fetchCity,
    TResult? Function(int id)? fetchSubscriptionItems,
    TResult? Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult? Function(BonusRequest body)? orderSubscription,
    TResult? Function()? fetchRatings,
    TResult? Function(ReviewRequest body, int id)? sendReview,
    TResult? Function(int id)? fetchQrMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchItems,
    TResult Function()? fetchCity,
    TResult Function(int id)? fetchSubscriptionItems,
    TResult Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult Function(BonusRequest body)? orderSubscription,
    TResult Function()? fetchRatings,
    TResult Function(ReviewRequest body, int id)? sendReview,
    TResult Function(int id)? fetchQrMenu,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_FetchCity value) fetchCity,
    required TResult Function(_FetchSubscriptionItems value)
        fetchSubscriptionItems,
    required TResult Function(_FetchFreeItems value) fetchFreeItems,
    required TResult Function(_OrderSubscription value) orderSubscription,
    required TResult Function(_FetchRatings value) fetchRatings,
    required TResult Function(_SendReview value) sendReview,
    required TResult Function(_FetchQrMenu value) fetchQrMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_FetchCity value)? fetchCity,
    TResult? Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult? Function(_FetchFreeItems value)? fetchFreeItems,
    TResult? Function(_OrderSubscription value)? orderSubscription,
    TResult? Function(_FetchRatings value)? fetchRatings,
    TResult? Function(_SendReview value)? sendReview,
    TResult? Function(_FetchQrMenu value)? fetchQrMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_FetchCity value)? fetchCity,
    TResult Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult Function(_FetchFreeItems value)? fetchFreeItems,
    TResult Function(_OrderSubscription value)? orderSubscription,
    TResult Function(_FetchRatings value)? fetchRatings,
    TResult Function(_SendReview value)? sendReview,
    TResult Function(_FetchQrMenu value)? fetchQrMenu,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeApiCopyWith<$Res> {
  factory $HomeApiCopyWith(HomeApi value, $Res Function(HomeApi) then) =
      _$HomeApiCopyWithImpl<$Res, HomeApi>;
}

/// @nodoc
class _$HomeApiCopyWithImpl<$Res, $Val extends HomeApi>
    implements $HomeApiCopyWith<$Res> {
  _$HomeApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchNewsImplCopyWith<$Res> {
  factory _$$FetchNewsImplCopyWith(
          _$FetchNewsImpl value, $Res Function(_$FetchNewsImpl) then) =
      __$$FetchNewsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchNewsImplCopyWithImpl<$Res>
    extends _$HomeApiCopyWithImpl<$Res, _$FetchNewsImpl>
    implements _$$FetchNewsImplCopyWith<$Res> {
  __$$FetchNewsImplCopyWithImpl(
      _$FetchNewsImpl _value, $Res Function(_$FetchNewsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchNewsImpl extends _FetchNews {
  const _$FetchNewsImpl() : super._();

  @override
  String toString() {
    return 'HomeApi.fetchNews()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchNewsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchItems,
    required TResult Function() fetchCity,
    required TResult Function(int id) fetchSubscriptionItems,
    required TResult Function(int idSubscription, String idItem) fetchFreeItems,
    required TResult Function(BonusRequest body) orderSubscription,
    required TResult Function() fetchRatings,
    required TResult Function(ReviewRequest body, int id) sendReview,
    required TResult Function(int id) fetchQrMenu,
  }) {
    return fetchNews();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchItems,
    TResult? Function()? fetchCity,
    TResult? Function(int id)? fetchSubscriptionItems,
    TResult? Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult? Function(BonusRequest body)? orderSubscription,
    TResult? Function()? fetchRatings,
    TResult? Function(ReviewRequest body, int id)? sendReview,
    TResult? Function(int id)? fetchQrMenu,
  }) {
    return fetchNews?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchItems,
    TResult Function()? fetchCity,
    TResult Function(int id)? fetchSubscriptionItems,
    TResult Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult Function(BonusRequest body)? orderSubscription,
    TResult Function()? fetchRatings,
    TResult Function(ReviewRequest body, int id)? sendReview,
    TResult Function(int id)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (fetchNews != null) {
      return fetchNews();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_FetchCity value) fetchCity,
    required TResult Function(_FetchSubscriptionItems value)
        fetchSubscriptionItems,
    required TResult Function(_FetchFreeItems value) fetchFreeItems,
    required TResult Function(_OrderSubscription value) orderSubscription,
    required TResult Function(_FetchRatings value) fetchRatings,
    required TResult Function(_SendReview value) sendReview,
    required TResult Function(_FetchQrMenu value) fetchQrMenu,
  }) {
    return fetchNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_FetchCity value)? fetchCity,
    TResult? Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult? Function(_FetchFreeItems value)? fetchFreeItems,
    TResult? Function(_OrderSubscription value)? orderSubscription,
    TResult? Function(_FetchRatings value)? fetchRatings,
    TResult? Function(_SendReview value)? sendReview,
    TResult? Function(_FetchQrMenu value)? fetchQrMenu,
  }) {
    return fetchNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_FetchCity value)? fetchCity,
    TResult Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult Function(_FetchFreeItems value)? fetchFreeItems,
    TResult Function(_OrderSubscription value)? orderSubscription,
    TResult Function(_FetchRatings value)? fetchRatings,
    TResult Function(_SendReview value)? sendReview,
    TResult Function(_FetchQrMenu value)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (fetchNews != null) {
      return fetchNews(this);
    }
    return orElse();
  }
}

abstract class _FetchNews extends HomeApi {
  const factory _FetchNews() = _$FetchNewsImpl;
  const _FetchNews._() : super._();
}

/// @nodoc
abstract class _$$FetchItemsImplCopyWith<$Res> {
  factory _$$FetchItemsImplCopyWith(
          _$FetchItemsImpl value, $Res Function(_$FetchItemsImpl) then) =
      __$$FetchItemsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchItemsImplCopyWithImpl<$Res>
    extends _$HomeApiCopyWithImpl<$Res, _$FetchItemsImpl>
    implements _$$FetchItemsImplCopyWith<$Res> {
  __$$FetchItemsImplCopyWithImpl(
      _$FetchItemsImpl _value, $Res Function(_$FetchItemsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchItemsImpl extends _FetchItems {
  const _$FetchItemsImpl() : super._();

  @override
  String toString() {
    return 'HomeApi.fetchItems()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchItemsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchItems,
    required TResult Function() fetchCity,
    required TResult Function(int id) fetchSubscriptionItems,
    required TResult Function(int idSubscription, String idItem) fetchFreeItems,
    required TResult Function(BonusRequest body) orderSubscription,
    required TResult Function() fetchRatings,
    required TResult Function(ReviewRequest body, int id) sendReview,
    required TResult Function(int id) fetchQrMenu,
  }) {
    return fetchItems();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchItems,
    TResult? Function()? fetchCity,
    TResult? Function(int id)? fetchSubscriptionItems,
    TResult? Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult? Function(BonusRequest body)? orderSubscription,
    TResult? Function()? fetchRatings,
    TResult? Function(ReviewRequest body, int id)? sendReview,
    TResult? Function(int id)? fetchQrMenu,
  }) {
    return fetchItems?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchItems,
    TResult Function()? fetchCity,
    TResult Function(int id)? fetchSubscriptionItems,
    TResult Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult Function(BonusRequest body)? orderSubscription,
    TResult Function()? fetchRatings,
    TResult Function(ReviewRequest body, int id)? sendReview,
    TResult Function(int id)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (fetchItems != null) {
      return fetchItems();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_FetchCity value) fetchCity,
    required TResult Function(_FetchSubscriptionItems value)
        fetchSubscriptionItems,
    required TResult Function(_FetchFreeItems value) fetchFreeItems,
    required TResult Function(_OrderSubscription value) orderSubscription,
    required TResult Function(_FetchRatings value) fetchRatings,
    required TResult Function(_SendReview value) sendReview,
    required TResult Function(_FetchQrMenu value) fetchQrMenu,
  }) {
    return fetchItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_FetchCity value)? fetchCity,
    TResult? Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult? Function(_FetchFreeItems value)? fetchFreeItems,
    TResult? Function(_OrderSubscription value)? orderSubscription,
    TResult? Function(_FetchRatings value)? fetchRatings,
    TResult? Function(_SendReview value)? sendReview,
    TResult? Function(_FetchQrMenu value)? fetchQrMenu,
  }) {
    return fetchItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_FetchCity value)? fetchCity,
    TResult Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult Function(_FetchFreeItems value)? fetchFreeItems,
    TResult Function(_OrderSubscription value)? orderSubscription,
    TResult Function(_FetchRatings value)? fetchRatings,
    TResult Function(_SendReview value)? sendReview,
    TResult Function(_FetchQrMenu value)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (fetchItems != null) {
      return fetchItems(this);
    }
    return orElse();
  }
}

abstract class _FetchItems extends HomeApi {
  const factory _FetchItems() = _$FetchItemsImpl;
  const _FetchItems._() : super._();
}

/// @nodoc
abstract class _$$FetchCityImplCopyWith<$Res> {
  factory _$$FetchCityImplCopyWith(
          _$FetchCityImpl value, $Res Function(_$FetchCityImpl) then) =
      __$$FetchCityImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchCityImplCopyWithImpl<$Res>
    extends _$HomeApiCopyWithImpl<$Res, _$FetchCityImpl>
    implements _$$FetchCityImplCopyWith<$Res> {
  __$$FetchCityImplCopyWithImpl(
      _$FetchCityImpl _value, $Res Function(_$FetchCityImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchCityImpl extends _FetchCity {
  const _$FetchCityImpl() : super._();

  @override
  String toString() {
    return 'HomeApi.fetchCity()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchCityImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchItems,
    required TResult Function() fetchCity,
    required TResult Function(int id) fetchSubscriptionItems,
    required TResult Function(int idSubscription, String idItem) fetchFreeItems,
    required TResult Function(BonusRequest body) orderSubscription,
    required TResult Function() fetchRatings,
    required TResult Function(ReviewRequest body, int id) sendReview,
    required TResult Function(int id) fetchQrMenu,
  }) {
    return fetchCity();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchItems,
    TResult? Function()? fetchCity,
    TResult? Function(int id)? fetchSubscriptionItems,
    TResult? Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult? Function(BonusRequest body)? orderSubscription,
    TResult? Function()? fetchRatings,
    TResult? Function(ReviewRequest body, int id)? sendReview,
    TResult? Function(int id)? fetchQrMenu,
  }) {
    return fetchCity?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchItems,
    TResult Function()? fetchCity,
    TResult Function(int id)? fetchSubscriptionItems,
    TResult Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult Function(BonusRequest body)? orderSubscription,
    TResult Function()? fetchRatings,
    TResult Function(ReviewRequest body, int id)? sendReview,
    TResult Function(int id)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (fetchCity != null) {
      return fetchCity();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_FetchCity value) fetchCity,
    required TResult Function(_FetchSubscriptionItems value)
        fetchSubscriptionItems,
    required TResult Function(_FetchFreeItems value) fetchFreeItems,
    required TResult Function(_OrderSubscription value) orderSubscription,
    required TResult Function(_FetchRatings value) fetchRatings,
    required TResult Function(_SendReview value) sendReview,
    required TResult Function(_FetchQrMenu value) fetchQrMenu,
  }) {
    return fetchCity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_FetchCity value)? fetchCity,
    TResult? Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult? Function(_FetchFreeItems value)? fetchFreeItems,
    TResult? Function(_OrderSubscription value)? orderSubscription,
    TResult? Function(_FetchRatings value)? fetchRatings,
    TResult? Function(_SendReview value)? sendReview,
    TResult? Function(_FetchQrMenu value)? fetchQrMenu,
  }) {
    return fetchCity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_FetchCity value)? fetchCity,
    TResult Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult Function(_FetchFreeItems value)? fetchFreeItems,
    TResult Function(_OrderSubscription value)? orderSubscription,
    TResult Function(_FetchRatings value)? fetchRatings,
    TResult Function(_SendReview value)? sendReview,
    TResult Function(_FetchQrMenu value)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (fetchCity != null) {
      return fetchCity(this);
    }
    return orElse();
  }
}

abstract class _FetchCity extends HomeApi {
  const factory _FetchCity() = _$FetchCityImpl;
  const _FetchCity._() : super._();
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
    extends _$HomeApiCopyWithImpl<$Res, _$FetchSubscriptionItemsImpl>
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

class _$FetchSubscriptionItemsImpl extends _FetchSubscriptionItems {
  const _$FetchSubscriptionItemsImpl({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'HomeApi.fetchSubscriptionItems(id: $id)';
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
    required TResult Function() fetchNews,
    required TResult Function() fetchItems,
    required TResult Function() fetchCity,
    required TResult Function(int id) fetchSubscriptionItems,
    required TResult Function(int idSubscription, String idItem) fetchFreeItems,
    required TResult Function(BonusRequest body) orderSubscription,
    required TResult Function() fetchRatings,
    required TResult Function(ReviewRequest body, int id) sendReview,
    required TResult Function(int id) fetchQrMenu,
  }) {
    return fetchSubscriptionItems(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchItems,
    TResult? Function()? fetchCity,
    TResult? Function(int id)? fetchSubscriptionItems,
    TResult? Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult? Function(BonusRequest body)? orderSubscription,
    TResult? Function()? fetchRatings,
    TResult? Function(ReviewRequest body, int id)? sendReview,
    TResult? Function(int id)? fetchQrMenu,
  }) {
    return fetchSubscriptionItems?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchItems,
    TResult Function()? fetchCity,
    TResult Function(int id)? fetchSubscriptionItems,
    TResult Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult Function(BonusRequest body)? orderSubscription,
    TResult Function()? fetchRatings,
    TResult Function(ReviewRequest body, int id)? sendReview,
    TResult Function(int id)? fetchQrMenu,
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
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_FetchCity value) fetchCity,
    required TResult Function(_FetchSubscriptionItems value)
        fetchSubscriptionItems,
    required TResult Function(_FetchFreeItems value) fetchFreeItems,
    required TResult Function(_OrderSubscription value) orderSubscription,
    required TResult Function(_FetchRatings value) fetchRatings,
    required TResult Function(_SendReview value) sendReview,
    required TResult Function(_FetchQrMenu value) fetchQrMenu,
  }) {
    return fetchSubscriptionItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_FetchCity value)? fetchCity,
    TResult? Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult? Function(_FetchFreeItems value)? fetchFreeItems,
    TResult? Function(_OrderSubscription value)? orderSubscription,
    TResult? Function(_FetchRatings value)? fetchRatings,
    TResult? Function(_SendReview value)? sendReview,
    TResult? Function(_FetchQrMenu value)? fetchQrMenu,
  }) {
    return fetchSubscriptionItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_FetchCity value)? fetchCity,
    TResult Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult Function(_FetchFreeItems value)? fetchFreeItems,
    TResult Function(_OrderSubscription value)? orderSubscription,
    TResult Function(_FetchRatings value)? fetchRatings,
    TResult Function(_SendReview value)? sendReview,
    TResult Function(_FetchQrMenu value)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (fetchSubscriptionItems != null) {
      return fetchSubscriptionItems(this);
    }
    return orElse();
  }
}

abstract class _FetchSubscriptionItems extends HomeApi {
  const factory _FetchSubscriptionItems({required final int id}) =
      _$FetchSubscriptionItemsImpl;
  const _FetchSubscriptionItems._() : super._();

  int get id;
  @JsonKey(ignore: true)
  _$$FetchSubscriptionItemsImplCopyWith<_$FetchSubscriptionItemsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchFreeItemsImplCopyWith<$Res> {
  factory _$$FetchFreeItemsImplCopyWith(_$FetchFreeItemsImpl value,
          $Res Function(_$FetchFreeItemsImpl) then) =
      __$$FetchFreeItemsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int idSubscription, String idItem});
}

/// @nodoc
class __$$FetchFreeItemsImplCopyWithImpl<$Res>
    extends _$HomeApiCopyWithImpl<$Res, _$FetchFreeItemsImpl>
    implements _$$FetchFreeItemsImplCopyWith<$Res> {
  __$$FetchFreeItemsImplCopyWithImpl(
      _$FetchFreeItemsImpl _value, $Res Function(_$FetchFreeItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idSubscription = null,
    Object? idItem = null,
  }) {
    return _then(_$FetchFreeItemsImpl(
      idSubscription: null == idSubscription
          ? _value.idSubscription
          : idSubscription // ignore: cast_nullable_to_non_nullable
              as int,
      idItem: null == idItem
          ? _value.idItem
          : idItem // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchFreeItemsImpl extends _FetchFreeItems {
  const _$FetchFreeItemsImpl(
      {required this.idSubscription, required this.idItem})
      : super._();

  @override
  final int idSubscription;
  @override
  final String idItem;

  @override
  String toString() {
    return 'HomeApi.fetchFreeItems(idSubscription: $idSubscription, idItem: $idItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchFreeItemsImpl &&
            (identical(other.idSubscription, idSubscription) ||
                other.idSubscription == idSubscription) &&
            (identical(other.idItem, idItem) || other.idItem == idItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idSubscription, idItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchFreeItemsImplCopyWith<_$FetchFreeItemsImpl> get copyWith =>
      __$$FetchFreeItemsImplCopyWithImpl<_$FetchFreeItemsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchItems,
    required TResult Function() fetchCity,
    required TResult Function(int id) fetchSubscriptionItems,
    required TResult Function(int idSubscription, String idItem) fetchFreeItems,
    required TResult Function(BonusRequest body) orderSubscription,
    required TResult Function() fetchRatings,
    required TResult Function(ReviewRequest body, int id) sendReview,
    required TResult Function(int id) fetchQrMenu,
  }) {
    return fetchFreeItems(idSubscription, idItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchItems,
    TResult? Function()? fetchCity,
    TResult? Function(int id)? fetchSubscriptionItems,
    TResult? Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult? Function(BonusRequest body)? orderSubscription,
    TResult? Function()? fetchRatings,
    TResult? Function(ReviewRequest body, int id)? sendReview,
    TResult? Function(int id)? fetchQrMenu,
  }) {
    return fetchFreeItems?.call(idSubscription, idItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchItems,
    TResult Function()? fetchCity,
    TResult Function(int id)? fetchSubscriptionItems,
    TResult Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult Function(BonusRequest body)? orderSubscription,
    TResult Function()? fetchRatings,
    TResult Function(ReviewRequest body, int id)? sendReview,
    TResult Function(int id)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (fetchFreeItems != null) {
      return fetchFreeItems(idSubscription, idItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_FetchCity value) fetchCity,
    required TResult Function(_FetchSubscriptionItems value)
        fetchSubscriptionItems,
    required TResult Function(_FetchFreeItems value) fetchFreeItems,
    required TResult Function(_OrderSubscription value) orderSubscription,
    required TResult Function(_FetchRatings value) fetchRatings,
    required TResult Function(_SendReview value) sendReview,
    required TResult Function(_FetchQrMenu value) fetchQrMenu,
  }) {
    return fetchFreeItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_FetchCity value)? fetchCity,
    TResult? Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult? Function(_FetchFreeItems value)? fetchFreeItems,
    TResult? Function(_OrderSubscription value)? orderSubscription,
    TResult? Function(_FetchRatings value)? fetchRatings,
    TResult? Function(_SendReview value)? sendReview,
    TResult? Function(_FetchQrMenu value)? fetchQrMenu,
  }) {
    return fetchFreeItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_FetchCity value)? fetchCity,
    TResult Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult Function(_FetchFreeItems value)? fetchFreeItems,
    TResult Function(_OrderSubscription value)? orderSubscription,
    TResult Function(_FetchRatings value)? fetchRatings,
    TResult Function(_SendReview value)? sendReview,
    TResult Function(_FetchQrMenu value)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (fetchFreeItems != null) {
      return fetchFreeItems(this);
    }
    return orElse();
  }
}

abstract class _FetchFreeItems extends HomeApi {
  const factory _FetchFreeItems(
      {required final int idSubscription,
      required final String idItem}) = _$FetchFreeItemsImpl;
  const _FetchFreeItems._() : super._();

  int get idSubscription;
  String get idItem;
  @JsonKey(ignore: true)
  _$$FetchFreeItemsImplCopyWith<_$FetchFreeItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$HomeApiCopyWithImpl<$Res, _$OrderSubscriptionImpl>
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

class _$OrderSubscriptionImpl extends _OrderSubscription {
  const _$OrderSubscriptionImpl({required this.body}) : super._();

  @override
  final BonusRequest body;

  @override
  String toString() {
    return 'HomeApi.orderSubscription(body: $body)';
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
    required TResult Function() fetchNews,
    required TResult Function() fetchItems,
    required TResult Function() fetchCity,
    required TResult Function(int id) fetchSubscriptionItems,
    required TResult Function(int idSubscription, String idItem) fetchFreeItems,
    required TResult Function(BonusRequest body) orderSubscription,
    required TResult Function() fetchRatings,
    required TResult Function(ReviewRequest body, int id) sendReview,
    required TResult Function(int id) fetchQrMenu,
  }) {
    return orderSubscription(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchItems,
    TResult? Function()? fetchCity,
    TResult? Function(int id)? fetchSubscriptionItems,
    TResult? Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult? Function(BonusRequest body)? orderSubscription,
    TResult? Function()? fetchRatings,
    TResult? Function(ReviewRequest body, int id)? sendReview,
    TResult? Function(int id)? fetchQrMenu,
  }) {
    return orderSubscription?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchItems,
    TResult Function()? fetchCity,
    TResult Function(int id)? fetchSubscriptionItems,
    TResult Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult Function(BonusRequest body)? orderSubscription,
    TResult Function()? fetchRatings,
    TResult Function(ReviewRequest body, int id)? sendReview,
    TResult Function(int id)? fetchQrMenu,
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
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_FetchCity value) fetchCity,
    required TResult Function(_FetchSubscriptionItems value)
        fetchSubscriptionItems,
    required TResult Function(_FetchFreeItems value) fetchFreeItems,
    required TResult Function(_OrderSubscription value) orderSubscription,
    required TResult Function(_FetchRatings value) fetchRatings,
    required TResult Function(_SendReview value) sendReview,
    required TResult Function(_FetchQrMenu value) fetchQrMenu,
  }) {
    return orderSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_FetchCity value)? fetchCity,
    TResult? Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult? Function(_FetchFreeItems value)? fetchFreeItems,
    TResult? Function(_OrderSubscription value)? orderSubscription,
    TResult? Function(_FetchRatings value)? fetchRatings,
    TResult? Function(_SendReview value)? sendReview,
    TResult? Function(_FetchQrMenu value)? fetchQrMenu,
  }) {
    return orderSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_FetchCity value)? fetchCity,
    TResult Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult Function(_FetchFreeItems value)? fetchFreeItems,
    TResult Function(_OrderSubscription value)? orderSubscription,
    TResult Function(_FetchRatings value)? fetchRatings,
    TResult Function(_SendReview value)? sendReview,
    TResult Function(_FetchQrMenu value)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (orderSubscription != null) {
      return orderSubscription(this);
    }
    return orElse();
  }
}

abstract class _OrderSubscription extends HomeApi {
  const factory _OrderSubscription({required final BonusRequest body}) =
      _$OrderSubscriptionImpl;
  const _OrderSubscription._() : super._();

  BonusRequest get body;
  @JsonKey(ignore: true)
  _$$OrderSubscriptionImplCopyWith<_$OrderSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchRatingsImplCopyWith<$Res> {
  factory _$$FetchRatingsImplCopyWith(
          _$FetchRatingsImpl value, $Res Function(_$FetchRatingsImpl) then) =
      __$$FetchRatingsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchRatingsImplCopyWithImpl<$Res>
    extends _$HomeApiCopyWithImpl<$Res, _$FetchRatingsImpl>
    implements _$$FetchRatingsImplCopyWith<$Res> {
  __$$FetchRatingsImplCopyWithImpl(
      _$FetchRatingsImpl _value, $Res Function(_$FetchRatingsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchRatingsImpl extends _FetchRatings {
  const _$FetchRatingsImpl() : super._();

  @override
  String toString() {
    return 'HomeApi.fetchRatings()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchRatingsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchItems,
    required TResult Function() fetchCity,
    required TResult Function(int id) fetchSubscriptionItems,
    required TResult Function(int idSubscription, String idItem) fetchFreeItems,
    required TResult Function(BonusRequest body) orderSubscription,
    required TResult Function() fetchRatings,
    required TResult Function(ReviewRequest body, int id) sendReview,
    required TResult Function(int id) fetchQrMenu,
  }) {
    return fetchRatings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchItems,
    TResult? Function()? fetchCity,
    TResult? Function(int id)? fetchSubscriptionItems,
    TResult? Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult? Function(BonusRequest body)? orderSubscription,
    TResult? Function()? fetchRatings,
    TResult? Function(ReviewRequest body, int id)? sendReview,
    TResult? Function(int id)? fetchQrMenu,
  }) {
    return fetchRatings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchItems,
    TResult Function()? fetchCity,
    TResult Function(int id)? fetchSubscriptionItems,
    TResult Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult Function(BonusRequest body)? orderSubscription,
    TResult Function()? fetchRatings,
    TResult Function(ReviewRequest body, int id)? sendReview,
    TResult Function(int id)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (fetchRatings != null) {
      return fetchRatings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_FetchCity value) fetchCity,
    required TResult Function(_FetchSubscriptionItems value)
        fetchSubscriptionItems,
    required TResult Function(_FetchFreeItems value) fetchFreeItems,
    required TResult Function(_OrderSubscription value) orderSubscription,
    required TResult Function(_FetchRatings value) fetchRatings,
    required TResult Function(_SendReview value) sendReview,
    required TResult Function(_FetchQrMenu value) fetchQrMenu,
  }) {
    return fetchRatings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_FetchCity value)? fetchCity,
    TResult? Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult? Function(_FetchFreeItems value)? fetchFreeItems,
    TResult? Function(_OrderSubscription value)? orderSubscription,
    TResult? Function(_FetchRatings value)? fetchRatings,
    TResult? Function(_SendReview value)? sendReview,
    TResult? Function(_FetchQrMenu value)? fetchQrMenu,
  }) {
    return fetchRatings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_FetchCity value)? fetchCity,
    TResult Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult Function(_FetchFreeItems value)? fetchFreeItems,
    TResult Function(_OrderSubscription value)? orderSubscription,
    TResult Function(_FetchRatings value)? fetchRatings,
    TResult Function(_SendReview value)? sendReview,
    TResult Function(_FetchQrMenu value)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (fetchRatings != null) {
      return fetchRatings(this);
    }
    return orElse();
  }
}

abstract class _FetchRatings extends HomeApi {
  const factory _FetchRatings() = _$FetchRatingsImpl;
  const _FetchRatings._() : super._();
}

/// @nodoc
abstract class _$$SendReviewImplCopyWith<$Res> {
  factory _$$SendReviewImplCopyWith(
          _$SendReviewImpl value, $Res Function(_$SendReviewImpl) then) =
      __$$SendReviewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReviewRequest body, int id});
}

/// @nodoc
class __$$SendReviewImplCopyWithImpl<$Res>
    extends _$HomeApiCopyWithImpl<$Res, _$SendReviewImpl>
    implements _$$SendReviewImplCopyWith<$Res> {
  __$$SendReviewImplCopyWithImpl(
      _$SendReviewImpl _value, $Res Function(_$SendReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? id = null,
  }) {
    return _then(_$SendReviewImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as ReviewRequest,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SendReviewImpl extends _SendReview {
  const _$SendReviewImpl({required this.body, required this.id}) : super._();

  @override
  final ReviewRequest body;
  @override
  final int id;

  @override
  String toString() {
    return 'HomeApi.sendReview(body: $body, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendReviewImpl &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendReviewImplCopyWith<_$SendReviewImpl> get copyWith =>
      __$$SendReviewImplCopyWithImpl<_$SendReviewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchItems,
    required TResult Function() fetchCity,
    required TResult Function(int id) fetchSubscriptionItems,
    required TResult Function(int idSubscription, String idItem) fetchFreeItems,
    required TResult Function(BonusRequest body) orderSubscription,
    required TResult Function() fetchRatings,
    required TResult Function(ReviewRequest body, int id) sendReview,
    required TResult Function(int id) fetchQrMenu,
  }) {
    return sendReview(body, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchItems,
    TResult? Function()? fetchCity,
    TResult? Function(int id)? fetchSubscriptionItems,
    TResult? Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult? Function(BonusRequest body)? orderSubscription,
    TResult? Function()? fetchRatings,
    TResult? Function(ReviewRequest body, int id)? sendReview,
    TResult? Function(int id)? fetchQrMenu,
  }) {
    return sendReview?.call(body, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchItems,
    TResult Function()? fetchCity,
    TResult Function(int id)? fetchSubscriptionItems,
    TResult Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult Function(BonusRequest body)? orderSubscription,
    TResult Function()? fetchRatings,
    TResult Function(ReviewRequest body, int id)? sendReview,
    TResult Function(int id)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (sendReview != null) {
      return sendReview(body, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_FetchCity value) fetchCity,
    required TResult Function(_FetchSubscriptionItems value)
        fetchSubscriptionItems,
    required TResult Function(_FetchFreeItems value) fetchFreeItems,
    required TResult Function(_OrderSubscription value) orderSubscription,
    required TResult Function(_FetchRatings value) fetchRatings,
    required TResult Function(_SendReview value) sendReview,
    required TResult Function(_FetchQrMenu value) fetchQrMenu,
  }) {
    return sendReview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_FetchCity value)? fetchCity,
    TResult? Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult? Function(_FetchFreeItems value)? fetchFreeItems,
    TResult? Function(_OrderSubscription value)? orderSubscription,
    TResult? Function(_FetchRatings value)? fetchRatings,
    TResult? Function(_SendReview value)? sendReview,
    TResult? Function(_FetchQrMenu value)? fetchQrMenu,
  }) {
    return sendReview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_FetchCity value)? fetchCity,
    TResult Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult Function(_FetchFreeItems value)? fetchFreeItems,
    TResult Function(_OrderSubscription value)? orderSubscription,
    TResult Function(_FetchRatings value)? fetchRatings,
    TResult Function(_SendReview value)? sendReview,
    TResult Function(_FetchQrMenu value)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (sendReview != null) {
      return sendReview(this);
    }
    return orElse();
  }
}

abstract class _SendReview extends HomeApi {
  const factory _SendReview(
      {required final ReviewRequest body,
      required final int id}) = _$SendReviewImpl;
  const _SendReview._() : super._();

  ReviewRequest get body;
  int get id;
  @JsonKey(ignore: true)
  _$$SendReviewImplCopyWith<_$SendReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchQrMenuImplCopyWith<$Res> {
  factory _$$FetchQrMenuImplCopyWith(
          _$FetchQrMenuImpl value, $Res Function(_$FetchQrMenuImpl) then) =
      __$$FetchQrMenuImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$FetchQrMenuImplCopyWithImpl<$Res>
    extends _$HomeApiCopyWithImpl<$Res, _$FetchQrMenuImpl>
    implements _$$FetchQrMenuImplCopyWith<$Res> {
  __$$FetchQrMenuImplCopyWithImpl(
      _$FetchQrMenuImpl _value, $Res Function(_$FetchQrMenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchQrMenuImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchQrMenuImpl extends _FetchQrMenu {
  const _$FetchQrMenuImpl({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'HomeApi.fetchQrMenu(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchQrMenuImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchQrMenuImplCopyWith<_$FetchQrMenuImpl> get copyWith =>
      __$$FetchQrMenuImplCopyWithImpl<_$FetchQrMenuImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchItems,
    required TResult Function() fetchCity,
    required TResult Function(int id) fetchSubscriptionItems,
    required TResult Function(int idSubscription, String idItem) fetchFreeItems,
    required TResult Function(BonusRequest body) orderSubscription,
    required TResult Function() fetchRatings,
    required TResult Function(ReviewRequest body, int id) sendReview,
    required TResult Function(int id) fetchQrMenu,
  }) {
    return fetchQrMenu(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchItems,
    TResult? Function()? fetchCity,
    TResult? Function(int id)? fetchSubscriptionItems,
    TResult? Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult? Function(BonusRequest body)? orderSubscription,
    TResult? Function()? fetchRatings,
    TResult? Function(ReviewRequest body, int id)? sendReview,
    TResult? Function(int id)? fetchQrMenu,
  }) {
    return fetchQrMenu?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchItems,
    TResult Function()? fetchCity,
    TResult Function(int id)? fetchSubscriptionItems,
    TResult Function(int idSubscription, String idItem)? fetchFreeItems,
    TResult Function(BonusRequest body)? orderSubscription,
    TResult Function()? fetchRatings,
    TResult Function(ReviewRequest body, int id)? sendReview,
    TResult Function(int id)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (fetchQrMenu != null) {
      return fetchQrMenu(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_FetchCity value) fetchCity,
    required TResult Function(_FetchSubscriptionItems value)
        fetchSubscriptionItems,
    required TResult Function(_FetchFreeItems value) fetchFreeItems,
    required TResult Function(_OrderSubscription value) orderSubscription,
    required TResult Function(_FetchRatings value) fetchRatings,
    required TResult Function(_SendReview value) sendReview,
    required TResult Function(_FetchQrMenu value) fetchQrMenu,
  }) {
    return fetchQrMenu(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_FetchCity value)? fetchCity,
    TResult? Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult? Function(_FetchFreeItems value)? fetchFreeItems,
    TResult? Function(_OrderSubscription value)? orderSubscription,
    TResult? Function(_FetchRatings value)? fetchRatings,
    TResult? Function(_SendReview value)? sendReview,
    TResult? Function(_FetchQrMenu value)? fetchQrMenu,
  }) {
    return fetchQrMenu?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_FetchCity value)? fetchCity,
    TResult Function(_FetchSubscriptionItems value)? fetchSubscriptionItems,
    TResult Function(_FetchFreeItems value)? fetchFreeItems,
    TResult Function(_OrderSubscription value)? orderSubscription,
    TResult Function(_FetchRatings value)? fetchRatings,
    TResult Function(_SendReview value)? sendReview,
    TResult Function(_FetchQrMenu value)? fetchQrMenu,
    required TResult orElse(),
  }) {
    if (fetchQrMenu != null) {
      return fetchQrMenu(this);
    }
    return orElse();
  }
}

abstract class _FetchQrMenu extends HomeApi {
  const factory _FetchQrMenu({required final int id}) = _$FetchQrMenuImpl;
  const _FetchQrMenu._() : super._();

  int get id;
  @JsonKey(ignore: true)
  _$$FetchQrMenuImplCopyWith<_$FetchQrMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
