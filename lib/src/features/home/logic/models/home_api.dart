import 'package:qr_pay_app/src/core/server/interfaces/base_client_generator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/bonus_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/review_request.dart';

part 'home_api.freezed.dart';

@freezed
abstract class HomeApi extends BaseClientGenerator with _$HomeApi {
  const HomeApi._() : super();

  //Новости
  const factory HomeApi.fetchNews() = _FetchNews;

  //Items
  const factory HomeApi.fetchItems() = _FetchItems;

  //Города
  const factory HomeApi.fetchCity() = _FetchCity;

  //Рестораны Подписка
  const factory HomeApi.fetchSubscriptionItems({required int id}) =
      _FetchSubscriptionItems;

  //Бесплатные напитки
  const factory HomeApi.fetchFreeItems(
      {required int idSubscription, required String idItem}) = _FetchFreeItems;

  //Оформление по подписке
  const factory HomeApi.orderSubscription({required BonusRequest body}) =
      _OrderSubscription;

  const factory HomeApi.fetchRatings() = _FetchRatings;

  const factory HomeApi.sendReview({
    required ReviewRequest body,
    required int id,
  }) = _SendReview;

  //Меню
  const factory HomeApi.fetchQrMenu({
    required int id,
    required String type,
  }) = _FetchQrMenu;

  @override
  dynamic get body => whenOrNull(
        orderSubscription: (body) => body.toJson(),
        sendReview: (body, _) => body.toJson(),
      );

  /// Используемые методы запросов, по умолчанию 'GET'
  @override
  String get method => maybeWhen(
        orElse: () => 'GET',
        orderSubscription: (_) => 'POST',
        sendReview: (data, _) => 'POST',
      );

  @override
  String get path => when(
        fetchNews: () => '/news',
        fetchItems: () => '/items',
        fetchCity: () => '/cities',
        fetchSubscriptionItems: (id) => '/subscriptions/$id/items',
        fetchFreeItems: (idSubscription, idItem) =>
            '/subscriptions/$idSubscription/items/$idItem/products',
        // orderSubscription: (_) => '/orders/subscription',
        orderSubscription: (_) => '/orders/subscription-checkout',
        fetchRatings: () => '/ratings',
        sendReview: (_, id) => '/items/$id/reviews',
        fetchQrMenu: (id, _) => '/items/$id/menu',
      );

  @override
  Map<String, dynamic>? get queryParameters => whenOrNull(
        fetchQrMenu: (_, type) => {'filters[type]': type},
      );
}
