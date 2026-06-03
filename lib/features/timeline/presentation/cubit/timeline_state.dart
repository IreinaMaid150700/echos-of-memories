part of 'timeline_cubit.dart';

@freezed
abstract class TimelineState with _$TimelineState {
  const factory TimelineState({
    @Default(Loaded<List<MomentEntity>>()) Loaded<List<MomentEntity>> moments,
  }) = _TimelineState;
}
