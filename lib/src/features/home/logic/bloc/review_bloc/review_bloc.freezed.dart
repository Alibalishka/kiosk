// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRatings,
    required TResult Function(ReviewRequest body, int id) sendReview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRatings,
    TResult? Function(ReviewRequest body, int id)? sendReview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRatings,
    TResult Function(ReviewRequest body, int id)? sendReview,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRatings value) fetchRatings,
    required TResult Function(_SendReview value) sendReview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRatings value)? fetchRatings,
    TResult? Function(_SendReview value)? sendReview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRatings value)? fetchRatings,
    TResult Function(_SendReview value)? sendReview,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewEventCopyWith<$Res> {
  factory $ReviewEventCopyWith(
          ReviewEvent value, $Res Function(ReviewEvent) then) =
      _$ReviewEventCopyWithImpl<$Res, ReviewEvent>;
}

/// @nodoc
class _$ReviewEventCopyWithImpl<$Res, $Val extends ReviewEvent>
    implements $ReviewEventCopyWith<$Res> {
  _$ReviewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchRatingsImplCopyWith<$Res> {
  factory _$$FetchRatingsImplCopyWith(
          _$FetchRatingsImpl value, $Res Function(_$FetchRatingsImpl) then) =
      __$$FetchRatingsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchRatingsImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$FetchRatingsImpl>
    implements _$$FetchRatingsImplCopyWith<$Res> {
  __$$FetchRatingsImplCopyWithImpl(
      _$FetchRatingsImpl _value, $Res Function(_$FetchRatingsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchRatingsImpl implements _FetchRatings {
  const _$FetchRatingsImpl();

  @override
  String toString() {
    return 'ReviewEvent.fetchRatings()';
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
    required TResult Function() fetchRatings,
    required TResult Function(ReviewRequest body, int id) sendReview,
  }) {
    return fetchRatings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRatings,
    TResult? Function(ReviewRequest body, int id)? sendReview,
  }) {
    return fetchRatings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRatings,
    TResult Function(ReviewRequest body, int id)? sendReview,
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
    required TResult Function(_FetchRatings value) fetchRatings,
    required TResult Function(_SendReview value) sendReview,
  }) {
    return fetchRatings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRatings value)? fetchRatings,
    TResult? Function(_SendReview value)? sendReview,
  }) {
    return fetchRatings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRatings value)? fetchRatings,
    TResult Function(_SendReview value)? sendReview,
    required TResult orElse(),
  }) {
    if (fetchRatings != null) {
      return fetchRatings(this);
    }
    return orElse();
  }
}

abstract class _FetchRatings implements ReviewEvent {
  const factory _FetchRatings() = _$FetchRatingsImpl;
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
    extends _$ReviewEventCopyWithImpl<$Res, _$SendReviewImpl>
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

class _$SendReviewImpl implements _SendReview {
  const _$SendReviewImpl({required this.body, required this.id});

  @override
  final ReviewRequest body;
  @override
  final int id;

  @override
  String toString() {
    return 'ReviewEvent.sendReview(body: $body, id: $id)';
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
    required TResult Function() fetchRatings,
    required TResult Function(ReviewRequest body, int id) sendReview,
  }) {
    return sendReview(body, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRatings,
    TResult? Function(ReviewRequest body, int id)? sendReview,
  }) {
    return sendReview?.call(body, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRatings,
    TResult Function(ReviewRequest body, int id)? sendReview,
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
    required TResult Function(_FetchRatings value) fetchRatings,
    required TResult Function(_SendReview value) sendReview,
  }) {
    return sendReview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRatings value)? fetchRatings,
    TResult? Function(_SendReview value)? sendReview,
  }) {
    return sendReview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRatings value)? fetchRatings,
    TResult Function(_SendReview value)? sendReview,
    required TResult orElse(),
  }) {
    if (sendReview != null) {
      return sendReview(this);
    }
    return orElse();
  }
}

