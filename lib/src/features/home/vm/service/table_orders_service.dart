import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/table_orders_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/table_orders_poll.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';

/// Что сейчас известно о заказах стола.
enum TableOrdersStatus {
  /// Первый ответ по этому столу ещё не пришёл.
  loading,

  /// Заказы получены. Пустой список — на столе заказов нет.
  ready,

  /// Сервер не знает такого стола (400).
  invalidTable,

  /// Первый ответ так и не пришёл: нет сети или ошибка сервера.
  unavailable,
}

/// Опрос `GET /orders/table` для экрана «Заказы стола».
///
/// Планшетов сотни, а на сервере лимит, поэтому темп задаёт сервер: новый
/// запрос — не раньше `poll_after` секунд после ответа (15, пока у стола есть
/// заказы, 60 — когда пусто), после 429 — не раньше Retry-After. ETag уходит
/// в If-None-Match, а 304 оставляет текущие данные.
///
/// Спрашиваем, только пока приложение на экране. Ожидание идёт и в фоне, но
/// запрос, срок которого подошёл там, уходит лишь при возвращении — так
/// после фона нет ни лишнего запроса, ни лишней паузы.
class TableOrdersService extends ChangeNotifier {
  TableOrdersService({KioskRepository? repository})
      : _repositoryOverride = repository;

  /// Пока сервер не прислал poll_after: столько он просит, когда у стола
  /// есть заказы.
  static const Duration _defaultPollAfter = Duration(seconds: 15);

  /// Страховка от poll_after: 0 — чаще этого не спрашиваем никогда.
  static const Duration _minPollAfter = Duration(seconds: 5);

  /// 429 без Retry-After и неверный стол — темп пустого стола.
  static const Duration _slowPollAfter = Duration(seconds: 60);

  final KioskRepository? _repositoryOverride;

  KioskRepository get _repository =>
      _repositoryOverride ?? sl<KioskRepository>();

  /// Сервер ответил 403: планшет отключён или токен чужой. Опрос встаёт до
  /// следующего [start].
  VoidCallback? onForbidden;

  int? _venueId;
  String? _tableId;
  String? _etag;
  List<TableOrder> _orders = const [];
  TableOrdersStatus _status = TableOrdersStatus.loading;
  bool _stale = false;
  Duration _pollAfter = _defaultPollAfter;

  /// Растёт со сменой стола: ответ про прежний стол не показываем.
  int _generation = 0;

  Timer? _wait;

  /// Срок следующего запроса подошёл. Изначально — да: запросов ещё не было.
  bool _due = true;
  bool _inFlight = false;

  /// Сколько страниц меню сейчас просят опрос: новая страница успевает
  /// вызвать [start] раньше, чем старая — [stop].
  int _clients = 0;
  bool _onScreen = true;
  bool _forbidden = false;
  bool _disposed = false;
  AppLifecycleListener? _lifecycle;

  List<TableOrder> get orders => _orders;

  TableOrdersStatus get status => _status;

  /// Последний запрос не удался — на экране данные прошлого ответа.
  bool get stale => _stale;

  /// Стол и заведение известны — есть что спрашивать.
  bool get hasTable => _venueId != null && _tableId != null;

  /// Этап стола в целом: самый ранний среди его заказов — так же, как этап
  /// заказа считается по позициям. null — заказов нет.
  OrderStage? get tableStage {
    OrderStage? earliest;
    for (final order in _orders) {
      final stage = order.stage;
      if (stage == null || stage == OrderStage.unknown) continue;
      if (earliest == null || stage.index < earliest.index) earliest = stage;
    }
    return earliest;
  }

  /// Хотя бы один заказ не дошёл до кассы — гостю нужен официант.
  bool get needsWaiter =>
      _orders.any((order) => order.status == TableOrderStatus.error);

  /// `i` и `t` — те же заведение и стол, что уходят в pay-order.
  void setTable({int? venueId, String? tableId}) {
    final table = (tableId?.isEmpty ?? true) ? null : tableId;
    if (venueId == _venueId && table == _tableId) return;

    _venueId = venueId;
    _tableId = table;
    _generation++;
    _etag = null;
    _orders = const [];
    _status = TableOrdersStatus.loading;
    _stale = false;
    notifyListeners();
    _pollIfDue();
  }

