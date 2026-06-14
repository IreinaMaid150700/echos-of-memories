import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/core/utils/models/loaded.dart';
import 'package:music_app/features/calendar/presentation/cubit/calendar_state.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarCubit extends BaseCubit<CalendarState> {
  CalendarCubit()
    : super(
        CalendarState(
          focusedDay: DateTime.now(),
          selectedDay: DateTime.now(),
          momentsForSelectedDay: Loaded(),
        ),
      );

  List<_MomentData> _getMockMomentsForDay(DateTime day) {
    final dayOfMonth = day.day;
    return [
      _MomentData(
        time: '08:30',
        title: 'Buổi sáng yên bình',
        note: 'Ánh nắng ban mai透过窗帘, một tách cà phê nóng.',
        mood: 'Bình yên 🌿',
        location: 'Nhà',
        imageColor: '#E8D9C5',
      ),
      if (dayOfMonth % 2 == 0)
        _MomentData(
          time: '12:45',
          title: 'Giải lao trưa',
          note: 'Đi bộ một lát giữa buổi trưa. Không gian thật tĩnh lặng.',
          mood: 'Thư giãn',
          location: 'Công viên',
          imageColor: '#DCEBD5',
        ),
      if (dayOfMonth % 3 == 0)
        _MomentData(
          time: '18:30',
          title: 'Hoàng hôn',
          note: 'Ngắm hoàng hôn từ ban công. Màu trời thật đẹp.',
          mood: 'Nhẹ nhàng',
          location: 'Ban công',
          imageColor: '#F4C3B2',
        ),
    ];
  }

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

class _MomentData {
  final String time;
  final String title;
  final String note;
  final String mood;
  final String location;
  final String imageColor;

  const _MomentData({
    required this.time,
    required this.title,
    required this.note,
    required this.mood,
    required this.location,
    required this.imageColor,
  });
}
