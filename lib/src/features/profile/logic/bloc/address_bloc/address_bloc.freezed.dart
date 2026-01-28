// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAddress,
    required TResult Function() refreshAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function(int id) selectAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAddress,
    TResult? Function()? refreshAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function(int id)? selectAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAddress,
    TResult Function()? refreshAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function(int id)? selectAddress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_RefreshAddress value) refreshAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_SelectAddress value) selectAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_RefreshAddress value)? refreshAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_RefreshAddress value)? refreshAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressEventCopyWith<$Res> {
  factory $AddressEventCopyWith(
          AddressEvent value, $Res Function(AddressEvent) then) =
      _$AddressEventCopyWithImpl<$Res, AddressEvent>;
}

/// @nodoc
class _$AddressEventCopyWithImpl<$Res, $Val extends AddressEvent>
    implements $AddressEventCopyWith<$Res> {
  _$AddressEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchAddressImplCopyWith<$Res> {
  factory _$$FetchAddressImplCopyWith(
          _$FetchAddressImpl value, $Res Function(_$FetchAddressImpl) then) =
      __$$FetchAddressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAddressImplCopyWithImpl<$Res>
    extends _$AddressEventCopyWithImpl<$Res, _$FetchAddressImpl>
    implements _$$FetchAddressImplCopyWith<$Res> {
  __$$FetchAddressImplCopyWithImpl(
      _$FetchAddressImpl _value, $Res Function(_$FetchAddressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchAddressImpl implements _FetchAddress {
  const _$FetchAddressImpl();

  @override
  String toString() {
    return 'AddressEvent.fetchAddress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchAddressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAddress,
    required TResult Function() refreshAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function(int id) selectAddress,
  }) {
    return fetchAddress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAddress,
    TResult? Function()? refreshAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function(int id)? selectAddress,
  }) {
    return fetchAddress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAddress,
    TResult Function()? refreshAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function(int id)? selectAddress,
    required TResult orElse(),
  }) {
    if (fetchAddress != null) {
      return fetchAddress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_RefreshAddress value) refreshAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_SelectAddress value) selectAddress,
  }) {
    return fetchAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_RefreshAddress value)? refreshAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
  }) {
    return fetchAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_RefreshAddress value)? refreshAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    required TResult orElse(),
  }) {
    if (fetchAddress != null) {
      return fetchAddress(this);
    }
    return orElse();
  }
}

abstract class _FetchAddress implements AddressEvent {
  const factory _FetchAddress() = _$FetchAddressImpl;
}

/// @nodoc
abstract class _$$RefreshAddressImplCopyWith<$Res> {
  factory _$$RefreshAddressImplCopyWith(_$RefreshAddressImpl value,
          $Res Function(_$RefreshAddressImpl) then) =
      __$$RefreshAddressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshAddressImplCopyWithImpl<$Res>
    extends _$AddressEventCopyWithImpl<$Res, _$RefreshAddressImpl>
    implements _$$RefreshAddressImplCopyWith<$Res> {
  __$$RefreshAddressImplCopyWithImpl(
      _$RefreshAddressImpl _value, $Res Function(_$RefreshAddressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshAddressImpl implements _RefreshAddress {
  const _$RefreshAddressImpl();

  @override
  String toString() {
    return 'AddressEvent.refreshAddress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshAddressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAddress,
    required TResult Function() refreshAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function(int id) selectAddress,
  }) {
    return refreshAddress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAddress,
    TResult? Function()? refreshAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function(int id)? selectAddress,
  }) {
    return refreshAddress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAddress,
    TResult Function()? refreshAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function(int id)? selectAddress,
    required TResult orElse(),
  }) {
    if (refreshAddress != null) {
      return refreshAddress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_RefreshAddress value) refreshAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_SelectAddress value) selectAddress,
  }) {
    return refreshAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_RefreshAddress value)? refreshAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
  }) {
    return refreshAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_RefreshAddress value)? refreshAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    required TResult orElse(),
  }) {
    if (refreshAddress != null) {
      return refreshAddress(this);
    }
    return orElse();
  }
}

abstract class _RefreshAddress implements AddressEvent {
  const factory _RefreshAddress() = _$RefreshAddressImpl;
}

/// @nodoc
abstract class _$$SaveAddressImplCopyWith<$Res> {
  factory _$$SaveAddressImplCopyWith(
          _$SaveAddressImpl value, $Res Function(_$SaveAddressImpl) then) =
      __$$SaveAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressRequest body});
}

/// @nodoc
class __$$SaveAddressImplCopyWithImpl<$Res>
    extends _$AddressEventCopyWithImpl<$Res, _$SaveAddressImpl>
    implements _$$SaveAddressImplCopyWith<$Res> {
  __$$SaveAddressImplCopyWithImpl(
      _$SaveAddressImpl _value, $Res Function(_$SaveAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$SaveAddressImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as AddressRequest,
    ));
  }
}

/// @nodoc

class _$SaveAddressImpl implements _SaveAddress {
  const _$SaveAddressImpl({required this.body});

  @override
  final AddressRequest body;

  @override
  String toString() {
    return 'AddressEvent.saveAddress(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveAddressImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveAddressImplCopyWith<_$SaveAddressImpl> get copyWith =>
      __$$SaveAddressImplCopyWithImpl<_$SaveAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAddress,
    required TResult Function() refreshAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function(int id) selectAddress,
  }) {
    return saveAddress(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAddress,
    TResult? Function()? refreshAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function(int id)? selectAddress,
  }) {
    return saveAddress?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAddress,
    TResult Function()? refreshAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function(int id)? selectAddress,
    required TResult orElse(),
  }) {
    if (saveAddress != null) {
      return saveAddress(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_RefreshAddress value) refreshAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_SelectAddress value) selectAddress,
  }) {
    return saveAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_RefreshAddress value)? refreshAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
  }) {
    return saveAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_RefreshAddress value)? refreshAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    required TResult orElse(),
  }) {
    if (saveAddress != null) {
      return saveAddress(this);
    }
    return orElse();
  }
}

abstract class _SaveAddress implements AddressEvent {
  const factory _SaveAddress({required final AddressRequest body}) =
      _$SaveAddressImpl;

