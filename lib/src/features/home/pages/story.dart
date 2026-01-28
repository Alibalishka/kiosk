import 'dart:math' as math;

import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story_presenter/flutter_story_presenter.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/vm/story_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:video_player/video_player.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({
    super.key,
    required this.storyData,
    required this.initialPage,
  });
  final List<StoryModel> storyData;
  final int initialPage;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  PageController pageController = PageController();
  double currentPageValue = 0.0;
  double verticalDragOffset = 0.0;
  double dragThreshold = 150.0;

  VideoPlayerController? videoController;
  int currentStoryIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.initialPage);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.none,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: PageView.builder(
          itemCount: widget.storyData.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: pageController,
              child: MyStoryView(
                storyModel: widget.storyData[index],
                pageController: pageController,
                totalPage: widget.storyData.length,
              ),
              builder: (context, child) {
                if (pageController.position.hasContentDimensions) {
                  currentPageValue = pageController.page ?? 0.0;
                  final isLeaving = (index - currentPageValue) <= 0;
                  final t = (index - currentPageValue);
                  final rotationY = lerpDouble(0, 30, t)!;
                  const maxOpacity = 0.8;
                  final num opacity = lerpDouble(0, maxOpacity, t.abs())!
                      .clamp(0.0, maxOpacity);
                  final isPaging = opacity != maxOpacity;
                  final transform = Matrix4.identity();
                  transform.setEntry(3, 2, 0.003);
                  transform.rotateY(-rotationY * (math.pi / 180.0));
                  return Transform(
                    alignment: isLeaving
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    transform: transform,
                    child: Stack(
                      children: [
                        child!,
                        if (isPaging && !isLeaving)
                          Positioned.fill(
                            child: Opacity(
                              opacity: opacity as double,
                              child: const ColoredBox(
                                color: Colors.black87,
                              ),
                            ),
                          )
                      ],
                    ),
                  );
                }
                return child!;
              },
            );
          },
        ),
      ),
    );
  }
}

class MyStoryView extends StatefulWidget {
  const MyStoryView({
    super.key,
    required this.storyModel,
    required this.pageController,
    required this.totalPage,
  });

  final StoryModel storyModel;
  final PageController pageController;
  final int totalPage;

  @override
  State<MyStoryView> createState() => _MyStoryViewState();
}

class _MyStoryViewState extends State<MyStoryView> {
  late FlutterStoryController controller;
  final ValueNotifier<int> storyIndexNotifier = ValueNotifier<int>(0);
  double verticalDragOffset = 0.0;
  double dragThreshold = 150.0;

  @override
  void initState() {
    controller = FlutterStoryController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() => verticalDragOffset += details.delta.dy);
      },
      onVerticalDragEnd: (details) {
        if (verticalDragOffset > dragThreshold) {
          context.router.pop(context);
        } else {
          setState(() => verticalDragOffset = 0.0);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        color: AppColors.semanticBgSurface1,
        transform: Matrix4.translationValues(0, verticalDragOffset, 0),
        child: ValueListenableBuilder<int>(
          valueListenable: storyIndexNotifier,
          builder: (context, storyIndex, state) {
            return FlutterStoryPresenter(
              flutterStoryController: controller,
              items: widget.storyModel.stories,
              headerWidget: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    color: Colors.white,
                    icon: const Icon(Icons.close),
                    onPressed: () => context.router.pop(),
                  ),
                ),
              ),
              footerWidget: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(1),
                            const Color.fromRGBO(0, 0, 0, 0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        widget.storyModel.stories[storyIndex].textConfig
                                ?.textWidget ??
                            const SizedBox.shrink(),
                        const SizedBox(height: 16),
                        widget.storyModel.itemId == null
                            ? const SizedBox.shrink()
                            : CustomButton(
                                text: LocaleKeys.toTheRestaurantPage.tr(),
                                onPressed: () => context.router.push(
                                    DetailProviderRoute(
                                        id: widget.storyModel.itemId ?? 0)),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
              storyViewIndicatorConfig: StoryViewIndicatorConfig(
                height: 6,
                activeColor: AppComponents.progressbarBaseColorDefault,
                backgroundCompletedColor:
                    AppComponents.progressbarProgressColorDefault,
                backgroundDisabledColor: AppComponents
                    .progressbarProgressColorDefault
                    .withOpacity(0.5),
                horizontalGap: 1.5,
                borderRadius: 100,
                margin: const EdgeInsets.only(
                    top: 60, bottom: 0, left: 16, right: 16),
              ),
              initialIndex: 0,
              onStoryChanged: (index) => storyIndexNotifier.value = index,
              onPreviousCompleted: () async {
                await widget.pageController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              onCompleted: () async {
                if (widget.pageController.page == widget.totalPage - 1) {
                  context.router.pop();
                } else {
                  await widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                  controller = FlutterStoryController();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
