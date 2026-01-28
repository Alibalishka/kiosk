import 'package:qr_pay_app/src/features/profile/logic/model/responses/configuration_response.dart';
import 'package:dio/dio.dart';
import 'package:qr_pay_app/src/core/server/layers/network_executer.dart';
import 'package:qr_pay_app/src/core/server/result.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/auth_api.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/address_request.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/organization_update_request.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/register_request.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/send_fcm_request.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/subscription_pay.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/user_update_request.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/add_bank_card.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/address_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/cards_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/check_subs_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/history_model.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/history_order.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/notification_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/order_detail.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/orders_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/payment_method.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/subs_pay_model.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/subscription_model.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/type_organization_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/unread_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/user_response.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/verify_response.dart';

abstract class AuthRepository {
  Future<Result<void>> login({required String phone});
  Future<Result<VerifyResponse>> pinCode({required RegisterRequest body});
  Future<Result<UserResponsesModel>> fetchUser();
  Future<Result<AddressResponseModel>> fetchAddress();
  Future<Result<void>> saveAddress({required AddressRequest body});
  Future<Result<void>> deleteAddress({required int id});
  Future<Result<OrdersResponseModel>> fetchOrders();
  // Future<Result<OrderResponseModel>> fetchOrder({required int id});
  Future<Result<void>> selectAddress({required int id});
  Future<Result<TypeOrganizationResponse>> fetcTypeOrganization();
  Future<Result<void>> updateUser({required UserUpdateRequest body});
  Future<Result<void>> updateOrganization(
      {required OrganizationUpdateRequest body});
  Future<Result<void>> deleteUser();
  Future<Result<PaymentMethod>> fetchPaymentMethods();
  Future<Result<AddBankCardResponse>> addBankCard({required int id});
  Future<Result<CardsModel>> fetchCards();
  Future<Result<HistoryModel>> fetchHistory();
  Future<Result<SubscriptionModel>> fetchSubscription();
  Future<Result<SubsPayModel>> paySubscription({
    required SubscriptionPayRequest payRequest,
    required int id,
  });
  Future<Result<HistoryOrderEntity>> fetchHistoryOrder();
  Future<Result<OrderDetailEntity>> fetchHistoryDetailOrder({required int id});
  Future<Result<void>> sendSupport({required FormData body});
  Future<Result<void>> cancelSubscription({required int id});
  Future<Result<void>> removeCard({required int id});
  Future<Result<CheckSubsModel>> checkSubscripton({
    required int idSubscroption,
    required int userSubId,
  });
  Future<Result<void>> sendFcmToken({required SendFcmRequest body});
  Future<Result<void>> deleteFcmToken({required String platform});
  Future<Result<NotifResponse>> fetchNotification();
  Future<Result<UnreadResponse>> fetchUnread();
  Future<Result<void>> readNotification();
  Future<Result<ConfigurationResponse>> fetchConfiguration();
}

class AuthRepositoryImpl implements AuthRepository {
  final NetworkExecuter client;
  AuthRepositoryImpl({required this.client});

  @override
  Future<Result<void>> login({
    required String phone,
  }) =>
      client.execute(route: AuthApi.login(phone: phone));

  @override
  Future<Result<VerifyResponse>> pinCode({required RegisterRequest body}) =>
      client.execute(
        route: AuthApi.pinCode(body: body),
        responseType: VerifyResponse(),
      );

  @override
  Future<Result<UserResponsesModel>> fetchUser() => client.execute(
      route: const AuthApi.fetchUser(), responseType: UserResponsesModel());

  @override
  Future<Result<AddressResponseModel>> fetchAddress() => client.execute(
        route: const AuthApi.fetchAddress(),
        responseType: AddressResponseModel(),
      );

  @override
  Future<Result<void>> saveAddress({required AddressRequest body}) async =>
      client.execute(route: AuthApi.saveAddress(body: body));

  @override
  Future<Result<void>> deleteAddress({required int id}) async =>
      client.execute(route: AuthApi.deleteAddress(id: id));

  @override
  Future<Result<OrdersResponseModel>> fetchOrders() async => client.execute(
        route: const AuthApi.fetcOrders(),
        responseType: OrdersResponseModel(),
      );

  // @override
  // Future<Result<OrderResponseModel>> fetchOrder({required int id}) async =>
  //     client.execute(
  //       route: AuthApi.fetcOrder(id: id),
  //       responseType: OrderResponseModel(),
  //     );

