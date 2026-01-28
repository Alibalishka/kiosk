// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchUser,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function() deleteUser,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function() fetchConfiguration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchUser,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function()? deleteUser,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function()? fetchConfiguration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchUser,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function()? deleteUser,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchUserImplCopyWith<$Res> {
  factory _$$FetchUserImplCopyWith(
          _$FetchUserImpl value, $Res Function(_$FetchUserImpl) then) =
      __$$FetchUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$FetchUserImpl>
    implements _$$FetchUserImplCopyWith<$Res> {
  __$$FetchUserImplCopyWithImpl(
      _$FetchUserImpl _value, $Res Function(_$FetchUserImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchUserImpl implements _FetchUser {
  const _$FetchUserImpl();

  @override
  String toString() {
    return 'UserEvent.fetchUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchUser,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function() deleteUser,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function() fetchConfiguration,
  }) {
    return fetchUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchUser,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function()? deleteUser,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetchUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchUser,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function()? deleteUser,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchUser != null) {
      return fetchUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetchUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetchUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchUser != null) {
      return fetchUser(this);
    }
    return orElse();
  }
}

abstract class _FetchUser implements UserEvent {
  const factory _FetchUser() = _$FetchUserImpl;
}

/// @nodoc
abstract class _$$UpdateUserImplCopyWith<$Res> {
  factory _$$UpdateUserImplCopyWith(
          _$UpdateUserImpl value, $Res Function(_$UpdateUserImpl) then) =
      __$$UpdateUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserUpdateRequest body});
}

/// @nodoc
class __$$UpdateUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UpdateUserImpl>
    implements _$$UpdateUserImplCopyWith<$Res> {
  __$$UpdateUserImplCopyWithImpl(
      _$UpdateUserImpl _value, $Res Function(_$UpdateUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$UpdateUserImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as UserUpdateRequest,
    ));
  }
}

/// @nodoc

class _$UpdateUserImpl implements _UpdateUser {
  const _$UpdateUserImpl({required this.body});

  @override
  final UserUpdateRequest body;

  @override
  String toString() {
    return 'UserEvent.updateUser(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserImplCopyWith<_$UpdateUserImpl> get copyWith =>
      __$$UpdateUserImplCopyWithImpl<_$UpdateUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchUser,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function() deleteUser,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function() fetchConfiguration,
  }) {
    return updateUser(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchUser,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function()? deleteUser,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function()? fetchConfiguration,
  }) {
    return updateUser?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchUser,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function()? deleteUser,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return updateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return updateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(this);
    }
    return orElse();
  }
}

abstract class _UpdateUser implements UserEvent {
  const factory _UpdateUser({required final UserUpdateRequest body}) =
      _$UpdateUserImpl;

  UserUpdateRequest get body;
  @JsonKey(ignore: true)
  _$$UpdateUserImplCopyWith<_$UpdateUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteUserImplCopyWith<$Res> {
  factory _$$DeleteUserImplCopyWith(
          _$DeleteUserImpl value, $Res Function(_$DeleteUserImpl) then) =
      __$$DeleteUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$DeleteUserImpl>
    implements _$$DeleteUserImplCopyWith<$Res> {
  __$$DeleteUserImplCopyWithImpl(
      _$DeleteUserImpl _value, $Res Function(_$DeleteUserImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteUserImpl implements _DeleteUser {
  const _$DeleteUserImpl();

  @override
  String toString() {
    return 'UserEvent.deleteUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchUser,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function() deleteUser,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function() fetchConfiguration,
  }) {
    return deleteUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchUser,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function()? deleteUser,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function()? fetchConfiguration,
  }) {
    return deleteUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchUser,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function()? deleteUser,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return deleteUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return deleteUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser(this);
    }
    return orElse();
  }
}

abstract class _DeleteUser implements UserEvent {
  const factory _DeleteUser() = _$DeleteUserImpl;
}

/// @nodoc
abstract class _$$CheckSubscriptonImplCopyWith<$Res> {
  factory _$$CheckSubscriptonImplCopyWith(_$CheckSubscriptonImpl value,
          $Res Function(_$CheckSubscriptonImpl) then) =
      __$$CheckSubscriptonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int idSubscroption, int userSubId});
}

