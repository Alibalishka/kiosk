import 'dart:async';

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

  /// Номер последнего запроса на видео. Загрузка, которую обогнал более
  /// новый запрос (смена слайда, реклама, dispose), видит чужой номер и
  /// освобождает свой контроллер. Без этого шапка и syncData после загрузки
  /// меню грузили видео одновременно: проигравший контроллер оставался без
  /// ссылки и крутил видео в фоне, удерживая аппаратный декодер.
  int _generation = 0;

  /// URL, который грузится прямо сейчас (null — ничего не грузится).
  String? _loadingUrl;

  /// Поверх показана реклама: декодер отдан ей, шапка ждёт [resume].
  bool _suspended = false;

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
    final items = menuData.effectiveRecommend;
    await loadHeaderVideoForItem(items.isNotEmpty ? items.first : null);
  }

  Future<void> loadHeaderVideoForItem(Items? item) async {
    final videoPath = item?.image?.isNotEmpty == true
        ? item!.image!.first.file
        : null;
    final url = (videoPath ?? '').trim();

    if (url.isEmpty || !url.toLowerCase().endsWith('.mp4')) {
      await _clearControllerOnly();
      return;
    }

    // Пока поверх реклама, декодер не трогаем — только запоминаем, что
    // показать после resume(). Иначе перестройка шапки под рекламой
    // заводила второй декодер рядом с рекламным.
    if (_suspended) {
      _lastUrlBeforeSuspend = url;
      return;
    }

    if (_currentUrl == url) {
      // если url тот же и уже готово — просто убедимся что играет
      if (_controller?.value.isInitialized ?? false) {
        _controller?.play();
        return;
      }
      // уже грузится — второй контроллер не нужен
      if (_loadingUrl == url) return;
    }

    await _setControllerForUrl(url);
  }

  Future<void> _setControllerForUrl(String url) async {
    final generation = ++_generation;
    _currentUrl = url;
    _loadingUrl = url;
    isVideo = true;

    final old = _controller;
    _controller = null;
    await old?.dispose();

    VideoPlayerController? controller;
    try {
      final file = await VideoCache.I.getFile(url);
      if (generation != _generation) return;

      controller = (file != null)
          ? VideoPlayerController.file(file)
          : VideoPlayerController.networkUrl(Uri.parse(url));

      final created = controller
        ..setLooping(true)
        ..setVolume(0);

      created.addListener(() {
        final v = created.value;
        if (v.hasError) {
          log('Header video error ($url): ${v.errorDescription}');
        }
      });

      await created.initialize();
      if (generation != _generation) {
        unawaited(created.dispose());
        return;
      }
      _controller = created;
      created.play();
    } catch (e) {
      log('Header video init failed ($url): $e');
      // Освобождаем свой контроллер, а не _controller — тот мог уже
      // поставить более новый запрос. Не ждём: dispose после неудачного
      // initialize может не завершиться.
      unawaited(controller?.dispose());
      if (generation != _generation) return;
      isVideo = false;
      _currentUrl = null;
    } finally {
      if (generation == _generation) _loadingUrl = null;
    }
  }

  /// Отменяет загрузку, которая сейчас идёт: по завершении она освободит
  /// свой контроллер сама.
  void _cancelLoading() {
    _generation++;
    _loadingUrl = null;
  }

  /// ВАЖНО: освобождаем декодер, когда поверх появляется AdFullScreen
  Future<void> suspend() async {
    _suspended = true;
    _cancelLoading();
    _lastUrlBeforeSuspend = _currentUrl;
    final c = _controller;
    _controller = null;
    await c?.dispose();
  }

  /// Возвращаем видео после скрытия рекламы (уже из кеша)
  Future<void> resume() async {
    _suspended = false;
    final url = _lastUrlBeforeSuspend;
    if (url == null || url.isEmpty) return;
    if (_controller != null) return;

    await _setControllerForUrl(url);
  }

  Future<void> _clearControllerOnly() async {
    _cancelLoading();
    isVideo = false;
    _currentUrl = null;
    _lastUrlBeforeSuspend = null;

    final c = _controller;
    _controller = null;
    await c?.dispose();
  }

  /// Финальный dispose (когда экран реально закрыли)
  void disposeService() {
    WidgetsBinding.instance.removeObserver(this);
    _cancelLoading();
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
