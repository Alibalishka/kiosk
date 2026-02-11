import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkStatusService {
  NetworkStatusService({
    Duration checkInterval = const Duration(seconds: 3),
    Duration checkTimeout = const Duration(seconds: 2),
  }) : _checker = InternetConnectionChecker.createInstance(
          checkInterval: checkInterval,
          checkTimeout: checkTimeout,
        );

  final Connectivity _connectivity = Connectivity();
  final InternetConnectionChecker _checker;

  final _controller = StreamController<bool>.broadcast();
  Stream<bool> get stream => _controller.stream.distinct();

  bool _isOnline = true;
  bool get isOnline => _isOnline;

  StreamSubscription? _connSub;
  StreamSubscription? _internetSub;
  bool _inited = false;

  Future<void> init() async {
    if (_inited) return;
    _inited = true;

    // начальное состояние
    _isOnline = await _checker.hasConnection;
    _controller.add(_isOnline);

    // 1) быстрый триггер по смене сети (wifi/mobile/off)
    _connSub = _connectivity.onConnectivityChanged.listen((_) async {
      final ok = await _checker.hasConnection;
      _emit(ok);
    });

    // 2) периодическая проверка "реально есть интернет"
    _internetSub = _checker.onStatusChange.listen((status) {
      _emit(status == InternetConnectionStatus.connected);
    });
  }

  void _emit(bool ok) {
    if (ok == _isOnline) return;
    _isOnline = ok;
    _controller.add(ok);
  }

  Future<void> dispose() async {
    await _connSub?.cancel();
    await _internetSub?.cancel();
    await _controller.close();
  }
}
