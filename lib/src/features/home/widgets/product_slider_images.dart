import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/news_model.dart';
import 'package:qr_pay_app/src/features/home/vm/detail_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/story_detail.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

class RestaurantSliderImage extends StatefulWidget {
  final List<NewsDatum>? images;
  final ValueChanged<int>? onIndexChanged;
  // final DetailVm? viewModel;
  final bool isDetailPage;
  // final bool isGradientEffect;

  const RestaurantSliderImage({
    super.key,
    required this.images,
    this.onIndexChanged,
    // this.viewModel,
    this.isDetailPage = false,
    // this.isGradientEffect = false,
  });

  @override
  State<RestaurantSliderImage> createState() => _RestaurantSliderImageState();
}

class _RestaurantSliderImageState extends State<RestaurantSliderImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    //   CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    // );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailVm>(
      builder: (context, value, state) {
        return CarouselSlider.builder(
          itemCount: widget.images?.length ?? 0,
          itemBuilder: (context, index, realindex) => GestureDetector(
            onTap: () => showCustomSheet(
              context,
              child: MyStoryViewDetail(
                stories: value.sampleStory[0].stories,
                inittialIndex: index,
              ),
            ),
            child: Stack(
              children: [
                widget.images?[index].file != null &&
                        (widget.images?[index].file?.contains('.mp4') ?? false)
                    ? Stack(
                        children: [
                          // Картинка (фоновая)
                          widget.images?[index].filePreview == null
                              ? const SizedBox.shrink()
                              : CachedNetworkImage(
                                  imageUrl:
                                      widget.images?[index].filePreview ?? '',
                                  progressIndicatorBuilder:
                                      (context, url, progress) =>
                                          Shimmer.fromColors(
                                    baseColor: AppComponents.shimmerBase,
                                    highlightColor:
                                        AppComponents.shimmerHighlight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.primitiveNeutral0,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  imageBuilder: (context, placeholder) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: placeholder,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),

                          // Видео с fade-анимацией
                          if (value
                                  .videoPlayerController?.value.isInitialized ??
                              false)
                            Positioned.fill(
                              child: AnimatedOpacity(
                                opacity: 1.0,
                                duration: const Duration(milliseconds: 1500),
                                curve: Curves.easeInOut,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  clipBehavior: Clip.hardEdge,
                                  child: SizedBox(
                                    width: value.videoPlayerController!.value
                                        .size.width,
                                    height: value.videoPlayerController!.value
                                        .size.height,
                                    child: ClipRRect(
                                      // borderRadius: const BorderRadius.vertical(
                                      //   bottom: Radius.circular(8),
                                      // ),
                                      child: VideoPlayer(
                                          value.videoPlayerController!),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height:
                                100, // можно отрегулировать под нужную высоту
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    AppColors
                                        .primitiveNeutralcold1000, // Полупрозрачный чёрный
                                    AppColors.none,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : CachedNetworkImage(
                        imageUrl: widget.images?[index].image != null
                            ? widget.images![index].image!
                            : (widget.images?[index].file != null &&
                                    (widget.images?[index].file
                                            ?.contains('.webp') ??
                                        false))
                                ? widget.images![index].file!
                                : widget.images![index].path!,
                        progressIndicatorBuilder: (context, url, progress) =>
                            Shimmer.fromColors(
                          baseColor: AppComponents.shimmerBase,
                          highlightColor: AppComponents.shimmerHighlight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primitiveNeutral0,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        fit: BoxFit.cover,
                        imageBuilder: (context, placeholder) => Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: placeholder,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              height:
                                  100, // можно отрегулировать под нужную высоту
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      AppColors
                                          .primitiveNeutralcold1000, // Полупрозрачный чёрный
                                      AppColors.none,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // : const SizedBox.shrink(),
                            // widget.isDetailPage
                            //     ? Container(
                            //         decoration: const BoxDecoration(
                            //           gradient: LinearGradient(
                            //             begin: Alignment.topCenter,
                            //             end: Alignment.center,
                            //             stops: [0.0, 1],
                            //             colors: [
                            //               AppColors.primitiveNeutralwarm1000,
                            //               AppColors.none,
                            //             ],
                            //           ),
                            //         ),
                            //       )
                            //     : const SizedBox.shrink(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 32, horizontal: 16),
                              child: Text(
                                widget.images?[index].headerTitle ?? '',
                                style: GoogleFonts.forum(
                                  fontSize: 28,
                                  color: AppColors.primitiveNeutralwarm0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
              ],
            ),
          ),
          options: CarouselOptions(
            autoPlay: false,
            autoPlayAnimationDuration: const Duration(seconds: 5),
            height: context.mediaQuery.size.height,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              if (widget.onIndexChanged != null) {
                widget.onIndexChanged!(index);
              }
            },
          ),
        );
      },
    );
  }
}
