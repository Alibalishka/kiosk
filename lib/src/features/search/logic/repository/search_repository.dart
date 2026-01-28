import 'package:qr_pay_app/src/core/server/layers/network_executer.dart';
import 'package:qr_pay_app/src/core/server/result.dart';
import 'package:qr_pay_app/src/features/search/logic/models/response/search_model.dart';
import 'package:qr_pay_app/src/features/search/logic/models/search_api.dart';

abstract class SearchRepository {
  Future<Result<SearchModel>> searchRequest({
    required String keyword,
  });
}

class SearchRepositoryImpl extends SearchRepository {
  final NetworkExecuter client;

  SearchRepositoryImpl({required this.client});

  @override
  Future<Result<SearchModel>> searchRequest({
    required String keyword,
  }) =>
      client.execute(
          route: SearchApi.searchRequest(keyword: keyword),
          responseType: SearchModel());
}
