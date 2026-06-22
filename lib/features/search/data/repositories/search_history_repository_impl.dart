import 'package:injectable/injectable.dart';
import 'package:music_app/core/storage/preferences_service.dart';
import 'package:music_app/features/search/domain/repositories/search_history_repository.dart';

@LazySingleton(as: SearchHistoryRepository)
class SearchHistoryRepositoryImpl implements SearchHistoryRepository {
  final PreferencesService _prefs;

  SearchHistoryRepositoryImpl(this._prefs);

  @override
  List<String> getRecent() => _prefs.recentSearches;

  @override
  Future<void> add(String query) => _prefs.addRecentSearch(query);

  @override
  Future<void> clear() => _prefs.clearRecentSearches();
}