  @override
  Future<Result<void>> selectAddress({required int id}) async =>
      client.execute(route: AuthApi.selectAddress(id: id));

  @override
  Future<Result<TypeOrganizationResponse>> fetcTypeOrganization() async =>
      client.execute(
        route: const AuthApi.fetcTypeOrganization(),
        responseType: TypeOrganizationResponse(),
      );

  @override
  Future<Result<void>> updateUser({required UserUpdateRequest body}) async =>
      client.execute(route: AuthApi.updateUser(body: body));

  @override
  Future<Result<void>> updateOrganization(
          {required OrganizationUpdateRequest body}) async =>
      client.execute(route: AuthApi.updateOrganization(body: body));

  @override
  Future<Result<void>> deleteUser() async =>
      client.execute(route: const AuthApi.deleteUser());

  @override
  Future<Result<PaymentMethod>> fetchPaymentMethods() async => client.execute(
      route: const AuthApi.fetchPaymentMethods(),
      responseType: PaymentMethod());

  @override
  Future<Result<AddBankCardResponse>> addBankCard({required int id}) async =>
      client.execute(
        route: AuthApi.addBankCard(id: id),
        responseType: AddBankCardResponse(),
      );

  @override
  Future<Result<CardsModel>> fetchCards() async => client.execute(
      route: const AuthApi.fetchCards(), responseType: CardsModel());

  @override
  Future<Result<HistoryModel>> fetchHistory() async => client.execute(
        route: const AuthApi.fetchHistory(),
        responseType: HistoryModel(),
      );

  @override
  Future<Result<SubscriptionModel>> fetchSubscription() async => client.execute(
        route: const AuthApi.fetchSubscription(),
        responseType: SubscriptionModel(),
      );

  @override
  Future<Result<SubsPayModel>> paySubscription({
    required SubscriptionPayRequest payRequest,
    required int id,
  }) async =>
      client.execute(
        route: AuthApi.paySubscription(payRequest: payRequest, id: id),
        responseType: SubsPayModel(),
      );

  @override
  Future<Result<HistoryOrderEntity>> fetchHistoryOrder() async =>
      client.execute(
        route: const AuthApi.fetchHistoryOrder(),
        responseType: HistoryOrderEntity(),
      );

  @override
  Future<Result<void>> sendSupport({required FormData body}) async =>
      client.execute(route: AuthApi.sendSupport(body));

  @override
  Future<Result<OrderDetailEntity>> fetchHistoryDetailOrder(
          {required int id}) async =>
      client.execute(
        route: AuthApi.fetchHistoryDetailOrder(id: id),
        responseType: OrderDetailEntity(),
      );

  @override
  Future<Result<void>> cancelSubscription({required int id}) async =>
      client.execute(route: AuthApi.cancelSubscription(id: id));

  @override
  Future<Result<void>> removeCard({required int id}) async =>
      client.execute(route: AuthApi.removeCard(id: id));

  @override
  Future<Result<CheckSubsModel>> checkSubscripton({
    required int idSubscroption,
    required int userSubId,
  }) =>
      client.execute(
        route: AuthApi.checkSubscripton(
            idSubscroption: idSubscroption, userSubId: userSubId),
        responseType: CheckSubsModel(),
      );

  @override
  Future<Result<void>> sendFcmToken({required SendFcmRequest body}) =>
      client.execute(route: AuthApi.sendFcmToken(body: body));

  @override
  Future<Result<void>> deleteFcmToken({required String platform}) =>
      client.execute(route: AuthApi.deleteFcmToken(platform: platform));

  @override
  Future<Result<NotifResponse>> fetchNotification() => client.execute(
        route: const AuthApi.fetchNotification(),
        responseType: NotifResponse(),
      );

  @override
  Future<Result<UnreadResponse>> fetchUnread() => client.execute(
        route: const AuthApi.fetchUnread(),
        responseType: UnreadResponse(),
      );

  @override
  Future<Result<void>> readNotification() =>
      client.execute(route: const AuthApi.readNotification());

  @override
  Future<Result<ConfigurationResponse>> fetchConfiguration() => client.execute(
        route: const AuthApi.fetchConfiguration(),
        responseType: ConfigurationResponse(),
      );
}
