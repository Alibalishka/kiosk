// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthApi {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthApiCopyWith<$Res> {
  factory $AuthApiCopyWith(AuthApi value, $Res Function(AuthApi) then) =
      _$AuthApiCopyWithImpl<$Res, AuthApi>;
}

/// @nodoc
class _$AuthApiCopyWithImpl<$Res, $Val extends AuthApi>
    implements $AuthApiCopyWith<$Res> {
  _$AuthApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$LoginImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginImpl extends _Login {
  const _$LoginImpl({required this.phone}) : super._();

  @override
  final String phone;

  @override
  String toString() {
    return 'AuthApi.login(phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return login(phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return login?.call(phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login extends AuthApi {
  const factory _Login({required final String phone}) = _$LoginImpl;
  const _Login._() : super._();

  String get phone;
  @JsonKey(ignore: true)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PinCodeImplCopyWith<$Res> {
  factory _$$PinCodeImplCopyWith(
          _$PinCodeImpl value, $Res Function(_$PinCodeImpl) then) =
      __$$PinCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterRequest body});
}

/// @nodoc
class __$$PinCodeImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$PinCodeImpl>
    implements _$$PinCodeImplCopyWith<$Res> {
  __$$PinCodeImplCopyWithImpl(
      _$PinCodeImpl _value, $Res Function(_$PinCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$PinCodeImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as RegisterRequest,
    ));
  }
}

/// @nodoc

class _$PinCodeImpl extends _PinCode {
  const _$PinCodeImpl({required this.body}) : super._();

  @override
  final RegisterRequest body;

