import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_moment/domain/models/tag_entity.dart';
import 'package:music_app/features/create_moment/domain/repositories/tag_repository.dart';

@injectable
class GetTagsUseCase {
  final TagRepository _repository;

  GetTagsUseCase(this._repository);

  Future<Either<Failure, List<TagEntity>>> call() => _repository.getTags();
}