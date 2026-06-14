import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:music_app/features/moment/domain/models/moment_summary.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/core/utils/extensions/date_time_extension.dart';
import 'package:music_app/core/utils/extensions/screen_padding.dart';
import 'package:music_app/features/calendar/presentation/cubit/calendar_cubit.dart';
import 'package:music_app/features/calendar/presentation/cubit/calendar_state.dart';

part '../widgets/step_action_time_button.dart';
part '../widgets/calendar_widget.dart';
part '../widgets/day_mood_section.dart';

@RoutePage()
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _CalendarHeader(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      _CalendarWidget(),
                      _DayMoodSection(),
                      _CalendarEventsList(),
                    ],
                  ),
                ),
              ),

              const Divider(height: 1),
            ],
          ).paddingSymmetric(horizontal: AppSpacing.md),
        ),
      ),
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  const _CalendarHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: _CurrentTimeCalendarSelected(),
    );
  }
}

class _CalendarEventsList extends StatelessWidget {
  const _CalendarEventsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      buildWhen: (previous, current) =>
          previous.selectedDay != current.selectedDay,
      builder: (context, state) {
        final selectedDay = state.selectedDay;
        if (selectedDay == null) {
          return Center(
            child: Text(
              'Chọn một ngày để xem khoảnh khắc',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.themeColors.textMuted,
              ),
            ),
          );
        }

        final moments = state.momentsForSelectedDay.data ?? [];

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          itemCount: moments.length,
          separatorBuilder: (context, index) => const Gap(AppSpacing.sm),
          itemBuilder: (context, index) {
            return _MomentListItem(moment: moments[index]);
          },
        );
      },
    );
  }
}

class _MomentListItem extends StatelessWidget {
  final MomentSummary moment;

  const _MomentListItem({required this.moment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.themeColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: context.themeColors.borderSubtle),
      ),
      child: Row(
        children: [
          _MomentImage(colorHex: moment.tone?.id ?? ''),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    moment.title ?? '',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.themeColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(AppSpacing.xxs),
                  Text(
                    moment.note ?? '',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.themeColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(AppSpacing.xs),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xs,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: context.themeColors.moodCalmBackground,
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                        ),
                        child: Text(
                          moment.mood?.name ?? '',
                          style: context.textTheme.labelSmall?.copyWith(
                            color: context.themeColors.moodCalmText,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const Gap(AppSpacing.xs),
                      Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: context.themeColors.textMuted,
                      ),
                      const Gap(2),
                      Expanded(
                        child: Text(
                          '',
                          style: context.textTheme.labelSmall?.copyWith(
                            color: context.themeColors.textMuted,
                            fontSize: 10,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  moment.momentDate.toDateString(),
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.themeColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MomentImage extends StatelessWidget {
  final String colorHex;

  const _MomentImage({required this.colorHex});

  Color _parseColor(String hex) {
    final hexCode = hex.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: _parseColor(colorHex),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Icon(
        Icons.image_outlined,
        color: context.themeColors.textMuted,
        size: 32,
      ),
    );
  }
}

class _CurrentTimeCalendarSelected extends StatelessWidget {
  const _CurrentTimeCalendarSelected({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      buildWhen: (previous, current) {
        if (previous.focusedDay != current.focusedDay) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _StepActionTimeButton(isNext: false),
            Expanded(
              child: Column(
                children: [
                  Text(
                    state.focusedDay?.toVietnamese(
                          showDay: false,
                          showYear: false,
                        ) ??
                        '',
                    style: context.textTheme.titleLarge?.copyWith(
                      color: context.themeColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(AppSpacing.xs),
                  Text(
                    state.focusedDay?.year.toString() ?? '',
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.themeColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            _StepActionTimeButton(isNext: true),
          ],
        );
      },
    );
  }
}
