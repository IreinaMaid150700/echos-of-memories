import 'package:dartz/dartz.dart';
import 'package:music_app/core/error/failure.dart';

abstract class CollectionRepository {
  Future<Either<Failure, Unit>> createCollection({
    required String name,
    String? description,
    bool isPinned,
  });

  /// Sets the [isLocked] flag on a collection (app lock per-item gating).
  Future<Either<Failure, Unit>> updateLocked(String id, bool isLocked);
}
