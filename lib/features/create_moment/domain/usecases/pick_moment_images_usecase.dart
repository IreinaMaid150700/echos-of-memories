import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/media/domain/media_picker_gateway.dart';
import 'package:music_app/core/media/domain/media_type.dart';

@injectable
class PickMomentImagesUseCase {
  final MediaPickerGateway _mediaPickerGateway;

  PickMomentImagesUseCase(this._mediaPickerGateway);

  Future<Either<Failure, List<File>>> call(List<File> existing) async {
    final result = await _mediaPickerGateway.pickMultiple(MediaType.image);
    return result.map((picked) {
      final existingPaths = existing.map((f) => f.path).toSet();
      return picked.where((f) => existingPaths.add(f.path)).toList();
    });
  }
}
