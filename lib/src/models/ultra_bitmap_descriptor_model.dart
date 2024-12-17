import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:huawei_map/huawei_map.dart' as hm;

class UltraBitmapDescriptorModel {
  final gm.BitmapDescriptor googleBitmap;
  final hm.BitmapDescriptor huaweiBitmap;

  const UltraBitmapDescriptorModel(
      {required this.googleBitmap, required this.huaweiBitmap});

  static Future<UltraBitmapDescriptorModel> fromAsset(
      {required Size size, required String asset}) async {
    return UltraBitmapDescriptorModel(
      googleBitmap: await gm.BitmapDescriptor.asset(
          ImageConfiguration(size: size), asset),
      huaweiBitmap: await hm.BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: size), asset),
    );
  }

  factory UltraBitmapDescriptorModel.fromBytes(
          {required Uint8List bytes, required Size size}) =>
      UltraBitmapDescriptorModel(
        googleBitmap: gm.BitmapDescriptor.bytes(bytes,
            height: size.height, width: size.width),
        huaweiBitmap: hm.BitmapDescriptor.fromBytes(
          bytes,
        ),
      );

  static const defaultMarker = UltraBitmapDescriptorModel(
    googleBitmap: gm.BitmapDescriptor.defaultMarker,
    huaweiBitmap: hm.BitmapDescriptor.defaultMarker,
  );
}
