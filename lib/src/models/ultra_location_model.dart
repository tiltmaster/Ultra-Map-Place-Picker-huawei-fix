import 'package:flutter_google_maps_webservices/geocoding.dart' as gms;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:huawei_map/huawei_map.dart' as hm;

class UltraLocationModel {
  /// location latitude
  final double latitude;

  /// location longitude
  final double longitude;

  UltraLocationModel(this.latitude, this.longitude);

  factory UltraLocationModel.fromHuaweiLatLng(hm.LatLng location) =>
      UltraLocationModel(location.lat, location.lng);
  factory UltraLocationModel.fromGoogleLatLng(gm.LatLng location) =>
      UltraLocationModel(location.latitude, location.longitude);
  factory UltraLocationModel.fromHuaweiLocation(hm.Location location) =>
      UltraLocationModel(location.latitude ?? 0, location.longitude ?? 0);
  factory UltraLocationModel.fromGoogleLocation(gms.Location location) =>
      UltraLocationModel(location.lat, location.lng);
  factory UltraLocationModel.fromPosition(Position position) =>
      UltraLocationModel(position.latitude, position.longitude);

  hm.LatLng get huaweiLatLng => hm.LatLng(latitude, longitude);
  gm.LatLng get googleLatLng => gm.LatLng(latitude, longitude);
}
