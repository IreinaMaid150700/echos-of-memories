import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/storage/app_database.dart';
import 'package:music_app/features/moment/domain/models/tag_entity.dart';
import 'package:music_app/features/create_moment/domain/repositories/tag_repository.dart';

@LazySingleton(as: TagRepository)
class TagRepositoryImpl implements TagRepository {
  final AppDatabase _db;

  TagRepositoryImpl(this._db);

  @override
  Future<Either<Failure, List<TagEntity>>> getTags() async {
    try {
      final results = await (_db.select(_db.momentTags)
            ..where((t) => t.deletedAt.isNull()))
          .get();
      return Right(results.map(_toEntity).toList());
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to fetch tags: $e'));
    }
  }

  @override
  Future<Either<Failure, TagEntity>> createTag(String name) async {
    try {
      final now = DateTime.now();
      final normalizedName = name.trim().toLowerCase().replaceAll('#', '');

      final existing =
          await (_db.select(_db.momentTags)
                ..where(
                  (t) =>
                      t.normalizedName.equals(normalizedName) &
                      t.deletedAt.isNull(),
                ))
              .getSingleOrNull();

      if (existing != null) {
        return Right(_toEntity(existing));
      }

      final id = const Uuid().v4();
      await _db
          .into(_db.momentTags)
          .insert(
            MomentTagsCompanion.insert(
              id: id,
              name: normalizedName,
              normalizedName: normalizedName,
              createdAt: now,
              updatedAt: now,
            ),
          );

      final created = await (_db.select(
        _db.momentTags,
      )..where((t) => t.id.equals(id))).getSingle();
      return Right(_toEntity(created));
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to create tag: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTag(String id) async {
    try {
      await (_db.update(_db.momentTags)..where((t) => t.id.equals(id))).write(
        MomentTagsCompanion(deletedAt: Value(DateTime.now())),
      );
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to delete tag: $e'));
    }
  }

  TagEntity _toEntity(MomentTag tag) {
    return TagEntity(
      id: tag.id,
      name: tag.name,
      normalizedName: tag.normalizedName,
      colorHex: tag.colorHex,
      groupKey: tag.groupKey,
      usageCount: tag.usageCount,
    );
  }
}