/// @nodoc
class __$$CheckSubscriptonImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$CheckSubscriptonImpl>
    implements _$$CheckSubscriptonImplCopyWith<$Res> {
  __$$CheckSubscriptonImplCopyWithImpl(_$CheckSubscriptonImpl _value,
      $Res Function(_$CheckSubscriptonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idSubscroption = null,
    Object? userSubId = null,
  }) {
    return _then(_$CheckSubscriptonImpl(
      idSubscroption: null == idSubscroption
          ? _value.idSubscroption
          : idSubscroption // ignore: cast_nullable_to_non_nullable
              as int,
      userSubId: null == userSubId
          ? _value.userSubId
          : userSubId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CheckSubscriptonImpl implements _CheckSubscripton {
  const _$CheckSubscriptonImpl(
      {required this.idSubscroption, required this.userSubId});

  @override
  final int idSubscroption;
  @override
  final int userSubId;

  @override
  String toString() {
    return 'UserEvent.checkSubscripton(idSubscroption: $idSubscroption, userSubId: $userSubId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckSubscriptonImpl &&
            (identical(other.idSubscroption, idSubscroption) ||
                other.idSubscroption == idSubscroption) &&
            (identical(other.userSubId, userSubId) ||
                other.userSubId == userSubId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idSubscroption, userSubId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckSubscriptonImplCopyWith<_$CheckSubscriptonImpl> get copyWith =>
      __$$CheckSubscriptonImplCopyWithImpl<_$CheckSubscriptonImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchUser,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function() deleteUser,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function() fetchConfiguration,
  }) {
    return checkSubscripton(idSubscroption, userSubId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchUser,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function()? deleteUser,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function()? fetchConfiguration,
  }) {
    return checkSubscripton?.call(idSubscroption, userSubId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchUser,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function()? deleteUser,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (checkSubscripton != null) {
      return checkSubscripton(idSubscroption, userSubId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return checkSubscripton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return checkSubscripton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (checkSubscripton != null) {
      return checkSubscripton(this);
    }
    return orElse();
  }
}

abstract class _CheckSubscripton implements UserEvent {
  const factory _CheckSubscripton(
      {required final int idSubscroption,
      required final int userSubId}) = _$CheckSubscriptonImpl;

  int get idSubscroption;
  int get userSubId;
  @JsonKey(ignore: true)
  _$$CheckSubscriptonImplCopyWith<_$CheckSubscriptonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchConfigurationImplCopyWith<$Res> {
  factory _$$FetchConfigurationImplCopyWith(_$FetchConfigurationImpl value,
          $Res Function(_$FetchConfigurationImpl) then) =
      __$$FetchConfigurationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchConfigurationImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$FetchConfigurationImpl>
    implements _$$FetchConfigurationImplCopyWith<$Res> {
  __$$FetchConfigurationImplCopyWithImpl(_$FetchConfigurationImpl _value,
      $Res Function(_$FetchConfigurationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchConfigurationImpl implements _FetchConfiguration {
  const _$FetchConfigurationImpl();

  @override
  String toString() {
    return 'UserEvent.fetchConfiguration()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchConfigurationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchUser,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function() deleteUser,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function() fetchConfiguration,
  }) {
    return fetchConfiguration();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchUser,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function()? deleteUser,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetchConfiguration?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchUser,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function()? deleteUser,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchConfiguration != null) {
      return fetchConfiguration();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetchConfiguration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetchConfiguration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchConfiguration != null) {
      return fetchConfiguration(this);
    }
    return orElse();
  }
}

abstract class _FetchConfiguration implements UserEvent {
  const factory _FetchConfiguration() = _$FetchConfigurationImpl;
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserResponsesModel user) success,
    required TResult Function(String message) error,
    required TResult Function(TypeOrganizationResponse type) typeSuccess,
    required TResult Function() updateSuccess,
    required TResult Function() deleteSuccess,
    required TResult Function(ConfigurationResponse response)
        configurationSuccess,
    required TResult Function() checkSubsLoading,
    required TResult Function(CheckSubsModel checkSubsModel) checkSubsSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserResponsesModel user)? success,
    TResult? Function(String message)? error,
    TResult? Function(TypeOrganizationResponse type)? typeSuccess,
    TResult? Function()? updateSuccess,
    TResult? Function()? deleteSuccess,
    TResult? Function(ConfigurationResponse response)? configurationSuccess,
    TResult? Function()? checkSubsLoading,
    TResult? Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserResponsesModel user)? success,
    TResult Function(String message)? error,
    TResult Function(TypeOrganizationResponse type)? typeSuccess,
    TResult Function()? updateSuccess,
    TResult Function()? deleteSuccess,
    TResult Function(ConfigurationResponse response)? configurationSuccess,
    TResult Function()? checkSubsLoading,
    TResult Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialUser value) initial,
    required TResult Function(_SuccessUser value) success,
    required TResult Function(_ErrorUser value) error,
    required TResult Function(_TypeLoading value) typeSuccess,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_ConfigurationSuccess value) configurationSuccess,
    required TResult Function(_CheckSubsLoading value) checkSubsLoading,
    required TResult Function(_CheckSubsSuccess value) checkSubsSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialUser value)? initial,
    TResult? Function(_SuccessUser value)? success,
    TResult? Function(_ErrorUser value)? error,
    TResult? Function(_TypeLoading value)? typeSuccess,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult? Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult? Function(_CheckSubsSuccess value)? checkSubsSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialUser value)? initial,
    TResult Function(_SuccessUser value)? success,
    TResult Function(_ErrorUser value)? error,
    TResult Function(_TypeLoading value)? typeSuccess,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult Function(_CheckSubsSuccess value)? checkSubsSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialUserImplCopyWith<$Res> {
  factory _$$InitialUserImplCopyWith(
          _$InitialUserImpl value, $Res Function(_$InitialUserImpl) then) =
      __$$InitialUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialUserImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$InitialUserImpl>
    implements _$$InitialUserImplCopyWith<$Res> {
  __$$InitialUserImplCopyWithImpl(
      _$InitialUserImpl _value, $Res Function(_$InitialUserImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialUserImpl implements _InitialUser {
  const _$InitialUserImpl();

  @override
  String toString() {
    return 'UserState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserResponsesModel user) success,
    required TResult Function(String message) error,
    required TResult Function(TypeOrganizationResponse type) typeSuccess,
    required TResult Function() updateSuccess,
    required TResult Function() deleteSuccess,
    required TResult Function(ConfigurationResponse response)
        configurationSuccess,
    required TResult Function() checkSubsLoading,
    required TResult Function(CheckSubsModel checkSubsModel) checkSubsSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserResponsesModel user)? success,
    TResult? Function(String message)? error,
    TResult? Function(TypeOrganizationResponse type)? typeSuccess,
    TResult? Function()? updateSuccess,
    TResult? Function()? deleteSuccess,
    TResult? Function(ConfigurationResponse response)? configurationSuccess,
    TResult? Function()? checkSubsLoading,
    TResult? Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserResponsesModel user)? success,
    TResult Function(String message)? error,
    TResult Function(TypeOrganizationResponse type)? typeSuccess,
    TResult Function()? updateSuccess,
    TResult Function()? deleteSuccess,
    TResult Function(ConfigurationResponse response)? configurationSuccess,
    TResult Function()? checkSubsLoading,
    TResult Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
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
    required TResult Function(_InitialUser value) initial,
    required TResult Function(_SuccessUser value) success,
    required TResult Function(_ErrorUser value) error,
    required TResult Function(_TypeLoading value) typeSuccess,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_ConfigurationSuccess value) configurationSuccess,
    required TResult Function(_CheckSubsLoading value) checkSubsLoading,
    required TResult Function(_CheckSubsSuccess value) checkSubsSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialUser value)? initial,
    TResult? Function(_SuccessUser value)? success,
    TResult? Function(_ErrorUser value)? error,
    TResult? Function(_TypeLoading value)? typeSuccess,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult? Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult? Function(_CheckSubsSuccess value)? checkSubsSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialUser value)? initial,
    TResult Function(_SuccessUser value)? success,
    TResult Function(_ErrorUser value)? error,
    TResult Function(_TypeLoading value)? typeSuccess,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult Function(_CheckSubsSuccess value)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialUser implements UserState {
  const factory _InitialUser() = _$InitialUserImpl;
}

/// @nodoc
abstract class _$$SuccessUserImplCopyWith<$Res> {
  factory _$$SuccessUserImplCopyWith(
          _$SuccessUserImpl value, $Res Function(_$SuccessUserImpl) then) =
      __$$SuccessUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserResponsesModel user});
}

/// @nodoc
class __$$SuccessUserImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$SuccessUserImpl>
    implements _$$SuccessUserImplCopyWith<$Res> {
  __$$SuccessUserImplCopyWithImpl(
      _$SuccessUserImpl _value, $Res Function(_$SuccessUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$SuccessUserImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponsesModel,
    ));
  }
}

/// @nodoc

class _$SuccessUserImpl implements _SuccessUser {
  const _$SuccessUserImpl({required this.user});

  @override
  final UserResponsesModel user;

  @override
  String toString() {
    return 'UserState.success(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessUserImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessUserImplCopyWith<_$SuccessUserImpl> get copyWith =>
      __$$SuccessUserImplCopyWithImpl<_$SuccessUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserResponsesModel user) success,
    required TResult Function(String message) error,
    required TResult Function(TypeOrganizationResponse type) typeSuccess,
    required TResult Function() updateSuccess,
    required TResult Function() deleteSuccess,
    required TResult Function(ConfigurationResponse response)
        configurationSuccess,
    required TResult Function() checkSubsLoading,
    required TResult Function(CheckSubsModel checkSubsModel) checkSubsSuccess,
  }) {
    return success(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserResponsesModel user)? success,
    TResult? Function(String message)? error,
    TResult? Function(TypeOrganizationResponse type)? typeSuccess,
    TResult? Function()? updateSuccess,
    TResult? Function()? deleteSuccess,
    TResult? Function(ConfigurationResponse response)? configurationSuccess,
    TResult? Function()? checkSubsLoading,
    TResult? Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
  }) {
    return success?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserResponsesModel user)? success,
    TResult Function(String message)? error,
    TResult Function(TypeOrganizationResponse type)? typeSuccess,
    TResult Function()? updateSuccess,
    TResult Function()? deleteSuccess,
    TResult Function(ConfigurationResponse response)? configurationSuccess,
    TResult Function()? checkSubsLoading,
    TResult Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialUser value) initial,
    required TResult Function(_SuccessUser value) success,
    required TResult Function(_ErrorUser value) error,
    required TResult Function(_TypeLoading value) typeSuccess,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_ConfigurationSuccess value) configurationSuccess,
    required TResult Function(_CheckSubsLoading value) checkSubsLoading,
    required TResult Function(_CheckSubsSuccess value) checkSubsSuccess,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialUser value)? initial,
    TResult? Function(_SuccessUser value)? success,
    TResult? Function(_ErrorUser value)? error,
    TResult? Function(_TypeLoading value)? typeSuccess,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult? Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult? Function(_CheckSubsSuccess value)? checkSubsSuccess,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialUser value)? initial,
    TResult Function(_SuccessUser value)? success,
    TResult Function(_ErrorUser value)? error,
    TResult Function(_TypeLoading value)? typeSuccess,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult Function(_CheckSubsSuccess value)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessUser implements UserState {
  const factory _SuccessUser({required final UserResponsesModel user}) =
      _$SuccessUserImpl;

  UserResponsesModel get user;
  @JsonKey(ignore: true)
  _$$SuccessUserImplCopyWith<_$SuccessUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorUserImplCopyWith<$Res> {
  factory _$$ErrorUserImplCopyWith(
          _$ErrorUserImpl value, $Res Function(_$ErrorUserImpl) then) =
      __$$ErrorUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorUserImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$ErrorUserImpl>
    implements _$$ErrorUserImplCopyWith<$Res> {
  __$$ErrorUserImplCopyWithImpl(
      _$ErrorUserImpl _value, $Res Function(_$ErrorUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorUserImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorUserImpl implements _ErrorUser {
  const _$ErrorUserImpl({this.message = 'Произошла ошибка'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'UserState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorUserImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorUserImplCopyWith<_$ErrorUserImpl> get copyWith =>
      __$$ErrorUserImplCopyWithImpl<_$ErrorUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserResponsesModel user) success,
    required TResult Function(String message) error,
    required TResult Function(TypeOrganizationResponse type) typeSuccess,
    required TResult Function() updateSuccess,
    required TResult Function() deleteSuccess,
    required TResult Function(ConfigurationResponse response)
        configurationSuccess,
    required TResult Function() checkSubsLoading,
    required TResult Function(CheckSubsModel checkSubsModel) checkSubsSuccess,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserResponsesModel user)? success,
    TResult? Function(String message)? error,
    TResult? Function(TypeOrganizationResponse type)? typeSuccess,
    TResult? Function()? updateSuccess,
    TResult? Function()? deleteSuccess,
    TResult? Function(ConfigurationResponse response)? configurationSuccess,
    TResult? Function()? checkSubsLoading,
    TResult? Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserResponsesModel user)? success,
    TResult Function(String message)? error,
    TResult Function(TypeOrganizationResponse type)? typeSuccess,
    TResult Function()? updateSuccess,
    TResult Function()? deleteSuccess,
    TResult Function(ConfigurationResponse response)? configurationSuccess,
    TResult Function()? checkSubsLoading,
    TResult Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialUser value) initial,
    required TResult Function(_SuccessUser value) success,
    required TResult Function(_ErrorUser value) error,
    required TResult Function(_TypeLoading value) typeSuccess,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_ConfigurationSuccess value) configurationSuccess,
    required TResult Function(_CheckSubsLoading value) checkSubsLoading,
    required TResult Function(_CheckSubsSuccess value) checkSubsSuccess,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialUser value)? initial,
    TResult? Function(_SuccessUser value)? success,
    TResult? Function(_ErrorUser value)? error,
    TResult? Function(_TypeLoading value)? typeSuccess,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult? Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult? Function(_CheckSubsSuccess value)? checkSubsSuccess,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialUser value)? initial,
    TResult Function(_SuccessUser value)? success,
    TResult Function(_ErrorUser value)? error,
    TResult Function(_TypeLoading value)? typeSuccess,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult Function(_CheckSubsSuccess value)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorUser implements UserState {
  const factory _ErrorUser({final String message}) = _$ErrorUserImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorUserImplCopyWith<_$ErrorUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TypeLoadingImplCopyWith<$Res> {
  factory _$$TypeLoadingImplCopyWith(
          _$TypeLoadingImpl value, $Res Function(_$TypeLoadingImpl) then) =
      __$$TypeLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TypeOrganizationResponse type});
}

