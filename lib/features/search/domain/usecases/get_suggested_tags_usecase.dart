import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_moment/domain/repositories/tag_repository.dart';
import 'package:music_app/features/moment/domain/models/tag_entity.dart';

@injectable
class GetSuggestedTagsUseCase {
  final TagRepository _repository;

  GetSuggestedTagsUseCase(this._repository);

  Future<Either<Failure, List<TagEntity>>> call() => _repository.getTags();
}
