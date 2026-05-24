import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_state.freezed.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const factory CalendarState({
    DateTime? selectedDay,
    DateTime? focusedDay,
    @Default(CalendarFormat.month) CalendarFormat calendarFormat,
  }) = _CalendarState;
}