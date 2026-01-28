// import 'package:video_player/video_player.dart';

// class ScreenSaverVideoCache {
//   final _controllers = <String, VideoPlayerController>{};

//   Future<VideoPlayerController?> preload(String url) async {
//     if (_controllers.containsKey(url)) {
//       return _controllers[url];
//     }

//     try {
//       final controller = VideoPlayerController.networkUrl(Uri.parse(url))
//         ..setLooping(true)
//         ..setVolume(0);

//       await controller.initialize();
//       _controllers[url] = controller;
//       return controller;
//     } catch (_) {
//       return null;
//     }
//   }

//   VideoPlayerController? get(String url) => _controllers[url];

//   void disposeExcept(Set<String> keepUrls) {
//     final toRemove =
//         _controllers.keys.where((url) => !keepUrls.contains(url)).toList();

//     for (final url in toRemove) {
//       _controllers[url]?.dispose();
//       _controllers.remove(url);
//     }
//   }
// }
