import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/features/home/vm/service/video_cache.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/screen_savers_response.dart';
import 'package:video_player/video_player.dart';

// class AdFullScreen extends StatefulWidget {
//   final ScreenSaversDatum banner;
//   final VoidCallback onTap;

//   const AdFullScreen({
//     super.key,
//     required this.banner,
//     required this.onTap,
//   });

//   @override
//   State<AdFullScreen> createState() => _AdFullScreenState();
// }

// class _AdFullScreenState extends State<AdFullScreen>
//     with SingleTickerProviderStateMixin {
//   VideoPlayerController? _controller;

//   /// 🔑 флаг: видео реально готово (первый кадр отдан)
//   final ValueNotifier<bool> _isVideoReady = ValueNotifier(false);

//   // late final AnimationController _pulseController;

//   bool get _hasVideo => (widget.banner.video ?? '').trim().isNotEmpty;
//   bool get _hasImage => (widget.banner.image ?? '').trim().isNotEmpty;

//   bool _overlayLaidOut = false;
//   bool _playRequested = false;

//   /// ключ для AnimatedSwitcher — ТОЛЬКО при смене баннера
//   String get _contentKey => (widget.banner.id?.toString() ??
//           widget.banner.video ??
//           widget.banner.image ??
//           widget.banner.title ??
//           '')
//       .trim();

//   @override
//   void initState() {
//     super.initState();

//     // _pulseController = AnimationController(
//     //   vsync: this,
//     //   duration: const Duration(seconds: 2),
//     // )..repeat(reverse: true);

//     if (_hasVideo) {
//       final cache = sl<ScreenSaverVideoCache>();
//       _controller = cache.get(widget.banner.video!.trim());

//       if (_controller != null) {
//         _attachVideoListener(_controller!);

