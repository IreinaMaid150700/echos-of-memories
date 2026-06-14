import 'package:flutter/material.dart';

/// Theme tuỳ biến cho [MemoriaTimeline] — mọi giá trị null sẽ fallback về
/// màu/typography của app theme hiện tại.
class MemoriaTimelineTheme {
  final Color? dotColorA;
  final Color? dotColorB;
  final double dotRadius;
  final double dotBorderWidth;
  final Color? dotBorderColor;
  final bool dotGlow;
  final Color? lineColor;
  final double lineWidth;
  final bool lineGradient;
  final Color? cardColor;
  final double cardRadius;
  final EdgeInsets cardPadding;
  final List<BoxShadow>? cardShadow;
  final Color? cardBorderColor;
  final double cardBorderWidth;
  final TextStyle? titleStyle;
  final TextStyle? bodyStyle;
  final TextStyle? timeStyle;
  final TextStyle? captionStyle;
  final Color? tagBackground;
  final Color? tagBorder;
  final Color? tagForeground;
  final double chipRadius;
  final Color? moodBackground;
  final Color? moodBorder;
  final Color? moodForeground;
  final Color? moodIconColor;
  final double timeColumnWidth;
  final double dotColumnWidth;
  final double cardDotGap;
  final double entrySpacing;
  final double dotTopOffset;

  const MemoriaTimelineTheme({
    this.dotColorA,
    this.dotColorB,
    this.dotRadius = 6,
    this.dotBorderWidth = 2,
    this.dotBorderColor,
    this.dotGlow = true,
    this.lineColor,
    this.lineWidth = 1.5,
    this.lineGradient = true,
    this.cardColor,
    this.cardRadius = 16,
    this.cardPadding = const EdgeInsets.all(14),
    this.cardShadow,
    this.cardBorderColor,
    this.cardBorderWidth = 0,
    this.titleStyle,
    this.bodyStyle,
    this.timeStyle,
    this.captionStyle,
    this.tagBackground,
    this.tagBorder,
    this.tagForeground,
    this.chipRadius = 20,
    this.moodBackground,
    this.moodBorder,
    this.moodForeground,
    this.moodIconColor,
    this.timeColumnWidth = 68,
    this.dotColumnWidth = 22,
    this.cardDotGap = 10,
    this.entrySpacing = 18,
    this.dotTopOffset = 4,
  });
}
