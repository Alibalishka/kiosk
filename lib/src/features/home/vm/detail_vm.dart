import 'dart:async';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story_presenter/flutter_story_presenter.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/extensions/analytics.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/detail_item_bloc/detail_item_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_event.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/story_vm.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DetailVm extends ViewModel {
  final BuildContext context;
  final int itemId;
  final List<ImageDatum> images;

  DetailVm({
    required this.context,
    required this.itemId,
    required this.images,
  });

  late DetailItemBloc detailItemBloc;
  late PromotionsBloc promotionBloc;
  DetailItemModel data = DetailItemModel();
  DateTime now = DateTime.now();
  // final mapControllerCompleter = Completer<YandexMapController>();
  // final List<MapObject> mapObjects = [];
  // final MapObjectId mapObjectId = const MapObjectId('normal_icon_placemark');
  String? lat;
  String? lng;
  late ScrollController scrollController = ScrollController();
  bool isAtStart = true;

  QrMenuModel? menuData;

  /// Video EX
  late VideoPlayerController? videoPlayerController =
      VideoPlayerController.networkUrl(Uri.parse(''));
  //Story Data
  List<StoryModel> sampleStory = [];

  @override
  void init() {
    super.init();

    images.isNotEmpty ? initializeVideoPlayer(images.first.file ?? '') : null;
    scrollController.addListener(_scrollListener);
    detailItemBloc = DetailItemBloc(detailItemRepository: sl())
      ..add(DetailItemEvent.fetchDetailItem(itemId: itemId));
    promotionBloc = PromotionsBloc(promotionsRepository: PromotionsRepository())
      ..add(GetPromotions());
  }

  @override
  void dispose() {
    if (videoPlayerController != null) {
      videoPlayerController?.pause();
      videoPlayerController?.dispose();
      videoPlayerController = null;
    }
    detailItemBloc.close();
    scrollController.dispose();
    super.dispose();
    // promotionsBloc.close();
  }

  void syncMenu(QrMenuModel menuData) {
    this.menuData = menuData;
  }

  Future<void> initStoryData() async {
    sampleStory = [];

    List<StoryItem> storyItems = [];
    for (var item in data.data!.images!) {
      if (item.file != null && (item.file ?? '').endsWith('.mp4')) {
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
            url: item.path,
            duration: const Duration(seconds: 5),
            imageConfig: StoryViewImageConfig(
              fit: BoxFit.cover,
              progressIndicatorBuilder: (p0, p1, p2) => Shimmer.fromColors(
                baseColor: AppComponents.shimmerBase,
                highlightColor: AppComponents.shimmerHighlight,
                child: Container(color: Colors.white),
              ),
            ),
          ),
        );
      }
    }
    sampleStory.add(
      StoryModel(
        itemId: data.data?.id ?? 0,
        stories: storyItems,
      ),
    );
  }

  Future<void> initializeVideoPlayer(String path) async {
    if (path.contains('.mp4')) {
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(path))
        ..initialize().then((_) async {
          videoPlayerController?.setVolume(0.0);
          videoPlayerController?.setLooping(true);
          videoPlayerController?.play();

          await Future.delayed(const Duration(milliseconds: 10));
          notifyListeners();
        });
    }
  }

  Future<void> _scrollListener() async {
    // Если прокрутка в самом начале
    if (scrollController.offset < context.mediaQuery.size.width / 1.4 &&
        !isAtStart) {
      isAtStart = true;
      // setState(() => isAtStart = true);
    }
    // Если прокрутка ушла от начала
    else if (scrollController.offset >= context.mediaQuery.size.width / 1.4 &&
        isAtStart) {
      isAtStart = false;
      // setState(() => isAtStart = false);
    }

    notifyListeners();
  }

  // Future<void> saveData(DetailItemModel data) async {
  //   this.data = data;
  //   try {
  //     await initStoryData();
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   AnalyticsService.openContent(
  //       id: data.data?.id ?? 0, name: data.data?.name ?? 'null');
  //   data.data?.images?.first.file != null
  //       ? initializeVideoPlayer(data.data?.images?.first.file ?? '')
  //       : null;
  //   preloadImages();
  //   await Future.delayed(const Duration(milliseconds: 10));
  //   notifyListeners();
  // }
  Future<void> saveData(DetailItemModel data) async {
    this.data = data;
    preloadImages();
    lat = data.data?.lat;
    lng = data.data?.lng;

    try {
      await initStoryData();
    } catch (e, stackTrace) {
      log('Error in initStoryData: $e\n$stackTrace');
    }

    AnalyticsService.openContent(
      id: data.data?.id ?? 0,
      name: data.data?.name ?? 'null',
    );

    if (data.data?.images?.isNotEmpty ?? false) {
      final file = data.data!.images!.first.file;
      if (file != null) {
        initializeVideoPlayer(file);
      }
    }

    await Future.delayed(const Duration(milliseconds: 100));
    notifyListeners();
    // await moveToLocation(
    //   lat: data.data?.lat,
    //   lng: data.data?.lng,
    // );
  }

  void preloadImages() {
    for (var data in data.data!.images!) {
      CachedNetworkImageProvider(data.path!)
          .resolve(const ImageConfiguration());

      data.filePreview != null
          ? CachedNetworkImageProvider(data.filePreview!)
              .resolve(const ImageConfiguration())
          : null;
    }
  }

  // Future<void> moveToLocation({
  //   required String? lat,
  //   required String? lng,
  // }) async {
  //   final latitude = double.tryParse(lat ?? '') ?? 43.238949;
  //   final longitude = double.tryParse(lng ?? '') ?? 76.889709;

  //   this.lat = latitude.toString();
  //   this.lng = longitude.toString();

  //   final point = Point(latitude: latitude, longitude: longitude);

  //   final mapObject = PlacemarkMapObject(
  //     mapId: mapObjectId,
  //     point: point,
  //     opacity: 1,
  //     icon: PlacemarkIcon.single(
  //       PlacemarkIconStyle(
  //         image: BitmapDescriptor.fromAssetImage(AppWebpImages.locationFill),
  //         scale: 1,
  //       ),
  //     ),
  //   );

  //   final controller = await mapControllerCompleter.future;
  //   controller.moveCamera(
  //     animation: const MapAnimation(
  //       type: MapAnimationType.linear,
  //       duration: 1,
  //     ),
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(target: point, zoom: 12),
  //     ),
  //   );

  //   mapObjects.add(mapObject);
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   notifyListeners();
  // }
}
