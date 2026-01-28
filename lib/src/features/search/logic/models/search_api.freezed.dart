// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchApi {
  String get keyword => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyword) searchRequest,
    required TResult Function(String keyword) filterRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String keyword)? searchRequest,
    TResult? Function(String keyword)? filterRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyword)? searchRequest,
    TResult Function(String keyword)? filterRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchRequest value) searchRequest,
    required TResult Function(_FilterRequest value) filterRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchRequest value)? searchRequest,
    TResult? Function(_FilterRequest value)? filterRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchRequest value)? searchRequest,
    TResult Function(_FilterRequest value)? filterRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchApiCopyWith<SearchApi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchApiCopyWith<$Res> {
  factory $SearchApiCopyWith(SearchApi value, $Res Function(SearchApi) then) =
      _$SearchApiCopyWithImpl<$Res, SearchApi>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class _$SearchApiCopyWithImpl<$Res, $Val extends SearchApi>
    implements $SearchApiCopyWith<$Res> {
  _$SearchApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_value.copyWith(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchRequestImplCopyWith<$Res>
    implements $SearchApiCopyWith<$Res> {
  factory _$$SearchRequestImplCopyWith(
          _$SearchRequestImpl value, $Res Function(_$SearchRequestImpl) then) =
      __$$SearchRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$SearchRequestImplCopyWithImpl<$Res>
    extends _$SearchApiCopyWithImpl<$Res, _$SearchRequestImpl>
    implements _$$SearchRequestImplCopyWith<$Res> {
  __$$SearchRequestImplCopyWithImpl(
      _$SearchRequestImpl _value, $Res Function(_$SearchRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_$SearchRequestImpl(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchRequestImpl extends _SearchRequest {
  const _$SearchRequestImpl({required this.keyword}) : super._();

  @override
  final String keyword;

  @override
  String toString() {
    return 'SearchApi.searchRequest(keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRequestImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchRequestImplCopyWith<_$SearchRequestImpl> get copyWith =>
      __$$SearchRequestImplCopyWithImpl<_$SearchRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyword) searchRequest,
    required TResult Function(String keyword) filterRequest,
  }) {
    return searchRequest(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String keyword)? searchRequest,
    TResult? Function(String keyword)? filterRequest,
  }) {
    return searchRequest?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyword)? searchRequest,
    TResult Function(String keyword)? filterRequest,
    required TResult orElse(),
  }) {
    if (searchRequest != null) {
      return searchRequest(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchRequest value) searchRequest,
    required TResult Function(_FilterRequest value) filterRequest,
  }) {
    return searchRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchRequest value)? searchRequest,
    TResult? Function(_FilterRequest value)? filterRequest,
  }) {
    return searchRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchRequest value)? searchRequest,
    TResult Function(_FilterRequest value)? filterRequest,
    required TResult orElse(),
  }) {
    if (searchRequest != null) {
      return searchRequest(this);
    }
    return orElse();
  }
}

abstract class _SearchRequest extends SearchApi {
  const factory _SearchRequest({required final String keyword}) =
      _$SearchRequestImpl;
  const _SearchRequest._() : super._();

  @override
  String get keyword;
  @override
  @JsonKey(ignore: true)
  _$$SearchRequestImplCopyWith<_$SearchRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterRequestImplCopyWith<$Res>
    implements $SearchApiCopyWith<$Res> {
  factory _$$FilterRequestImplCopyWith(
          _$FilterRequestImpl value, $Res Function(_$FilterRequestImpl) then) =
      __$$FilterRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$FilterRequestImplCopyWithImpl<$Res>
    extends _$SearchApiCopyWithImpl<$Res, _$FilterRequestImpl>
    implements _$$FilterRequestImplCopyWith<$Res> {
  __$$FilterRequestImplCopyWithImpl(
      _$FilterRequestImpl _value, $Res Function(_$FilterRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_$FilterRequestImpl(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilterRequestImpl extends _FilterRequest {
  const _$FilterRequestImpl({required this.keyword}) : super._();

  @override
  final String keyword;

  @override
  String toString() {
    return 'SearchApi.filterRequest(keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterRequestImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterRequestImplCopyWith<_$FilterRequestImpl> get copyWith =>
      __$$FilterRequestImplCopyWithImpl<_$FilterRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyword) searchRequest,
    required TResult Function(String keyword) filterRequest,
  }) {
    return filterRequest(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String keyword)? searchRequest,
    TResult? Function(String keyword)? filterRequest,
  }) {
    return filterRequest?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyword)? searchRequest,
    TResult Function(String keyword)? filterRequest,
    required TResult orElse(),
  }) {
    if (filterRequest != null) {
      return filterRequest(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchRequest value) searchRequest,
    required TResult Function(_FilterRequest value) filterRequest,
  }) {
    return filterRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchRequest value)? searchRequest,
    TResult? Function(_FilterRequest value)? filterRequest,
  }) {
    return filterRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchRequest value)? searchRequest,
    TResult Function(_FilterRequest value)? filterRequest,
    required TResult orElse(),
  }) {
    if (filterRequest != null) {
      return filterRequest(this);
    }
    return orElse();
  }
}

abstract class _FilterRequest extends SearchApi {
  const factory _FilterRequest({required final String keyword}) =
      _$FilterRequestImpl;
  const _FilterRequest._() : super._();

  @override
  String get keyword;
  @override
  @JsonKey(ignore: true)
  _$$FilterRequestImplCopyWith<_$FilterRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
