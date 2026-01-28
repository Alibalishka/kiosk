import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapVm extends ViewModel {
  final BuildContext context;
  final String lat;
  final String lng;

  MapVm({
    required this.context,
    required this.lat,
    required this.lng,
  });

  final mapControllerCompleter = Completer<YandexMapController>();
  final List<MapObject> mapObjects = [];
  final MapObjectId mapObjectId = const MapObjectId('normal_icon_placemark');

  @override
  void init() {
    super.init();
    moveToLocation();
  }

  void moveToLocation() async {
    final mapObject = PlacemarkMapObject(
      mapId: mapObjectId,
      point: Point(
        latitude: double.parse(lat),
        longitude: double.parse(lng),
      ),
      opacity: 1,
      icon: PlacemarkIcon.single(PlacemarkIconStyle(
        image: BitmapDescriptor.fromAssetImage(AppWebpImages.locationFill),
        scale: 1,
      )),
    );
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: double.parse(lat),
            longitude: double.parse(lng),
          ),
          zoom: 15,
        ),
      ),
    );
    mapObjects.add(mapObject);
    await Future.delayed(const Duration(milliseconds: 100));
    notifyListeners();
  }
}
