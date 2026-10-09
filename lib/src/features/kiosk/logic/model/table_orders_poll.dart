import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/table_orders_response.dart';

part 'table_orders_poll.freezed.dart';

/// Чем закончился один запрос `GET /orders/table`.
@freezed
class TableOrdersPoll with _$TableOrdersPoll {
  /// 200: свежие заказы и ETag для следующего запроса.
  const factory TableOrdersPoll.loaded({
    required TableOrdersData data,
    String? etag,
  }) = _Loaded;

  /// 304: с прошлого ответа ничего не изменилось.
  const factory TableOrdersPoll.notModified() = _NotModified;

  /// 429: сервер просит подождать. null — без Retry-After.
  const factory TableOrdersPoll.rateLimited({Duration? retryAfter}) =
      _RateLimited;

  /// 403: планшет отключён или токен чужой — нужно переподключение.
  const factory TableOrdersPoll.forbidden() = _Forbidden;

  /// 400: неверный стол.
  const factory TableOrdersPoll.invalidTable() = _InvalidTable;

  /// Нет связи, ошибка сервера или непонятный ответ.
  const factory TableOrdersPoll.failed() = _Failed;
}
