part of '../screens/calendar_screen.dart';

class _DayMoodSection extends StatelessWidget {
  const _DayMoodSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      buildWhen: (previous, current) =>
          previous.selectedDay != current.selectedDay,
      builder: (context, state) {
        final selectedDay = state.selectedDay;
        if (selectedDay == null) {
          return const SizedBox.shrink();
        }

        final mockMoods = _getMockMoodsForDay(selectedDay);

        return Container(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.mood,
                    size: 16,
                    color: context.themeColors.textSecondary,
                  ),
                  const Gap(AppSpacing.xs),
                  Text(
                    'Tâm trạng hôm đó',
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.themeColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const Gap(AppSpacing.sm),
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: mockMoods
                    .map((mood) => _MoodChip(label: mood))
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  List<String> _getMockMoodsForDay(DateTime day) {
    final dayOfMonth = day.day;
    if (dayOfMonth % 7 == 0) return ['Bình yên 🌿', 'Nhẹ nhàng'];
    if (dayOfMonth % 5 == 0) return ['Vui vẻ 😊', 'Hào hứng', 'Tràn đầy'];
    if (dayOfMonth % 3 == 0) return ['Suy tư 🌙', 'Mê man'];
    return ['Bình thường'];
  }
}

class _MoodChip extends StatelessWidget {
  final String label;

  const _MoodChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: context.themeColors.moodCalmBackground,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          Text(
            label,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.themeColors.moodCalmText,
            ),
          ),
          Gap(AppSpacing.sm),
          Text('x1', style: context.textTheme.labelSmall),
        ],
      ),
    );
  }
}
