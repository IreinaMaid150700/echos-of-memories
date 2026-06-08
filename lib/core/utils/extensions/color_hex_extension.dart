import 'package:flutter/material.dart';

/// Parse a `#RRGGBB` / `#AARRGGBB` (or without `#`) hex string into a [Color].
extension ColorHexExtension on String {
  /// Returns the parsed color, or [fallback] when the string is not valid hex.
  Color toColor({Color fallback = const Color(0xFF000000)}) {
    var hex = trim().replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    if (hex.length != 8) return fallback;
    final value = int.tryParse(hex, radix: 16);
    return value == null ? fallback : Color(value);
  }
}

/// Convenience for nullable hex strings.
extension NullableColorHexExtension on String? {
  Color toColorOr(Color fallback) {
    final self = this;
    if (self == null || self.isEmpty) return fallback;
    return self.toColor(fallback: fallback);
  }
}
