import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkStatusService {
  NetworkStatusService({
    Duration checkInterval = const Duration(seconds: 10),
    Duration checkTimeout = const Duration(seconds: 10),
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
  int _offlineStrikes = 0;

  Future<void> init() async {
    if (_inited) return;
    _inited = true;

    // начальное состояние
    _isOnline = await _probeInternet();
    _controller.add(_isOnline);

    // 1) быстрый триггер по смене сети (wifi/mobile/off)
    _connSub = _connectivity.onConnectivityChanged.listen((_) async {
      final ok = await _probeInternet();
      _emitWithHysteresis(ok);
    });

    // 2) периодическая проверка "реально есть интернет"
    _internetSub = _checker.onStatusChange.listen((_) async {
      final ok = await _probeInternet();
      _emitWithHysteresis(ok);
    });
  }

  Future<bool> _probeInternet() async {
    final hosts = <String>['1.1.1.1', '8.8.8.8', '9.9.9.9'];
    var anyOk = false;
    for (final host in hosts) {
      try {
        final socket = await Socket.connect(
          host,
          53,
          timeout: const Duration(seconds: 2),
        );
        socket.destroy();
        anyOk = true;
      } catch (_) {}
    }
    log('NetworkStatusService probe result: $anyOk');
    return anyOk;
  }

  void _emitWithHysteresis(bool ok) {
    if (ok) {
      _offlineStrikes = 0;
      _emit(true);
      return;
    }

    _offlineStrikes += 1;
    // Не считаем сеть "упавшей" от единичного промаха.
    if (_offlineStrikes >= 2) {
      _emit(false);
    }
  }

  void _emit(bool ok) {
    if (ok == _isOnline) return;
    _isOnline = ok;
    _controller.add(ok);
  }

  Future<void> dispose() async {
    await _connSub?.cancel();
    await _internetSub?.cancel();
    _checker.dispose();
    await _controller.close();
  }
}
