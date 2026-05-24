import 'package:dartz/dartz.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_moment/domain/models/tag_entity.dart';

abstract class TagRepository {
  Future<Either<Failure, List<TagEntity>>> getTags();
  Future<Either<Failure, TagEntity>> createTag(String name);
  Future<Either<Failure, Unit>> deleteTag(String id);
}