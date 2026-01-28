import 'package:flutter/widgets.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:video_player/video_player.dart';

import 'dart:developer';
import 'video_cache.dart';

class VideoPreviewService with WidgetsBindingObserver {
  VideoPreviewService() {
    WidgetsBinding.instance.addObserver(this);
  }

  VideoPlayerController? _controller;
  VideoPlayerController? get videoPlayerController => _controller;

  bool isVideo = false;

  String? _currentUrl;
  String? _lastUrlBeforeSuspend;

  bool get isInitialized => _controller?.value.isInitialized ?? false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // если мы НЕ в suspend (например, рекламы нет)
      if (_controller != null && (_controller!.value.isInitialized)) {
        _controller?.play();
      }
    } else if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.hidden) {
      _controller?.pause();
    }
  }

  Future<void> init(QrMenuModel menuData) async {
    final videoPath = menuData.recommend?.isNotEmpty == true
        ? menuData.recommend!.first.image?.first.file
        : null;

    final url = (videoPath ?? '').trim();

    if (url.isEmpty || !url.toLowerCase().endsWith('.mp4')) {
      await _clearControllerOnly();
      return;
    }

    // если url тот же и уже готово — просто убедимся что играет
    if (_currentUrl == url && (_controller?.value.isInitialized ?? false)) {
      _controller?.play();
      return;
    }

    await _setControllerForUrl(url);
  }

  Future<void> _setControllerForUrl(String url) async {
    _currentUrl = url;
    isVideo = true;

    final old = _controller;
    _controller = null;
    await old?.dispose();

    try {
      final file = await VideoCache.I.getFile(url);

      final controller = (file != null)
          ? VideoPlayerController.file(file)
          : VideoPlayerController.networkUrl(Uri.parse(url));

      controller
        ..setLooping(true)
        ..setVolume(0);

      controller.addListener(() {
        final v = controller.value;
        if (v.hasError) {
          log('Header video error ($url): ${v.errorDescription}');
        }
      });

      await controller.initialize();
      _controller = controller;
      controller.play();
    } catch (e) {
      log('Header video init failed ($url): $e');
      isVideo = false;
      _currentUrl = null;
      await _controller?.dispose();
      _controller = null;
    }
  }

  /// ВАЖНО: освобождаем декодер, когда поверх появляется AdFullScreen
  Future<void> suspend() async {
    _lastUrlBeforeSuspend = _currentUrl;
    final c = _controller;
    _controller = null;
    await c?.dispose();
  }

  /// Возвращаем видео после скрытия рекламы (уже из кеша)
  Future<void> resume() async {
    final url = _lastUrlBeforeSuspend;
    if (url == null || url.isEmpty) return;
    if (_controller != null) return;

    await _setControllerForUrl(url);
  }

  Future<void> _clearControllerOnly() async {
    isVideo = false;
    _currentUrl = null;

    final c = _controller;
    _controller = null;
    await c?.dispose();
  }

  /// Финальный dispose (когда экран реально закрыли)
  void disposeService() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    _controller = null;
    isVideo = false;
    _currentUrl = null;
  }
}

// class VideoPreviewService with WidgetsBindingObserver {
//   VideoPreviewService() {
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed) {
//       videoPlayerController?.play();
//     }
//   }

//   VideoPlayerController? videoPlayerController;
//   bool isVideo = false;

//   Future<void> init(QrMenuModel menuData) async {
//     if (menuData.recommend?.isNotEmpty ?? false) {
//       final videoPath = menuData.recommend?.first.image?.first.file;

//       if (videoPath != null && videoPath.endsWith('.mp4')) {
//         isVideo = true;
//         videoPlayerController =
//             VideoPlayerController.networkUrl(Uri.parse(videoPath));

//         await videoPlayerController?.initialize();
//         videoPlayerController?.setVolume(0.0);
//         videoPlayerController?.setLooping(true);
//         videoPlayerController?.play();
//       } else {
//         isVideo = false;
//         dispose();
//       }
//     } else {
//       isVideo = false;
//       dispose();
//     }
//   }

//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     videoPlayerController?.dispose();
//     videoPlayerController = null;
//     isVideo = false;
//   }

//   bool get isInitialized => videoPlayerController?.value.isInitialized ?? false;
// }
