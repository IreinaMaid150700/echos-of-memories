part of '../create_collection_screen.dart';

class _MoodSection extends StatelessWidget {
  const _MoodSection();

  static const _moods = [
    (emoji: '🌿', label: 'Bình yên', key: 'calm'),
    (emoji: '😊', label: 'Vui vẻ', key: 'warm'),
    (emoji: '🌙', label: 'Trầm lắng', key: 'focused'),
    (emoji: '✨', label: 'Biết ơn', key: 'peaceful'),
    (emoji: '💭', label: 'Tự sự', key: 'focused'),
    (emoji: '🤍', label: 'Dịu dàng', key: 'calm'),
  ];

  static (Color, Color) _palette(AppCustomColors c, String key) {
    switch (key) {
      case 'calm':
        return (c.moodCalmBackground, c.moodCalmText);
      case 'warm':
        return (c.moodWarmBackground, c.moodWarmText);
      case 'focused':
        return (c.moodFocusedBackground, c.moodFocusedText);
      default:
        return (c.moodPeacefulBackground, c.moodPeacefulText);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Cảm xúc chủ đạo (tuỳ chọn)'),
        const Gap(AppSpacing.sm),
        BlocSelector<CreateCollectionCubit, CreateCollectionState, int>(
          selector: (state) => state.moodIndex,
          builder: (context, moodIndex) {
            return Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: List.generate(_moods.length, (index) {
                final mood = _moods[index];
                final active = moodIndex == index;
                final (bg, fg) = _palette(colors, mood.key);
                return GestureDetector(
                  onTap: () =>
                      context.read<CreateCollectionCubit>().toggleMood(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: active ? bg : colors.surface,
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      border: Border.all(
                        color: active
                            ? fg.withValues(alpha: 0.3)
                            : colors.borderSubtle,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(mood.emoji, style: const TextStyle(fontSize: 14)),
                        const Gap(AppSpacing.xxs),
                        Text(
                          mood.label,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: active ? fg : colors.textSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}
