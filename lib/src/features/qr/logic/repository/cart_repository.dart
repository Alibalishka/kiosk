import 'package:qr_pay_app/src/core/server/layers/network_executer.dart';
import 'package:qr_pay_app/src/core/server/result.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/bonus_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/cart_api.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/add_cart_requests.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/cart_items_requests.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/check_promo_requests.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/checkout_requests.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/item_update_requests.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/pay_request.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/checkout_model.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/pay_model.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/promo_model.dart';

abstract class CartRepository {
  Future<Result<void>> addCart({
    required int id,
    required AddCartRequest body,
  });
  Future<Result<void>> deleteItems({required CartItemsRequests body});
  Future<Result<void>> updateItem({required ItemRequests body});
  Future<Result<void>> createOrders({required CartItemsRequests body});
  Future<Result<ChekoutModel>> fetchChekout({required CheckoutRequests body});
  Future<Result<ChekoutModel>> fetchChekoutSubscription({required String id});
  Future<Result<ChekoutModel>> fetchChekoutMenu(
      {required MenuCheckoutRequest body});
  Future<Result<PayModel>> payByCart({required PayRequest body});
  Future<Result<PayModel>> payBonus({required BonusRequest body});
  Future<Result<PayModel>> payMenu({required MenuCheckoutRequest body});
  Future<Result<PromoModel>> checkPromoCode({required CheckPromoRequest body});
}

class CartRepositoryImpl extends CartRepository {
  final NetworkExecuter client;

  CartRepositoryImpl({required this.client});

  @override
  Future<Result<void>> addCart({
    required int id,
    required AddCartRequest body,
  }) =>
      client.execute(
        route: CartApi.addCart(
          id: id,
          body: body,
        ),
      );

  @override
  Future<Result<void>> deleteItems({required CartItemsRequests body}) async =>
      client.execute(route: CartApi.deleteItems(body: body));

  @override
  Future<Result<void>> updateItem({required ItemRequests body}) async =>
      client.execute(route: CartApi.updateItem(data: body));

  @override
  Future<Result<void>> createOrders({required CartItemsRequests body}) async =>
      client.execute(route: CartApi.createOrders(body: body));

  @override
  Future<Result<ChekoutModel>> fetchChekout(
          {required CheckoutRequests body}) async =>
      client.execute(
        route: CartApi.fetchChekout(data: body),
        responseType: ChekoutModel(),
      );

  @override
  Future<Result<ChekoutModel>> fetchChekoutSubscription(
          {required String id}) async =>
      client.execute(
        route: CartApi.fetchChekoutSubscription(id: id),
        responseType: ChekoutModel(),
      );

  @override
  Future<Result<PayModel>> payByCart({required PayRequest body}) async =>
      client.execute(
        route: CartApi.payByCart(body: body),
        responseType: PayModel(),
      );

  @override
  Future<Result<PayModel>> payBonus({required BonusRequest body}) async =>
      client.execute(
        route: CartApi.payBonus(body: body),
        responseType: PayModel(),
      );

  @override
  Future<Result<PromoModel>> checkPromoCode(
          {required CheckPromoRequest body}) async =>
      client.execute(
        route: CartApi.checkPromoCode(body: body),
        responseType: PromoModel(),
      );

  @override
  Future<Result<ChekoutModel>> fetchChekoutMenu(
          {required MenuCheckoutRequest body}) async =>
      client.execute(
        route: CartApi.fetchChekoutMenu(body: body),
        responseType: ChekoutModel(),
      );

  @override
  Future<Result<PayModel>> payMenu({required MenuCheckoutRequest body}) async =>
      client.execute(
        route: CartApi.payMenu(body: body),
        responseType: PayModel(),
      );
}
