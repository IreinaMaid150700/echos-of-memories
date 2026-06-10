import 'package:injectable/injectable.dart';
import 'package:music_app/features/moment/domain/models/moment_summary.dart';
import 'package:music_app/features/moment/domain/repositories/moment_repository.dart';

@injectable
class WatchMomentsUseCase {
  final MomentRepository _repository;
  WatchMomentsUseCase(this._repository);

  Stream<List<MomentSummary>> call() => _repository.watchMomentSummaries();
}