  AddressRequest get body;
  @JsonKey(ignore: true)
  _$$SaveAddressImplCopyWith<_$SaveAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteAddressImplCopyWith<$Res> {
  factory _$$DeleteAddressImplCopyWith(
          _$DeleteAddressImpl value, $Res Function(_$DeleteAddressImpl) then) =
      __$$DeleteAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteAddressImplCopyWithImpl<$Res>
    extends _$AddressEventCopyWithImpl<$Res, _$DeleteAddressImpl>
    implements _$$DeleteAddressImplCopyWith<$Res> {
  __$$DeleteAddressImplCopyWithImpl(
      _$DeleteAddressImpl _value, $Res Function(_$DeleteAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteAddressImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteAddressImpl implements _DeleteAddress {
  const _$DeleteAddressImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'AddressEvent.deleteAddress(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAddressImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAddressImplCopyWith<_$DeleteAddressImpl> get copyWith =>
      __$$DeleteAddressImplCopyWithImpl<_$DeleteAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAddress,
    required TResult Function() refreshAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function(int id) selectAddress,
  }) {
    return deleteAddress(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAddress,
    TResult? Function()? refreshAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function(int id)? selectAddress,
  }) {
    return deleteAddress?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAddress,
    TResult Function()? refreshAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function(int id)? selectAddress,
    required TResult orElse(),
  }) {
    if (deleteAddress != null) {
      return deleteAddress(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_RefreshAddress value) refreshAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_SelectAddress value) selectAddress,
  }) {
    return deleteAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_RefreshAddress value)? refreshAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
  }) {
    return deleteAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_RefreshAddress value)? refreshAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    required TResult orElse(),
  }) {
    if (deleteAddress != null) {
      return deleteAddress(this);
    }
    return orElse();
  }
}

abstract class _DeleteAddress implements AddressEvent {
  const factory _DeleteAddress({required final int id}) = _$DeleteAddressImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteAddressImplCopyWith<_$DeleteAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectAddressImplCopyWith<$Res> {
  factory _$$SelectAddressImplCopyWith(
          _$SelectAddressImpl value, $Res Function(_$SelectAddressImpl) then) =
      __$$SelectAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$SelectAddressImplCopyWithImpl<$Res>
    extends _$AddressEventCopyWithImpl<$Res, _$SelectAddressImpl>
    implements _$$SelectAddressImplCopyWith<$Res> {
  __$$SelectAddressImplCopyWithImpl(
      _$SelectAddressImpl _value, $Res Function(_$SelectAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$SelectAddressImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectAddressImpl implements _SelectAddress {
  const _$SelectAddressImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'AddressEvent.selectAddress(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectAddressImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectAddressImplCopyWith<_$SelectAddressImpl> get copyWith =>
      __$$SelectAddressImplCopyWithImpl<_$SelectAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAddress,
    required TResult Function() refreshAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function(int id) selectAddress,
  }) {
    return selectAddress(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAddress,
    TResult? Function()? refreshAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function(int id)? selectAddress,
  }) {
    return selectAddress?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAddress,
    TResult Function()? refreshAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function(int id)? selectAddress,
    required TResult orElse(),
  }) {
    if (selectAddress != null) {
      return selectAddress(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_RefreshAddress value) refreshAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_SelectAddress value) selectAddress,
  }) {
    return selectAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_RefreshAddress value)? refreshAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
  }) {
    return selectAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_RefreshAddress value)? refreshAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    required TResult orElse(),
  }) {
    if (selectAddress != null) {
      return selectAddress(this);
    }
    return orElse();
  }
}

abstract class _SelectAddress implements AddressEvent {
  const factory _SelectAddress({required final int id}) = _$SelectAddressImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$SelectAddressImplCopyWith<_$SelectAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddressState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AddressResponseModel addressResponseModel)
        success,
    required TResult Function(String message) failed,
    required TResult Function() saveLoading,
    required TResult Function() saveSuccess,
    required TResult Function(String message) saveFailed,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function() selectLoading,
    required TResult Function() selectSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AddressResponseModel addressResponseModel)? success,
    TResult? Function(String message)? failed,
    TResult? Function()? saveLoading,
    TResult? Function()? saveSuccess,
    TResult? Function(String message)? saveFailed,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function()? selectLoading,
    TResult? Function()? selectSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AddressResponseModel addressResponseModel)? success,
    TResult Function(String message)? failed,
    TResult Function()? saveLoading,
    TResult Function()? saveSuccess,
    TResult Function(String message)? saveFailed,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function()? selectLoading,
    TResult Function()? selectSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAddress value) loading,
    required TResult Function(_SuccessAddress value) success,
    required TResult Function(_FailedAddress value) failed,
    required TResult Function(_SaveLoadingAddress value) saveLoading,
    required TResult Function(_SaveSuccessAddress value) saveSuccess,
    required TResult Function(_SaveFailedAddress value) saveFailed,
    required TResult Function(_DeleteLoading value) deleteLoading,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_SelectLoading value) selectLoading,
    required TResult Function(_SelectSuccess value) selectSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAddress value)? loading,
    TResult? Function(_SuccessAddress value)? success,
    TResult? Function(_FailedAddress value)? failed,
    TResult? Function(_SaveLoadingAddress value)? saveLoading,
    TResult? Function(_SaveSuccessAddress value)? saveSuccess,
    TResult? Function(_SaveFailedAddress value)? saveFailed,
    TResult? Function(_DeleteLoading value)? deleteLoading,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_SelectLoading value)? selectLoading,
    TResult? Function(_SelectSuccess value)? selectSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAddress value)? loading,
    TResult Function(_SuccessAddress value)? success,
    TResult Function(_FailedAddress value)? failed,
    TResult Function(_SaveLoadingAddress value)? saveLoading,
    TResult Function(_SaveSuccessAddress value)? saveSuccess,
    TResult Function(_SaveFailedAddress value)? saveFailed,
    TResult Function(_DeleteLoading value)? deleteLoading,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_SelectLoading value)? selectLoading,
    TResult Function(_SelectSuccess value)? selectSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressStateCopyWith<$Res> {
  factory $AddressStateCopyWith(
          AddressState value, $Res Function(AddressState) then) =
      _$AddressStateCopyWithImpl<$Res, AddressState>;
}

