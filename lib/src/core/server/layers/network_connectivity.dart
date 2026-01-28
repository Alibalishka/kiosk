// ignore_for_file: lines_longer_than_80_chars

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectivity {
  final Connectivity _connectivity;

  NetworkConnectivity({required Connectivity connectivity})
      : _connectivity = connectivity;

  Future<bool> get status async {
    final connectivityResult = await _connectivity.checkConnectivity();

    return connectivityResult != ConnectivityResult.none;
  }
}
