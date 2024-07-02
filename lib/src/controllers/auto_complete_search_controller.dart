import 'package:flutter/cupertino.dart';
import 'package:ultra_map_place_picker/src/widgets/auto_complete_search.dart';

class AutoCompleteSearchController extends ChangeNotifier {
  late AutoCompleteSearchState _autoCompleteSearch;

  attach(final AutoCompleteSearchState searchWidget) {
    _autoCompleteSearch = searchWidget;
  }

  /// Just clears text.
  clear() {
    _autoCompleteSearch.clearText();
  }

  /// Clear and remove focus (Dismiss keyboard)
  reset() {
    _autoCompleteSearch.resetSearchBar();
  }

  clearOverlay() {
    _autoCompleteSearch.clearOverlay();
  }
}
