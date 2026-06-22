part of 'search_cubit.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    String? selectedMoodId,
    @Default(Loaded<List<MomentSummary>>()) Loaded<List<MomentSummary>> results,
    @Default(Loaded<List<MoodEntity>>()) Loaded<List<MoodEntity>> moods,
    @Default(Loaded<List<TagEntity>>()) Loaded<List<TagEntity>> suggestedTags,
    @Default(<String>[]) List<String> recentSearches,
  }) = _SearchState;
}
