import 'package:dartz/dartz.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/moment/domain/models/create_moment_params.dart';
import 'package:music_app/features/moment/domain/models/moment_entity.dart';

abstract class MomentRepository {
  Future<Either<Failure, List<MomentEntity>>> getMoments();
  Future<Either<Failure, MomentEntity>> getMomentById(String id);
  Future<Either<Failure, MomentEntity>> createMoment(CreateMomentParams params);
  Future<Either<Failure, Unit>> deleteMoment(String id);
  Future<Either<Failure, Unit>> updateMomentFlags(
    String id, {
    bool? isPinned,
    bool? isHiddenFromWidget,
  });
}
