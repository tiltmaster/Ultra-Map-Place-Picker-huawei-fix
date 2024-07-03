import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:huawei_map/huawei_map.dart' as hm;

enum PinState { preparing, idle, dragging }
enum SearchingState { idle, searching }

enum UltraMapType {
  normal(googleMapType: gm.MapType.normal, huaweiMapType: hm.MapType.normal),
  satellite(googleMapType: gm.MapType.satellite, huaweiMapType: hm.MapType.normal),
  terrain(googleMapType: gm.MapType.terrain, huaweiMapType: hm.MapType.terrain),
  hybrid(googleMapType: gm.MapType.hybrid, huaweiMapType: hm.MapType.normal);

  final gm.MapType googleMapType;
  final hm.MapType huaweiMapType;
  const UltraMapType({required this.googleMapType, required this.huaweiMapType});
}

enum UltraJointType {
  mitered(googleJointType: gm.JointType.mitered, huaweiJointType: hm.JointType.mitered),
  bevel(googleJointType: gm.JointType.bevel, huaweiJointType: hm.JointType.bevel),
  round(googleJointType: gm.JointType.round, huaweiJointType: hm.JointType.round),
  ;

  final gm.JointType googleJointType;
  final hm.JointType huaweiJointType;
  const UltraJointType({required this.googleJointType, required this.huaweiJointType});
}
