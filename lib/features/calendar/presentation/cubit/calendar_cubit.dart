import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/features/calendar/presentation/cubit/calendar_state.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarCubit extends BaseCubit<CalendarState> {
  CalendarCubit()
    : super(
        CalendarState(focusedDay: DateTime.now(), selectedDay: DateTime.now()),
      );

  void selectDay({DateTime? selectedDay, DateTime? focusedDay}) {
    emit(
      state.copyWith(
        selectedDay: selectedDay ?? state.selectedDay,
        focusedDay: focusedDay ?? state.focusedDay,
      ),
    );
  }

  void changeFormat(CalendarFormat format) {
    emit(state.copyWith(calendarFormat: format));
  }

  void changePage(DateTime focusedDay) {
    emit(state.copyWith(focusedDay: focusedDay));
  }

  void nextMonth() {
    final current = state.focusedDay ?? DateTime.now();
    final next = DateTime(current.year, current.month + 1, 1);
    emit(state.copyWith(focusedDay: next));
  }

  void previousMonth() {
    final current = state.focusedDay ?? DateTime.now();
    final prev = DateTime(current.year, current.month - 1, 1);
    emit(state.copyWith(focusedDay: prev));
  }

  void goToToday() {
    final now = DateTime.now();
    emit(state.copyWith(focusedDay: now, selectedDay: now));
  }

  void goToDate(DateTime date) {
    emit(state.copyWith(focusedDay: date));
  }
}
