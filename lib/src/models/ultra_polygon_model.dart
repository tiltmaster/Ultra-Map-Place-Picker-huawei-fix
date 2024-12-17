import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:huawei_map/huawei_map.dart' as hm;
import 'package:ultra_map_place_picker/src/models/ultra_location_model.dart';

class UltraPolygonModel {
  final String polygonId;
  final Color? fillColor;
  final bool? geodesic;
  final List<UltraLocationModel>? points;
  final bool? visible;
  final Color? strokeColor;
  final int? strokeWidth;
  final int? zIndex;
  final VoidCallback? onClick;
  final List<List<UltraLocationModel>>? holes;

  UltraPolygonModel({
    required this.polygonId,
    this.fillColor,
    this.geodesic,
    this.points,
    this.visible,
    this.strokeColor,
    this.strokeWidth,
    this.zIndex,
    this.onClick,
    this.holes,
  });

  gm.Polygon get toGooglePolygon => gm.Polygon(
        polygonId: gm.PolygonId(polygonId),
        fillColor: fillColor ?? Colors.black,
        geodesic: geodesic ?? false,
        points: points?.map((point) => point.googleLatLng).toList() ?? [],
        visible: visible ?? true,
        strokeColor: strokeColor ?? Colors.black,
        strokeWidth: strokeWidth ?? 10,
        zIndex: zIndex ?? 0,
        onTap: onClick,
        consumeTapEvents: onClick != null,
        holes: holes
                ?.map((holeList) =>
                    holeList.map((hole) => hole.googleLatLng).toList())
                .toList() ??
            [],
      );

  hm.Polygon get toHuaweiPolygon => hm.Polygon(
        polygonId: hm.PolygonId(polygonId),
        clickable: onClick != null,
        fillColor: fillColor ?? Colors.black,
        geodesic: geodesic ?? false,
        points: points?.map((point) => point.huaweiLatLng).toList() ?? [],
        holes: holes
                ?.map((holeList) =>
                    holeList.map((hole) => hole.huaweiLatLng).toList())
                .toList() ??
            [],
        visible: visible ?? true,
        strokeColor: strokeColor ?? Colors.black,
        strokeWidth: strokeWidth ?? 10,
        zIndex: zIndex ?? 0,
        onClick: onClick,
      );
}