  /// Страница меню на экране — опрашиваем.
  void start() {
    if (_disposed) return;
    _clients++;
    if (_clients > 1) return;

    _forbidden = false;
    _onScreen = _isOnScreen(WidgetsBinding.instance.lifecycleState);
    _lifecycle = AppLifecycleListener(onShow: _onShow, onHide: _onHide);
    _pollIfDue();
  }

  /// Страница меню ушла. Начатое ожидание не сбрасываем: вернётся страница —
  /// темп сервера сохранится.
  void stop() {
    if (_clients == 0) return;
    _clients--;
    if (_clients > 0) return;

    _lifecycle?.dispose();
    _lifecycle = null;
  }

  @override
  void dispose() {
    _disposed = true;
    _wait?.cancel();
    _lifecycle?.dispose();
    super.dispose();
  }

  static bool _isOnScreen(AppLifecycleState? state) =>
      state == null ||
      state == AppLifecycleState.resumed ||
      state == AppLifecycleState.inactive;

  void _onShow() {
    _onScreen = true;
    _pollIfDue();
  }

  void _onHide() => _onScreen = false;

  void _pollIfDue() {
    if (!_due || _inFlight || _clients == 0 || !_onScreen) return;
    if (_forbidden || _disposed) return;
    final venueId = _venueId;
    final tableId = _tableId;
    if (venueId == null || tableId == null) return;

    _due = false;
    _poll(venueId, tableId);
  }

  Future<void> _poll(int venueId, String tableId) async {
    final generation = _generation;
    _inFlight = true;
    TableOrdersPoll result;
    try {
      result = await _repository.fetchTableOrders(
        venueId: venueId,
        tableId: tableId,
        etag: _etag,
      );
    } on Object catch (e) {
      log('table orders: poll failed: $e');
      result = const TableOrdersPoll.failed();
    }
    _inFlight = false;
    if (_disposed) return;

    final forbidden =
        result.maybeWhen(forbidden: () => true, orElse: () => false);
    if (forbidden) {
      // Новый токен после переподключения — спросим сразу.
      _forbidden = true;
      _due = true;
      onForbidden?.call();
      return;
    }

    // Ответ про прежний стол не показываем, но темп сервера соблюдаем.
    if (generation == _generation) _apply(result);
    _waitFor(_delayAfter(result));
  }

  void _apply(TableOrdersPoll result) {
    result.maybeWhen(
      loaded: (data, etag) {
        _orders = List.unmodifiable(data.orders ?? const <TableOrder>[]);
        _etag = etag;
        _pollAfter = _pollAfterFrom(data.pollAfter);
        _status = TableOrdersStatus.ready;
        _stale = false;
      },
      // 304 приходит только на наш ETag — данные уже на экране.
      notModified: () {
        _status = TableOrdersStatus.ready;
        _stale = false;
      },
      invalidTable: () {
        _orders = const [];
        _etag = null;
        _status = TableOrdersStatus.invalidTable;
        _stale = false;
      },
      failed: () {
        if (_status == TableOrdersStatus.loading) {
          _status = TableOrdersStatus.unavailable;
        } else if (_status == TableOrdersStatus.ready) {
          _stale = true;
        }
      },
      orElse: () {},
    );
    notifyListeners();
  }

  /// Не чаще, чем просит сервер. После 429 ждём и Retry-After, и обычный
  /// poll_after — что дольше.
  Duration _delayAfter(TableOrdersPoll result) => result.maybeWhen(
        loaded: (data, _) => _pollAfterFrom(data.pollAfter),
        rateLimited: (retryAfter) {
          final wait = retryAfter ?? _slowPollAfter;
          return wait > _pollAfter ? wait : _pollAfter;
        },
        invalidTable: () => _slowPollAfter,
        orElse: () => _pollAfter,
      );

  static Duration _pollAfterFrom(int? seconds) {
    if (seconds == null) return _defaultPollAfter;
    final value = Duration(seconds: seconds);
    return value < _minPollAfter ? _minPollAfter : value;
  }

  void _waitFor(Duration delay) {
    _wait?.cancel();
    _wait = Timer(delay, () {
      _wait = null;
      _due = true;
      _pollIfDue();
    });
  }
}
