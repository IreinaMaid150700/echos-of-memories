part of '../create_moment_screen.dart';

class _MoodSelectorSection extends StatelessWidget {
  const _MoodSelectorSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Text(
            'Tâm trạng',
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.themeColors.textMuted,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.11,
            ),
          ),
        ),
        const Gap(AppSpacing.sm),
        BlocBuilder<CreateMomentCubit, CreateMomentState>(
          buildWhen: (p, c) =>
              p.moods != c.moods || p.moodIdSelected != c.moodIdSelected,
          builder: (context, state) {
            final moods = state.moods.data ?? const <MoodEntity>[];
            if (state.moods.isLoading && moods.isEmpty) {
              return const SizedBox(
                height: 44,
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              );
            }
            if (moods.isEmpty) return const SizedBox.shrink();
            return SizedBox(
              height: 44,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                itemCount: moods.length,
                separatorBuilder: (_, __) => const Gap(AppSpacing.xs),
                itemBuilder: (context, index) {
                  final mood = moods[index];
                  final bg = mood.colorHex.toColorOr(
                    context.themeColors.tertiary,
                  );
                  final fg =
                      ThemeData.estimateBrightnessForColor(bg) ==
                          Brightness.dark
                      ? Colors.white
                      : const Color(0xFF2A211E);
                  return _MoodChip(
                    emoji: mood.emoji,
                    label: mood.name,
                    semanticLabel: 'Tâm trạng: ${mood.name}',
                    bgColor: bg,
                    textColor: fg,
                    selected: state.moodIdSelected == mood.id,
                    onTap: () =>
                        context.read<CreateMomentCubit>().selectMood(mood.id),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class _MoodChip extends StatelessWidget {
  final String emoji;
  final String label;
  final String semanticLabel;
  final Color bgColor;
  final Color textColor;
  final bool selected;
  final VoidCallback onTap;

  const _MoodChip({
    required this.emoji,
    required this.label,
    required this.semanticLabel,
    required this.bgColor,
    required this.textColor,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      button: true,
      selected: selected,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(AppRadius.full),
            border: Border.all(
              color: selected
                  ? context.themeColors.primary
                  : textColor.withValues(alpha: 0.15),
              width: selected ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 14)),
              const Gap(AppSpacing.xxs),
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