//         /// ⚠️ play ТОЛЬКО после первого build
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (mounted) {
//             _controller!.play();
//           }
//         });
//       }
//     }
//   }

//   @override
//   void didUpdateWidget(covariant AdFullScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     final oldVideo = (oldWidget.banner.video ?? '').trim();
//     final newVideo = (widget.banner.video ?? '').trim();

//     if (oldVideo != newVideo) {
//       _isVideoReady.value = false;

//       if (_hasVideo) {
//         final cache = sl<ScreenSaverVideoCache>();
//         _controller = cache.get(newVideo);

//         if (_controller != null) {
//           _attachVideoListener(_controller!);

//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             if (mounted) {
//               _controller!.play();
//             }
//           });
//         }
//       }
//     }
//   }

//   /// 🔑 Ждём ПЕРВЫЙ РЕАЛЬНЫЙ КАДР
//   void _attachVideoListener(VideoPlayerController controller) {
//     controller.addListener(() {
//       final v = controller.value;

//       if (!_isVideoReady.value &&
//           v.isInitialized &&
//           v.isPlaying &&
//           v.position > Duration.zero) {
//         _isVideoReady.value = true;
//       }
//     });
//   }

//   void _tryStartVideo() {
//     if (_playRequested) return;
//     if (_controller == null) return;

//     final v = _controller!.value;

//     if (!v.isInitialized) {
//       // ждём следующего кадра
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         _tryStartVideo();
//       });
//       return;
//     }

//     _playRequested = true;
//     _controller!.play();
//   }

//   @override
//   void dispose() {
//     // _pulseController.dispose();
//     _isVideoReady.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       if (!_overlayLaidOut) {
//         _overlayLaidOut = true;

//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           _tryStartVideo();
//         });
//       }

//       return GestureDetector(
//         behavior: HitTestBehavior.opaque,
//         onTap: widget.onTap,
//         child: Container(
//           color: Colors.black,
//           child: AnimatedSwitcher(
//             duration: const Duration(milliseconds: 650),
//             switchInCurve: Curves.easeOutCubic,
//             switchOutCurve: Curves.easeInCubic,
//             transitionBuilder: (child, animation) =>
//                 FadeTransition(opacity: animation, child: child),
//             child: Stack(
//               key: ValueKey(_contentKey),
//               children: [
//                 /// 🔹 CONTENT
//                 Positioned.fill(child: _buildContent()),

//                 /// 🔹 VERTICAL GRADIENT
//                 Positioned.fill(
//                   child: DecoratedBox(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.topCenter,
//                         colors: [
//                           Colors.black.withOpacity(0.40),
//                           Colors.black.withOpacity(0.12),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),

//                 /// 🔹 VIGNETTE
//                 Positioned.fill(
//                   child: IgnorePointer(
//                     child: DecoratedBox(
//                       decoration: BoxDecoration(
//                         gradient: RadialGradient(
//                           center: const Alignment(0, -0.1),
//                           radius: 1.1,
//                           colors: [
//                             Colors.transparent,
//                             Colors.black.withOpacity(0.5),
//                           ],
//                           stops: const [0.6, 1.0],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }

//   /// ================= CONTENT =================

//   Widget _buildContent() {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         /// 🔹 PREVIEW / IMAGE — ВСЕГДА ПОД ВИДЕО
//         if (_hasImage) _buildImage(),

//         /// 🔹 VIDEO — ПОЯВЛЯЕТСЯ ТОЛЬКО КОГДА ГОТОВО
//         if (_hasVideo && _controller != null)
//           ValueListenableBuilder<bool>(
//             valueListenable: _isVideoReady,
//             builder: (_, ready, __) {
//               if (!ready) return const SizedBox.shrink();

//               final size = _controller!.value.size;
//               return FittedBox(
//                 fit: BoxFit.cover,
//                 child: SizedBox(
//                   width: size.width,
//                   height: size.height,
//                   child: VideoPlayer(_controller!),
//                 ),
//               );
//             },
//           ),
//       ],
//     );
//   }

//   Widget _buildImage() {
//     return SafeNetworkImage(
//       imageUrl: widget.banner.image!,
//       imageBuilder: (context, provider) => Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: provider,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AdFullScreen extends StatefulWidget {
//   final ScreenSaversDatum banner;
//   final VoidCallback onTap;

//   const AdFullScreen({
//     super.key,
//     required this.banner,
//     required this.onTap,
//   });

//   @override
//   State<AdFullScreen> createState() => _AdFullScreenState();
// }

// class _AdFullScreenState extends State<AdFullScreen>
//     with SingleTickerProviderStateMixin {
//   VideoPlayerController? _controller;
//   Future<void>? _initFuture;

//   late final AnimationController _pulseController;
//   late final Animation<double> _scaleAnim;
//   late final Animation<double> _glowAnim;

//   bool get _hasVideo => (widget.banner.video ?? '').trim().isNotEmpty;
//   bool get _hasImage => (widget.banner.image ?? '').trim().isNotEmpty;

//   // ключ для AnimatedSwitcher (новая реклама → новое содержимое)
//   String get _contentKey => (widget.banner.id?.toString() ??
//           widget.banner.video ??
//           widget.banner.image ??
//           widget.banner.title ??
//           '')
//       .trim();

//   @override
//   void initState() {
//     super.initState();
//     _pulseController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat(reverse: true);

//     _scaleAnim = Tween<double>(begin: 1.0, end: 1.05).animate(
//       CurvedAnimation(
//         parent: _pulseController,
//         curve: Curves.easeInOut,
//       ),
//     );

//     _glowAnim = Tween<double>(begin: 0.0, end: 18.0).animate(
//       CurvedAnimation(
//         parent: _pulseController,
//         curve: Curves.easeInOut,
//       ),
//     );

//     _initVideo();
//   }

//   @override
//   void didUpdateWidget(covariant AdFullScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     final oldVideo = (oldWidget.banner.video ?? '').trim();
//     final newVideo = (widget.banner.video ?? '').trim();

//     if (oldVideo != newVideo) {
//       log('AdFullScreen: banner video changed, reinit controller');

//       _controller?.dispose();
//       _controller = null;
//       _initFuture = null;

//       _initVideo();
//     }
//   }

//   void _initVideo() {
//     if (!_hasVideo) {
//       log('AdFullScreen: no video url, skip init. banner.video="${widget.banner.video}"');
//       return;
//     }

//     final url = widget.banner.video!.trim();
//     log('AdFullScreen: init video: $url');

//     final controller = VideoPlayerController.networkUrl(Uri.parse(url))
//       ..setLooping(true)
//       ..setVolume(0); // mute для автоплея

//     _controller = controller;

//     _initFuture = controller.initialize().then((_) {
//       if (!mounted) return;
//       log(
//         'AdFullScreen: initialized. '
//         'isInitialized=${controller.value.isInitialized}, '
//         'hasError=${controller.value.hasError}, '
//         'error=${controller.value.errorDescription}, '
//         'size=${controller.value.size}',
//       );

//       if (!controller.value.hasError && controller.value.isInitialized) {
//         controller.play();
//       }
//       setState(() {});
//     }).catchError((e, st) {
//       log('AdFullScreen: init error: $e\n$st');
//       if (!mounted) return;
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     _pulseController.dispose();
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: widget.onTap,
//       child: Container(
//         color: Colors.black,
//         child: AnimatedSwitcher(
//           duration: const Duration(milliseconds: 650),
//           switchInCurve: Curves.easeOutCubic,
//           switchOutCurve: Curves.easeInCubic,
//           transitionBuilder: (child, animation) => FadeTransition(
//             opacity: animation,
//             child: child,
//           ),
//           child: Stack(
//             key: ValueKey(_contentKey),
//             children: [
//               // контент (видео / картинка / текст)
//               Positioned.fill(child: _buildContent()),

//               // мягкий вертикальный градиент
//               Positioned.fill(
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                       colors: [
//                         Colors.black.withValues(alpha: 0.40),
//                         Colors.black.withValues(alpha: 0.12),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//               // виньетка по краям (radial)
//               Positioned.fill(
//                 child: IgnorePointer(
//                   child: DecoratedBox(
//                     decoration: BoxDecoration(
//                       gradient: RadialGradient(
//                         center: const Alignment(0, -0.1),
//                         radius: 1.1,
//                         colors: [
//                           Colors.transparent,
//                           Colors.black.withValues(alpha: 0.5),
//                         ],
//                         stops: const [0.6, 1.0],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               // пульсирующая кнопка "Заказать" снизу
//               // Align(
//               //   alignment: Alignment.bottomCenter,
//               //   child: Padding(
//               //     padding: const EdgeInsets.only(bottom: 190),
//               //     child: AnimatedBuilder(
//               //       animation: _pulseController,
//               //       builder: (context, child) {
//               //         final dy = (_pulseController.value - 0.5) * -4;

//               //         return Transform.translate(
//               //           offset: Offset(0, dy),
//               //           child: Transform.scale(
//               //             scale: _scaleAnim.value,
//               //             child: ClipRRect(
//               //               borderRadius: BorderRadius.circular(100),

//               //               /// ВАЖНО: ограничиваем область blur
//               //               child: BackdropFilter(
//               //                 filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
//               //                 child: Container(
//               //                   padding: const EdgeInsets.symmetric(
//               //                     horizontal: 80,
//               //                     vertical: 28,
//               //                   ),
//               //                   decoration: BoxDecoration(
//               //                     borderRadius: BorderRadius.circular(100),
//               //                     color: Colors.white.withOpacity(0.20),
//               //                     border: Border.all(
//               //                       color: Colors.white.withOpacity(0.4),
//               //                       width: 1.2,
//               //                     ),
//               //                     boxShadow: [
//               //                       BoxShadow(
//               //                         color: Colors.black.withOpacity(0.25),
//               //                         blurRadius: 18,
//               //                         offset: const Offset(0, 8),
//               //                       ),
//               //                     ],
//               //                   ),
//               //                   child: Text(
//               //                     LocaleKeys.order.tr(),
//               //                     style: AppTextStyles.bodyXlStrong.copyWith(
//               //                       fontSize: 23.sp,
//               //                       color: Colors.black,
//               //                       decoration: TextDecoration.none,
//               //                     ),
//               //                   ),
//               //                 ),
//               //               ),
//               //             ),
//               //           ),
//               //         );
//               //       },
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildContent() {
//     // Если есть видео — пробуем его
//     // if (_hasVideo && _controller != null && _initFuture != null) {
//     //   return FutureBuilder<void>(
//     //     future: _initFuture,
//     //     builder: (context, snapshot) {
//     //       // пока инициализируется
//     //       if (snapshot.connectionState == ConnectionState.waiting) {
//     //         return const CircleLoader();
//     //       }

//     //       // если контроллер сообщил об ошибке
//     //       if (_controller!.value.hasError) {
//     //         log('AdFullScreen: video error: ${_controller!.value.errorDescription}');
//     //         if (_hasImage) {
//     //           return _buildImage();
//     //         }
//     //         return Center(
//     //           child: Text(
//     //             'Ошибка видео:\n${_controller!.value.errorDescription}',
//     //             style: const TextStyle(color: Colors.red, fontSize: 14),
//     //             textAlign: TextAlign.center,
//     //           ),
//     //         );
//     //       }

//     //       // не инициализировался по какой-то причине
//     //       if (!_controller!.value.isInitialized) {
//     //         log('AdFullScreen: controller not initialized but future done');
//     //         if (_hasImage) return _buildImage();
//     //         return const Center(
//     //           child: Text(
//     //             'Видео недоступно',
//     //             style: TextStyle(color: Colors.white),
//     //           ),
//     //         );
//     //       }

//     //       // всё ок — показываем фуллскрин с cover
//     //       final size = _controller!.value.size;

//     //       return FittedBox(
//     //         fit: BoxFit.contain,
//     //         child: SizedBox(
//     //           width: size.width,
//     //           height: size.height,
//     //           child: VideoPlayer(_controller!),
//     //         ),
//     //       );
//     //     },
//     //   );
//     // }

//     if (_hasVideo && _controller != null && _controller!.value.isInitialized) {
//       final size = _controller!.value.size;

//       return FittedBox(
//         fit: BoxFit.cover,
//         child: SizedBox(
//           width: size.width,
//           height: size.height,
//           child: VideoPlayer(_controller!),
//         ),
//       );
//     }

//     // Если видео нет или контроллер не инициализирован — картинка / текст
//     if (_hasImage) return _buildImage();

//     return _buildFallbackText();
//   }

//   Widget _buildImage() {
//     return SafeNetworkImage(
//       imageUrl: widget.banner.image!,
//       imageBuilder: (context, placeholder) => Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: placeholder,
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFallbackText() {
//     return Center(
//       child: Text(
//         widget.banner.title ?? 'Рекламный блок',
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 24,
//           fontWeight: FontWeight.w600,
//           letterSpacing: 0.5,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }

class AdFullScreen extends StatefulWidget {
  final List<ScreenSaversDatum> items;
  final VoidCallback onTap;

  const AdFullScreen({
    super.key,
    required this.items,
    required this.onTap,
  });

  @override
  State<AdFullScreen> createState() => _AdFullScreenState();
}

class _AdFullScreenState extends State<AdFullScreen> {
  int _index = 0;

  VideoPlayerController? _currentController;
  VideoPlayerController? _nextController;

  Timer? _switchTimer;
  Timer? _videoSafetyTimer;

  VoidCallback? _videoEndListener;
  bool _goNextCoalesceScheduled = false;
  bool _nextPreloadInFlight = false;

  ScreenSaversDatum get _current => widget.items[_index];

  ScreenSaversDatum get _next =>
      widget.items[(_index + 1) % widget.items.length];

  bool get _hasImage => (_current.image ?? '').trim().isNotEmpty;

  String get _contentKey => (_current.id?.toString() ??
          _current.video ??
          _current.image ??
          _current.title ??
          '')
      .trim();

  /// ─────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    if (widget.items.isEmpty) return;
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    try {
      await _initCurrent();
      await _preloadNext();
      if (!mounted) return;
      _scheduleSlideEnd();
    } catch (e, st) {
      log('AdFullScreen bootstrap failed: $e\n$st');
      if (mounted) _scheduleSlideEnd();
    }
  }

  @override
  void dispose() {
    _cancelSlideTimers();
    _detachVideoEndListener();
    _currentController?.dispose();
    _nextController?.dispose();
    super.dispose();
  }

  void _cancelSlideTimers() {
    _switchTimer?.cancel();
    _switchTimer = null;
    _videoSafetyTimer?.cancel();
    _videoSafetyTimer = null;
  }

  /// Сливает повторные вызовы (конец ролика + safety-таймер в один кадр).
  void _requestGoNext() {
    if (!mounted) return;
    if (_goNextCoalesceScheduled) return;
    _goNextCoalesceScheduled = true;
    scheduleMicrotask(() {
      _goNextCoalesceScheduled = false;
      if (!mounted) return;
      _goNext();
    });
  }

  /// ─────────────────────────────────────────────────────────────
  /// Длительность слайда: видео — до конца ролика; картинка — displayDuration с бэка
  /// ─────────────────────────────────────────────────────────────

  void _detachVideoEndListener() {
    if (_videoEndListener != null && _currentController != null) {
      _currentController!.removeListener(_videoEndListener!);
    }
    _videoEndListener = null;
  }

  /// Запасной предел, если duration не пришёл или плеер «завис».
  Duration _videoSafetyTimeout(VideoPlayerController c) {
    const maxCap = Duration(minutes: 25);
    final d = c.value.duration;
    if (d <= Duration.zero) return const Duration(seconds: 120);
    final withBuffer = d + const Duration(seconds: 15);
    return withBuffer > maxCap ? maxCap : withBuffer;
  }

  void _scheduleSlideEnd() {
    _cancelSlideTimers();
    _detachVideoEndListener();

    final videoUrl = (_current.video ?? '').trim();
    final c = _currentController;
    final canPlayVideo = videoUrl.isNotEmpty &&
        c != null &&
        c.value.isInitialized &&
        !c.value.hasError;

    if (canPlayVideo) {
      _attachVideoEndListener(c);
      _videoSafetyTimer = Timer(_videoSafetyTimeout(c), _requestGoNext);
    } else {
      _startImageTimer();
    }
  }

  void _startImageTimer() {
    final seconds = (_current.displayDuration ?? 8).clamp(2, 60);
    _switchTimer = Timer(Duration(seconds: seconds), _requestGoNext);
  }

  void _attachVideoEndListener(VideoPlayerController controller) {
    _videoEndListener = () {
      if (!mounted) return;
      final v = controller.value;
      if (v.hasError) {
        log('AdFullScreen current video error: ${v.errorDescription}');
        _detachVideoEndListener();
        _cancelSlideTimers();
        _requestGoNext();
        return;
      }
      if (!v.isInitialized) return;
      if (v.duration <= Duration.zero) return;
      final nearEnd =
          v.position >= v.duration - const Duration(milliseconds: 300);
      if (nearEnd) {
        _detachVideoEndListener();
        _cancelSlideTimers();
        _requestGoNext();
      }
    };
    controller.addListener(_videoEndListener!);
  }

  /// ─────────────────────────────────────────────────────────────
  /// SWITCH
  /// ─────────────────────────────────────────────────────────────

  bool _shouldWaitForNextVideo(String nextUrl, VideoPlayerController? nextCtrl) {
    if (nextUrl.isEmpty) return false;
    if (nextCtrl != null) {
      if (nextCtrl.value.hasError) return false;
      return !nextCtrl.value.isInitialized;
    }
    return _nextPreloadInFlight;
  }

  void _goNext() {
    if (!mounted) return;

    final nextUrl = (_next.video ?? '').trim();
    final nextCtrl = _nextController;

    if (_shouldWaitForNextVideo(nextUrl, nextCtrl)) {
      // Не трогаем safety / listener текущего слайда — только откладываем смену.
      _switchTimer?.cancel();
      _switchTimer = Timer(const Duration(seconds: 1), _requestGoNext);
      return;
    }

    _cancelSlideTimers();
    _detachVideoEndListener();

    try {
      _currentController?.dispose();
    } catch (e, st) {
      log('AdFullScreen dispose current failed: $e\n$st');
    }
    _currentController = nextCtrl;
    _nextController = null;

    _index = (_index + 1) % widget.items.length;

    final cur = _currentController;
    if (cur != null && cur.value.isInitialized && !cur.value.hasError) {
      cur.seekTo(Duration.zero).then((_) {
        if (!mounted) return;
        cur.play();
      }).catchError((Object e, StackTrace st) {
        log('AdFullScreen seek/play failed: $e\n$st');
        if (mounted) _requestGoNext();
      });
    } else {
      cur?.dispose();
      _currentController = null;
    }

    _preloadNext();
    _scheduleSlideEnd();

    if (mounted) setState(() {});
  }

  /// ─────────────────────────────────────────────────────────────
  /// INIT CURRENT
  /// ─────────────────────────────────────────────────────────────

  Future<void> _initCurrent() async {
    final url = (_current.video ?? '').trim();
    if (url.isEmpty) return;

    try {
      _currentController?.dispose();
    } catch (e, st) {
      log('AdFullScreen dispose before init: $e\n$st');
    }
    _currentController = null;

    try {
      _currentController = await _prepareController(url);
    } catch (e, st) {
      log('AdFullScreen _initCurrent: $e\n$st');
      _currentController = null;
    }
    if (!mounted) return;

    final c = _currentController;
    if (c != null && c.value.isInitialized && !c.value.hasError) {
      try {
        await c.play();
      } catch (e, st) {
        log('AdFullScreen initial play failed: $e\n$st');
      }
    }
    if (mounted) setState(() {});
  }

  /// ─────────────────────────────────────────────────────────────
  /// PRELOAD NEXT
  /// ─────────────────────────────────────────────────────────────

  Future<void> _preloadNext() async {
    final url = (_next.video ?? '').trim();
    if (url.isEmpty) {
      _nextPreloadInFlight = false;
      return;
    }

    _nextPreloadInFlight = true;
    try {
      try {
        _nextController?.dispose();
      } catch (e, st) {
        log('AdFullScreen dispose next before preload: $e\n$st');
      }
      _nextController = null;

      try {
        _nextController = await _prepareController(url);
      } catch (e, st) {
        log('AdFullScreen _preloadNext: $e\n$st');
        _nextController = null;
      }
      try {
        await _nextController?.pause();
      } catch (e, st) {
        log('AdFullScreen preload pause: $e\n$st');
      }
    } finally {
      _nextPreloadInFlight = false;
    }
  }

  /// ─────────────────────────────────────────────────────────────
  /// CONTROLLER FACTORY
  /// ─────────────────────────────────────────────────────────────

  Future<VideoPlayerController?> _prepareController(String url) async {
    try {
      final file = await VideoCache.I.getFile(url);

      final controller = (file != null)
          ? VideoPlayerController.file(file)
          : VideoPlayerController.networkUrl(Uri.parse(url));

      controller
        ..setLooping(false)
        ..setVolume(0);

      await controller.initialize();
      if (controller.value.hasError) {
        log('Ad video init error ($url): ${controller.value.errorDescription}');
        await controller.dispose();
        return null;
      }
      return controller;
    } catch (e, st) {
      log('Ad prepareController failed ($url): $e\n$st');
      return null;
    }
  }

  /// ─────────────────────────────────────────────────────────────
  /// UI
  /// ─────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Container(
        color: Colors.black,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          child: Stack(
            key: ValueKey(_contentKey),
            children: [
              Positioned.fill(child: _buildContent()),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.4),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ─────────────────────────────────────────────────────────────
  /// CONTENT
  /// ─────────────────────────────────────────────────────────────

  Widget _buildContent() {
    final c = _currentController;

    if (c != null && c.value.isInitialized) {
      final size = c.value.size;

      return FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: VideoPlayer(c),
        ),
      );
    }

    if (_hasImage) return _buildImage();

    return _buildFallbackText();
  }

  Widget _buildImage() {
    final imageUrl = (_current.image ?? '').trim();
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (_, __, ___) => _buildFallbackText(),
    );
  }

  Widget _buildFallbackText() {
    return const SizedBox.shrink();
  }
}
