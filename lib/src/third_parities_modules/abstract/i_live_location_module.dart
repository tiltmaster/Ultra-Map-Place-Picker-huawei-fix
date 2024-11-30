import 'package:geolocator/geolocator.dart';

abstract class ILiveLocationModule {
  Future<Position?> getCurrentLocation(
      {required final bool gracefully,
      required LocationAccuracy? desiredAccuracy});
}