/// @nodoc
class __$$TypeLoadingImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$TypeLoadingImpl>
    implements _$$TypeLoadingImplCopyWith<$Res> {
  __$$TypeLoadingImplCopyWithImpl(
      _$TypeLoadingImpl _value, $Res Function(_$TypeLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$TypeLoadingImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeOrganizationResponse,
    ));
  }
}

/// @nodoc

class _$TypeLoadingImpl implements _TypeLoading {
  const _$TypeLoadingImpl({required this.type});

  @override
  final TypeOrganizationResponse type;

  @override
  String toString() {
    return 'UserState.typeSuccess(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeLoadingImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeLoadingImplCopyWith<_$TypeLoadingImpl> get copyWith =>
      __$$TypeLoadingImplCopyWithImpl<_$TypeLoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserResponsesModel user) success,
    required TResult Function(String message) error,
    required TResult Function(TypeOrganizationResponse type) typeSuccess,
    required TResult Function() updateSuccess,
    required TResult Function() deleteSuccess,
    required TResult Function(ConfigurationResponse response)
        configurationSuccess,
    required TResult Function() checkSubsLoading,
    required TResult Function(CheckSubsModel checkSubsModel) checkSubsSuccess,
  }) {
    return typeSuccess(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserResponsesModel user)? success,
    TResult? Function(String message)? error,
    TResult? Function(TypeOrganizationResponse type)? typeSuccess,
    TResult? Function()? updateSuccess,
    TResult? Function()? deleteSuccess,
    TResult? Function(ConfigurationResponse response)? configurationSuccess,
    TResult? Function()? checkSubsLoading,
    TResult? Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
  }) {
    return typeSuccess?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserResponsesModel user)? success,
    TResult Function(String message)? error,
    TResult Function(TypeOrganizationResponse type)? typeSuccess,
    TResult Function()? updateSuccess,
    TResult Function()? deleteSuccess,
    TResult Function(ConfigurationResponse response)? configurationSuccess,
    TResult Function()? checkSubsLoading,
    TResult Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (typeSuccess != null) {
      return typeSuccess(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialUser value) initial,
    required TResult Function(_SuccessUser value) success,
    required TResult Function(_ErrorUser value) error,
    required TResult Function(_TypeLoading value) typeSuccess,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_ConfigurationSuccess value) configurationSuccess,
    required TResult Function(_CheckSubsLoading value) checkSubsLoading,
    required TResult Function(_CheckSubsSuccess value) checkSubsSuccess,
  }) {
    return typeSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialUser value)? initial,
    TResult? Function(_SuccessUser value)? success,
    TResult? Function(_ErrorUser value)? error,
    TResult? Function(_TypeLoading value)? typeSuccess,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult? Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult? Function(_CheckSubsSuccess value)? checkSubsSuccess,
  }) {
    return typeSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialUser value)? initial,
    TResult Function(_SuccessUser value)? success,
    TResult Function(_ErrorUser value)? error,
    TResult Function(_TypeLoading value)? typeSuccess,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult Function(_CheckSubsSuccess value)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (typeSuccess != null) {
      return typeSuccess(this);
    }
    return orElse();
  }
}

