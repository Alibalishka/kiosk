import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/vm/detail_vm.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapWidgte extends StatefulWidget {
  const MapWidgte({
    super.key,
    // required this.viewModel,
    this.lat,
    this.lng,
  });
  // final DetailVm viewModel;
  final String? lat;
  final String? lng;

  @override
  State<MapWidgte> createState() => _MapWidgteState();
}

class _MapWidgteState extends State<MapWidgte> {
  final mapControllerCompleter = Completer<YandexMapController>();
  final List<MapObject> mapObjects = [];
  final MapObjectId mapObjectId = const MapObjectId('normal_icon_placemark');
  String lat = '';
  String lng = '';

  Future<void> moveToLocation({
    required String? lat,
    required String? lng,
  }) async {
    final latitude = double.tryParse(lat ?? '');
    final longitude = double.tryParse(lng ?? '');

    if (latitude == null || longitude == null) return;

    this.lat = latitude.toString();
    this.lng = longitude.toString();

    final point = Point(latitude: latitude, longitude: longitude);

    final mapObject = PlacemarkMapObject(
      mapId: mapObjectId,
      point: point,
      opacity: 1,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(AppWebpImages.locationFill),
          scale: 1,
        ),
      ),
    );

    final controller = await mapControllerCompleter.future;
    controller.moveCamera(
      animation: const MapAnimation(
        type: MapAnimationType.linear,
        duration: 1,
      ),
      CameraUpdate.newCameraPosition(
        CameraPosition(target: point, zoom: 12),
      ),
    );
    log('ALIOIIII');

    setState(() {
      mapObjects
        ..clear()
        ..add(mapObject);
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 500),
      () => moveToLocation(
        lat: widget.lat,
        lng: widget.lng,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        clipBehavior: Clip.none,
        height: 200,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Stack(
            children: [
              YandexMap(
                onMapTap: (_) =>
                    context.router.push(MapProviderRoute(lat: lat, lng: lng)),
                mapObjects: mapObjects,
                // nightModeEnabled: true,
                // modelsEnabled: false,
                onMapCreated: (controller) async =>
                    mapControllerCompleter.complete(controller),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
