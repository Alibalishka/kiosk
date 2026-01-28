import 'package:qr_pay_app/src/core/server/interfaces/base_client_generator.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/bonus_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/add_cart_requests.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/cart_items_requests.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/check_promo_requests.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/checkout_requests.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/item_update_requests.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/pay_request.dart';

part 'cart_api.freezed.dart';

@freezed
abstract class CartApi extends BaseClientGenerator with _$CartApi {
  const CartApi._() : super();

  // Добавить корзину
  const factory CartApi.addCart({
    required int id,
    required AddCartRequest body,
  }) = _AddCart;

  // Получить список
  const factory CartApi.getCart() = _GetCart;

  // Обновить товар
  const factory CartApi.updateItem({required ItemRequests data}) = _UpdateItem;

  // Удалить товары
  const factory CartApi.deleteItems({required CartItemsRequests body}) =
      _DeleteItems;

  // Создать заказ
  const factory CartApi.createOrders({required CartItemsRequests body}) =
      _CreateOrders;

  const factory CartApi.fetchChekout({required CheckoutRequests data}) =
      _FetchChekout;

  const factory CartApi.fetchChekoutSubscription({required String id}) =
      _FetchChekoutSubscription;

  const factory CartApi.fetchChekoutMenu({required MenuCheckoutRequest body}) =
      _FetchChekoutMenu;

  // Оплатить
  const factory CartApi.payByCart({required PayRequest body}) = _PayByCart;

  const factory CartApi.payBonus({required BonusRequest body}) = _PayBonus;

  const factory CartApi.payMenu({required MenuCheckoutRequest body}) = _PayMenu;

  const factory CartApi.checkPromoCode({required CheckPromoRequest body}) =
      _CheckPromoCode;

  @override
  dynamic get body => whenOrNull(
        addCart: (_, AddCartRequest body) => body.toJson(),
        deleteItems: (body) => body.toJson(),
        updateItem: (body) => {
          'quantity': body.quantity,
          'organization_id': body.organizationId,
        },
        createOrders: (body) => body.toJson(),
        payBonus: (body) => body.toJson(),
        checkPromoCode: (body) => body.toJson(),
        fetchChekoutMenu: (body) => body.toJson(),
        payMenu: (body) => body.toJson(),
      );

  /// Используемые методы запросов, по умолчанию 'POST'
  @override
  String get method => maybeWhen(
        orElse: () => 'POST',
        getCart: () => 'GET',
        deleteItems: (_) => 'DELETE',
        updateItem: (_) => 'PUT',
        createOrders: (_) => 'POST',
        fetchChekout: (_) => 'GET',
        fetchChekoutSubscription: (_) => 'GET',
        fetchChekoutMenu: (_) => 'POST',
        payMenu: (_) => 'POST',
      );

  /// Пути всех запросов (после [kBaseUrl])
  @override
  String get path => when(
        addCart: (id, _) => '/items/$id/cart',
        getCart: () => '/cart',
        deleteItems: (_) => '/cart',
        updateItem: (body) => '/items/${body.id}/cart',
        createOrders: (_) => '/orders',
        fetchChekout: (_) => '/orders/find-by-params',
        payByCart: (_) => '/orders/pay-by-params',
        fetchChekoutSubscription: (id) => '/orders/$id',
        payBonus: (_) => '/orders/subscription',
        checkPromoCode: (_) => '/discount/apply',
        fetchChekoutMenu: (_) => '/orders/checkout',
        payMenu: (_) => '/orders/pay-order',
      );

  /// Параметры запросов
  @override
  Map<String, dynamic>? get queryParameters => whenOrNull(
        fetchChekout: (data) => data.toJson(),
        payByCart: (data) => data.toJson(),
      );
}
