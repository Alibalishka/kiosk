import 'package:qr_pay_app/src/core/server/interfaces/base_client_generator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_api.freezed.dart';

@freezed
abstract class SearchApi extends BaseClientGenerator with _$SearchApi {
  const SearchApi._() : super();

  const factory SearchApi.searchRequest({
    required String keyword,
  }) = _SearchRequest;

  const factory SearchApi.filterRequest({
    required String keyword,
  }) = _FilterRequest;

  @override
  dynamic get body => whenOrNull();

  /// Используемые методы запросов, по умолчанию 'GET'
  @override
  String get method => maybeWhen(
        orElse: () => 'GET',
      );

  /// Пути всех запросов (после [kBaseUrl])
  @override
  String get path => when(
        searchRequest: (keyword) => '/items/autocomplete',
        filterRequest: (keyword) => '/items',
      );

  /// Параметры запросов
  @override
  Map<String, dynamic>? get queryParameters => whenOrNull(
        searchRequest: (keyword) => {'q': keyword},
        filterRequest: (keyword) => {'filters[q]': keyword},
      );
}
