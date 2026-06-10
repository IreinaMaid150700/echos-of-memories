import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_moment/domain/repositories/tag_repository.dart';

@injectable
class DeleteTagUseCase {
  final TagRepository _repository;

  DeleteTagUseCase(this._repository);

  Future<Either<Failure, Unit>> call(String id) => _repository.deleteTag(id);
}
