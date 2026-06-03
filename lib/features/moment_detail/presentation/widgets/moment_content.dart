part of '../screens/moment_detail_screen.dart';

class _MomentContent extends StatelessWidget {
  const _MomentContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MomentDetailCubit, MomentDetailState>(
      buildWhen: (prev, curr) => prev.moment != curr.moment,
      builder: (context, state) {
        final moment = state.moment.data;
        if (moment == null) return const SizedBox.shrink();
        final note = moment.note;
        final summary = note == null ? '' : note.substring(0, note.length.clamp(0, 80));
        final displayTitle = moment.title ?? summary;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (displayTitle.isNotEmpty)
              Text(
                displayTitle,
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.themeColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (moment.note != null) ...[
              const Gap(AppSpacing.sm),
              Text(
                moment.note!,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.themeColors.textSecondary,
                  height: 1.6,
                ),
              ),
            ],
            const Gap(AppSpacing.md),
          ],
        );
      },
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
