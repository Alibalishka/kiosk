import 'package:cached_network_image/cached_network_image.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/pages/story.dart';
import 'package:qr_pay_app/src/features/home/vm/story_vm.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/features/home/widgets/animated_card.dart';
import 'package:shimmer/shimmer.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({
    super.key,
    required this.viewModel,
  });
  final StoryVm viewModel;

  @override
  State<NewsWidget> createState() => NewsWidgetState();
}

class NewsWidgetState extends State<NewsWidget>
    with ViewModelMixin<NewsWidget, StoryVm> {
  @override
  StoryVm get viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   height: 150,
    //   child: ListView.separated(
    //     padding: AppPaddings.horizontal16,
    //     shrinkWrap: true,
    //     scrollDirection: Axis.horizontal,
    //     itemBuilder: (BuildContext context, int index) {
    //       return AnimatedCard(
    //         child: Material(
    //           color: AppColors.semanticBgSurface1,
    //           borderRadius: const BorderRadius.all(Radius.circular(12)),
    //           child: GestureDetector(
    //             onTap: () => showCustomSheet(
    //               context,
    //               child: StoryPage(
    //                 storyData: viewModel.sampleStory,
    //                 initialPage: index,
    //               ),
    //             ),
    //             child: Stack(
    //               children: [
    //                 CachedNetworkImage(
    //                   width: MediaQuery.of(context).size.width / 1.12,
    //                   progressIndicatorBuilder: (context, url, progress) =>
    //                       Shimmer.fromColors(
    //                     baseColor: AppComponents.shimmerBase,
    //                     highlightColor: AppComponents.shimmerHighlight,
    //                     child: Container(
    //                       decoration: BoxDecoration(
    //                         color: AppColors.primitiveNeutral0,
    //                         borderRadius: BorderRadius.circular(24),
    //                       ),
    //                     ),
    //                   ),
    //                   imageUrl: viewModel.storyData[index].image ?? '',
    //                   imageBuilder: (context, placeholder) => Stack(
    //                     children: [
    //                       Container(
    //                         decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(24),
    //                           image: DecorationImage(
    //                             image: placeholder,
    //                             fit: BoxFit.cover,
    //                           ),
    //                         ),
    //                       ),
    //                       Container(
    //                         decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(24),
    //                           gradient: LinearGradient(
    //                             begin: Alignment.bottomCenter,
    //                             end: Alignment.center,
    //                             colors: [
    //                               AppColors.primitiveNeutralwarm1000
    //                                   .withOpacity(0.7),
    //                               AppColors.none,
    //                             ],
    //                           ),
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //                 Align(
    //                   alignment: Alignment.bottomCenter,
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(12),
    //                     child: Text(
    //                       viewModel.storyData[index].headerTitle ?? '',
    //                       style: AppTextStyles.bodyMStrong.copyWith(
    //                           color: AppComponents
    //                               .adbannergroupAdbannerDarkSubtitleColorDefault,
    //                           height: 1.2),
    //                       overflow: TextOverflow.ellipsis,
    //                       maxLines: 3,
    //                     ),
    //                   ),
    //                 ),
    //                 // Positioned(
    //                 //   left: 16,
    //                 //   top: 20,
    //                 //   bottom: 20,
    //                 //   right: 150,
    //                 //   child: Text(
    //                 //     viewModel.storyData[index].headerTitle ?? '',
    //                 //     style: AppTextStyles.headingH3.copyWith(
    //                 //         color: AppComponents
    //                 //             .adbannergroupAdbannerDarkSubtitleColorDefault,
    //                 //         height: 1.2),
    //                 //     overflow: TextOverflow.ellipsis,
    //                 //     maxLines: 3,
    //                 //   ),
    //                 // ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //     separatorBuilder: (BuildContext context, int index) =>
    //         const RowSpacer(0.8),
    //     itemCount: viewModel.storyData.length,
    //   ),
    // );
    return SizedBox(
      height: context.mediaQuery.size.width * 0.35,
      // height: 144,
      // width: context.mediaQuery.size.width / 3,
      child: ListView.separated(
        itemCount: viewModel.storyData.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const RowSpacer(0.95),
        itemBuilder: (context, index) => AnimatedCard(
          child: Material(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: GestureDetector(
              onTap: () => showCustomSheet(
                context,
                child: StoryPage(
                  storyData: viewModel.sampleStory,
                  initialPage: index,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 8 : 0,
                    right: index == viewModel.storyData.length - 1 ? 8 : 0),
                child: Container(
                  width: context.mediaQuery.size.width * 0.25,
                  // width: 104,
                  decoration: const BoxDecoration(
                    color: AppColors.none,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: viewModel.storyData[index].image ?? '',
                    progressIndicatorBuilder: (context, url, progress) =>
                        Shimmer.fromColors(
                      baseColor: AppComponents.shimmerBase,
                      highlightColor: AppComponents.shimmerHighlight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primitiveNeutralwarm1000,
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                    imageBuilder: (context, placeholder) => Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                            image: DecorationImage(
                              image: placeholder,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              stops: const [0, 0.4],
                              colors: [
                                AppColors.primitiveNeutralwarm1000
                                    .withOpacity(0.7),
                                AppColors.none,
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 8,
                          right: 8,
                          child: Text(
                            viewModel.storyData[index].headerTitle ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.bodySstrong.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
