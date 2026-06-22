part of '../search_screen.dart';

class _EmptyStateSection extends StatelessWidget {
  const _EmptyStateSection({required this.onTermTap});

  final void Function(String value) onTermTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (a, b) =>
          a.recentSearches != b.recentSearches ||
          a.suggestedTags != b.suggestedTags,
      builder: (context, state) {
        final recent = state.recentSearches;
        final tags = state.suggestedTags.data ?? const [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (recent.isNotEmpty) ...[
              const _Eyebrow('GẦN ĐÂY'),
              const Gap(AppSpacing.xs),
              _RecentList(recent: recent, onTap: onTermTap),
              const Gap(AppSpacing.lg),
            ],
            if (tags.isNotEmpty) ...[
              const _Eyebrow('THẺ GỢI Ý'),
              const Gap(AppSpacing.xs),
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: [
                  for (final tag in tags)
                    _SuggestedTagPill(
                      label: tag.name,
                      onTap: () => onTermTap('#${tag.name}'),
                    ),
                ],
              ),
              const Gap(AppSpacing.lg),
            ],
            const _Eyebrow('KHÁM PHÁ'),
            const Gap(AppSpacing.xs),
            const _DiscoveryGrid(),
          ],
        );
      },
    );
  }
}

class _RecentList extends StatelessWidget {
  const _RecentList({required this.recent, required this.onTap});

  final List<String> recent;
  final void Function(String value) onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return Column(
      children: [
        for (var i = 0; i < recent.length; i++) ...[
          GestureDetector(
            onTap: () => onTap(recent[i]),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.icSearch,
                    width: 16,
                    height: 16,
                  ),
                  const Gap(AppSpacing.xs),
                  Expanded(
                    child: Text(
                      recent[i],
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: colors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (i != recent.length - 1)
            Divider(
              height: 1,
              color: colors.borderSubtle.withValues(alpha: 0.4),
            ),
        ],
      ],
    );
  }
}

class _SuggestedTagPill extends StatelessWidget {
  const _SuggestedTagPill({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: colors.tagChipBackground,
          borderRadius: BorderRadius.circular(AppRadius.full),
          border: Border.all(color: colors.borderSubtle),
        ),
        child: Text(
          '#$label',
          style: context.textTheme.bodySmall?.copyWith(
            color: colors.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _DiscoveryGrid extends StatelessWidget {
  const _DiscoveryGrid();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _DiscoveryCard(
            icon: Assets.icons.icCalendar,
            label: 'Theo ngày',
            onTap: () => context.router.push(const CalendarRoute()),
          ),
        ),
        const Gap(AppSpacing.sm),
        Expanded(
          child: _DiscoveryCard(
            icon: Assets.icons.icMap,
            label: 'Theo nơi chốn',
            onTap: () => context.router.push(const MapRoute()),
          ),
        ),
      ],
    );
  }
}

class _DiscoveryCard extends StatelessWidget {
  const _DiscoveryCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final String icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: colors.borderSubtle),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              icon,
              width: 22,
              height: 22,
              colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
            ),
            const Gap(AppSpacing.sm),
            Text(
              label,
              style: context.textTheme.bodyMedium?.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