abstract class _SendReview implements ReviewEvent {
  const factory _SendReview(
      {required final ReviewRequest body,
      required final int id}) = _$SendReviewImpl;

  ReviewRequest get body;
  int get id;
  @JsonKey(ignore: true)
  _$$SendReviewImplCopyWith<_$SendReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReviewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReviewModel ratingEntity) successFetch,
    required TResult Function() successSend,
    required TResult Function() sendLoading,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReviewModel ratingEntity)? successFetch,
    TResult? Function()? successSend,
    TResult? Function()? sendLoading,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReviewModel ratingEntity)? successFetch,
    TResult Function()? successSend,
    TResult Function()? sendLoading,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessFetch value) successFetch,
    required TResult Function(_SuccessSend value) successSend,
    required TResult Function(_SendLoading value) sendLoading,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessFetch value)? successFetch,
    TResult? Function(_SuccessSend value)? successSend,
    TResult? Function(_SendLoading value)? sendLoading,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessFetch value)? successFetch,
    TResult Function(_SuccessSend value)? successSend,
    TResult Function(_SendLoading value)? sendLoading,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewStateCopyWith<$Res> {
  factory $ReviewStateCopyWith(
          ReviewState value, $Res Function(ReviewState) then) =
      _$ReviewStateCopyWithImpl<$Res, ReviewState>;
}

/// @nodoc
class _$ReviewStateCopyWithImpl<$Res, $Val extends ReviewState>
    implements $ReviewStateCopyWith<$Res> {
  _$ReviewStateCopyWithImpl(this._value, this._then);

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
    extends _$ReviewStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ReviewState.initial()';
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
    required TResult Function(ReviewModel ratingEntity) successFetch,
    required TResult Function() successSend,
    required TResult Function() sendLoading,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReviewModel ratingEntity)? successFetch,
    TResult? Function()? successSend,
    TResult? Function()? sendLoading,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReviewModel ratingEntity)? successFetch,
    TResult Function()? successSend,
    TResult Function()? sendLoading,
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
    required TResult Function(_SuccessFetch value) successFetch,
    required TResult Function(_SuccessSend value) successSend,
    required TResult Function(_SendLoading value) sendLoading,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessFetch value)? successFetch,
    TResult? Function(_SuccessSend value)? successSend,
    TResult? Function(_SendLoading value)? sendLoading,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessFetch value)? successFetch,
    TResult Function(_SuccessSend value)? successSend,
    TResult Function(_SendLoading value)? sendLoading,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ReviewState {
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
    extends _$ReviewStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'ReviewState.loading()';
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
    required TResult Function(ReviewModel ratingEntity) successFetch,
    required TResult Function() successSend,
    required TResult Function() sendLoading,
    required TResult Function(String message) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReviewModel ratingEntity)? successFetch,
    TResult? Function()? successSend,
    TResult? Function()? sendLoading,
    TResult? Function(String message)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReviewModel ratingEntity)? successFetch,
    TResult Function()? successSend,
    TResult Function()? sendLoading,
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
    required TResult Function(_SuccessFetch value) successFetch,
    required TResult Function(_SuccessSend value) successSend,
    required TResult Function(_SendLoading value) sendLoading,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessFetch value)? successFetch,
    TResult? Function(_SuccessSend value)? successSend,
    TResult? Function(_SendLoading value)? sendLoading,
    TResult? Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessFetch value)? successFetch,
    TResult Function(_SuccessSend value)? successSend,
    TResult Function(_SendLoading value)? sendLoading,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ReviewState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessFetchImplCopyWith<$Res> {
  factory _$$SuccessFetchImplCopyWith(
          _$SuccessFetchImpl value, $Res Function(_$SuccessFetchImpl) then) =
      __$$SuccessFetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReviewModel ratingEntity});
}