abstract class _TypeLoading implements UserState {
  const factory _TypeLoading({required final TypeOrganizationResponse type}) =
      _$TypeLoadingImpl;

  TypeOrganizationResponse get type;
  @JsonKey(ignore: true)
  _$$TypeLoadingImplCopyWith<_$TypeLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSuccessImplCopyWith<$Res> {
  factory _$$UpdateSuccessImplCopyWith(
          _$UpdateSuccessImpl value, $Res Function(_$UpdateSuccessImpl) then) =
      __$$UpdateSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UpdateSuccessImpl>
    implements _$$UpdateSuccessImplCopyWith<$Res> {
  __$$UpdateSuccessImplCopyWithImpl(
      _$UpdateSuccessImpl _value, $Res Function(_$UpdateSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateSuccessImpl implements _UpdateSuccess {
  const _$UpdateSuccessImpl();

  @override
  String toString() {
    return 'UserState.updateSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserResponsesModel user) success,
    required TResult Function(String message) error,
    required TResult Function(TypeOrganizationResponse type) typeSuccess,
    required TResult Function() updateSuccess,
    required TResult Function() deleteSuccess,
    required TResult Function(ConfigurationResponse response)
        configurationSuccess,
    required TResult Function() checkSubsLoading,
    required TResult Function(CheckSubsModel checkSubsModel) checkSubsSuccess,
  }) {
    return updateSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserResponsesModel user)? success,
    TResult? Function(String message)? error,
    TResult? Function(TypeOrganizationResponse type)? typeSuccess,
    TResult? Function()? updateSuccess,
    TResult? Function()? deleteSuccess,
    TResult? Function(ConfigurationResponse response)? configurationSuccess,
    TResult? Function()? checkSubsLoading,
    TResult? Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
  }) {
    return updateSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserResponsesModel user)? success,
    TResult Function(String message)? error,
    TResult Function(TypeOrganizationResponse type)? typeSuccess,
    TResult Function()? updateSuccess,
    TResult Function()? deleteSuccess,
    TResult Function(ConfigurationResponse response)? configurationSuccess,
    TResult Function()? checkSubsLoading,
    TResult Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (updateSuccess != null) {
      return updateSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialUser value) initial,
    required TResult Function(_SuccessUser value) success,
    required TResult Function(_ErrorUser value) error,
    required TResult Function(_TypeLoading value) typeSuccess,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_ConfigurationSuccess value) configurationSuccess,
    required TResult Function(_CheckSubsLoading value) checkSubsLoading,
    required TResult Function(_CheckSubsSuccess value) checkSubsSuccess,
  }) {
    return updateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialUser value)? initial,
    TResult? Function(_SuccessUser value)? success,
    TResult? Function(_ErrorUser value)? error,
    TResult? Function(_TypeLoading value)? typeSuccess,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult? Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult? Function(_CheckSubsSuccess value)? checkSubsSuccess,
  }) {
    return updateSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialUser value)? initial,
    TResult Function(_SuccessUser value)? success,
    TResult Function(_ErrorUser value)? error,
    TResult Function(_TypeLoading value)? typeSuccess,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult Function(_CheckSubsSuccess value)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (updateSuccess != null) {
      return updateSuccess(this);
    }
    return orElse();
  }
}

