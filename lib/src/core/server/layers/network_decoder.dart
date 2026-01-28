import 'package:qr_pay_app/src/core/extensions/map_indexed.dart';
import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:dio/dio.dart';

/// Класс который занимается десериализацией обьектов

class NetworkDecoder {
  K decode<K, T>({
    required Response response,
    required BaseModel responseType,
  }) {
    try {
      if (response.data is List) {
        final list = response.data as List;

        return List<T>.from(
          list.mapToList(
            (e) => responseType.fromJson(e as Map<String, dynamic>),
          ),
        ) as K;
      } else {
        return responseType.fromJson(response.data as Map<String, dynamic>)
            as K;
      }
    } on Object {
      rethrow;
    }
  }
}
