import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/core/utils/models/loaded.dart';
import 'package:music_app/features/moment/domain/models/moment_summary.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_state.freezed.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const factory CalendarState({
    DateTime? selectedDay,
    DateTime? focusedDay,
    @Default(Loaded<List<MomentSummary>>())
    Loaded<List<MomentSummary>> momentsForSelectedDay,
    @Default(CalendarFormat.month) CalendarFormat calendarFormat,
  }) = _CalendarState;
}