/// @nodoc
class _$AddressStateCopyWithImpl<$Res, $Val extends AddressState>
    implements $AddressStateCopyWith<$Res> {
  _$AddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingAddressImplCopyWith<$Res> {
  factory _$$LoadingAddressImplCopyWith(_$LoadingAddressImpl value,
          $Res Function(_$LoadingAddressImpl) then) =
      __$$LoadingAddressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingAddressImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$LoadingAddressImpl>
    implements _$$LoadingAddressImplCopyWith<$Res> {
  __$$LoadingAddressImplCopyWithImpl(
      _$LoadingAddressImpl _value, $Res Function(_$LoadingAddressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingAddressImpl implements _LoadingAddress {
  const _$LoadingAddressImpl();

  @override
  String toString() {
    return 'AddressState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingAddressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AddressResponseModel addressResponseModel)
        success,
    required TResult Function(String message) failed,
    required TResult Function() saveLoading,
    required TResult Function() saveSuccess,
    required TResult Function(String message) saveFailed,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function() selectLoading,
    required TResult Function() selectSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AddressResponseModel addressResponseModel)? success,
    TResult? Function(String message)? failed,
    TResult? Function()? saveLoading,
    TResult? Function()? saveSuccess,
    TResult? Function(String message)? saveFailed,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function()? selectLoading,
    TResult? Function()? selectSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AddressResponseModel addressResponseModel)? success,
    TResult Function(String message)? failed,
    TResult Function()? saveLoading,
    TResult Function()? saveSuccess,
    TResult Function(String message)? saveFailed,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function()? selectLoading,
    TResult Function()? selectSuccess,
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
    required TResult Function(_LoadingAddress value) loading,
    required TResult Function(_SuccessAddress value) success,
    required TResult Function(_FailedAddress value) failed,
    required TResult Function(_SaveLoadingAddress value) saveLoading,
    required TResult Function(_SaveSuccessAddress value) saveSuccess,
    required TResult Function(_SaveFailedAddress value) saveFailed,
    required TResult Function(_DeleteLoading value) deleteLoading,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_SelectLoading value) selectLoading,
    required TResult Function(_SelectSuccess value) selectSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAddress value)? loading,
    TResult? Function(_SuccessAddress value)? success,
    TResult? Function(_FailedAddress value)? failed,
    TResult? Function(_SaveLoadingAddress value)? saveLoading,
    TResult? Function(_SaveSuccessAddress value)? saveSuccess,
    TResult? Function(_SaveFailedAddress value)? saveFailed,
    TResult? Function(_DeleteLoading value)? deleteLoading,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_SelectLoading value)? selectLoading,
    TResult? Function(_SelectSuccess value)? selectSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAddress value)? loading,
    TResult Function(_SuccessAddress value)? success,
    TResult Function(_FailedAddress value)? failed,
    TResult Function(_SaveLoadingAddress value)? saveLoading,
    TResult Function(_SaveSuccessAddress value)? saveSuccess,
    TResult Function(_SaveFailedAddress value)? saveFailed,
    TResult Function(_DeleteLoading value)? deleteLoading,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_SelectLoading value)? selectLoading,
    TResult Function(_SelectSuccess value)? selectSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingAddress implements AddressState {
  const factory _LoadingAddress() = _$LoadingAddressImpl;
}

/// @nodoc
abstract class _$$SuccessAddressImplCopyWith<$Res> {
  factory _$$SuccessAddressImplCopyWith(_$SuccessAddressImpl value,
          $Res Function(_$SuccessAddressImpl) then) =
      __$$SuccessAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressResponseModel addressResponseModel});
}

/// @nodoc
class __$$SuccessAddressImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$SuccessAddressImpl>
    implements _$$SuccessAddressImplCopyWith<$Res> {
  __$$SuccessAddressImplCopyWithImpl(
      _$SuccessAddressImpl _value, $Res Function(_$SuccessAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressResponseModel = null,
  }) {
    return _then(_$SuccessAddressImpl(
      addressResponseModel: null == addressResponseModel
          ? _value.addressResponseModel
          : addressResponseModel // ignore: cast_nullable_to_non_nullable
              as AddressResponseModel,
    ));
  }
}

/// @nodoc

class _$SuccessAddressImpl implements _SuccessAddress {
  const _$SuccessAddressImpl({required this.addressResponseModel});

  @override
  final AddressResponseModel addressResponseModel;

