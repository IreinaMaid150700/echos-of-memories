import 'package:dartz/dartz.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/moment/domain/models/create_moment_params.dart';
import 'package:music_app/features/moment/domain/models/moment_detail_entity.dart';
import 'package:music_app/features/moment/domain/models/moment_summary.dart';
import 'package:music_app/features/search/domain/models/search_filters.dart';

abstract class MomentRepository {
  /// Stream for list screens — mood/tone/cover/tags already resolved.
  Stream<List<MomentSummary>> watchMomentSummaries();

  /// One-shot filtered query for the Search screen.
  Future<Either<Failure, List<MomentSummary>>> searchMoments(
    SearchFilters filters,
  );

  /// Full detail with assets for detail screen.
  Future<Either<Failure, MomentDetailEntity>> getMomentDetail(String id);

  Future<Either<Failure, MomentDetailEntity>> createMoment(CreateMomentParams params);
  Future<Either<Failure, Unit>> deleteMoment(String id);
  Future<Either<Failure, Unit>> updateMomentFlags(
    String id, {
    bool? isPinned,
    bool? isHiddenFromWidget,
    bool? isLocked,
  });
}
