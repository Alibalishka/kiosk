import 'package:qr_pay_app/src/core/server/interfaces/base_client_generator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/available_times_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/reserv_request.dart';

part 'detail_item_api.freezed.dart';

@freezed
abstract class DetailItemApi extends BaseClientGenerator with _$DetailItemApi {
  const DetailItemApi._() : super();

  //
  const factory DetailItemApi.getDetailItem({required int itemId}) =
      _GetDetailItem;

  const factory DetailItemApi.getDetailItemSimilar({required int itemId}) =
      _GetDetailItemSimilar;

  const factory DetailItemApi.getItemByCustomer(
      {required int itemId, required int organizationId}) = _GetItemByCustomer;

  const factory DetailItemApi.getItemReviews({required int itemId}) =
      _GetItemReviews;

  const factory DetailItemApi.fetchTimes(
      {required AvailableTimesRequest body}) = _FetchTimes;

  const factory DetailItemApi.reserv({required ReservRequest body}) = _Reserv;

  const factory DetailItemApi.fetchReserv() = _FetchReser;

  @override
  dynamic get body => whenOrNull(
        fetchTimes: (body) => body.toJson(),
        reserv: (body) => body.toJson(),
      );

  /// Используемые методы запросов, по умолчанию 'GET'
  @override
  String get method => maybeWhen(
        orElse: () => 'GET',
        reserv: (_) => 'POST',
      );

  @override
  String get path => when(
        getDetailItem: (int itemId) => '/items/$itemId',
        getDetailItemSimilar: (int itemId) => '/items/$itemId/similar',
        getItemByCustomer: (itemId, organizationId) => '/items/$itemId/similar',
        getItemReviews: (int itemId) => '/items/$itemId/reviews',
        fetchTimes: (_) => '/reserve/get-available-times',
        reserv: (_) => '/reserve',
        fetchReserv: () => '/reserve',
      );

  @override
  Map<String, dynamic>? get queryParameters => whenOrNull(
        getItemByCustomer: (itemId, organizationId) =>
            {'filters[organization_id]': organizationId},
      );
}