  @override
  String toString() {
    return 'AddressState.success(addressResponseModel: $addressResponseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessAddressImpl &&
            (identical(other.addressResponseModel, addressResponseModel) ||
                other.addressResponseModel == addressResponseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addressResponseModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessAddressImplCopyWith<_$SuccessAddressImpl> get copyWith =>
      __$$SuccessAddressImplCopyWithImpl<_$SuccessAddressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AddressResponseModel addressResponseModel)
        success,
    required TResult Function(String message) failed,
    required TResult Function() saveLoading,
    required TResult Function() saveSuccess,
    required TResult Function(String message) saveFailed,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function() selectLoading,
    required TResult Function() selectSuccess,
  }) {
    return success(addressResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AddressResponseModel addressResponseModel)? success,
    TResult? Function(String message)? failed,
    TResult? Function()? saveLoading,
    TResult? Function()? saveSuccess,
    TResult? Function(String message)? saveFailed,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function()? selectLoading,
    TResult? Function()? selectSuccess,
  }) {
    return success?.call(addressResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AddressResponseModel addressResponseModel)? success,
    TResult Function(String message)? failed,
    TResult Function()? saveLoading,
    TResult Function()? saveSuccess,
    TResult Function(String message)? saveFailed,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function()? selectLoading,
    TResult Function()? selectSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(addressResponseModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAddress value) loading,
    required TResult Function(_SuccessAddress value) success,
    required TResult Function(_FailedAddress value) failed,
    required TResult Function(_SaveLoadingAddress value) saveLoading,
    required TResult Function(_SaveSuccessAddress value) saveSuccess,
    required TResult Function(_SaveFailedAddress value) saveFailed,
    required TResult Function(_DeleteLoading value) deleteLoading,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_SelectLoading value) selectLoading,
    required TResult Function(_SelectSuccess value) selectSuccess,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAddress value)? loading,
    TResult? Function(_SuccessAddress value)? success,
    TResult? Function(_FailedAddress value)? failed,
    TResult? Function(_SaveLoadingAddress value)? saveLoading,
    TResult? Function(_SaveSuccessAddress value)? saveSuccess,
    TResult? Function(_SaveFailedAddress value)? saveFailed,
    TResult? Function(_DeleteLoading value)? deleteLoading,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_SelectLoading value)? selectLoading,
    TResult? Function(_SelectSuccess value)? selectSuccess,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAddress value)? loading,
    TResult Function(_SuccessAddress value)? success,
    TResult Function(_FailedAddress value)? failed,
    TResult Function(_SaveLoadingAddress value)? saveLoading,
    TResult Function(_SaveSuccessAddress value)? saveSuccess,
    TResult Function(_SaveFailedAddress value)? saveFailed,
    TResult Function(_DeleteLoading value)? deleteLoading,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_SelectLoading value)? selectLoading,
    TResult Function(_SelectSuccess value)? selectSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessAddress implements AddressState {
  const factory _SuccessAddress(
          {required final AddressResponseModel addressResponseModel}) =
      _$SuccessAddressImpl;

  AddressResponseModel get addressResponseModel;
  @JsonKey(ignore: true)
  _$$SuccessAddressImplCopyWith<_$SuccessAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedAddressImplCopyWith<$Res> {
  factory _$$FailedAddressImplCopyWith(
          _$FailedAddressImpl value, $Res Function(_$FailedAddressImpl) then) =
      __$$FailedAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailedAddressImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$FailedAddressImpl>
    implements _$$FailedAddressImplCopyWith<$Res> {
  __$$FailedAddressImplCopyWithImpl(
      _$FailedAddressImpl _value, $Res Function(_$FailedAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailedAddressImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailedAddressImpl implements _FailedAddress {
  const _$FailedAddressImpl({this.message = 'Произошла ошибка'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AddressState.failed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedAddressImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedAddressImplCopyWith<_$FailedAddressImpl> get copyWith =>
      __$$FailedAddressImplCopyWithImpl<_$FailedAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AddressResponseModel addressResponseModel)
        success,
    required TResult Function(String message) failed,
    required TResult Function() saveLoading,
    required TResult Function() saveSuccess,
    required TResult Function(String message) saveFailed,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function() selectLoading,
    required TResult Function() selectSuccess,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AddressResponseModel addressResponseModel)? success,
    TResult? Function(String message)? failed,
    TResult? Function()? saveLoading,
    TResult? Function()? saveSuccess,
    TResult? Function(String message)? saveFailed,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function()? selectLoading,
    TResult? Function()? selectSuccess,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AddressResponseModel addressResponseModel)? success,
    TResult Function(String message)? failed,
    TResult Function()? saveLoading,
    TResult Function()? saveSuccess,
    TResult Function(String message)? saveFailed,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function()? selectLoading,
    TResult Function()? selectSuccess,
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
    required TResult Function(_LoadingAddress value) loading,
    required TResult Function(_SuccessAddress value) success,
    required TResult Function(_FailedAddress value) failed,
    required TResult Function(_SaveLoadingAddress value) saveLoading,
    required TResult Function(_SaveSuccessAddress value) saveSuccess,
    required TResult Function(_SaveFailedAddress value) saveFailed,
    required TResult Function(_DeleteLoading value) deleteLoading,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_SelectLoading value) selectLoading,
    required TResult Function(_SelectSuccess value) selectSuccess,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAddress value)? loading,
    TResult? Function(_SuccessAddress value)? success,
    TResult? Function(_FailedAddress value)? failed,
    TResult? Function(_SaveLoadingAddress value)? saveLoading,
    TResult? Function(_SaveSuccessAddress value)? saveSuccess,
    TResult? Function(_SaveFailedAddress value)? saveFailed,
    TResult? Function(_DeleteLoading value)? deleteLoading,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_SelectLoading value)? selectLoading,
    TResult? Function(_SelectSuccess value)? selectSuccess,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAddress value)? loading,
    TResult Function(_SuccessAddress value)? success,
    TResult Function(_FailedAddress value)? failed,
    TResult Function(_SaveLoadingAddress value)? saveLoading,
    TResult Function(_SaveSuccessAddress value)? saveSuccess,
    TResult Function(_SaveFailedAddress value)? saveFailed,
    TResult Function(_DeleteLoading value)? deleteLoading,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_SelectLoading value)? selectLoading,
    TResult Function(_SelectSuccess value)? selectSuccess,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _FailedAddress implements AddressState {
  const factory _FailedAddress({final String message}) = _$FailedAddressImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedAddressImplCopyWith<_$FailedAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveLoadingAddressImplCopyWith<$Res> {
  factory _$$SaveLoadingAddressImplCopyWith(_$SaveLoadingAddressImpl value,
          $Res Function(_$SaveLoadingAddressImpl) then) =
      __$$SaveLoadingAddressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveLoadingAddressImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$SaveLoadingAddressImpl>
    implements _$$SaveLoadingAddressImplCopyWith<$Res> {
  __$$SaveLoadingAddressImplCopyWithImpl(_$SaveLoadingAddressImpl _value,
      $Res Function(_$SaveLoadingAddressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SaveLoadingAddressImpl implements _SaveLoadingAddress {
  const _$SaveLoadingAddressImpl();

  @override
  String toString() {
    return 'AddressState.saveLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SaveLoadingAddressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AddressResponseModel addressResponseModel)
        success,
    required TResult Function(String message) failed,
    required TResult Function() saveLoading,
    required TResult Function() saveSuccess,
    required TResult Function(String message) saveFailed,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function() selectLoading,
    required TResult Function() selectSuccess,
  }) {
    return saveLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AddressResponseModel addressResponseModel)? success,
    TResult? Function(String message)? failed,
    TResult? Function()? saveLoading,
    TResult? Function()? saveSuccess,
    TResult? Function(String message)? saveFailed,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function()? selectLoading,
    TResult? Function()? selectSuccess,
  }) {
    return saveLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AddressResponseModel addressResponseModel)? success,
    TResult Function(String message)? failed,
    TResult Function()? saveLoading,
    TResult Function()? saveSuccess,
    TResult Function(String message)? saveFailed,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function()? selectLoading,
    TResult Function()? selectSuccess,
    required TResult orElse(),
  }) {
    if (saveLoading != null) {
      return saveLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAddress value) loading,
    required TResult Function(_SuccessAddress value) success,
    required TResult Function(_FailedAddress value) failed,
    required TResult Function(_SaveLoadingAddress value) saveLoading,
    required TResult Function(_SaveSuccessAddress value) saveSuccess,
    required TResult Function(_SaveFailedAddress value) saveFailed,
    required TResult Function(_DeleteLoading value) deleteLoading,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_SelectLoading value) selectLoading,
    required TResult Function(_SelectSuccess value) selectSuccess,
  }) {
    return saveLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAddress value)? loading,
    TResult? Function(_SuccessAddress value)? success,
    TResult? Function(_FailedAddress value)? failed,
    TResult? Function(_SaveLoadingAddress value)? saveLoading,
    TResult? Function(_SaveSuccessAddress value)? saveSuccess,
    TResult? Function(_SaveFailedAddress value)? saveFailed,
    TResult? Function(_DeleteLoading value)? deleteLoading,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_SelectLoading value)? selectLoading,
    TResult? Function(_SelectSuccess value)? selectSuccess,
  }) {
    return saveLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAddress value)? loading,
    TResult Function(_SuccessAddress value)? success,
    TResult Function(_FailedAddress value)? failed,
    TResult Function(_SaveLoadingAddress value)? saveLoading,
    TResult Function(_SaveSuccessAddress value)? saveSuccess,
    TResult Function(_SaveFailedAddress value)? saveFailed,
    TResult Function(_DeleteLoading value)? deleteLoading,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_SelectLoading value)? selectLoading,
    TResult Function(_SelectSuccess value)? selectSuccess,
    required TResult orElse(),
  }) {
    if (saveLoading != null) {
      return saveLoading(this);
    }
    return orElse();
  }
}

