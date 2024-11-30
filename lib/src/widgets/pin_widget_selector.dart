import 'package:flutter/material.dart';
import 'package:ultra_map_place_picker/src/providers/place_provider.dart';
import 'package:provider/provider.dart';
import 'package:ultra_map_place_picker/src/widgets/default_pin.dart';
import 'package:ultra_map_place_picker/ultra_map_place_picker.dart';

class PinWidgetSelector extends StatelessWidget {
  final PinBuilder? pinBuilder;
  const PinWidgetSelector({super.key, required this.pinBuilder});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Selector<PlaceProvider, PinState>(
        selector: (final _, final provider) => provider.pinState,
        builder: (final context, final state, final __) {
          if (pinBuilder == null) {
            return DefaultPin(state: state);
          } else {
            return Builder(
                builder: (final builderContext) =>
                    pinBuilder!(builderContext, state));
          }
        },
      ),
    );
  }
}
