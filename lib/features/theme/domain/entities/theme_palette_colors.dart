import 'package:flutter/material.dart';

/// Parses `#RRGGBB` into a fully opaque [Color].
Color hexToColor(String hex) =>
    Color(0xFF000000 | int.parse(hex.substring(1), radix: 16));

/// Formats a [Color] as an uppercase `#RRGGBB` string (alpha dropped).
String colorToHex(Color color) =>
    '#${(color.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
