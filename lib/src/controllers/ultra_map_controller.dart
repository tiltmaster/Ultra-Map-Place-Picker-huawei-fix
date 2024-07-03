import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:huawei_map/huawei_map.dart' as hm;
import 'package:ultra_map_place_picker/src/models/location_model.dart';

class UltraMapController {
  gm.GoogleMapController? googleMapController;
  hm.HuaweiMapController? huaweiMapController;

  void completeGoogleController(final gm.GoogleMapController? controller) {
    googleMapController = controller;
    if (controller != null) {
      Completer().complete(googleMapController);
    }
  }

  void completeHuaweiController(final hm.HuaweiMapController? controller) {
    huaweiMapController = controller;
    if (controller != null) {
      Completer().complete(huaweiMapController);
    }
  }

  Future<void> animateCamera(
      {required LocationModel target, required double zoomLevel}) async {
    await googleMapController
        ?.animateCamera(gm.CameraUpdate.newCameraPosition(gm.CameraPosition(
            target: gm.LatLng(
              target.latitude,
              target.longitude,
            ),
            zoom: zoomLevel)));
    await huaweiMapController
        ?.animateCamera(hm.CameraUpdate.newCameraPosition(hm.CameraPosition(
            target: hm.LatLng(
              target.latitude,
              target.longitude,
            ),
            zoom: zoomLevel)));
  }

  Future<double?> getZoomLevel() async {
    return googleMapController != null
        ? (await googleMapController?.getZoomLevel())
        : (await huaweiMapController?.getZoomLevel());
  }
}
