import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/moment/domain/models/tag_entity.dart';
import 'package:music_app/features/create_moment/domain/repositories/tag_repository.dart';

@injectable
class CreateTagUseCase {
  final TagRepository _repository;

  CreateTagUseCase(this._repository);

  Future<Either<Failure, TagEntity>> call(String name) =>
      _repository.createTag(name);
}
