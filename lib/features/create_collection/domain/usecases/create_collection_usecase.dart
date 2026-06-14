import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_collection/domain/repositories/collection_repository.dart';

@injectable
class CreateCollectionUsecase {
  final CollectionRepository _repository;

  CreateCollectionUsecase(this._repository);

  Future<Either<Failure, Unit>> call({
    required String name,
    String? description,
    bool isPinned = false,
  }) => _repository.createCollection(
    name: name,
    description: description,
    isPinned: isPinned,
  );
}
