import 'package:flutter/material.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/features/timeline/presentation/widgets/timeline_theme.dart';

/// Chấm tròn đánh dấu một entry trên timeline.
class TimelineDot extends StatelessWidget {
  final MemoriaTimelineTheme theme;
  final Color color;

  const TimelineDot({super.key, required this.theme, required this.color});

  @override
  Widget build(BuildContext context) {
    final d = theme.dotRadius * 2;
    final dotBorderCol = theme.dotBorderColor ?? context.themeColors.background;
    return Container(
      width: d,
      height: d,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: dotBorderCol, width: theme.dotBorderWidth),
        boxShadow: theme.dotGlow
            ? [
                BoxShadow(
                  color: color.withValues(alpha: 0.4),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
    );
  }
}