/// @nodoc
class __$$SuccessFetchImplCopyWithImpl<$Res>
    extends _$ReviewStateCopyWithImpl<$Res, _$SuccessFetchImpl>
    implements _$$SuccessFetchImplCopyWith<$Res> {
  __$$SuccessFetchImplCopyWithImpl(
      _$SuccessFetchImpl _value, $Res Function(_$SuccessFetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratingEntity = null,
  }) {
    return _then(_$SuccessFetchImpl(
      ratingEntity: null == ratingEntity
          ? _value.ratingEntity
          : ratingEntity // ignore: cast_nullable_to_non_nullable
              as ReviewModel,
    ));
  }
}

/// @nodoc

class _$SuccessFetchImpl implements _SuccessFetch {
  const _$SuccessFetchImpl({required this.ratingEntity});

  @override
  final ReviewModel ratingEntity;

  @override
  String toString() {
    return 'ReviewState.successFetch(ratingEntity: $ratingEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessFetchImpl &&
            (identical(other.ratingEntity, ratingEntity) ||
                other.ratingEntity == ratingEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ratingEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessFetchImplCopyWith<_$SuccessFetchImpl> get copyWith =>
      __$$SuccessFetchImplCopyWithImpl<_$SuccessFetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReviewModel ratingEntity) successFetch,
    required TResult Function() successSend,
    required TResult Function() sendLoading,
    required TResult Function(String message) failed,
  }) {
    return successFetch(ratingEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReviewModel ratingEntity)? successFetch,
    TResult? Function()? successSend,
    TResult? Function()? sendLoading,
    TResult? Function(String message)? failed,
  }) {
    return successFetch?.call(ratingEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReviewModel ratingEntity)? successFetch,
    TResult Function()? successSend,
    TResult Function()? sendLoading,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successFetch != null) {
      return successFetch(ratingEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessFetch value) successFetch,
    required TResult Function(_SuccessSend value) successSend,
    required TResult Function(_SendLoading value) sendLoading,
    required TResult Function(_Failed value) failed,
  }) {
    return successFetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessFetch value)? successFetch,
    TResult? Function(_SuccessSend value)? successSend,
    TResult? Function(_SendLoading value)? sendLoading,
    TResult? Function(_Failed value)? failed,
  }) {
    return successFetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessFetch value)? successFetch,
    TResult Function(_SuccessSend value)? successSend,
    TResult Function(_SendLoading value)? sendLoading,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successFetch != null) {
      return successFetch(this);
    }
    return orElse();
  }
}

abstract class _SuccessFetch implements ReviewState {
  const factory _SuccessFetch({required final ReviewModel ratingEntity}) =
      _$SuccessFetchImpl;

  ReviewModel get ratingEntity;
  @JsonKey(ignore: true)
  _$$SuccessFetchImplCopyWith<_$SuccessFetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessSendImplCopyWith<$Res> {
  factory _$$SuccessSendImplCopyWith(
          _$SuccessSendImpl value, $Res Function(_$SuccessSendImpl) then) =
      __$$SuccessSendImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessSendImplCopyWithImpl<$Res>
    extends _$ReviewStateCopyWithImpl<$Res, _$SuccessSendImpl>
    implements _$$SuccessSendImplCopyWith<$Res> {
  __$$SuccessSendImplCopyWithImpl(
      _$SuccessSendImpl _value, $Res Function(_$SuccessSendImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessSendImpl implements _SuccessSend {
  const _$SuccessSendImpl();

  @override
  String toString() {
    return 'ReviewState.successSend()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessSendImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReviewModel ratingEntity) successFetch,
    required TResult Function() successSend,
    required TResult Function() sendLoading,
    required TResult Function(String message) failed,
  }) {
    return successSend();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReviewModel ratingEntity)? successFetch,
    TResult? Function()? successSend,
    TResult? Function()? sendLoading,
    TResult? Function(String message)? failed,
  }) {
    return successSend?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReviewModel ratingEntity)? successFetch,
    TResult Function()? successSend,
    TResult Function()? sendLoading,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successSend != null) {
      return successSend();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessFetch value) successFetch,
    required TResult Function(_SuccessSend value) successSend,
    required TResult Function(_SendLoading value) sendLoading,
    required TResult Function(_Failed value) failed,
  }) {
    return successSend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessFetch value)? successFetch,
    TResult? Function(_SuccessSend value)? successSend,
    TResult? Function(_SendLoading value)? sendLoading,
    TResult? Function(_Failed value)? failed,
  }) {
    return successSend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessFetch value)? successFetch,
    TResult Function(_SuccessSend value)? successSend,
    TResult Function(_SendLoading value)? sendLoading,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successSend != null) {
      return successSend(this);
    }
    return orElse();
  }
}