abstract class _SaveLoadingAddress implements AddressState {
  const factory _SaveLoadingAddress() = _$SaveLoadingAddressImpl;
}

/// @nodoc
abstract class _$$SaveSuccessAddressImplCopyWith<$Res> {
  factory _$$SaveSuccessAddressImplCopyWith(_$SaveSuccessAddressImpl value,
          $Res Function(_$SaveSuccessAddressImpl) then) =
      __$$SaveSuccessAddressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveSuccessAddressImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$SaveSuccessAddressImpl>
    implements _$$SaveSuccessAddressImplCopyWith<$Res> {
  __$$SaveSuccessAddressImplCopyWithImpl(_$SaveSuccessAddressImpl _value,
      $Res Function(_$SaveSuccessAddressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SaveSuccessAddressImpl implements _SaveSuccessAddress {
  const _$SaveSuccessAddressImpl();

  @override
  String toString() {
    return 'AddressState.saveSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SaveSuccessAddressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AddressResponseModel addressResponseModel)
        success,
    required TResult Function(String message) failed,
    required TResult Function() saveLoading,
    required TResult Function() saveSuccess,
    required TResult Function(String message) saveFailed,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function() selectLoading,
    required TResult Function() selectSuccess,
  }) {
    return saveSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AddressResponseModel addressResponseModel)? success,
    TResult? Function(String message)? failed,
    TResult? Function()? saveLoading,
    TResult? Function()? saveSuccess,
    TResult? Function(String message)? saveFailed,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function()? selectLoading,
    TResult? Function()? selectSuccess,
  }) {
    return saveSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AddressResponseModel addressResponseModel)? success,
    TResult Function(String message)? failed,
    TResult Function()? saveLoading,
    TResult Function()? saveSuccess,
    TResult Function(String message)? saveFailed,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function()? selectLoading,
    TResult Function()? selectSuccess,
    required TResult orElse(),
  }) {
    if (saveSuccess != null) {
      return saveSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAddress value) loading,
    required TResult Function(_SuccessAddress value) success,
    required TResult Function(_FailedAddress value) failed,
    required TResult Function(_SaveLoadingAddress value) saveLoading,
    required TResult Function(_SaveSuccessAddress value) saveSuccess,
    required TResult Function(_SaveFailedAddress value) saveFailed,
    required TResult Function(_DeleteLoading value) deleteLoading,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_SelectLoading value) selectLoading,
    required TResult Function(_SelectSuccess value) selectSuccess,
  }) {
    return saveSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAddress value)? loading,
    TResult? Function(_SuccessAddress value)? success,
    TResult? Function(_FailedAddress value)? failed,
    TResult? Function(_SaveLoadingAddress value)? saveLoading,
    TResult? Function(_SaveSuccessAddress value)? saveSuccess,
    TResult? Function(_SaveFailedAddress value)? saveFailed,
    TResult? Function(_DeleteLoading value)? deleteLoading,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_SelectLoading value)? selectLoading,
    TResult? Function(_SelectSuccess value)? selectSuccess,
  }) {
    return saveSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAddress value)? loading,
    TResult Function(_SuccessAddress value)? success,
    TResult Function(_FailedAddress value)? failed,
    TResult Function(_SaveLoadingAddress value)? saveLoading,
    TResult Function(_SaveSuccessAddress value)? saveSuccess,
    TResult Function(_SaveFailedAddress value)? saveFailed,
    TResult Function(_DeleteLoading value)? deleteLoading,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_SelectLoading value)? selectLoading,
    TResult Function(_SelectSuccess value)? selectSuccess,
    required TResult orElse(),
  }) {
    if (saveSuccess != null) {
      return saveSuccess(this);
    }
    return orElse();
  }
}