abstract class _UpdateSuccess implements UserState {
  const factory _UpdateSuccess() = _$UpdateSuccessImpl;
}

/// @nodoc
abstract class _$$DeleteSuccessImplCopyWith<$Res> {
  factory _$$DeleteSuccessImplCopyWith(
          _$DeleteSuccessImpl value, $Res Function(_$DeleteSuccessImpl) then) =
      __$$DeleteSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$DeleteSuccessImpl>
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
    return 'UserState.deleteSuccess()';
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
    required TResult Function() initial,
    required TResult Function(UserResponsesModel user) success,
    required TResult Function(String message) error,
    required TResult Function(TypeOrganizationResponse type) typeSuccess,
    required TResult Function() updateSuccess,
    required TResult Function() deleteSuccess,
    required TResult Function(ConfigurationResponse response)
        configurationSuccess,
    required TResult Function() checkSubsLoading,
    required TResult Function(CheckSubsModel checkSubsModel) checkSubsSuccess,
  }) {
    return deleteSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserResponsesModel user)? success,
    TResult? Function(String message)? error,
    TResult? Function(TypeOrganizationResponse type)? typeSuccess,
    TResult? Function()? updateSuccess,
    TResult? Function()? deleteSuccess,
    TResult? Function(ConfigurationResponse response)? configurationSuccess,
    TResult? Function()? checkSubsLoading,
    TResult? Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
  }) {
    return deleteSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserResponsesModel user)? success,
    TResult Function(String message)? error,
    TResult Function(TypeOrganizationResponse type)? typeSuccess,
    TResult Function()? updateSuccess,
    TResult Function()? deleteSuccess,
    TResult Function(ConfigurationResponse response)? configurationSuccess,
    TResult Function()? checkSubsLoading,
    TResult Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
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
    required TResult Function(_InitialUser value) initial,
    required TResult Function(_SuccessUser value) success,
    required TResult Function(_ErrorUser value) error,
    required TResult Function(_TypeLoading value) typeSuccess,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_ConfigurationSuccess value) configurationSuccess,
    required TResult Function(_CheckSubsLoading value) checkSubsLoading,
    required TResult Function(_CheckSubsSuccess value) checkSubsSuccess,
  }) {
    return deleteSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialUser value)? initial,
    TResult? Function(_SuccessUser value)? success,
    TResult? Function(_ErrorUser value)? error,
    TResult? Function(_TypeLoading value)? typeSuccess,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult? Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult? Function(_CheckSubsSuccess value)? checkSubsSuccess,
  }) {
    return deleteSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialUser value)? initial,
    TResult Function(_SuccessUser value)? success,
    TResult Function(_ErrorUser value)? error,
    TResult Function(_TypeLoading value)? typeSuccess,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult Function(_CheckSubsSuccess value)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (deleteSuccess != null) {
      return deleteSuccess(this);
    }
    return orElse();
  }
}

