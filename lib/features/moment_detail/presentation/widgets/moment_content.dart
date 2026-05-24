part of '../screens/moment_detail_screen.dart';

class _MomentContent extends StatelessWidget {
  const _MomentContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quiet coffee after work',
          style: context.textTheme.titleLarge?.copyWith(
            color: context.themeColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(AppSpacing.sm),
        Text(
          'The café had a quiet corner by the window. I ordered my usual latte and spent an hour just watching the street below. People passing by, wind through the leaves, nothing much on my mind.',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.themeColors.textSecondary,
            height: 1.6,
          ),
        ),
        const Gap(AppSpacing.md),
        const _MoodChip(label: 'Calm'),
      ],
    );
  }
}

class _MoodChip extends StatelessWidget {
  final String label;

  const _MoodChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.themeColors.moodCalmBackground,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.spa_outlined,
            size: 14,
            color: context.themeColors.moodCalmText,
          ),
          const Gap(AppSpacing.xxs),
          Text(
            label,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.themeColors.moodCalmText,
            ),
          ),
        ],
      ),
    );
  }
}