abstract class _SaveSuccessAddress implements AddressState {
  const factory _SaveSuccessAddress() = _$SaveSuccessAddressImpl;
}

/// @nodoc
abstract class _$$SaveFailedAddressImplCopyWith<$Res> {
  factory _$$SaveFailedAddressImplCopyWith(_$SaveFailedAddressImpl value,
          $Res Function(_$SaveFailedAddressImpl) then) =
      __$$SaveFailedAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SaveFailedAddressImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$SaveFailedAddressImpl>
    implements _$$SaveFailedAddressImplCopyWith<$Res> {
  __$$SaveFailedAddressImplCopyWithImpl(_$SaveFailedAddressImpl _value,
      $Res Function(_$SaveFailedAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SaveFailedAddressImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SaveFailedAddressImpl implements _SaveFailedAddress {
  const _$SaveFailedAddressImpl({this.message = 'Произошла ошибка'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AddressState.saveFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveFailedAddressImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveFailedAddressImplCopyWith<_$SaveFailedAddressImpl> get copyWith =>
      __$$SaveFailedAddressImplCopyWithImpl<_$SaveFailedAddressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AddressResponseModel addressResponseModel)
        success,
    required TResult Function(String message) failed,
    required TResult Function() saveLoading,
    required TResult Function() saveSuccess,
    required TResult Function(String message) saveFailed,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function() selectLoading,
    required TResult Function() selectSuccess,
  }) {
    return saveFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AddressResponseModel addressResponseModel)? success,
    TResult? Function(String message)? failed,
    TResult? Function()? saveLoading,
    TResult? Function()? saveSuccess,
    TResult? Function(String message)? saveFailed,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function()? selectLoading,
    TResult? Function()? selectSuccess,
  }) {
    return saveFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AddressResponseModel addressResponseModel)? success,
    TResult Function(String message)? failed,
    TResult Function()? saveLoading,
    TResult Function()? saveSuccess,
    TResult Function(String message)? saveFailed,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function()? selectLoading,
    TResult Function()? selectSuccess,
    required TResult orElse(),
  }) {
    if (saveFailed != null) {
      return saveFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAddress value) loading,
    required TResult Function(_SuccessAddress value) success,
    required TResult Function(_FailedAddress value) failed,
    required TResult Function(_SaveLoadingAddress value) saveLoading,
    required TResult Function(_SaveSuccessAddress value) saveSuccess,
    required TResult Function(_SaveFailedAddress value) saveFailed,
    required TResult Function(_DeleteLoading value) deleteLoading,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_SelectLoading value) selectLoading,
    required TResult Function(_SelectSuccess value) selectSuccess,
  }) {
    return saveFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAddress value)? loading,
    TResult? Function(_SuccessAddress value)? success,
    TResult? Function(_FailedAddress value)? failed,
    TResult? Function(_SaveLoadingAddress value)? saveLoading,
    TResult? Function(_SaveSuccessAddress value)? saveSuccess,
    TResult? Function(_SaveFailedAddress value)? saveFailed,
    TResult? Function(_DeleteLoading value)? deleteLoading,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_SelectLoading value)? selectLoading,
    TResult? Function(_SelectSuccess value)? selectSuccess,
  }) {
    return saveFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAddress value)? loading,
    TResult Function(_SuccessAddress value)? success,
    TResult Function(_FailedAddress value)? failed,
    TResult Function(_SaveLoadingAddress value)? saveLoading,
    TResult Function(_SaveSuccessAddress value)? saveSuccess,
    TResult Function(_SaveFailedAddress value)? saveFailed,
    TResult Function(_DeleteLoading value)? deleteLoading,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_SelectLoading value)? selectLoading,
    TResult Function(_SelectSuccess value)? selectSuccess,
    required TResult orElse(),
  }) {
    if (saveFailed != null) {
      return saveFailed(this);
    }
    return orElse();
  }
}

abstract class _SaveFailedAddress implements AddressState {
  const factory _SaveFailedAddress({final String message}) =
      _$SaveFailedAddressImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SaveFailedAddressImplCopyWith<_$SaveFailedAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteLoadingImplCopyWith<$Res> {
  factory _$$DeleteLoadingImplCopyWith(
          _$DeleteLoadingImpl value, $Res Function(_$DeleteLoadingImpl) then) =
      __$$DeleteLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteLoadingImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$DeleteLoadingImpl>
    implements _$$DeleteLoadingImplCopyWith<$Res> {
  __$$DeleteLoadingImplCopyWithImpl(
      _$DeleteLoadingImpl _value, $Res Function(_$DeleteLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteLoadingImpl implements _DeleteLoading {
  const _$DeleteLoadingImpl();

  @override
  String toString() {
    return 'AddressState.deleteLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AddressResponseModel addressResponseModel)
        success,
    required TResult Function(String message) failed,
    required TResult Function() saveLoading,
    required TResult Function() saveSuccess,
    required TResult Function(String message) saveFailed,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function() selectLoading,
    required TResult Function() selectSuccess,
  }) {
    return deleteLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AddressResponseModel addressResponseModel)? success,
    TResult? Function(String message)? failed,
    TResult? Function()? saveLoading,
    TResult? Function()? saveSuccess,
    TResult? Function(String message)? saveFailed,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function()? selectLoading,
    TResult? Function()? selectSuccess,
  }) {
    return deleteLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AddressResponseModel addressResponseModel)? success,
    TResult Function(String message)? failed,
    TResult Function()? saveLoading,
    TResult Function()? saveSuccess,
    TResult Function(String message)? saveFailed,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function()? selectLoading,
    TResult Function()? selectSuccess,
    required TResult orElse(),
  }) {
    if (deleteLoading != null) {
      return deleteLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAddress value) loading,
    required TResult Function(_SuccessAddress value) success,
    required TResult Function(_FailedAddress value) failed,
    required TResult Function(_SaveLoadingAddress value) saveLoading,
    required TResult Function(_SaveSuccessAddress value) saveSuccess,
    required TResult Function(_SaveFailedAddress value) saveFailed,
    required TResult Function(_DeleteLoading value) deleteLoading,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_SelectLoading value) selectLoading,
    required TResult Function(_SelectSuccess value) selectSuccess,
  }) {
    return deleteLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAddress value)? loading,
    TResult? Function(_SuccessAddress value)? success,
    TResult? Function(_FailedAddress value)? failed,
    TResult? Function(_SaveLoadingAddress value)? saveLoading,
    TResult? Function(_SaveSuccessAddress value)? saveSuccess,
    TResult? Function(_SaveFailedAddress value)? saveFailed,
    TResult? Function(_DeleteLoading value)? deleteLoading,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_SelectLoading value)? selectLoading,
    TResult? Function(_SelectSuccess value)? selectSuccess,
  }) {
    return deleteLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAddress value)? loading,
    TResult Function(_SuccessAddress value)? success,
    TResult Function(_FailedAddress value)? failed,
    TResult Function(_SaveLoadingAddress value)? saveLoading,
    TResult Function(_SaveSuccessAddress value)? saveSuccess,
    TResult Function(_SaveFailedAddress value)? saveFailed,
    TResult Function(_DeleteLoading value)? deleteLoading,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_SelectLoading value)? selectLoading,
    TResult Function(_SelectSuccess value)? selectSuccess,
    required TResult orElse(),
  }) {
    if (deleteLoading != null) {
      return deleteLoading(this);
    }
    return orElse();
  }
}

