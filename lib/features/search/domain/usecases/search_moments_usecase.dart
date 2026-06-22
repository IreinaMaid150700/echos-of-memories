import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/moment/domain/models/moment_summary.dart';
import 'package:music_app/features/moment/domain/repositories/moment_repository.dart';
import 'package:music_app/features/search/domain/models/search_filters.dart';

@injectable
class SearchMomentsUseCase {
  final MomentRepository _repository;

  SearchMomentsUseCase(this._repository);

  Future<Either<Failure, List<MomentSummary>>> call(SearchFilters filters) =>
      _repository.searchMoments(filters);
}
