import 'package:flutter/material.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/features/timeline/presentation/widgets/timeline_theme.dart';

/// Chip hiển thị mood của một entry trên timeline.
class TimelineMoodChip extends StatelessWidget {
  final String label;
  final MemoriaTimelineTheme theme;

  const TimelineMoodChip({super.key, required this.label, required this.theme});

  @override
  Widget build(BuildContext context) {
    final t = theme;
    final bg = t.moodBackground ?? context.themeColors.moodCalmBackground;
    final borderCol = t.moodBorder ?? context.themeColors.borderSubtle;
    final fg = t.moodForeground ?? context.themeColors.moodCalmText;
    final iconCol = t.moodIconColor ?? context.themeColors.moodCalmText;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(t.chipRadius),
        border: Border.all(color: borderCol),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.eco, size: 10, color: iconCol),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.5,
              color: fg,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

/// Chip hiển thị tag (#hashtag) của một entry trên timeline.
class TimelineTagChip extends StatelessWidget {
  final String label;
  final MemoriaTimelineTheme theme;

  const TimelineTagChip({super.key, required this.label, required this.theme});

  @override
  Widget build(BuildContext context) {
    final t = theme;
    final bg = t.tagBackground ?? context.themeColors.tagChipBackground;
    final borderCol = t.tagBorder ?? context.themeColors.borderSubtle;
    final fg = t.tagForeground ?? context.themeColors.textSecondary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(t.chipRadius),
        border: Border.all(color: borderCol),
      ),
      child: Text("#$label", style: TextStyle(fontSize: 11.5, color: fg)),
    );
  }
}