abstract class _DeleteLoading implements AddressState {
  const factory _DeleteLoading() = _$DeleteLoadingImpl;
}

/// @nodoc
abstract class _$$DeleteSuccessImplCopyWith<$Res> {
  factory _$$DeleteSuccessImplCopyWith(
          _$DeleteSuccessImpl value, $Res Function(_$DeleteSuccessImpl) then) =
      __$$DeleteSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteSuccessImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$DeleteSuccessImpl>
    implements _$$DeleteSuccessImplCopyWith<$Res> {
  __$$DeleteSuccessImplCopyWithImpl(
      _$DeleteSuccessImpl _value, $Res Function(_$DeleteSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteSuccessImpl implements _DeleteSuccess {
  const _$DeleteSuccessImpl();

  @override
  String toString() {
    return 'AddressState.deleteSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AddressResponseModel addressResponseModel)
        success,
    required TResult Function(String message) failed,
    required TResult Function() saveLoading,
    required TResult Function() saveSuccess,
    required TResult Function(String message) saveFailed,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function() selectLoading,
    required TResult Function() selectSuccess,
  }) {
    return deleteSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AddressResponseModel addressResponseModel)? success,
    TResult? Function(String message)? failed,
    TResult? Function()? saveLoading,
    TResult? Function()? saveSuccess,
    TResult? Function(String message)? saveFailed,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function()? selectLoading,
    TResult? Function()? selectSuccess,
  }) {
    return deleteSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AddressResponseModel addressResponseModel)? success,
    TResult Function(String message)? failed,
    TResult Function()? saveLoading,
    TResult Function()? saveSuccess,
    TResult Function(String message)? saveFailed,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function()? selectLoading,
    TResult Function()? selectSuccess,
    required TResult orElse(),
  }) {
    if (deleteSuccess != null) {
      return deleteSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAddress value) loading,
    required TResult Function(_SuccessAddress value) success,
    required TResult Function(_FailedAddress value) failed,
    required TResult Function(_SaveLoadingAddress value) saveLoading,
    required TResult Function(_SaveSuccessAddress value) saveSuccess,
    required TResult Function(_SaveFailedAddress value) saveFailed,
    required TResult Function(_DeleteLoading value) deleteLoading,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_SelectLoading value) selectLoading,
    required TResult Function(_SelectSuccess value) selectSuccess,
  }) {
    return deleteSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAddress value)? loading,
    TResult? Function(_SuccessAddress value)? success,
    TResult? Function(_FailedAddress value)? failed,
    TResult? Function(_SaveLoadingAddress value)? saveLoading,
    TResult? Function(_SaveSuccessAddress value)? saveSuccess,
    TResult? Function(_SaveFailedAddress value)? saveFailed,
    TResult? Function(_DeleteLoading value)? deleteLoading,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_SelectLoading value)? selectLoading,
    TResult? Function(_SelectSuccess value)? selectSuccess,
  }) {
    return deleteSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAddress value)? loading,
    TResult Function(_SuccessAddress value)? success,
    TResult Function(_FailedAddress value)? failed,
    TResult Function(_SaveLoadingAddress value)? saveLoading,
    TResult Function(_SaveSuccessAddress value)? saveSuccess,
    TResult Function(_SaveFailedAddress value)? saveFailed,
    TResult Function(_DeleteLoading value)? deleteLoading,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_SelectLoading value)? selectLoading,
    TResult Function(_SelectSuccess value)? selectSuccess,
    required TResult orElse(),
  }) {
    if (deleteSuccess != null) {
      return deleteSuccess(this);
    }
    return orElse();
  }
}

abstract class _DeleteSuccess implements AddressState {
  const factory _DeleteSuccess() = _$DeleteSuccessImpl;
}

