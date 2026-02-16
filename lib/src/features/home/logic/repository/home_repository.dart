import 'package:qr_pay_app/src/core/server/layers/network_executer.dart';
import 'package:qr_pay_app/src/core/server/result.dart';
import 'package:qr_pay_app/src/features/home/logic/models/home_api.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/bonus_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/review_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/city_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/free_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/news_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/review_model.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/checkout_model.dart';

abstract class HomeRepository {
  Future<Result<NewsModel>> fetchNews();
  Future<Result<ItemsModel>> fetchItem();
  Future<Result<CityModel>> fetchCity();
  Future<Result<ItemsModel>> fetchSubscriptionItems({required int id});
  Future<Result<FreeModel>> fetchFreeItems({
    required int idSubscription,
    required String idItem,
  });
  Future<Result<ChekoutModel>> orderSubscription({required BonusRequest body});
  Future<Result<ReviewModel>> fetchRatings();
  Future<Result<void>> sendReview({
    required ReviewRequest body,
    required int id,
  });
  Future<Result<QrMenuModel>> fetchQrMenu({
    required int id,
    required String type,
  });
}

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.client});
  final NetworkExecuter client;

  @override
  Future<Result<NewsModel>> fetchNews() async => client.execute(
        route: const HomeApi.fetchNews(),
        responseType: NewsModel(),
      );

  @override
  Future<Result<ItemsModel>> fetchItem() async => client.execute(
        route: const HomeApi.fetchItems(),
        responseType: ItemsModel(),
      );

  @override
  Future<Result<CityModel>> fetchCity() async => client.execute(
        route: const HomeApi.fetchCity(),
        responseType: CityModel(),
      );

  @override
  Future<Result<ItemsModel>> fetchSubscriptionItems({required int id}) async =>
      client.execute(
        route: HomeApi.fetchSubscriptionItems(id: id),
        responseType: ItemsModel(),
      );

  @override
  Future<Result<FreeModel>> fetchFreeItems({
    required int idSubscription,
    required String idItem,
  }) async =>
      client.execute(
        route: HomeApi.fetchFreeItems(
          idSubscription: idSubscription,
          idItem: idItem,
        ),
        responseType: FreeModel(),
      );

  @override
  Future<Result<ChekoutModel>> orderSubscription(
          {required BonusRequest body}) async =>
      client.execute(
        route: HomeApi.orderSubscription(body: body),
        responseType: ChekoutModel(),
      );

  @override
  Future<Result<ReviewModel>> fetchRatings() async => client.execute(
        route: const HomeApi.fetchRatings(),
        responseType: ReviewModel(),
      );

  @override
  Future<Result<void>> sendReview({
    required ReviewRequest body,
    required int id,
  }) async =>
      client.execute(route: HomeApi.sendReview(body: body, id: id));

  @override
  Future<Result<QrMenuModel>> fetchQrMenu({
    required int id,
    required String type,
  }) async =>
      client.execute(
        route: HomeApi.fetchQrMenu(id: id, type: type),
        responseType: QrMenuModel(),
      );
}
