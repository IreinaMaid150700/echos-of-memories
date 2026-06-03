import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/moment/domain/models/moment_entity.dart';
import 'package:music_app/features/moment/domain/repositories/moment_repository.dart';

@injectable
class GetMomentsUseCase {
  final MomentRepository _repository;

  GetMomentsUseCase(this._repository);

  Future<Either<Failure, List<MomentEntity>>> call() => _repository.getMoments();
}
