part of '../search_screen.dart';

class _MoodFilterSection extends StatelessWidget {
  const _MoodFilterSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (a, b) =>
          a.moods != b.moods || a.selectedMoodId != b.selectedMoodId,
      builder: (context, state) {
        final moods = state.moods.data ?? const [];
        if (moods.isEmpty) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Eyebrow('LỌC THEO CẢM XÚC'),
              const Gap(AppSpacing.xs),
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: [
                  for (final mood in moods)
                    _MoodPill(
                      mood: mood,
                      selected: state.selectedMoodId == mood.id,
                      onTap: () =>
                          context.read<SearchCubit>().toggleMood(mood.id),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MoodPill extends StatelessWidget {
  const _MoodPill({
    required this.mood,
    required this.selected,
    required this.onTap,
  });

  final MoodEntity mood;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    final moodColor = mood.colorHex.toColorOr(colors.tertiary);
    final moodFg = ThemeData.estimateBrightnessForColor(moodColor) ==
            Brightness.dark
        ? Colors.white
        : const Color(0xFF2A211E);
    // Inactive: uniform pale surface + subtle border. Active: mood-colored.
    final bg = selected ? moodColor : colors.surface;
    final textColor = selected ? moodFg : colors.textSecondary;
    final borderColor =
        selected ? moodFg.withValues(alpha: 0.3) : colors.borderSubtle;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(AppRadius.full),
          border: Border.all(color: borderColor),
        ),
        child: Text(
          mood.name,
          style: context.textTheme.bodySmall?.copyWith(
            color: textColor,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _Eyebrow extends StatelessWidget {
  const _Eyebrow(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.labelSmall?.copyWith(
        color: context.themeColors.textMuted,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
