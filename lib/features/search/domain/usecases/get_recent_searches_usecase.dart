import 'package:injectable/injectable.dart';
import 'package:music_app/features/search/domain/repositories/search_history_repository.dart';

@injectable
class GetRecentSearchesUseCase {
  final SearchHistoryRepository _repository;

  GetRecentSearchesUseCase(this._repository);

  List<String> call() => _repository.getRecent();
}
