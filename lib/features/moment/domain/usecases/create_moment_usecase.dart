import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/moment/domain/models/create_moment_params.dart';
import 'package:music_app/features/moment/domain/models/moment_detail_entity.dart';
import 'package:music_app/features/moment/domain/repositories/moment_repository.dart';

@injectable
class CreateMomentUseCase {
  final MomentRepository _repository;

  CreateMomentUseCase(this._repository);

  Future<Either<Failure, MomentDetailEntity>> call(CreateMomentParams params) =>
      _repository.createMoment(params);
}
