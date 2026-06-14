import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_moment/domain/repositories/moment_asset_repository.dart';
import 'package:music_app/features/moment/domain/models/moment_asset_input.dart';

@injectable
class PersistMomentAssetsUseCase {
  final MomentAssetRepository _repository;

  PersistMomentAssetsUseCase(this._repository);

  Future<Either<Failure, List<MomentAssetInput>>> call(List<File> files) =>
      _repository.persist(files);
}
