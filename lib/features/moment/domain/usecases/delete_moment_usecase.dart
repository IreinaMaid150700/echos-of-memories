import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/moment/domain/repositories/moment_repository.dart';

@injectable
class DeleteMomentUseCase {
  final MomentRepository _repository;

  DeleteMomentUseCase(this._repository);

  Future<Either<Failure, Unit>> call(String id) => _repository.deleteMoment(id);
}
