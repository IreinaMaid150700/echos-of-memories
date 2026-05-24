part of '../screens/moment_detail_screen.dart';

class _OrganizationCard extends StatelessWidget {
  const _OrganizationCard();

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'ORGANIZATION',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tags',
            style: context.textTheme.labelSmall?.copyWith(
              color: context.themeColors.textMuted,
            ),
          ),
          const Gap(AppSpacing.xs),
          const Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              _TagChip(label: '# morning'),
              _TagChip(label: '# coffee'),
              _TagChip(label: '# gratitude'),
              _TagChip(label: '# solitude'),
            ],
          ),
          const Gap(AppSpacing.md),
          Text(
            'Collections',
            style: context.textTheme.labelSmall?.copyWith(
              color: context.themeColors.textMuted,
            ),
          ),
          const Gap(AppSpacing.xs),
          const Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              _CollectionChip(label: 'Slow mornings'),
              _CollectionChip(label: 'Café notes'),
            ],
          ),
          const Gap(AppSpacing.md),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;

  const _TagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.themeColors.surfaceElevated,
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: context.themeColors.borderSubtle),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          color: context.themeColors.textSecondary,
        ),
      ),
    );
  }
}

class _CollectionChip extends StatelessWidget {
  final String label;

  const _CollectionChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.themeColors.tertiary.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          color: context.themeColors.textSecondary,
        ),
      ),
    );
  }
}
