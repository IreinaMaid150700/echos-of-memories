import 'package:flutter/material.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/core/utils/extensions/date_time_extension.dart';

class CurrentTimeWidget extends StatelessWidget {
  const CurrentTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Row(
      children: [
        Text(
          '${now.day}',
          style: context.textTheme.displayLarge?.copyWith(
            color: context.themeColors.primary,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              now.toVietnamese(showYear: false, showDay: false),
              style: context.textTheme.labelMedium?.copyWith(
                color: context.themeColors.textSecondary,
              ),
            ),
            Text(
              '${now.year}',
              style: context.textTheme.labelMedium?.copyWith(
                color: context.themeColors.textMuted,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