abstract class _DeleteSuccess implements UserState {
  const factory _DeleteSuccess() = _$DeleteSuccessImpl;
}

/// @nodoc
abstract class _$$ConfigurationSuccessImplCopyWith<$Res> {
  factory _$$ConfigurationSuccessImplCopyWith(_$ConfigurationSuccessImpl value,
          $Res Function(_$ConfigurationSuccessImpl) then) =
      __$$ConfigurationSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ConfigurationResponse response});
}

/// @nodoc
class __$$ConfigurationSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$ConfigurationSuccessImpl>
    implements _$$ConfigurationSuccessImplCopyWith<$Res> {
  __$$ConfigurationSuccessImplCopyWithImpl(_$ConfigurationSuccessImpl _value,
      $Res Function(_$ConfigurationSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$ConfigurationSuccessImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ConfigurationResponse,
    ));
  }
}

/// @nodoc

class _$ConfigurationSuccessImpl implements _ConfigurationSuccess {
  const _$ConfigurationSuccessImpl({required this.response});

  @override
  final ConfigurationResponse response;

  @override
  String toString() {
    return 'UserState.configurationSuccess(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigurationSuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigurationSuccessImplCopyWith<_$ConfigurationSuccessImpl>
      get copyWith =>
          __$$ConfigurationSuccessImplCopyWithImpl<_$ConfigurationSuccessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserResponsesModel user) success,
    required TResult Function(String message) error,
    required TResult Function(TypeOrganizationResponse type) typeSuccess,
    required TResult Function() updateSuccess,
    required TResult Function() deleteSuccess,
    required TResult Function(ConfigurationResponse response)
        configurationSuccess,
    required TResult Function() checkSubsLoading,
    required TResult Function(CheckSubsModel checkSubsModel) checkSubsSuccess,
  }) {
    return configurationSuccess(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserResponsesModel user)? success,
    TResult? Function(String message)? error,
    TResult? Function(TypeOrganizationResponse type)? typeSuccess,
    TResult? Function()? updateSuccess,
    TResult? Function()? deleteSuccess,
    TResult? Function(ConfigurationResponse response)? configurationSuccess,
    TResult? Function()? checkSubsLoading,
    TResult? Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
  }) {
    return configurationSuccess?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserResponsesModel user)? success,
    TResult Function(String message)? error,
    TResult Function(TypeOrganizationResponse type)? typeSuccess,
    TResult Function()? updateSuccess,
    TResult Function()? deleteSuccess,
    TResult Function(ConfigurationResponse response)? configurationSuccess,
    TResult Function()? checkSubsLoading,
    TResult Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (configurationSuccess != null) {
      return configurationSuccess(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialUser value) initial,
    required TResult Function(_SuccessUser value) success,
    required TResult Function(_ErrorUser value) error,
    required TResult Function(_TypeLoading value) typeSuccess,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_ConfigurationSuccess value) configurationSuccess,
    required TResult Function(_CheckSubsLoading value) checkSubsLoading,
    required TResult Function(_CheckSubsSuccess value) checkSubsSuccess,
  }) {
    return configurationSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialUser value)? initial,
    TResult? Function(_SuccessUser value)? success,
    TResult? Function(_ErrorUser value)? error,
    TResult? Function(_TypeLoading value)? typeSuccess,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult? Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult? Function(_CheckSubsSuccess value)? checkSubsSuccess,
  }) {
    return configurationSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialUser value)? initial,
    TResult Function(_SuccessUser value)? success,
    TResult Function(_ErrorUser value)? error,
    TResult Function(_TypeLoading value)? typeSuccess,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult Function(_CheckSubsSuccess value)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (configurationSuccess != null) {
      return configurationSuccess(this);
    }
    return orElse();
  }
}

