import 'package:cached_network_image/cached_network_image.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/safe_network_image.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/pages/product_page.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/recomended.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

class QrMenuHeaderBackground extends StatelessWidget {
  final QrMenuVm viewModel;
  final BuildContext context;

  const QrMenuHeaderBackground({
    super.key,
    required this.viewModel,
    required this.context,
  });

  bool get _adVisible =>
      viewModel.isKioskMode &&
      viewModel.kioskService.isAdVisible &&
      viewModel.kioskService.currentScreenSaver != null;

  @override
  Widget build(BuildContext context) {
    final item = viewModel.menuData?.recommend?.first;

    return GestureDetector(
      onTap: (!_adVisible && viewModel.scrollService.isAtStart && item != null)
          ? () async {
              final headerCtrl = viewModel.videoService.videoPlayerController;
              headerCtrl?.pause();

              try {
                await showCustomSheet(
                  context,
                  child: ProductPage(item: item),
                );
              } finally {
                if (!_adVisible) {
                  final c = viewModel.videoService.videoPlayerController;
                  if (c != null && c.value.isInitialized) {
                    c.play();
                  }
                }
              }
            }
          : null,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 1) Постер ВСЕГДА снизу (и во время рекламы, и пока видео не готово)
            _buildPoster(item),

            // 2) Видео — только если не реклама и isVideo=true
            if (!_adVisible && viewModel.videoService.isVideo)
              _buildVideoFadeIn(viewModel, item),

            // 3) gradient overlay
            _buildGradient(),

            // 4) overlay content
            RecomendedWidget(item: item, viewModel: viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.primitiveNeutralwarm1000,
            AppColors.primitiveNeutralwarm1000.withOpacity(0.1),
            AppColors.none,
          ],
          stops: const [0, 0.35, 1.0],
        ),
      ),
    );
  }

  Widget _buildPoster(Items? item) {
    final url = (item?.image?.first.file?.contains('mp4') == true)
        ? (item?.image?.first.filePreview ?? '')
        : (item?.image?.first.path ?? item?.image?.first.file ?? '');

    if (url.isEmpty) {
      return const ColoredBox(color: Colors.black);
    }

    return SafeNetworkImage(
      imageUrl: url,
      imageBuilder: (context, placeholder) => DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: placeholder,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildVideoFadeIn(QrMenuVm viewModel, Items? item) {
    final controller = viewModel.videoService.videoPlayerController;
    if (controller == null) return const SizedBox.shrink();

    return RepaintBoundary(
      child: ValueListenableBuilder(
        valueListenable: controller,
        builder: (_, value, __) {
          final ready = value.isInitialized;

          // ✅ “дорогой” эффект: видео мягко проявляется поверх постера
          return IgnorePointer(
            ignoring: !ready,
            child: AnimatedOpacity(
              opacity: ready ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              child: ready
                  ? FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: value.size.width,
                        height: value.size.height,
                        child: VideoPlayer(controller),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}




// class QrMenuHeaderBackground extends StatelessWidget {
//   final QrMenuVm viewModel;
//   final BuildContext context;

//   const QrMenuHeaderBackground({
//     super.key,
//     required this.viewModel,
//     required this.context,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final item = viewModel.menuData?.recommend?.first;
//     final isVideoReady =
//         viewModel.videoService.videoPlayerController?.value.isInitialized ??
//             false;

//     return GestureDetector(
//       onTap: viewModel.scrollService.isAtStart
//           ? () => showCustomSheet(
//                 context,
//                 child: ProductPage(item: item!),
//               )
//           : null,
//       child:  Stack(
//         fit: StackFit.expand,
//         children: [
//           if (viewModel.videoService.isVideo)
//             isVideoReady
//                 ? SizedBox(
//                     height: 220, // нужная тебе высота блока под видео
//                     child: buildVideo(viewModel),
//                   )
//                 // AspectRatio(
//                 //     aspectRatio: viewModel.videoService.videoPlayerController!
//                 //         .value.aspectRatio,
//                 //     child: VideoPlayer(
//                 //         viewModel.videoService.videoPlayerController!),
//                 //   )
//                 : _buildShimmer()
//           else
//             SafeNetworkImage(
//               imageUrl: item?.image?.first.file?.contains('mp4') == true
//                   ? item?.image?.first.path ?? ''
//                   : item?.image?.first.file ?? '',
//               imageBuilder: (context, placeholder) => Container(
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.all(Radius.circular(12)),
//                   image: DecorationImage(
//                     image: placeholder,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//                 colors: [
//                   AppColors.primitiveNeutralwarm1000,
//                   AppColors.primitiveNeutralwarm1000.withOpacity(0.1),
//                   AppColors.none,
//                 ],
//                 stops: const [0, 0.35, 1.0],
//               ),
//             ),
//           ),
//           RecomendedWidget(item: item, viewModel: viewModel),
//         ],
//       ),
//     );
//   }

//   Widget _buildShimmer() => Shimmer.fromColors(
//         baseColor: AppComponents.shimmerBase,
//         highlightColor: AppComponents.shimmerHighlight,
//         child: Container(
//           decoration: BoxDecoration(
//             color: AppColors.primitiveNeutral0,
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       );

//   Widget buildVideo(QrMenuVm viewModel) {
//     final controller = viewModel.videoService.videoPlayerController;

//     // if (controller == null || !controller.value.isInitialized) {
//     //   return const SizedBox.shrink(); // или заглушка / лоадер
//     // }

//     if (controller == null) {
//       return const ColoredBox(color: Colors.black);
//     }

//     final size = controller.value.size;

//     return RepaintBoundary(
//   child: ValueListenableBuilder(
//     valueListenable: controller,
//     builder: (_, value, __) {
//       if (!value.isInitialized) {
//         return _buildShimmer();
//       }

//       return FittedBox(
//         fit: BoxFit.cover,
//         child: SizedBox(
//           width: value.size.width,
//           height: value.size.height,
//           child: VideoPlayer(controller),
//         ),
//       );
//     },
//   ),
// );


//   }


// }
