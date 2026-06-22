import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/core/utils/models/loaded.dart';
import 'package:music_app/features/moment/domain/models/moment_summary.dart';
import 'package:music_app/features/moment/domain/models/tag_entity.dart';
import 'package:music_app/features/mood_tone/domain/models/mood_entity.dart';
import 'package:music_app/features/mood_tone/domain/usecases/get_moods_usecase.dart';
import 'package:music_app/features/search/domain/models/search_filters.dart';
import 'package:music_app/features/search/domain/usecases/add_recent_search_usecase.dart';
import 'package:music_app/features/search/domain/usecases/get_recent_searches_usecase.dart';
import 'package:music_app/features/search/domain/usecases/get_suggested_tags_usecase.dart';
import 'package:music_app/features/search/domain/usecases/search_moments_usecase.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends BaseCubit<SearchState> {
  final SearchMomentsUseCase _searchMoments;
  final GetSuggestedTagsUseCase _getSuggestedTags;
  final GetRecentSearchesUseCase _getRecentSearches;
  final AddRecentSearchUseCase _addRecentSearch;
  final GetMoodsUseCase _getMoods;
  Timer? _debounce;

  SearchCubit({
    required SearchMomentsUseCase searchMomentsUseCase,
    required GetSuggestedTagsUseCase getSuggestedTagsUseCase,
    required GetRecentSearchesUseCase getRecentSearchesUseCase,
    required AddRecentSearchUseCase addRecentSearchUseCase,
    required GetMoodsUseCase getMoodsUseCase,
  }) : _searchMoments = searchMomentsUseCase,
       _getSuggestedTags = getSuggestedTagsUseCase,
       _getRecentSearches = getRecentSearchesUseCase,
       _addRecentSearch = addRecentSearchUseCase,
       _getMoods = getMoodsUseCase,
       super(const SearchState());

  Future<void> init() async {
    _loadRecent();
    await Future.wait([_loadMoods(), _loadSuggestedTags()]);
  }

  Future<void> _loadMoods() => execute(
    loadingState: state.copyWith(moods: state.moods.toLoading()),
    action: () => _getMoods(),
    onSuccess: (list) => state.copyWith(moods: state.moods.toSuccess(list)),
    onFailure: (f) => state.copyWith(moods: state.moods.toFailure(f.message)),
  );

  Future<void> _loadSuggestedTags() => execute(
    loadingState: state.copyWith(
      suggestedTags: state.suggestedTags.toLoading(),
    ),
    action: () => _getSuggestedTags(),
    onSuccess: (list) =>
        state.copyWith(suggestedTags: state.suggestedTags.toSuccess(list)),
    onFailure: (f) =>
        state.copyWith(suggestedTags: state.suggestedTags.toFailure(f.message)),
  );

  void _loadRecent() {
    emit(state.copyWith(recentSearches: _getRecentSearches()));
  }

  void onQueryChanged(String value) {
    emit(state.copyWith(query: value));
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), searchNow);
  }

  /// Sets the query immediately (recent / tag tap) and runs the search now.
  Future<void> submitQuery(String value) {
    _debounce?.cancel();
    emit(state.copyWith(query: value));
    return searchNow();
  }

  Future<void> toggleMood(String moodId) {
    final next = state.selectedMoodId == moodId ? null : moodId;
    emit(state.copyWith(selectedMoodId: next));
    return searchNow();
  }

  void clearQuery() {
    _debounce?.cancel();
    emit(
      state.copyWith(query: '', results: const Loaded<List<MomentSummary>>()),
    );
  }

  /// Runs the search immediately (no debounce). Exposed for the UI and tests.
  Future<void> searchNow() async {
    if (!hasActiveQuery) {
      emit(state.copyWith(results: const Loaded<List<MomentSummary>>()));
      return;
    }
    final q = state.query.trim();
    await execute(
      loadingState: state.copyWith(results: state.results.toLoading()),
      action: () =>
          _searchMoments(SearchFilters(text: q, moodId: state.selectedMoodId)),
      onSuccess: (list) {
        if (q.isNotEmpty) {
          unawaited(_addRecentSearch(q).then((_) => _loadRecent()));
        }
        return state.copyWith(results: state.results.toSuccess(list));
      },
      onFailure: (f) =>
          state.copyWith(results: state.results.toFailure(f.message)),
    );
  }

  bool get hasActiveQuery =>
      state.query.trim().isNotEmpty || state.selectedMoodId != null;

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
