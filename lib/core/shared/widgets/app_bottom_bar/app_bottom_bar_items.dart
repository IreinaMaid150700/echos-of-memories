import 'package:flutter/material.dart';

class AppBottomBarItemsModels {
  final String path;

  final String title;

  final Color? iconActiveColor;

  final Color? iconInactiveColor;

  final Color? backgroundSelectColor;

  final Color? backgroundUnSelectColor;

  const AppBottomBarItemsModels({
    required this.path,
    required this.title,
    this.backgroundSelectColor,
    this.backgroundUnSelectColor,
    this.iconActiveColor,
    this.iconInactiveColor,
  });
}