abstract class _SuccessSend implements ReviewState {
  const factory _SuccessSend() = _$SuccessSendImpl;
}

/// @nodoc
abstract class _$$SendLoadingImplCopyWith<$Res> {
  factory _$$SendLoadingImplCopyWith(
          _$SendLoadingImpl value, $Res Function(_$SendLoadingImpl) then) =
      __$$SendLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendLoadingImplCopyWithImpl<$Res>
    extends _$ReviewStateCopyWithImpl<$Res, _$SendLoadingImpl>
    implements _$$SendLoadingImplCopyWith<$Res> {
  __$$SendLoadingImplCopyWithImpl(
      _$SendLoadingImpl _value, $Res Function(_$SendLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendLoadingImpl implements _SendLoading {
  const _$SendLoadingImpl();

  @override
  String toString() {
    return 'ReviewState.sendLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReviewModel ratingEntity) successFetch,
    required TResult Function() successSend,
    required TResult Function() sendLoading,
    required TResult Function(String message) failed,
  }) {
    return sendLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReviewModel ratingEntity)? successFetch,
    TResult? Function()? successSend,
    TResult? Function()? sendLoading,
    TResult? Function(String message)? failed,
  }) {
    return sendLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReviewModel ratingEntity)? successFetch,
    TResult Function()? successSend,
    TResult Function()? sendLoading,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (sendLoading != null) {
      return sendLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessFetch value) successFetch,
    required TResult Function(_SuccessSend value) successSend,
    required TResult Function(_SendLoading value) sendLoading,
    required TResult Function(_Failed value) failed,
  }) {
    return sendLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessFetch value)? successFetch,
    TResult? Function(_SuccessSend value)? successSend,
    TResult? Function(_SendLoading value)? sendLoading,
    TResult? Function(_Failed value)? failed,
  }) {
    return sendLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessFetch value)? successFetch,
    TResult Function(_SuccessSend value)? successSend,
    TResult Function(_SendLoading value)? sendLoading,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (sendLoading != null) {
      return sendLoading(this);
    }
    return orElse();
  }
}

abstract class _SendLoading implements ReviewState {
  const factory _SendLoading() = _$SendLoadingImpl;
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
    extends _$ReviewStateCopyWithImpl<$Res, _$FailedImpl>
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
    return 'ReviewState.failed(message: $message)';
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
    required TResult Function(ReviewModel ratingEntity) successFetch,
    required TResult Function() successSend,
    required TResult Function() sendLoading,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReviewModel ratingEntity)? successFetch,
    TResult? Function()? successSend,
    TResult? Function()? sendLoading,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReviewModel ratingEntity)? successFetch,
    TResult Function()? successSend,
    TResult Function()? sendLoading,
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
    required TResult Function(_SuccessFetch value) successFetch,
    required TResult Function(_SuccessSend value) successSend,
    required TResult Function(_SendLoading value) sendLoading,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessFetch value)? successFetch,
    TResult? Function(_SuccessSend value)? successSend,
    TResult? Function(_SendLoading value)? sendLoading,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessFetch value)? successFetch,
    TResult Function(_SuccessSend value)? successSend,
    TResult Function(_SendLoading value)? sendLoading,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements ReviewState {
  const factory _Failed({final String message}) = _$FailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
