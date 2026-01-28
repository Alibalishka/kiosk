import 'package:qr_pay_app/src/core/server/layers/network_executer.dart';
import 'package:qr_pay_app/src/core/server/result.dart';
import 'package:qr_pay_app/src/features/home/logic/models/detail_item_api.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/available_times_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/reserv_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/available_times_response.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/reservation_response.dart';

abstract class DetailItemRepository {
  Future<Result<DetailItemModel>> getDetailItem({required int itemId});
  Future<Result<ItemsModel>> getDetailItemSimilar({required int itemId});
  Future<Result<ItemsModel>> getItemByCustomer(
      {required int itemId, required int organizationId});
  Future<Result<AvailableTimesResponse>> fetchTimes(
      {required AvailableTimesRequest body});
  Future<Result<void>> reserv({required ReservRequest body});
  Future<Result<ReservationResponse>> fetchReserv();
}

class DetailItemRepositoryImpl implements DetailItemRepository {
  DetailItemRepositoryImpl({required this.client});
  final NetworkExecuter client;

  @override
  Future<Result<DetailItemModel>> getDetailItem({required int itemId}) =>
      client.execute(
        route: DetailItemApi.getDetailItem(itemId: itemId),
        responseType: DetailItemModel(),
      );

  @override
  Future<Result<ItemsModel>> getDetailItemSimilar({required int itemId}) =>
      client.execute(
        route: DetailItemApi.getDetailItemSimilar(itemId: itemId),
        responseType: ItemsModel(),
      );

  @override
  Future<Result<ItemsModel>> getItemByCustomer(
          {required int itemId, required int organizationId}) =>
      client.execute(
        route: DetailItemApi.getItemByCustomer(
            itemId: itemId, organizationId: organizationId),
        responseType: ItemsModel(),
      );

  @override
  Future<Result<AvailableTimesResponse>> fetchTimes(
          {required AvailableTimesRequest body}) =>
      client.execute(
        route: DetailItemApi.fetchTimes(body: body),
        responseType: AvailableTimesResponse(),
      );

  @override
  Future<Result<void>> reserv({required ReservRequest body}) =>
      client.execute(route: DetailItemApi.reserv(body: body));

  @override
  Future<Result<ReservationResponse>> fetchReserv() => client.execute(
        route: const DetailItemApi.fetchReserv(),
        responseType: ReservationResponse(),
      );
}
