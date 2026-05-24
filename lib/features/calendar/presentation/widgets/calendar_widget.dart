part of '../screens/calendar_screen.dart';

class _CalendarWidget extends StatelessWidget {
  const _CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      buildWhen: (previous, current) {
        if (previous.focusedDay != current.focusedDay) {
          return true;
        }
        if (previous.calendarFormat != current.calendarFormat) {
          return true;
        }
        if (previous.selectedDay != current.focusedDay) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(AppSpacing.xs),
          decoration: BoxDecoration(
            color: context.themeColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.xl),
            border: Border.all(color: context.themeColors.borderSubtle),
          ),
          child: TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: state.focusedDay ?? DateTime.now(),
            calendarFormat: state.calendarFormat,
            headerVisible: false,
            selectedDayPredicate: (day) => isSameDay(state.selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              context.read<CalendarCubit>().selectDay(
                selectedDay: selectedDay,
                focusedDay: focusedDay,
              );
            },
            onFormatChanged: (format) {
              context.read<CalendarCubit>().changeFormat(format);
            },
            onPageChanged: (focusedDay) {
              context.read<CalendarCubit>().selectDay(focusedDay: focusedDay);
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: context.themeColors.tertiary,
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(
                color: context.themeColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
              selectedDecoration: BoxDecoration(
                color: context.themeColors.primary,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(
                color: context.themeColors.surfaceLowest,
                fontWeight: FontWeight.w600,
              ),
              defaultTextStyle: TextStyle(
                color: context.themeColors.textPrimary,
              ),
              weekendTextStyle: TextStyle(
                color: context.themeColors.textSecondary,
              ),
              outsideTextStyle: TextStyle(color: context.themeColors.textMuted),
              markerDecoration: BoxDecoration(
                color: context.themeColors.secondary,
                shape: BoxShape.circle,
              ),
              markersMaxCount: 3,
              markerSize: 6,
              markerMargin: const EdgeInsets.symmetric(horizontal: 1),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonDecoration: BoxDecoration(
                color: context.themeColors.tertiary,
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              formatButtonTextStyle: TextStyle(
                color: context.themeColors.textSecondary,
                fontSize: 12,
              ),
              titleTextStyle: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: context.themeColors.textPrimary,
              ),
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: context.themeColors.textSecondary,
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: context.themeColors.textSecondary,
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                fontFamily: 'JetBrains Mono',
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: context.themeColors.textMuted,
              ),
              weekendStyle: TextStyle(
                fontFamily: 'JetBrains Mono',
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: context.themeColors.textMuted,
              ),
            ),
            eventLoader: (day) {
              return [];
            },
          ),
        );
      },
    );
  }
}
