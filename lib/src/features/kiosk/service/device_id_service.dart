import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

class DeviceIdService {
  static const _key = 'kiosk_device_uuid_v1';

  final FlutterSecureStorage _storage;
  final Uuid _uuid;

  const DeviceIdService({
    FlutterSecureStorage? storage,
    Uuid? uuid,
  })  : _storage = storage ?? const FlutterSecureStorage(),
        _uuid = uuid ?? const Uuid();

  Future<String> getOrCreate() async {
    final existing = await _storage.read(key: _key);
    if (existing != null && existing.trim().isNotEmpty) {
      return existing.trim();
    }

    final id = _uuid.v4();
    await _storage.write(key: _key, value: id);
    return id;
  }

  Future<void> reset() => _storage.delete(key: _key);
}
