part of 'timeline_cubit.dart';

@freezed
abstract class TimelineState with _$TimelineState {
  const factory TimelineState({
    @Default(Loaded<List<MomentSummary>>()) Loaded<List<MomentSummary>> moments,
  }) = _TimelineState;
}
