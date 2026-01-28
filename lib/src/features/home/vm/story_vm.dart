import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story_presenter/flutter_story_presenter.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/news_model.dart';
import 'package:shimmer/shimmer.dart';

class StoryVm extends ViewModel {
  final BuildContext context;
  final List<NewsDatum> storyData;

  StoryVm({
    required this.context,
    required this.storyData,
  });

  // PageController pageController = PageController();
  // late AnimationController animationController;
  // int currentPage = 0;
  // Timer? timer;
  // double progressValue = 0.0;

  //Story Data
  List<StoryModel> sampleStory = [];

  late AnimationController animationController;
  late Animation<double> fadeAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(animationController);

  @override
  void init() {
    preloadImages();
    initStoryData();
    super.init();
  }

  @override
  void dispose() {
    // pageController.dispose();
    super.dispose();
  }

  void preloadImages() {
    for (var data in storyData) {
      for (var item in data.items!) {
        CachedNetworkImageProvider(item.image!)
            .resolve(const ImageConfiguration());
      }
    }
  }

  void initStoryData() {
    sampleStory = [];
    for (var data in storyData) {
      List<StoryItem> storyItems = [];
      for (var item in data.items!) {
        if ((item.file ?? '').endsWith('.mp4')) {
          item.filePreview != null
              ? CachedNetworkImageProvider(item.filePreview!)
                  .resolve(const ImageConfiguration())
              : null;
          storyItems.add(
            StoryItem(
              storyItemType: StoryItemType.video,
              storyItemSource: StoryItemSource.network,
              url: item.file,
              videoConfig: StoryViewVideoConfig(
                fit: BoxFit.cover,
                useVideoAspectRatio: false,
                // safeAreaTop: true,
                // padding: const EdgeInsets.only(top: 50),
                loadingWidget: item.filePreview != null
                    ? CachedNetworkImage(
                        imageUrl: item.filePreview ?? '',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: AppComponents.shimmerBase,
                          highlightColor: AppComponents.shimmerHighlight,
                          child: Container(color: Colors.white),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Shimmer.fromColors(
                        baseColor: AppComponents.shimmerBase,
                        highlightColor: AppComponents.shimmerHighlight,
                        child: Container(color: Colors.white),
                      ),
              ),
            ),
          );
        } else {
          storyItems.add(
            StoryItem(
              storyItemType: StoryItemType.image,
              storyItemSource: StoryItemSource.network,
              url: item.image,
              duration: const Duration(seconds: 5),
              imageConfig: StoryViewImageConfig(
                fit: BoxFit.cover,
                progressIndicatorBuilder: (p0, p1, p2) => Shimmer.fromColors(
                  baseColor: AppComponents.shimmerBase,
                  highlightColor: AppComponents.shimmerHighlight,
                  child: Container(color: Colors.white),
                ),
              ),
              textConfig: StoryViewTextConfig(
                textWidget: Text(
                  item.text ?? '',
                  style: AppTextStyles.bodyL.copyWith(
                    color: AppComponents
                        .adbannergroupAdbannerDarkSubtitleColorDefault,
                  ),
                ),
              ),
            ),
          );
        }
      }
      sampleStory.add(
        StoryModel(
          itemId: data.itemId,
          stories: storyItems,
        ),
      );
    }
  }
}

class StoryModel {
  int? itemId;
  List<StoryItem> stories;

  StoryModel({
    this.itemId,
    required this.stories,
  });
}
