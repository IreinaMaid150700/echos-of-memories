/// Abstract store for recent search terms (local, on-device).
abstract class SearchHistoryRepository {
  /// Most-recent-first list of past search terms.
  List<String> getRecent();

  /// Persist a search term (dedup + move-to-top + cap).
  Future<void> add(String query);

  /// Clear all recent searches.
  Future<void> clear();
}
