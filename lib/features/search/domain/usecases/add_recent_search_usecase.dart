import 'package:injectable/injectable.dart';
import 'package:music_app/features/search/domain/repositories/search_history_repository.dart';

@injectable
class AddRecentSearchUseCase {
  final SearchHistoryRepository _repository;

  AddRecentSearchUseCase(this._repository);

  Future<void> call(String query) => _repository.add(query);
}
