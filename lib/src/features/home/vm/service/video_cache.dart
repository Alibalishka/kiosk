import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class VideoCache {
  VideoCache._();
  static final VideoCache I = VideoCache._();

  static const _cacheName = 'kiosk_video_cache';

  final CacheManager _cm = CacheManager(
    Config(
      _cacheName,
      stalePeriod: const Duration(days: 30),
      maxNrOfCacheObjects: 200,
    ),
  );

  String _key(String url) => md5.convert(url.codeUnits).toString();

  Future<File?> getFile(String url) async {
    try {
      final k = _key(url);

      final cached = await _cm.getFileFromCache(k);
      if (cached != null && cached.file.existsSync()) {
        return cached.file;
      }

      final downloaded = await _cm.downloadFile(url, key: k);
      return downloaded.file;
    } catch (_) {
      return null;
    }
  }

  Future<void> invalidate(String url) async {
    try {
      await _cm.removeFile(_key(url));
    } catch (_) {}
  }
}