abstract class _ConfigurationSuccess implements UserState {
  const factory _ConfigurationSuccess(
          {required final ConfigurationResponse response}) =
      _$ConfigurationSuccessImpl;

  ConfigurationResponse get response;
  @JsonKey(ignore: true)
  _$$ConfigurationSuccessImplCopyWith<_$ConfigurationSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckSubsLoadingImplCopyWith<$Res> {
  factory _$$CheckSubsLoadingImplCopyWith(_$CheckSubsLoadingImpl value,
          $Res Function(_$CheckSubsLoadingImpl) then) =
      __$$CheckSubsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckSubsLoadingImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$CheckSubsLoadingImpl>
    implements _$$CheckSubsLoadingImplCopyWith<$Res> {
  __$$CheckSubsLoadingImplCopyWithImpl(_$CheckSubsLoadingImpl _value,
      $Res Function(_$CheckSubsLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckSubsLoadingImpl implements _CheckSubsLoading {
  const _$CheckSubsLoadingImpl();

  @override
  String toString() {
    return 'UserState.checkSubsLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckSubsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserResponsesModel user) success,
    required TResult Function(String message) error,
    required TResult Function(TypeOrganizationResponse type) typeSuccess,
    required TResult Function() updateSuccess,
    required TResult Function() deleteSuccess,
    required TResult Function(ConfigurationResponse response)
        configurationSuccess,
    required TResult Function() checkSubsLoading,
    required TResult Function(CheckSubsModel checkSubsModel) checkSubsSuccess,
  }) {
    return checkSubsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserResponsesModel user)? success,
    TResult? Function(String message)? error,
    TResult? Function(TypeOrganizationResponse type)? typeSuccess,
    TResult? Function()? updateSuccess,
    TResult? Function()? deleteSuccess,
    TResult? Function(ConfigurationResponse response)? configurationSuccess,
    TResult? Function()? checkSubsLoading,
    TResult? Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
  }) {
    return checkSubsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserResponsesModel user)? success,
    TResult Function(String message)? error,
    TResult Function(TypeOrganizationResponse type)? typeSuccess,
    TResult Function()? updateSuccess,
    TResult Function()? deleteSuccess,
    TResult Function(ConfigurationResponse response)? configurationSuccess,
    TResult Function()? checkSubsLoading,
    TResult Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (checkSubsLoading != null) {
      return checkSubsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialUser value) initial,
    required TResult Function(_SuccessUser value) success,
    required TResult Function(_ErrorUser value) error,
    required TResult Function(_TypeLoading value) typeSuccess,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_ConfigurationSuccess value) configurationSuccess,
    required TResult Function(_CheckSubsLoading value) checkSubsLoading,
    required TResult Function(_CheckSubsSuccess value) checkSubsSuccess,
  }) {
    return checkSubsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialUser value)? initial,
    TResult? Function(_SuccessUser value)? success,
    TResult? Function(_ErrorUser value)? error,
    TResult? Function(_TypeLoading value)? typeSuccess,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult? Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult? Function(_CheckSubsSuccess value)? checkSubsSuccess,
  }) {
    return checkSubsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialUser value)? initial,
    TResult Function(_SuccessUser value)? success,
    TResult Function(_ErrorUser value)? error,
    TResult Function(_TypeLoading value)? typeSuccess,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult Function(_CheckSubsSuccess value)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (checkSubsLoading != null) {
      return checkSubsLoading(this);
    }
    return orElse();
  }
}

