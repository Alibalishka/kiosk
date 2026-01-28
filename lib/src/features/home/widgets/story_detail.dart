import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story_presenter/flutter_story_presenter.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

// class StoryDetail extends StatefulWidget {
//   const StoryDetail({
//     Key? key,
//     // required this.storyData,
//     required this.initialPage,
//     required this.storyData,
//   }) : super(key: key);
//   // final List<NewsDatum> storyData;
//   final int initialPage;

//   final List<StoryModel> storyData;

//   @override
//   State<StoryDetail> createState() => _StoryPageState();
// }

// class _StoryPageState extends State<StoryDetail> {
//   // late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
//   // double verticalDragOffset = 0.0;
//   // double dragThreshold = 100.0;

//   @override
//   void initState() {
//     super.initState();
//     // indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
//     //     IndicatorAnimationCommand.resume);
//   }

//   @override
//   void dispose() {
//     // indicatorAnimationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return GestureDetector(
//     //   onVerticalDragUpdate: (details) {
//     //     setState(() => verticalDragOffset += details.delta.dy);
//     //   },
//     //   onVerticalDragEnd: (details) {
//     //     if (verticalDragOffset > dragThreshold) {
//     //       context.router.pop(context);
//     //     } else {
//     //       setState(() => verticalDragOffset = 0.0);
//     //     }
//     //   },
//     //   child: BackdropFilter(
//     //     filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
//     //     child: AnimatedContainer(
//     //       color: AppColors.primitiveBlue400,
//     //       duration: const Duration(milliseconds: 300),
//     //       curve: Curves.easeOut,
//     //       transform: Matrix4.translationValues(0, verticalDragOffset, 0),
//     //       child: Stack(
//     //         children: [
//     //           StoryPageView(
//     //             showShadow: true,
//     //             indicatorPadding:
//     //                 const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
//     //             indicatorVisitedColor:
//     //                 AppComponents.progressbarProgressColorDefault,
//     //             indicatorUnvisitedColor:
//     //                 AppComponents.progressbarBaseColorDefault,
//     //             indicatorHeight: 6,
//     //             initialPage: 0,
//     //             itemBuilder: (context, pageIndex, storyIndex) {
//     //               final user = widget.storyData[storyIndex];
//     //               return Stack(
//     //                 children: [
//     //                   CachedNetworkImage(
//     //                     imageUrl: user.path ?? '',
//     //                     placeholder: (context, url) => Shimmer.fromColors(
//     //                       baseColor: AppComponents.shimmerBase,
//     //                       highlightColor: AppComponents.shimmerHighlight,
//     //                       child: Container(color: Colors.white),
//     //                     ),
//     //                     errorWidget: (context, url, error) =>
//     //                         const Icon(Icons.error),
//     //                   ),
//     //                   Positioned(
//     //                     bottom: 0,
//     //                     left: 0,
//     //                     right: 0,
//     //                     child: Container(
//     //                       height: 170,
//     //                       decoration: BoxDecoration(
//     //                         gradient: LinearGradient(
//     //                           colors: [
//     //                             Colors.black.withOpacity(1),
//     //                             const Color.fromRGBO(0, 0, 0, 0),
//     //                           ],
//     //                           begin: Alignment.bottomCenter,
//     //                           end: Alignment.topCenter,
//     //                         ),
//     //                       ),
//     //                     ),
//     //                   ),
//     //                 ],
//     //               );
//     //             },
//     //             gestureItemBuilder: (context, pageIndex, storyIndex) {
//     //               return Stack(
//     //                 children: [
//     //                   SafeArea(
//     //                     child: Align(
//     //                       alignment: Alignment.topRight,
//     //                       child: Padding(
//     //                         padding: const EdgeInsets.only(top: 60),
//     //                         child: IconButton(
//     //                           padding: EdgeInsets.zero,
//     //                           color: Colors.white,
//     //                           icon: const Icon(Icons.close),
//     //                           onPressed: () => context.router.pop(),
//     //                         ),
//     //                       ),
//     //                     ),
//     //                   ),
//     //                   Positioned(
//     //                     bottom: 32,
//     //                     left: 16,
//     //                     right: 16,
//     //                     child: CustomButton(
//     //                         text: LocaleKeys.toTheRestaurantPage.tr(),
//     //                         onPressed: () => context.router.pop()),
//     //                   ),
//     //                 ],
//     //               );
//     //             },
//     //             indicatorAnimationController: indicatorAnimationController,
//     //             initialStoryIndex: (pageIndex) => widget.initialPage,
//     //             pageLength: 1,
//     //             storyLength: (int pageIndex) => widget.storyData.length,
//     //             onPageLimitReached: () => context.router.pop(),
//     //           ),
//     //         ],
//     //       ),
//     //     ),
//     //   ),
//     // );
//     return MyStoryViewDetail(
//       storyModel: widget.storyData[0],
//     );
//   }
// }

class MyStoryViewDetail extends StatefulWidget {
  const MyStoryViewDetail({
    super.key,
    required this.stories,
    required this.inittialIndex,
  });

  final List<StoryItem> stories;
  final int inittialIndex;

  @override
  State<MyStoryViewDetail> createState() => _MyStoryViewState();
}

class _MyStoryViewState extends State<MyStoryViewDetail> {
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
        child: FlutterStoryPresenter(
          flutterStoryController: controller,
          items: widget.stories,
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
                    CustomButton(
                      text: LocaleKeys.toTheRestaurantPage.tr(),
                      onPressed: () => context.router.pop(),
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
            backgroundDisabledColor:
                AppComponents.progressbarProgressColorDefault.withOpacity(0.5),
            horizontalGap: 1.5,
            borderRadius: 100,
            margin:
                const EdgeInsets.only(top: 60, bottom: 0, left: 16, right: 16),
          ),
          initialIndex: widget.inittialIndex,
          onStoryChanged: (index) {},
          onPreviousCompleted: () async {},
          onCompleted: () async {
            context.router.pop();
          },
        ),
      ),
    );
  }
}
