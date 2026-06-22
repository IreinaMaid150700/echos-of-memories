part of '../search_screen.dart';

class _SearchResultCard extends StatelessWidget {
  const _SearchResultCard({required this.moment});

  final MomentSummary moment;

  String get _title {
    if (moment.title != null && moment.title!.trim().isNotEmpty) {
      return moment.title!;
    }
    final note = moment.note;
    if (note != null && note.trim().isNotEmpty) {
      return note.substring(0, note.length.clamp(0, 50));
    }
    return 'Khoảnh khắc';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    final mood = moment.mood;
    final hasLocation = moment.latitude != null && moment.longitude != null;
    return GestureDetector(
      onTap: () => context.router.push(MomentDetailRoute(momentId: moment.id)),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: colors.borderSubtle),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (mood != null) ...[
                  _ResultMoodChip(mood: mood),
                  const Gap(AppSpacing.xs),
                ],
                SvgPicture.asset(
                  Assets.icons.icCalendar,
                  width: 13,
                  height: 13,
                ),
                const Gap(AppSpacing.xxs),
                Text(
                  moment.momentDate.toDateString(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: colors.textMuted,
                  ),
                ),
                if (hasLocation) ...[
                  const Gap(AppSpacing.xs),
                  SvgPicture.asset(Assets.icons.icMap, width: 13, height: 13),
                ],
              ],
            ),
            const Gap(AppSpacing.xs),
            Text(
              _title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: 14.5,
                fontWeight: FontWeight.w600,
                color: colors.textPrimary,
              ),
            ),
            if (moment.note != null && moment.note!.trim().isNotEmpty) ...[
              const Gap(AppSpacing.xxs),
              Text(
                moment.note!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall?.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ResultMoodChip extends StatelessWidget {
  const _ResultMoodChip({required this.mood});

  final MoodEntity mood;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    final bg = mood.colorHex.toColorOr(colors.tertiary);
    final fg = ThemeData.estimateBrightnessForColor(bg) == Brightness.dark
        ? Colors.white
        : const Color(0xFF2A211E);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        '${mood.emoji} ${mood.name}',
        style: context.textTheme.labelSmall?.copyWith(color: fg),
      ),
    );
  }
}