/// @nodoc
abstract class _$$SelectLoadingImplCopyWith<$Res> {
  factory _$$SelectLoadingImplCopyWith(
          _$SelectLoadingImpl value, $Res Function(_$SelectLoadingImpl) then) =
      __$$SelectLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SelectLoadingImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$SelectLoadingImpl>
    implements _$$SelectLoadingImplCopyWith<$Res> {
  __$$SelectLoadingImplCopyWithImpl(
      _$SelectLoadingImpl _value, $Res Function(_$SelectLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SelectLoadingImpl implements _SelectLoading {
  const _$SelectLoadingImpl();

  @override
  String toString() {
    return 'AddressState.selectLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SelectLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AddressResponseModel addressResponseModel)
        success,
    required TResult Function(String message) failed,
    required TResult Function() saveLoading,
    required TResult Function() saveSuccess,
    required TResult Function(String message) saveFailed,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function() selectLoading,
    required TResult Function() selectSuccess,
  }) {
    return selectLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AddressResponseModel addressResponseModel)? success,
    TResult? Function(String message)? failed,
    TResult? Function()? saveLoading,
    TResult? Function()? saveSuccess,
    TResult? Function(String message)? saveFailed,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function()? selectLoading,
    TResult? Function()? selectSuccess,
  }) {
    return selectLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AddressResponseModel addressResponseModel)? success,
    TResult Function(String message)? failed,
    TResult Function()? saveLoading,
    TResult Function()? saveSuccess,
    TResult Function(String message)? saveFailed,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function()? selectLoading,
    TResult Function()? selectSuccess,
    required TResult orElse(),
  }) {
    if (selectLoading != null) {
      return selectLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAddress value) loading,
    required TResult Function(_SuccessAddress value) success,
    required TResult Function(_FailedAddress value) failed,
    required TResult Function(_SaveLoadingAddress value) saveLoading,
    required TResult Function(_SaveSuccessAddress value) saveSuccess,
    required TResult Function(_SaveFailedAddress value) saveFailed,
    required TResult Function(_DeleteLoading value) deleteLoading,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_SelectLoading value) selectLoading,
    required TResult Function(_SelectSuccess value) selectSuccess,
  }) {
    return selectLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAddress value)? loading,
    TResult? Function(_SuccessAddress value)? success,
    TResult? Function(_FailedAddress value)? failed,
    TResult? Function(_SaveLoadingAddress value)? saveLoading,
    TResult? Function(_SaveSuccessAddress value)? saveSuccess,
    TResult? Function(_SaveFailedAddress value)? saveFailed,
    TResult? Function(_DeleteLoading value)? deleteLoading,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_SelectLoading value)? selectLoading,
    TResult? Function(_SelectSuccess value)? selectSuccess,
  }) {
    return selectLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAddress value)? loading,
    TResult Function(_SuccessAddress value)? success,
    TResult Function(_FailedAddress value)? failed,
    TResult Function(_SaveLoadingAddress value)? saveLoading,
    TResult Function(_SaveSuccessAddress value)? saveSuccess,
    TResult Function(_SaveFailedAddress value)? saveFailed,
    TResult Function(_DeleteLoading value)? deleteLoading,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_SelectLoading value)? selectLoading,
    TResult Function(_SelectSuccess value)? selectSuccess,
    required TResult orElse(),
  }) {
    if (selectLoading != null) {
      return selectLoading(this);
    }
    return orElse();
  }
}

abstract class _SelectLoading implements AddressState {
  const factory _SelectLoading() = _$SelectLoadingImpl;
}

/// @nodoc
abstract class _$$SelectSuccessImplCopyWith<$Res> {
  factory _$$SelectSuccessImplCopyWith(
          _$SelectSuccessImpl value, $Res Function(_$SelectSuccessImpl) then) =
      __$$SelectSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SelectSuccessImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$SelectSuccessImpl>
    implements _$$SelectSuccessImplCopyWith<$Res> {
  __$$SelectSuccessImplCopyWithImpl(
      _$SelectSuccessImpl _value, $Res Function(_$SelectSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SelectSuccessImpl implements _SelectSuccess {
  const _$SelectSuccessImpl();

  @override
  String toString() {
    return 'AddressState.selectSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SelectSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AddressResponseModel addressResponseModel)
        success,
    required TResult Function(String message) failed,
    required TResult Function() saveLoading,
    required TResult Function() saveSuccess,
    required TResult Function(String message) saveFailed,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function() selectLoading,
    required TResult Function() selectSuccess,
  }) {
    return selectSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AddressResponseModel addressResponseModel)? success,
    TResult? Function(String message)? failed,
    TResult? Function()? saveLoading,
    TResult? Function()? saveSuccess,
    TResult? Function(String message)? saveFailed,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function()? selectLoading,
    TResult? Function()? selectSuccess,
  }) {
    return selectSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AddressResponseModel addressResponseModel)? success,
    TResult Function(String message)? failed,
    TResult Function()? saveLoading,
    TResult Function()? saveSuccess,
    TResult Function(String message)? saveFailed,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function()? selectLoading,
    TResult Function()? selectSuccess,
    required TResult orElse(),
  }) {
    if (selectSuccess != null) {
      return selectSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAddress value) loading,
    required TResult Function(_SuccessAddress value) success,
    required TResult Function(_FailedAddress value) failed,
    required TResult Function(_SaveLoadingAddress value) saveLoading,
    required TResult Function(_SaveSuccessAddress value) saveSuccess,
    required TResult Function(_SaveFailedAddress value) saveFailed,
    required TResult Function(_DeleteLoading value) deleteLoading,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_SelectLoading value) selectLoading,
    required TResult Function(_SelectSuccess value) selectSuccess,
  }) {
    return selectSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAddress value)? loading,
    TResult? Function(_SuccessAddress value)? success,
    TResult? Function(_FailedAddress value)? failed,
    TResult? Function(_SaveLoadingAddress value)? saveLoading,
    TResult? Function(_SaveSuccessAddress value)? saveSuccess,
    TResult? Function(_SaveFailedAddress value)? saveFailed,
    TResult? Function(_DeleteLoading value)? deleteLoading,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_SelectLoading value)? selectLoading,
    TResult? Function(_SelectSuccess value)? selectSuccess,
  }) {
    return selectSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAddress value)? loading,
    TResult Function(_SuccessAddress value)? success,
    TResult Function(_FailedAddress value)? failed,
    TResult Function(_SaveLoadingAddress value)? saveLoading,
    TResult Function(_SaveSuccessAddress value)? saveSuccess,
    TResult Function(_SaveFailedAddress value)? saveFailed,
    TResult Function(_DeleteLoading value)? deleteLoading,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_SelectLoading value)? selectLoading,
    TResult Function(_SelectSuccess value)? selectSuccess,
    required TResult orElse(),
  }) {
    if (selectSuccess != null) {
      return selectSuccess(this);
    }
    return orElse();
  }
}

abstract class _SelectSuccess implements AddressState {
  const factory _SelectSuccess() = _$SelectSuccessImpl;
}
