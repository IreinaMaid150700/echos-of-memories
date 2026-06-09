import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/moment/domain/models/moment_asset_input.dart';

abstract class MomentAssetRepository {
  Future<Either<Failure, List<MomentAssetInput>>> persist(List<File> files);

  Future<void> cleanup(List<MomentAssetInput> assets);
}
