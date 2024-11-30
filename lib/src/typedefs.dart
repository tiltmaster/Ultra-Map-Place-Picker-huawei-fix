import 'package:flutter/material.dart';
import 'package:ultra_map_place_picker/ultra_map_place_picker.dart';

typedef SelectedPlaceWidgetBuilder = Widget Function(
    BuildContext context,
    PickResultModel? selectedPlace,
    SearchingState state,
    bool isSearchBarFocused);

typedef PinBuilder = Widget Function(BuildContext context, PinState state);

typedef IntroModalWidgetBuilder = Widget Function(
    BuildContext context, void Function() onClose);