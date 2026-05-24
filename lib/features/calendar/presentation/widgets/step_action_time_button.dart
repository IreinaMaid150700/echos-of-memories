part of '../screens/calendar_screen.dart';

class _StepActionTimeButton extends StatelessWidget {
  final bool isNext;

  const _StepActionTimeButton({required this.isNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: context.themeColors.tertiary,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppRadius.md),
          onTap: () {
            final cubit = context.read<CalendarCubit>();
            if (isNext) {
              cubit.nextMonth();
            } else {
              cubit.previousMonth();
            }
          },
          child: Icon(
            isNext ? Icons.chevron_right : Icons.chevron_left,
            color: context.themeColors.textSecondary,
            size: 24,
          ),
        ),
      ),
    );
  }
}
