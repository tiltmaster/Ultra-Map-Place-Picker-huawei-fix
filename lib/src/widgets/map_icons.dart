import 'package:flutter/material.dart';

class MapIcons extends StatelessWidget {
  final GlobalKey appBarKey;
  final bool? enableMapTypeButton, enableMyLocationButton;
  final void Function()? onToggleMapType, onMyLocation;
  const MapIcons(
      {super.key,
      required this.appBarKey,
      required this.enableMapTypeButton,
      required this.enableMyLocationButton,
      required this.onToggleMapType,
      required this.onMyLocation});

  @override
  Widget build(BuildContext context) {
    return (appBarKey.currentContext == null)
        ? Container()
        : Positioned(
            top: (appBarKey.currentContext!.findRenderObject() as RenderBox).size.height,
            right: 15,
            child: Column(
              children: <Widget>[
                enableMapTypeButton == true
                    ? SizedBox(
                        width: 35,
                        height: 35,
                        child: RawMaterialButton(
                          shape: const CircleBorder(),
                          fillColor: Theme.of(context).brightness == Brightness.dark ? Colors.black54 : Colors.white,
                          elevation: 4.0,
                          onPressed: onToggleMapType,
                          child: const Icon(Icons.layers),
                        ),
                      )
                    : Container(),
                const SizedBox(height: 10),
                enableMyLocationButton == true
                    ? SizedBox(
                        width: 35,
                        height: 35,
                        child: RawMaterialButton(
                          shape: const CircleBorder(),
                          fillColor: Theme.of(context).brightness == Brightness.dark ? Colors.black54 : Colors.white,
                          elevation: 4.0,
                          onPressed: onMyLocation,
                          child: const Icon(Icons.my_location),
                        ),
                      )
                    : Container(),
              ],
            ),
          );
  }
}
