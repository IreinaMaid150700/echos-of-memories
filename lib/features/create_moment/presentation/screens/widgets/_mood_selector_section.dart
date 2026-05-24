part of '../create_moment_screen.dart';

class _MoodSelectorSection extends StatelessWidget {
  const _MoodSelectorSection();

  static const _moods = [
    (emoji: '🌿', label: 'Bình yên', bgColorKey: 'moodCalmBackground', textColorKey: 'moodCalmText'),
    (emoji: '😊', label: 'Vui vẻ', bgColorKey: 'moodWarmBackground', textColorKey: 'moodWarmText'),
    (emoji: '🌙', label: 'Trầm lắng', bgColorKey: 'moodFocusedBackground', textColorKey: 'moodFocusedText'),
    (emoji: '😮‍💨', label: 'Mệt mỏi', bgColorKey: 'moodFocusedBackground', textColorKey: 'moodFocusedText'),
    (emoji: '✨', label: 'Biết ơn', bgColorKey: 'moodCalmBackground', textColorKey: 'moodCalmText'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Text(
            'Tâm trạng',
            style: context.textTheme.labelMedium?.copyWith(
              color: context.themeColors.textMuted,
            ),
          ),
        ),
        const Gap(AppSpacing.xs),
        SizedBox(
          height: 44,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            itemCount: _moods.length,
            separatorBuilder: (_, __) => const Gap(AppSpacing.xs),
            itemBuilder: (context, index) {
              final mood = _moods[index];
              return _MoodChip(
                emoji: mood.emoji,
                label: mood.label,
                bgColor: _getColor(context, mood.bgColorKey),
                textColor: _getColor(context, mood.textColorKey),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getColor(BuildContext context, String key) {
    switch (key) {
      case 'moodCalmBackground': return context.themeColors.moodCalmBackground;
      case 'moodWarmBackground': return context.themeColors.moodWarmBackground;
      case 'moodFocusedBackground': return context.themeColors.moodFocusedBackground;
      case 'moodPeacefulBackground': return context.themeColors.moodPeacefulBackground;
      case 'moodCalmText': return context.themeColors.moodCalmText;
      case 'moodWarmText': return context.themeColors.moodWarmText;
      case 'moodFocusedText': return context.themeColors.moodFocusedText;
      case 'moodPeacefulText': return context.themeColors.moodPeacefulText;
      default: return context.themeColors.moodCalmBackground;
    }
  }
}

class _MoodChip extends StatelessWidget {
  final String emoji;
  final String label;
  final Color bgColor;
  final Color textColor;

  const _MoodChip({
    required this.emoji,
    required this.label,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 14)),
          const Gap(AppSpacing.xxs),
          Text(
            label,
            style: context.textTheme.labelMedium?.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}