part of '../create_moment_screen.dart';

class _MoodSelectorSection extends StatelessWidget {
  const _MoodSelectorSection();

  static const _moods = [
    (
      emoji: '🌿',
      label: 'Bình yên',
      bgColorKey: 'moodCalmBackground',
      textColorKey: 'moodCalmText',
    ),
    (
      emoji: '😊',
      label: 'Vui vẻ',
      bgColorKey: 'moodWarmBackground',
      textColorKey: 'moodWarmText',
    ),
    (
      emoji: '🌙',
      label: 'Trầm lắng',
      bgColorKey: 'moodFocusedBackground',
      textColorKey: 'moodFocusedText',
    ),
    (
      emoji: '😮‍💨',
      label: 'Mệt mỏi',
      bgColorKey: 'moodFocusedBackground',
      textColorKey: 'moodFocusedText',
    ),
    (
      emoji: '✨',
      label: 'Biết ơn',
      bgColorKey: 'moodCalmBackground',
      textColorKey: 'moodCalmText',
    ),
  ];

  static const _moodColors = [
    Color(0xFFE6F1DF),
    Color(0xFFFFE2D8),
    Color(0xFFF4DFC7),
    Color(0xFFF5E8DF),
    Color(0xFFFFF0C8),
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
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.themeColors.textMuted,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.11,
            ),
          ),
        ),
        const Gap(AppSpacing.sm),
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
                bgColor: _moodColors[index],
                textColor: const Color(0xFF5F4A3E),
              );
            },
          ),
        ),
      ],
    );
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
        border: Border.all(color: const Color(0xFFB7D6AF), width: 1),
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
    );
  }
}