  @override
  String toString() {
    return 'AuthApi.pinCode(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PinCodeImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PinCodeImplCopyWith<_$PinCodeImpl> get copyWith =>
      __$$PinCodeImplCopyWithImpl<_$PinCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return pinCode(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return pinCode?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (pinCode != null) {
      return pinCode(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return pinCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return pinCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (pinCode != null) {
      return pinCode(this);
    }
    return orElse();
  }
}

abstract class _PinCode extends AuthApi {
  const factory _PinCode({required final RegisterRequest body}) = _$PinCodeImpl;
  const _PinCode._() : super._();

  RegisterRequest get body;
  @JsonKey(ignore: true)
  _$$PinCodeImplCopyWith<_$PinCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchUserImplCopyWith<$Res> {
  factory _$$FetchUserImplCopyWith(
          _$FetchUserImpl value, $Res Function(_$FetchUserImpl) then) =
      __$$FetchUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchUserImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$FetchUserImpl>
    implements _$$FetchUserImplCopyWith<$Res> {
  __$$FetchUserImplCopyWithImpl(
      _$FetchUserImpl _value, $Res Function(_$FetchUserImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchUserImpl extends _FetchUser {
  const _$FetchUserImpl() : super._();

  @override
  String toString() {
    return 'AuthApi.fetchUser()';
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
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return fetchUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetchUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
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
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetchUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetchUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchUser != null) {
      return fetchUser(this);
    }
    return orElse();
  }
}

abstract class _FetchUser extends AuthApi {
  const factory _FetchUser() = _$FetchUserImpl;
  const _FetchUser._() : super._();
}

/// @nodoc
abstract class _$$FetchAddressImplCopyWith<$Res> {
  factory _$$FetchAddressImplCopyWith(
          _$FetchAddressImpl value, $Res Function(_$FetchAddressImpl) then) =
      __$$FetchAddressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAddressImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$FetchAddressImpl>
    implements _$$FetchAddressImplCopyWith<$Res> {
  __$$FetchAddressImplCopyWithImpl(
      _$FetchAddressImpl _value, $Res Function(_$FetchAddressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchAddressImpl extends _FetchAddress {
  const _$FetchAddressImpl() : super._();

  @override
  String toString() {
    return 'AuthApi.fetchAddress()';
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
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return fetchAddress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetchAddress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
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
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetchAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetchAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchAddress != null) {
      return fetchAddress(this);
    }
    return orElse();
  }
}

abstract class _FetchAddress extends AuthApi {
  const factory _FetchAddress() = _$FetchAddressImpl;
  const _FetchAddress._() : super._();
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
    extends _$AuthApiCopyWithImpl<$Res, _$SaveAddressImpl>
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

class _$SaveAddressImpl extends _SaveAddress {
  const _$SaveAddressImpl({required this.body}) : super._();

  @override
  final AddressRequest body;

  @override
  String toString() {
    return 'AuthApi.saveAddress(body: $body)';
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
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return saveAddress(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return saveAddress?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
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
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return saveAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return saveAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (saveAddress != null) {
      return saveAddress(this);
    }
    return orElse();
  }
}

abstract class _SaveAddress extends AuthApi {
  const factory _SaveAddress({required final AddressRequest body}) =
      _$SaveAddressImpl;
  const _SaveAddress._() : super._();

  AddressRequest get body;
  @JsonKey(ignore: true)
  _$$SaveAddressImplCopyWith<_$SaveAddressImpl> get copyWith =>
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
    extends _$AuthApiCopyWithImpl<$Res, _$SelectAddressImpl>
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

class _$SelectAddressImpl extends _SelectAddress {
  const _$SelectAddressImpl({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'AuthApi.selectAddress(id: $id)';
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
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return selectAddress(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return selectAddress?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
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
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return selectAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return selectAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (selectAddress != null) {
      return selectAddress(this);
    }
    return orElse();
  }
}

abstract class _SelectAddress extends AuthApi {
  const factory _SelectAddress({required final int id}) = _$SelectAddressImpl;
  const _SelectAddress._() : super._();

  int get id;
  @JsonKey(ignore: true)
  _$$SelectAddressImplCopyWith<_$SelectAddressImpl> get copyWith =>
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
    extends _$AuthApiCopyWithImpl<$Res, _$DeleteAddressImpl>
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

class _$DeleteAddressImpl extends _DeleteAddress {
  const _$DeleteAddressImpl({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'AuthApi.deleteAddress(id: $id)';
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
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return deleteAddress(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return deleteAddress?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
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
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return deleteAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return deleteAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (deleteAddress != null) {
      return deleteAddress(this);
    }
    return orElse();
  }
}

abstract class _DeleteAddress extends AuthApi {
  const factory _DeleteAddress({required final int id}) = _$DeleteAddressImpl;
  const _DeleteAddress._() : super._();

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteAddressImplCopyWith<_$DeleteAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchOrdersImplCopyWith<$Res> {
  factory _$$FetchOrdersImplCopyWith(
          _$FetchOrdersImpl value, $Res Function(_$FetchOrdersImpl) then) =
      __$$FetchOrdersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchOrdersImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$FetchOrdersImpl>
    implements _$$FetchOrdersImplCopyWith<$Res> {
  __$$FetchOrdersImplCopyWithImpl(
      _$FetchOrdersImpl _value, $Res Function(_$FetchOrdersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchOrdersImpl extends _FetchOrders {
  const _$FetchOrdersImpl() : super._();

  @override
  String toString() {
    return 'AuthApi.fetcOrders()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchOrdersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return fetcOrders();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetcOrders?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetcOrders != null) {
      return fetcOrders();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetcOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetcOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetcOrders != null) {
      return fetcOrders(this);
    }
    return orElse();
  }
}

abstract class _FetchOrders extends AuthApi {
  const factory _FetchOrders() = _$FetchOrdersImpl;
  const _FetchOrders._() : super._();
}

/// @nodoc
abstract class _$$FetchOrderImplCopyWith<$Res> {
  factory _$$FetchOrderImplCopyWith(
          _$FetchOrderImpl value, $Res Function(_$FetchOrderImpl) then) =
      __$$FetchOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$FetchOrderImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$FetchOrderImpl>
    implements _$$FetchOrderImplCopyWith<$Res> {
  __$$FetchOrderImplCopyWithImpl(
      _$FetchOrderImpl _value, $Res Function(_$FetchOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchOrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchOrderImpl extends _FetchOrder {
  const _$FetchOrderImpl({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'AuthApi.fetcOrder(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchOrderImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchOrderImplCopyWith<_$FetchOrderImpl> get copyWith =>
      __$$FetchOrderImplCopyWithImpl<_$FetchOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return fetcOrder(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetcOrder?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetcOrder != null) {
      return fetcOrder(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetcOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetcOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetcOrder != null) {
      return fetcOrder(this);
    }
    return orElse();
  }
}

abstract class _FetchOrder extends AuthApi {
  const factory _FetchOrder({required final int id}) = _$FetchOrderImpl;
  const _FetchOrder._() : super._();

  int get id;
  @JsonKey(ignore: true)
  _$$FetchOrderImplCopyWith<_$FetchOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchTypeOrganizationImplCopyWith<$Res> {
  factory _$$FetchTypeOrganizationImplCopyWith(
          _$FetchTypeOrganizationImpl value,
          $Res Function(_$FetchTypeOrganizationImpl) then) =
      __$$FetchTypeOrganizationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchTypeOrganizationImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$FetchTypeOrganizationImpl>
    implements _$$FetchTypeOrganizationImplCopyWith<$Res> {
  __$$FetchTypeOrganizationImplCopyWithImpl(_$FetchTypeOrganizationImpl _value,
      $Res Function(_$FetchTypeOrganizationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchTypeOrganizationImpl extends _FetchTypeOrganization {
  const _$FetchTypeOrganizationImpl() : super._();

  @override
  String toString() {
    return 'AuthApi.fetcTypeOrganization()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchTypeOrganizationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return fetcTypeOrganization();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetcTypeOrganization?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetcTypeOrganization != null) {
      return fetcTypeOrganization();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetcTypeOrganization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetcTypeOrganization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetcTypeOrganization != null) {
      return fetcTypeOrganization(this);
    }
    return orElse();
  }
}

abstract class _FetchTypeOrganization extends AuthApi {
  const factory _FetchTypeOrganization() = _$FetchTypeOrganizationImpl;
  const _FetchTypeOrganization._() : super._();
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
    extends _$AuthApiCopyWithImpl<$Res, _$UpdateUserImpl>
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

class _$UpdateUserImpl extends _UpdateUser {
  const _$UpdateUserImpl({required this.body}) : super._();

  @override
  final UserUpdateRequest body;

  @override
  String toString() {
    return 'AuthApi.updateUser(body: $body)';
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
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return updateUser(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return updateUser?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
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
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return updateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return updateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(this);
    }
    return orElse();
  }
}

abstract class _UpdateUser extends AuthApi {
  const factory _UpdateUser({required final UserUpdateRequest body}) =
      _$UpdateUserImpl;
  const _UpdateUser._() : super._();

  UserUpdateRequest get body;
  @JsonKey(ignore: true)
  _$$UpdateUserImplCopyWith<_$UpdateUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateOrganizationImplCopyWith<$Res> {
  factory _$$UpdateOrganizationImplCopyWith(_$UpdateOrganizationImpl value,
          $Res Function(_$UpdateOrganizationImpl) then) =
      __$$UpdateOrganizationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrganizationUpdateRequest body});
}

/// @nodoc
class __$$UpdateOrganizationImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$UpdateOrganizationImpl>
    implements _$$UpdateOrganizationImplCopyWith<$Res> {
  __$$UpdateOrganizationImplCopyWithImpl(_$UpdateOrganizationImpl _value,
      $Res Function(_$UpdateOrganizationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$UpdateOrganizationImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as OrganizationUpdateRequest,
    ));
  }
}

/// @nodoc

class _$UpdateOrganizationImpl extends _UpdateOrganization {
  const _$UpdateOrganizationImpl({required this.body}) : super._();

  @override
  final OrganizationUpdateRequest body;

  @override
  String toString() {
    return 'AuthApi.updateOrganization(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateOrganizationImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateOrganizationImplCopyWith<_$UpdateOrganizationImpl> get copyWith =>
      __$$UpdateOrganizationImplCopyWithImpl<_$UpdateOrganizationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return updateOrganization(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return updateOrganization?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (updateOrganization != null) {
      return updateOrganization(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return updateOrganization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return updateOrganization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (updateOrganization != null) {
      return updateOrganization(this);
    }
    return orElse();
  }
}

abstract class _UpdateOrganization extends AuthApi {
  const factory _UpdateOrganization(
          {required final OrganizationUpdateRequest body}) =
      _$UpdateOrganizationImpl;
  const _UpdateOrganization._() : super._();

  OrganizationUpdateRequest get body;
  @JsonKey(ignore: true)
  _$$UpdateOrganizationImplCopyWith<_$UpdateOrganizationImpl> get copyWith =>
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
    extends _$AuthApiCopyWithImpl<$Res, _$DeleteUserImpl>
    implements _$$DeleteUserImplCopyWith<$Res> {
  __$$DeleteUserImplCopyWithImpl(
      _$DeleteUserImpl _value, $Res Function(_$DeleteUserImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteUserImpl extends _DeleteUser {
  const _$DeleteUserImpl() : super._();

  @override
  String toString() {
    return 'AuthApi.deleteUser()';
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
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return deleteUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return deleteUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
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
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return deleteUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return deleteUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser(this);
    }
    return orElse();
  }
}

abstract class _DeleteUser extends AuthApi {
  const factory _DeleteUser() = _$DeleteUserImpl;
  const _DeleteUser._() : super._();
}

/// @nodoc
abstract class _$$FetchPaymentMethodsImplCopyWith<$Res> {
  factory _$$FetchPaymentMethodsImplCopyWith(_$FetchPaymentMethodsImpl value,
          $Res Function(_$FetchPaymentMethodsImpl) then) =
      __$$FetchPaymentMethodsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchPaymentMethodsImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$FetchPaymentMethodsImpl>
    implements _$$FetchPaymentMethodsImplCopyWith<$Res> {
  __$$FetchPaymentMethodsImplCopyWithImpl(_$FetchPaymentMethodsImpl _value,
      $Res Function(_$FetchPaymentMethodsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchPaymentMethodsImpl extends _FetchPaymentMethods {
  const _$FetchPaymentMethodsImpl() : super._();

  @override
  String toString() {
    return 'AuthApi.fetchPaymentMethods()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPaymentMethodsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return fetchPaymentMethods();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetchPaymentMethods?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchPaymentMethods != null) {
      return fetchPaymentMethods();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetchPaymentMethods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetchPaymentMethods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchPaymentMethods != null) {
      return fetchPaymentMethods(this);
    }
    return orElse();
  }
}

abstract class _FetchPaymentMethods extends AuthApi {
  const factory _FetchPaymentMethods() = _$FetchPaymentMethodsImpl;
  const _FetchPaymentMethods._() : super._();
}

/// @nodoc
abstract class _$$AddBankCardImplCopyWith<$Res> {
  factory _$$AddBankCardImplCopyWith(
          _$AddBankCardImpl value, $Res Function(_$AddBankCardImpl) then) =
      __$$AddBankCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$AddBankCardImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$AddBankCardImpl>
    implements _$$AddBankCardImplCopyWith<$Res> {
  __$$AddBankCardImplCopyWithImpl(
      _$AddBankCardImpl _value, $Res Function(_$AddBankCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$AddBankCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddBankCardImpl extends _AddBankCard {
  const _$AddBankCardImpl({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'AuthApi.addBankCard(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBankCardImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddBankCardImplCopyWith<_$AddBankCardImpl> get copyWith =>
      __$$AddBankCardImplCopyWithImpl<_$AddBankCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return addBankCard(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return addBankCard?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (addBankCard != null) {
      return addBankCard(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return addBankCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return addBankCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (addBankCard != null) {
      return addBankCard(this);
    }
    return orElse();
  }
}

abstract class _AddBankCard extends AuthApi {
  const factory _AddBankCard({required final int id}) = _$AddBankCardImpl;
  const _AddBankCard._() : super._();

  int get id;
  @JsonKey(ignore: true)
  _$$AddBankCardImplCopyWith<_$AddBankCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchCardsImplCopyWith<$Res> {
  factory _$$FetchCardsImplCopyWith(
          _$FetchCardsImpl value, $Res Function(_$FetchCardsImpl) then) =
      __$$FetchCardsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchCardsImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$FetchCardsImpl>
    implements _$$FetchCardsImplCopyWith<$Res> {
  __$$FetchCardsImplCopyWithImpl(
      _$FetchCardsImpl _value, $Res Function(_$FetchCardsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchCardsImpl extends _FetchCards {
  const _$FetchCardsImpl() : super._();

  @override
  String toString() {
    return 'AuthApi.fetchCards()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchCardsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return fetchCards();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetchCards?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchCards != null) {
      return fetchCards();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetchCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetchCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchCards != null) {
      return fetchCards(this);
    }
    return orElse();
  }
}

abstract class _FetchCards extends AuthApi {
  const factory _FetchCards() = _$FetchCardsImpl;
  const _FetchCards._() : super._();
}

/// @nodoc
abstract class _$$FetchHistoryImplCopyWith<$Res> {
  factory _$$FetchHistoryImplCopyWith(
          _$FetchHistoryImpl value, $Res Function(_$FetchHistoryImpl) then) =
      __$$FetchHistoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchHistoryImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$FetchHistoryImpl>
    implements _$$FetchHistoryImplCopyWith<$Res> {
  __$$FetchHistoryImplCopyWithImpl(
      _$FetchHistoryImpl _value, $Res Function(_$FetchHistoryImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchHistoryImpl extends _FetchHistory {
  const _$FetchHistoryImpl() : super._();

  @override
  String toString() {
    return 'AuthApi.fetchHistory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchHistoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return fetchHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetchHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchHistory != null) {
      return fetchHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetchHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetchHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchHistory != null) {
      return fetchHistory(this);
    }
    return orElse();
  }
}

abstract class _FetchHistory extends AuthApi {
  const factory _FetchHistory() = _$FetchHistoryImpl;
  const _FetchHistory._() : super._();
}

/// @nodoc
abstract class _$$FetchSubscriptionImplCopyWith<$Res> {
  factory _$$FetchSubscriptionImplCopyWith(_$FetchSubscriptionImpl value,
          $Res Function(_$FetchSubscriptionImpl) then) =
      __$$FetchSubscriptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchSubscriptionImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$FetchSubscriptionImpl>
    implements _$$FetchSubscriptionImplCopyWith<$Res> {
  __$$FetchSubscriptionImplCopyWithImpl(_$FetchSubscriptionImpl _value,
      $Res Function(_$FetchSubscriptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchSubscriptionImpl extends _FetchSubscription {
  const _$FetchSubscriptionImpl() : super._();

  @override
  String toString() {
    return 'AuthApi.fetchSubscription()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchSubscriptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return fetchSubscription();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetchSubscription?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchSubscription != null) {
      return fetchSubscription();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetchSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetchSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchSubscription != null) {
      return fetchSubscription(this);
    }
    return orElse();
  }
}

abstract class _FetchSubscription extends AuthApi {
  const factory _FetchSubscription() = _$FetchSubscriptionImpl;
  const _FetchSubscription._() : super._();
}

/// @nodoc
abstract class _$$PaySubscriptionImplCopyWith<$Res> {
  factory _$$PaySubscriptionImplCopyWith(_$PaySubscriptionImpl value,
          $Res Function(_$PaySubscriptionImpl) then) =
      __$$PaySubscriptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SubscriptionPayRequest payRequest, int id});
}

/// @nodoc
class __$$PaySubscriptionImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$PaySubscriptionImpl>
    implements _$$PaySubscriptionImplCopyWith<$Res> {
  __$$PaySubscriptionImplCopyWithImpl(
      _$PaySubscriptionImpl _value, $Res Function(_$PaySubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payRequest = null,
    Object? id = null,
  }) {
    return _then(_$PaySubscriptionImpl(
      payRequest: null == payRequest
          ? _value.payRequest
          : payRequest // ignore: cast_nullable_to_non_nullable
              as SubscriptionPayRequest,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PaySubscriptionImpl extends _PaySubscription {
  const _$PaySubscriptionImpl({required this.payRequest, required this.id})
      : super._();

  @override
  final SubscriptionPayRequest payRequest;
  @override
  final int id;

  @override
  String toString() {
    return 'AuthApi.paySubscription(payRequest: $payRequest, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaySubscriptionImpl &&
            (identical(other.payRequest, payRequest) ||
                other.payRequest == payRequest) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payRequest, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaySubscriptionImplCopyWith<_$PaySubscriptionImpl> get copyWith =>
      __$$PaySubscriptionImplCopyWithImpl<_$PaySubscriptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return paySubscription(payRequest, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return paySubscription?.call(payRequest, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (paySubscription != null) {
      return paySubscription(payRequest, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return paySubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return paySubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (paySubscription != null) {
      return paySubscription(this);
    }
    return orElse();
  }
}

abstract class _PaySubscription extends AuthApi {
  const factory _PaySubscription(
      {required final SubscriptionPayRequest payRequest,
      required final int id}) = _$PaySubscriptionImpl;
  const _PaySubscription._() : super._();

  SubscriptionPayRequest get payRequest;
  int get id;
  @JsonKey(ignore: true)
  _$$PaySubscriptionImplCopyWith<_$PaySubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchHistoryOrderImplCopyWith<$Res> {
  factory _$$FetchHistoryOrderImplCopyWith(_$FetchHistoryOrderImpl value,
          $Res Function(_$FetchHistoryOrderImpl) then) =
      __$$FetchHistoryOrderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchHistoryOrderImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$FetchHistoryOrderImpl>
    implements _$$FetchHistoryOrderImplCopyWith<$Res> {
  __$$FetchHistoryOrderImplCopyWithImpl(_$FetchHistoryOrderImpl _value,
      $Res Function(_$FetchHistoryOrderImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchHistoryOrderImpl extends _FetchHistoryOrder {
  const _$FetchHistoryOrderImpl() : super._();

  @override
  String toString() {
    return 'AuthApi.fetchHistoryOrder()';
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
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return fetchHistoryOrder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetchHistoryOrder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
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
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetchHistoryOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetchHistoryOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchHistoryOrder != null) {
      return fetchHistoryOrder(this);
    }
    return orElse();
  }
}

abstract class _FetchHistoryOrder extends AuthApi {
  const factory _FetchHistoryOrder() = _$FetchHistoryOrderImpl;
  const _FetchHistoryOrder._() : super._();
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
    extends _$AuthApiCopyWithImpl<$Res, _$FetchHistoryDetailOrderImpl>
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

class _$FetchHistoryDetailOrderImpl extends _FetchHistoryDetailOrder {
  const _$FetchHistoryDetailOrderImpl({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'AuthApi.fetchHistoryDetailOrder(id: $id)';
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
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return fetchHistoryDetailOrder(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetchHistoryDetailOrder?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
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
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetchHistoryDetailOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetchHistoryDetailOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchHistoryDetailOrder != null) {
      return fetchHistoryDetailOrder(this);
    }
    return orElse();
  }
}

abstract class _FetchHistoryDetailOrder extends AuthApi {
  const factory _FetchHistoryDetailOrder({required final int id}) =
      _$FetchHistoryDetailOrderImpl;
  const _FetchHistoryDetailOrder._() : super._();

  int get id;
  @JsonKey(ignore: true)
  _$$FetchHistoryDetailOrderImplCopyWith<_$FetchHistoryDetailOrderImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendSupportImplCopyWith<$Res> {
  factory _$$SendSupportImplCopyWith(
          _$SendSupportImpl value, $Res Function(_$SendSupportImpl) then) =
      __$$SendSupportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FormData body});
}

/// @nodoc
class __$$SendSupportImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$SendSupportImpl>
    implements _$$SendSupportImplCopyWith<$Res> {
  __$$SendSupportImplCopyWithImpl(
      _$SendSupportImpl _value, $Res Function(_$SendSupportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$SendSupportImpl(
      null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as FormData,
    ));
  }
}

/// @nodoc

class _$SendSupportImpl extends _SendSupport {
  const _$SendSupportImpl(this.body) : super._();

  @override
  final FormData body;

  @override
  String toString() {
    return 'AuthApi.sendSupport(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendSupportImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendSupportImplCopyWith<_$SendSupportImpl> get copyWith =>
      __$$SendSupportImplCopyWithImpl<_$SendSupportImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return sendSupport(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return sendSupport?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (sendSupport != null) {
      return sendSupport(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return sendSupport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return sendSupport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (sendSupport != null) {
      return sendSupport(this);
    }
    return orElse();
  }
}

abstract class _SendSupport extends AuthApi {
  const factory _SendSupport(final FormData body) = _$SendSupportImpl;
  const _SendSupport._() : super._();

  FormData get body;
  @JsonKey(ignore: true)
  _$$SendSupportImplCopyWith<_$SendSupportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelSubscriptionImplCopyWith<$Res> {
  factory _$$CancelSubscriptionImplCopyWith(_$CancelSubscriptionImpl value,
          $Res Function(_$CancelSubscriptionImpl) then) =
      __$$CancelSubscriptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$CancelSubscriptionImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$CancelSubscriptionImpl>
    implements _$$CancelSubscriptionImplCopyWith<$Res> {
  __$$CancelSubscriptionImplCopyWithImpl(_$CancelSubscriptionImpl _value,
      $Res Function(_$CancelSubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$CancelSubscriptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CancelSubscriptionImpl extends _CancelSubscription {
  const _$CancelSubscriptionImpl({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'AuthApi.cancelSubscription(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelSubscriptionImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelSubscriptionImplCopyWith<_$CancelSubscriptionImpl> get copyWith =>
      __$$CancelSubscriptionImplCopyWithImpl<_$CancelSubscriptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return cancelSubscription(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return cancelSubscription?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (cancelSubscription != null) {
      return cancelSubscription(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return cancelSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return cancelSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (cancelSubscription != null) {
      return cancelSubscription(this);
    }
    return orElse();
  }
}

abstract class _CancelSubscription extends AuthApi {
  const factory _CancelSubscription({required final int id}) =
      _$CancelSubscriptionImpl;
  const _CancelSubscription._() : super._();

  int get id;
  @JsonKey(ignore: true)
  _$$CancelSubscriptionImplCopyWith<_$CancelSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveCardImplCopyWith<$Res> {
  factory _$$RemoveCardImplCopyWith(
          _$RemoveCardImpl value, $Res Function(_$RemoveCardImpl) then) =
      __$$RemoveCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$RemoveCardImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$RemoveCardImpl>
    implements _$$RemoveCardImplCopyWith<$Res> {
  __$$RemoveCardImplCopyWithImpl(
      _$RemoveCardImpl _value, $Res Function(_$RemoveCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemoveCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveCardImpl extends _RemoveCard {
  const _$RemoveCardImpl({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'AuthApi.removeCard(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveCardImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveCardImplCopyWith<_$RemoveCardImpl> get copyWith =>
      __$$RemoveCardImplCopyWithImpl<_$RemoveCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return removeCard(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return removeCard?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (removeCard != null) {
      return removeCard(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return removeCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return removeCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (removeCard != null) {
      return removeCard(this);
    }
    return orElse();
  }
}

abstract class _RemoveCard extends AuthApi {
  const factory _RemoveCard({required final int id}) = _$RemoveCardImpl;
  const _RemoveCard._() : super._();

  int get id;
  @JsonKey(ignore: true)
  _$$RemoveCardImplCopyWith<_$RemoveCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$AuthApiCopyWithImpl<$Res, _$CheckSubscriptonImpl>
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

class _$CheckSubscriptonImpl extends _CheckSubscripton {
  const _$CheckSubscriptonImpl(
      {required this.idSubscroption, required this.userSubId})
      : super._();

  @override
  final int idSubscroption;
  @override
  final int userSubId;

  @override
  String toString() {
    return 'AuthApi.checkSubscripton(idSubscroption: $idSubscroption, userSubId: $userSubId)';
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
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return checkSubscripton(idSubscroption, userSubId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return checkSubscripton?.call(idSubscroption, userSubId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
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
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return checkSubscripton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return checkSubscripton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (checkSubscripton != null) {
      return checkSubscripton(this);
    }
    return orElse();
  }
}

abstract class _CheckSubscripton extends AuthApi {
  const factory _CheckSubscripton(
      {required final int idSubscroption,
      required final int userSubId}) = _$CheckSubscriptonImpl;
  const _CheckSubscripton._() : super._();

  int get idSubscroption;
  int get userSubId;
  @JsonKey(ignore: true)
  _$$CheckSubscriptonImplCopyWith<_$CheckSubscriptonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendFcmTokenImplCopyWith<$Res> {
  factory _$$SendFcmTokenImplCopyWith(
          _$SendFcmTokenImpl value, $Res Function(_$SendFcmTokenImpl) then) =
      __$$SendFcmTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SendFcmRequest body});
}

/// @nodoc
class __$$SendFcmTokenImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$SendFcmTokenImpl>
    implements _$$SendFcmTokenImplCopyWith<$Res> {
  __$$SendFcmTokenImplCopyWithImpl(
      _$SendFcmTokenImpl _value, $Res Function(_$SendFcmTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$SendFcmTokenImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as SendFcmRequest,
    ));
  }
}

/// @nodoc

class _$SendFcmTokenImpl extends _SendFcmToken {
  const _$SendFcmTokenImpl({required this.body}) : super._();

  @override
  final SendFcmRequest body;

  @override
  String toString() {
    return 'AuthApi.sendFcmToken(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendFcmTokenImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendFcmTokenImplCopyWith<_$SendFcmTokenImpl> get copyWith =>
      __$$SendFcmTokenImplCopyWithImpl<_$SendFcmTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return sendFcmToken(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return sendFcmToken?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (sendFcmToken != null) {
      return sendFcmToken(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return sendFcmToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return sendFcmToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (sendFcmToken != null) {
      return sendFcmToken(this);
    }
    return orElse();
  }
}

abstract class _SendFcmToken extends AuthApi {
  const factory _SendFcmToken({required final SendFcmRequest body}) =
      _$SendFcmTokenImpl;
  const _SendFcmToken._() : super._();

  SendFcmRequest get body;
  @JsonKey(ignore: true)
  _$$SendFcmTokenImplCopyWith<_$SendFcmTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteFcmTokenImplCopyWith<$Res> {
  factory _$$DeleteFcmTokenImplCopyWith(_$DeleteFcmTokenImpl value,
          $Res Function(_$DeleteFcmTokenImpl) then) =
      __$$DeleteFcmTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String platform});
}

/// @nodoc
class __$$DeleteFcmTokenImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$DeleteFcmTokenImpl>
    implements _$$DeleteFcmTokenImplCopyWith<$Res> {
  __$$DeleteFcmTokenImplCopyWithImpl(
      _$DeleteFcmTokenImpl _value, $Res Function(_$DeleteFcmTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
  }) {
    return _then(_$DeleteFcmTokenImpl(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteFcmTokenImpl extends _DeleteFcmToken {
  const _$DeleteFcmTokenImpl({required this.platform}) : super._();

  @override
  final String platform;

  @override
  String toString() {
    return 'AuthApi.deleteFcmToken(platform: $platform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteFcmTokenImpl &&
            (identical(other.platform, platform) ||
                other.platform == platform));
  }

  @override
  int get hashCode => Object.hash(runtimeType, platform);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteFcmTokenImplCopyWith<_$DeleteFcmTokenImpl> get copyWith =>
      __$$DeleteFcmTokenImplCopyWithImpl<_$DeleteFcmTokenImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return deleteFcmToken(platform);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return deleteFcmToken?.call(platform);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (deleteFcmToken != null) {
      return deleteFcmToken(platform);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return deleteFcmToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return deleteFcmToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (deleteFcmToken != null) {
      return deleteFcmToken(this);
    }
    return orElse();
  }
}

abstract class _DeleteFcmToken extends AuthApi {
  const factory _DeleteFcmToken({required final String platform}) =
      _$DeleteFcmTokenImpl;
  const _DeleteFcmToken._() : super._();

  String get platform;
  @JsonKey(ignore: true)
  _$$DeleteFcmTokenImplCopyWith<_$DeleteFcmTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchNotificationImplCopyWith<$Res> {
  factory _$$FetchNotificationImplCopyWith(_$FetchNotificationImpl value,
          $Res Function(_$FetchNotificationImpl) then) =
      __$$FetchNotificationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchNotificationImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$FetchNotificationImpl>
    implements _$$FetchNotificationImplCopyWith<$Res> {
  __$$FetchNotificationImplCopyWithImpl(_$FetchNotificationImpl _value,
      $Res Function(_$FetchNotificationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchNotificationImpl extends _FetchNotification {
  const _$FetchNotificationImpl() : super._();

  @override
  String toString() {
    return 'AuthApi.fetchNotification()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchNotificationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return fetchNotification();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetchNotification?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchNotification != null) {
      return fetchNotification();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetchNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetchNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchNotification != null) {
      return fetchNotification(this);
    }
    return orElse();
  }
}

abstract class _FetchNotification extends AuthApi {
  const factory _FetchNotification() = _$FetchNotificationImpl;
  const _FetchNotification._() : super._();
}

/// @nodoc
abstract class _$$FetchUnreadImplCopyWith<$Res> {
  factory _$$FetchUnreadImplCopyWith(
          _$FetchUnreadImpl value, $Res Function(_$FetchUnreadImpl) then) =
      __$$FetchUnreadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchUnreadImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$FetchUnreadImpl>
    implements _$$FetchUnreadImplCopyWith<$Res> {
  __$$FetchUnreadImplCopyWithImpl(
      _$FetchUnreadImpl _value, $Res Function(_$FetchUnreadImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchUnreadImpl extends _FetchUnread {
  const _$FetchUnreadImpl() : super._();

  @override
  String toString() {
    return 'AuthApi.fetchUnread()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchUnreadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return fetchUnread();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetchUnread?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchUnread != null) {
      return fetchUnread();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetchUnread(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetchUnread?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchUnread != null) {
      return fetchUnread(this);
    }
    return orElse();
  }
}

abstract class _FetchUnread extends AuthApi {
  const factory _FetchUnread() = _$FetchUnreadImpl;
  const _FetchUnread._() : super._();
}

/// @nodoc
abstract class _$$ReadNotificationImplCopyWith<$Res> {
  factory _$$ReadNotificationImplCopyWith(_$ReadNotificationImpl value,
          $Res Function(_$ReadNotificationImpl) then) =
      __$$ReadNotificationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReadNotificationImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$ReadNotificationImpl>
    implements _$$ReadNotificationImplCopyWith<$Res> {
  __$$ReadNotificationImplCopyWithImpl(_$ReadNotificationImpl _value,
      $Res Function(_$ReadNotificationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReadNotificationImpl extends _ReadNotification {
  const _$ReadNotificationImpl() : super._();

  @override
  String toString() {
    return 'AuthApi.readNotification()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReadNotificationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return readNotification();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return readNotification?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
    TResult Function()? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (readNotification != null) {
      return readNotification();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return readNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return readNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (readNotification != null) {
      return readNotification(this);
    }
    return orElse();
  }
}

abstract class _ReadNotification extends AuthApi {
  const factory _ReadNotification() = _$ReadNotificationImpl;
  const _ReadNotification._() : super._();
}

/// @nodoc
abstract class _$$FetchConfigurationImplCopyWith<$Res> {
  factory _$$FetchConfigurationImplCopyWith(_$FetchConfigurationImpl value,
          $Res Function(_$FetchConfigurationImpl) then) =
      __$$FetchConfigurationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchConfigurationImplCopyWithImpl<$Res>
    extends _$AuthApiCopyWithImpl<$Res, _$FetchConfigurationImpl>
    implements _$$FetchConfigurationImplCopyWith<$Res> {
  __$$FetchConfigurationImplCopyWithImpl(_$FetchConfigurationImpl _value,
      $Res Function(_$FetchConfigurationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchConfigurationImpl extends _FetchConfiguration {
  const _$FetchConfigurationImpl() : super._();

  @override
  String toString() {
    return 'AuthApi.fetchConfiguration()';
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
    required TResult Function(String phone) login,
    required TResult Function(RegisterRequest body) pinCode,
    required TResult Function() fetchUser,
    required TResult Function() fetchAddress,
    required TResult Function(AddressRequest body) saveAddress,
    required TResult Function(int id) selectAddress,
    required TResult Function(int id) deleteAddress,
    required TResult Function() fetcOrders,
    required TResult Function(int id) fetcOrder,
    required TResult Function() fetcTypeOrganization,
    required TResult Function(UserUpdateRequest body) updateUser,
    required TResult Function(OrganizationUpdateRequest body)
        updateOrganization,
    required TResult Function() deleteUser,
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function() fetchHistory,
    required TResult Function() fetchSubscription,
    required TResult Function(SubscriptionPayRequest payRequest, int id)
        paySubscription,
    required TResult Function() fetchHistoryOrder,
    required TResult Function(int id) fetchHistoryDetailOrder,
    required TResult Function(FormData body) sendSupport,
    required TResult Function(int id) cancelSubscription,
    required TResult Function(int id) removeCard,
    required TResult Function(int idSubscroption, int userSubId)
        checkSubscripton,
    required TResult Function(SendFcmRequest body) sendFcmToken,
    required TResult Function(String platform) deleteFcmToken,
    required TResult Function() fetchNotification,
    required TResult Function() fetchUnread,
    required TResult Function() readNotification,
    required TResult Function() fetchConfiguration,
  }) {
    return fetchConfiguration();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? login,
    TResult? Function(RegisterRequest body)? pinCode,
    TResult? Function()? fetchUser,
    TResult? Function()? fetchAddress,
    TResult? Function(AddressRequest body)? saveAddress,
    TResult? Function(int id)? selectAddress,
    TResult? Function(int id)? deleteAddress,
    TResult? Function()? fetcOrders,
    TResult? Function(int id)? fetcOrder,
    TResult? Function()? fetcTypeOrganization,
    TResult? Function(UserUpdateRequest body)? updateUser,
    TResult? Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult? Function()? deleteUser,
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function()? fetchHistory,
    TResult? Function()? fetchSubscription,
    TResult? Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult? Function()? fetchHistoryOrder,
    TResult? Function(int id)? fetchHistoryDetailOrder,
    TResult? Function(FormData body)? sendSupport,
    TResult? Function(int id)? cancelSubscription,
    TResult? Function(int id)? removeCard,
    TResult? Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult? Function(SendFcmRequest body)? sendFcmToken,
    TResult? Function(String platform)? deleteFcmToken,
    TResult? Function()? fetchNotification,
    TResult? Function()? fetchUnread,
    TResult? Function()? readNotification,
    TResult? Function()? fetchConfiguration,
  }) {
    return fetchConfiguration?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? login,
    TResult Function(RegisterRequest body)? pinCode,
    TResult Function()? fetchUser,
    TResult Function()? fetchAddress,
    TResult Function(AddressRequest body)? saveAddress,
    TResult Function(int id)? selectAddress,
    TResult Function(int id)? deleteAddress,
    TResult Function()? fetcOrders,
    TResult Function(int id)? fetcOrder,
    TResult Function()? fetcTypeOrganization,
    TResult Function(UserUpdateRequest body)? updateUser,
    TResult Function(OrganizationUpdateRequest body)? updateOrganization,
    TResult Function()? deleteUser,
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function()? fetchHistory,
    TResult Function()? fetchSubscription,
    TResult Function(SubscriptionPayRequest payRequest, int id)?
        paySubscription,
    TResult Function()? fetchHistoryOrder,
    TResult Function(int id)? fetchHistoryDetailOrder,
    TResult Function(FormData body)? sendSupport,
    TResult Function(int id)? cancelSubscription,
    TResult Function(int id)? removeCard,
    TResult Function(int idSubscroption, int userSubId)? checkSubscripton,
    TResult Function(SendFcmRequest body)? sendFcmToken,
    TResult Function(String platform)? deleteFcmToken,
    TResult Function()? fetchNotification,
    TResult Function()? fetchUnread,
    TResult Function()? readNotification,
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
    required TResult Function(_Login value) login,
    required TResult Function(_PinCode value) pinCode,
    required TResult Function(_FetchUser value) fetchUser,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SaveAddress value) saveAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_FetchOrders value) fetcOrders,
    required TResult Function(_FetchOrder value) fetcOrder,
    required TResult Function(_FetchTypeOrganization value)
        fetcTypeOrganization,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateOrganization value) updateOrganization,
    required TResult Function(_DeleteUser value) deleteUser,
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_FetchSubscription value) fetchSubscription,
    required TResult Function(_PaySubscription value) paySubscription,
    required TResult Function(_FetchHistoryOrder value) fetchHistoryOrder,
    required TResult Function(_FetchHistoryDetailOrder value)
        fetchHistoryDetailOrder,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_CancelSubscription value) cancelSubscription,
    required TResult Function(_RemoveCard value) removeCard,
    required TResult Function(_CheckSubscripton value) checkSubscripton,
    required TResult Function(_SendFcmToken value) sendFcmToken,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_FetchUnread value) fetchUnread,
    required TResult Function(_ReadNotification value) readNotification,
    required TResult Function(_FetchConfiguration value) fetchConfiguration,
  }) {
    return fetchConfiguration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_PinCode value)? pinCode,
    TResult? Function(_FetchUser value)? fetchUser,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SaveAddress value)? saveAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_FetchOrders value)? fetcOrders,
    TResult? Function(_FetchOrder value)? fetcOrder,
    TResult? Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateOrganization value)? updateOrganization,
    TResult? Function(_DeleteUser value)? deleteUser,
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_FetchSubscription value)? fetchSubscription,
    TResult? Function(_PaySubscription value)? paySubscription,
    TResult? Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult? Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_CancelSubscription value)? cancelSubscription,
    TResult? Function(_RemoveCard value)? removeCard,
    TResult? Function(_CheckSubscripton value)? checkSubscripton,
    TResult? Function(_SendFcmToken value)? sendFcmToken,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_FetchUnread value)? fetchUnread,
    TResult? Function(_ReadNotification value)? readNotification,
    TResult? Function(_FetchConfiguration value)? fetchConfiguration,
  }) {
    return fetchConfiguration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_PinCode value)? pinCode,
    TResult Function(_FetchUser value)? fetchUser,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SaveAddress value)? saveAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_FetchOrders value)? fetcOrders,
    TResult Function(_FetchOrder value)? fetcOrder,
    TResult Function(_FetchTypeOrganization value)? fetcTypeOrganization,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateOrganization value)? updateOrganization,
    TResult Function(_DeleteUser value)? deleteUser,
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_FetchSubscription value)? fetchSubscription,
    TResult Function(_PaySubscription value)? paySubscription,
    TResult Function(_FetchHistoryOrder value)? fetchHistoryOrder,
    TResult Function(_FetchHistoryDetailOrder value)? fetchHistoryDetailOrder,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_CancelSubscription value)? cancelSubscription,
    TResult Function(_RemoveCard value)? removeCard,
    TResult Function(_CheckSubscripton value)? checkSubscripton,
    TResult Function(_SendFcmToken value)? sendFcmToken,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_FetchUnread value)? fetchUnread,
    TResult Function(_ReadNotification value)? readNotification,
    TResult Function(_FetchConfiguration value)? fetchConfiguration,
    required TResult orElse(),
  }) {
    if (fetchConfiguration != null) {
      return fetchConfiguration(this);
    }
    return orElse();
  }
}

abstract class _FetchConfiguration extends AuthApi {
  const factory _FetchConfiguration() = _$FetchConfigurationImpl;
  const _FetchConfiguration._() : super._();
}
