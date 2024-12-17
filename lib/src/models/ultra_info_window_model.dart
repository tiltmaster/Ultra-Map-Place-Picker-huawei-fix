import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:huawei_map/huawei_map.dart' as hm;

/// Defines an information window that shows up when a [Marker] is tapped.
class UltraInfoWindowModel {
  /// Title of a [Marker].
  ///
  /// By default, the title is empty.
  final String? title;

  /// Snippet of a [Marker].
  final String? snippet;

  /// Offset of an information window.
  final Offset anchor;

  /// Function to be executed when an information window is tapped.
  final VoidCallback? onClick;

  /// Empty information window.
  static const UltraInfoWindowModel noText = UltraInfoWindowModel();

  const UltraInfoWindowModel({
    this.title,
    this.snippet,
    this.anchor = const Offset(0.5, 0.0),
    this.onClick,
  });

  gm.InfoWindow get googleWindow => gm.InfoWindow(
        title: title,
        snippet: snippet,
        anchor: anchor,
        onTap: onClick,
      );

  hm.InfoWindow get huaweiWindow => hm.InfoWindow(
        title: title,
        snippet: snippet,
        anchor: anchor,
        onClick: onClick,
      );

  /// Copies an existing [UltraInfoWindowModel] object and updates the specified attributes.
  UltraInfoWindowModel updateCopy({
    String? title,
    String? snippet,
    Offset? anchor,
    VoidCallback? onClick,
    VoidCallback? onLongClick,
    VoidCallback? onClose,
  }) {
    return UltraInfoWindowModel(
      title: title ?? this.title,
      snippet: snippet ?? this.snippet,
      anchor: anchor ?? this.anchor,
      onClick: onClick ?? this.onClick,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) {
      return false;
    }
    return other is UltraInfoWindowModel &&
        title == other.title &&
        snippet == other.snippet &&
        anchor == other.anchor;
  }

  @override
  int get hashCode => Object.hash(title.hashCode, snippet, anchor);
}
