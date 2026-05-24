import 'package:music_app/features/timeline/presentation/cubit/timeline_state.dart';

class TimelineCubit {
  TimelineCubit() : _state = const TimelineState();

  TimelineState _state;
  TimelineState get state => _state;

  void emit(TimelineState state) {
    _state = state;
  }
}