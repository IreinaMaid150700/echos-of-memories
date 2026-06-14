import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/storage/app_database.dart';
import 'package:music_app/features/create_collection/domain/repositories/collection_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: CollectionRepository)
class CollectionRepositoryImpl implements CollectionRepository {
  final AppDatabase _db;
  CollectionRepositoryImpl(this._db);

  @override
  Future<Either<Failure, Unit>> createCollection({
    required String name,
    String? description,
    bool isPinned = false,
  }) async {
    try {
      final now = DateTime.now();
      // TODO: privacy (isPrivate) & mood are not persisted yet — the
      // MomentCollections table has no columns for them.
      await _db
          .into(_db.momentCollections)
          .insert(
            MomentCollectionsCompanion.insert(
              id: const Uuid().v4(),
              name: name,
              description: description != null
                  ? Value(description)
                  : const Value.absent(),
              isPinned: Value(isPinned),
              createdAt: now,
              updatedAt: now,
            ),
          );
      return const Right(unit);
    } on Exception catch (e, s) {
      log('createCollection failed', error: e, stackTrace: s);
      return const Left(CacheFailure(message: 'Không lưu được album'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateLocked(String id, bool isLocked) async {
    try {
      await (_db.update(_db.momentCollections)..where((t) => t.id.equals(id)))
          .write(
            MomentCollectionsCompanion(
              isLocked: Value(isLocked),
              updatedAt: Value(DateTime.now()),
            ),
          );
      return const Right(unit);
    } on Exception catch (e, s) {
      log('updateLocked failed', error: e, stackTrace: s);
      return const Left(CacheFailure(message: 'Không cập nhật được album'));
    }
  }
}
