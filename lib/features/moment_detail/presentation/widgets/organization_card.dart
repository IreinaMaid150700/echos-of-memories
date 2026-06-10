part of '../screens/moment_detail_screen.dart';

class _OrganizationCard extends StatelessWidget {
  const _OrganizationCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MomentDetailCubit, MomentDetailState>(
      buildWhen: (prev, curr) => prev.moment != curr.moment,
      builder: (context, state) {
        final moment = state.moment.data;
        if (moment == null || moment.tags.isEmpty)
          return const SizedBox.shrink();
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
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: moment.tags
                    .map((t) => _TagChip(label: '# ${t.name}'))
                    .toList(),
              ),
              const Gap(AppSpacing.md),
            ],
          ),
        );
      },
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
