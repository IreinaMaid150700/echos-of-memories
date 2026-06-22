part of '../search_screen.dart';

class _ResultsSection extends StatelessWidget {
  const _ResultsSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (a, b) => a.results != b.results,
      builder: (context, state) {
        final results = state.results;

        if (results.isLoading && !results.hasData) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.xxl),
            child: Center(child: CircularProgressIndicator.adaptive()),
          );
        }

        if (results.isFailure && !results.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
            child: Center(
              child: Text(
                results.error ?? 'Đã có lỗi xảy ra',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.themeColors.textSecondary,
                ),
              ),
            ),
          );
        }

        final moments = results.data ?? const [];
        if (results.isSuccess && moments.isEmpty) {
          return const _NoResultsCard();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const _Eyebrow('KẾT QUẢ'),
                const Gap(AppSpacing.xs),
                Text(
                  '· ${moments.length} khoảnh khắc',
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.themeColors.textMuted,
                  ),
                ),
              ],
            ),
            const Gap(AppSpacing.sm),
            for (final moment in moments) ...[
              _SearchResultCard(moment: moment),
              const Gap(AppSpacing.sm),
            ],
          ],
        );
      },
    );
  }
}

class _NoResultsCard extends StatelessWidget {
  const _NoResultsCard();

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.borderSubtle),
      ),
      child: Column(
        children: [
          SvgPicture.asset(Assets.icons.icNote, width: 32, height: 32),
          const Gap(AppSpacing.sm),
          Text(
            'Chưa có khoảnh khắc nào khớp',
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium?.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(AppSpacing.xxs),
          Text(
            'Thử một từ khoá khác, hoặc bỏ bộ lọc.',
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall?.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
