import 'package:dio/dio.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_client_generator.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/address_request.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/organization_update_request.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/register_request.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/send_fcm_request.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/subscription_pay.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/user_update_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_api.freezed.dart';

@freezed
abstract class AuthApi extends BaseClientGenerator with _$AuthApi {
  const AuthApi._() : super();

  const factory AuthApi.login({required String phone}) = _Login;
  const factory AuthApi.pinCode({required RegisterRequest body}) = _PinCode;
  const factory AuthApi.fetchUser() = _FetchUser;
  const factory AuthApi.fetchAddress() = _FetchAddress;
  const factory AuthApi.saveAddress({required AddressRequest body}) =
      _SaveAddress;
  const factory AuthApi.selectAddress({required int id}) = _SelectAddress;
  const factory AuthApi.deleteAddress({required int id}) = _DeleteAddress;
  const factory AuthApi.fetcOrders() = _FetchOrders;
  const factory AuthApi.fetcOrder({required int id}) = _FetchOrder;
  const factory AuthApi.fetcTypeOrganization() = _FetchTypeOrganization;
  const factory AuthApi.updateUser({required UserUpdateRequest body}) =
      _UpdateUser;
  const factory AuthApi.updateOrganization(
      {required OrganizationUpdateRequest body}) = _UpdateOrganization;
  const factory AuthApi.deleteUser() = _DeleteUser;
  const factory AuthApi.fetchPaymentMethods() = _FetchPaymentMethods;
  const factory AuthApi.addBankCard({required int id}) = _AddBankCard;
  const factory AuthApi.fetchCards() = _FetchCards;
  const factory AuthApi.fetchHistory() = _FetchHistory;
  const factory AuthApi.fetchSubscription() = _FetchSubscription;
  const factory AuthApi.paySubscription({
    required SubscriptionPayRequest payRequest,
    required int id,
  }) = _PaySubscription;
  const factory AuthApi.fetchHistoryOrder() = _FetchHistoryOrder;
  const factory AuthApi.fetchHistoryDetailOrder({required int id}) =
      _FetchHistoryDetailOrder;
  const factory AuthApi.sendSupport(FormData body) = _SendSupport;
  const factory AuthApi.cancelSubscription({required int id}) =
      _CancelSubscription;
  const factory AuthApi.removeCard({required int id}) = _RemoveCard;
  const factory AuthApi.checkSubscripton({
    required int idSubscroption,
    required int userSubId,
  }) = _CheckSubscripton;
  const factory AuthApi.sendFcmToken({required SendFcmRequest body}) =
      _SendFcmToken;
  const factory AuthApi.deleteFcmToken({required String platform}) =
      _DeleteFcmToken;

  const factory AuthApi.fetchNotification() = _FetchNotification;
  const factory AuthApi.fetchUnread() = _FetchUnread;
  const factory AuthApi.readNotification() = _ReadNotification;
  const factory AuthApi.fetchConfiguration() = _FetchConfiguration;

  @override
  dynamic get body => whenOrNull(
        login: (String phone) => {'phone': phone},
        pinCode: (RegisterRequest body) => body.toJson(),
        saveAddress: (AddressRequest body) => body.toJson(),
        updateUser: (UserUpdateRequest body) => body.toJson(),
        updateOrganization: (OrganizationUpdateRequest body) => body.toJson(),
        paySubscription: (SubscriptionPayRequest body, _) => body.toJson(),
        sendSupport: (FormData body) => body,
        sendFcmToken: (SendFcmRequest body) => body.toJson(),
        deleteFcmToken: (String platform) => {'platform': platform},
      );

  /// Используемые методы запросов, по умолчанию 'POST'
  @override
  String get method => maybeWhen(
        orElse: () => 'POST',
        fetchUser: () => 'GET',
        fetchAddress: () => 'GET',
        saveAddress: (_) => 'POST',
        deleteAddress: (_) => 'DELETE',
        fetcOrders: () => 'GET',
        fetcOrder: (_) => 'GET',
        fetcTypeOrganization: () => 'GET',
        updateUser: (_) => 'PUT',
        deleteUser: () => 'DELETE',
        fetchPaymentMethods: () => 'GET',
        addBankCard: (_) => 'GET',
        fetchCards: () => 'GET',
        fetchHistory: () => 'GET',
        fetchSubscription: () => 'GET',
        fetchHistoryOrder: () => 'GET',
        fetchHistoryDetailOrder: (_) => 'GET',
        removeCard: (_) => 'DELETE',
        checkSubscripton: (id, idUser) => 'GET',
        deleteFcmToken: (_) => 'DELETE',
        fetchNotification: () => 'GET',
        fetchUnread: () => 'GET',
        fetchConfiguration: () => 'GET',
      );

  /// Пути всех запросов (после [kBaseUrl])
  @override
  String get path => when(
        login: (_) => '/auth/otp',
        pinCode: (_) => '/auth/login',
        fetchUser: () => '/user',
        fetchAddress: () => '/user/address',
        saveAddress: (_) => '/user/address',
        deleteAddress: (int id) => '/user/address/$id',
        fetcOrders: () => '/orders',
        fetcOrder: (int id) => '/orders/$id',
        selectAddress: (int id) => '/user/address/$id/main',
        fetcTypeOrganization: () => '/type-organizations',
        updateUser: (_) => '/user',
        updateOrganization: (_) => '/user/organization',
        deleteUser: () => '/user',
        fetchPaymentMethods: () => '/methods/payment',
        addBankCard: (_) => '/bankcards/url',
        fetchCards: () => '/bankcards',
        fetchHistory: () => '/transactions',
        fetchSubscription: () => '/subscriptions/main',
        paySubscription: (_, id) => '/subscriptions/$id/pay',
        fetchHistoryOrder: () => '/orders',
        fetchHistoryDetailOrder: (int id) => '/orders/$id',
        sendSupport: (_) => '/support',
        cancelSubscription: (id) => '/subscriptions/$id/cancel',
        removeCard: (id) => '/bankcards/$id',
        checkSubscripton: (idSubscroption, userSubId) =>
            '/subscriptions/$idSubscroption/user/$userSubId',
        sendFcmToken: (_) => '/device-token',
        deleteFcmToken: (_) => '/device-token',
        fetchNotification: () => '/notifications',
        fetchUnread: () => '/notifications/unread',
        readNotification: () => '/notifications/unread',
        fetchConfiguration: () => '/configuration',
      );

  /// Параметры запросов
  @override
  Map<String, dynamic>? get queryParameters => whenOrNull(
        addBankCard: (id) => {'payment_method_id': id},
        fetchHistory: () => {'filters[type]': 'bonus'},
      );
}