abstract class _CheckSubsLoading implements UserState {
  const factory _CheckSubsLoading() = _$CheckSubsLoadingImpl;
}

/// @nodoc
abstract class _$$CheckSubsSuccessImplCopyWith<$Res> {
  factory _$$CheckSubsSuccessImplCopyWith(_$CheckSubsSuccessImpl value,
          $Res Function(_$CheckSubsSuccessImpl) then) =
      __$$CheckSubsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CheckSubsModel checkSubsModel});
}

/// @nodoc
class __$$CheckSubsSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$CheckSubsSuccessImpl>
    implements _$$CheckSubsSuccessImplCopyWith<$Res> {
  __$$CheckSubsSuccessImplCopyWithImpl(_$CheckSubsSuccessImpl _value,
      $Res Function(_$CheckSubsSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkSubsModel = null,
  }) {
    return _then(_$CheckSubsSuccessImpl(
      checkSubsModel: null == checkSubsModel
          ? _value.checkSubsModel
          : checkSubsModel // ignore: cast_nullable_to_non_nullable
              as CheckSubsModel,
    ));
  }
}

/// @nodoc

class _$CheckSubsSuccessImpl implements _CheckSubsSuccess {
  const _$CheckSubsSuccessImpl({required this.checkSubsModel});

  @override
  final CheckSubsModel checkSubsModel;

  @override
  String toString() {
    return 'UserState.checkSubsSuccess(checkSubsModel: $checkSubsModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckSubsSuccessImpl &&
            (identical(other.checkSubsModel, checkSubsModel) ||
                other.checkSubsModel == checkSubsModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, checkSubsModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckSubsSuccessImplCopyWith<_$CheckSubsSuccessImpl> get copyWith =>
      __$$CheckSubsSuccessImplCopyWithImpl<_$CheckSubsSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserResponsesModel user) success,
    required TResult Function(String message) error,
    required TResult Function(TypeOrganizationResponse type) typeSuccess,
    required TResult Function() updateSuccess,
    required TResult Function() deleteSuccess,
    required TResult Function(ConfigurationResponse response)
        configurationSuccess,
    required TResult Function() checkSubsLoading,
    required TResult Function(CheckSubsModel checkSubsModel) checkSubsSuccess,
  }) {
    return checkSubsSuccess(checkSubsModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserResponsesModel user)? success,
    TResult? Function(String message)? error,
    TResult? Function(TypeOrganizationResponse type)? typeSuccess,
    TResult? Function()? updateSuccess,
    TResult? Function()? deleteSuccess,
    TResult? Function(ConfigurationResponse response)? configurationSuccess,
    TResult? Function()? checkSubsLoading,
    TResult? Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
  }) {
    return checkSubsSuccess?.call(checkSubsModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserResponsesModel user)? success,
    TResult Function(String message)? error,
    TResult Function(TypeOrganizationResponse type)? typeSuccess,
    TResult Function()? updateSuccess,
    TResult Function()? deleteSuccess,
    TResult Function(ConfigurationResponse response)? configurationSuccess,
    TResult Function()? checkSubsLoading,
    TResult Function(CheckSubsModel checkSubsModel)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (checkSubsSuccess != null) {
      return checkSubsSuccess(checkSubsModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialUser value) initial,
    required TResult Function(_SuccessUser value) success,
    required TResult Function(_ErrorUser value) error,
    required TResult Function(_TypeLoading value) typeSuccess,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_DeleteSuccess value) deleteSuccess,
    required TResult Function(_ConfigurationSuccess value) configurationSuccess,
    required TResult Function(_CheckSubsLoading value) checkSubsLoading,
    required TResult Function(_CheckSubsSuccess value) checkSubsSuccess,
  }) {
    return checkSubsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialUser value)? initial,
    TResult? Function(_SuccessUser value)? success,
    TResult? Function(_ErrorUser value)? error,
    TResult? Function(_TypeLoading value)? typeSuccess,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_DeleteSuccess value)? deleteSuccess,
    TResult? Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult? Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult? Function(_CheckSubsSuccess value)? checkSubsSuccess,
  }) {
    return checkSubsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialUser value)? initial,
    TResult Function(_SuccessUser value)? success,
    TResult Function(_ErrorUser value)? error,
    TResult Function(_TypeLoading value)? typeSuccess,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_DeleteSuccess value)? deleteSuccess,
    TResult Function(_ConfigurationSuccess value)? configurationSuccess,
    TResult Function(_CheckSubsLoading value)? checkSubsLoading,
    TResult Function(_CheckSubsSuccess value)? checkSubsSuccess,
    required TResult orElse(),
  }) {
    if (checkSubsSuccess != null) {
      return checkSubsSuccess(this);
    }
    return orElse();
  }
}

abstract class _CheckSubsSuccess implements UserState {
  const factory _CheckSubsSuccess(
      {required final CheckSubsModel checkSubsModel}) = _$CheckSubsSuccessImpl;

  CheckSubsModel get checkSubsModel;
  @JsonKey(ignore: true)
  _$$CheckSubsSuccessImplCopyWith<_$CheckSubsSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
