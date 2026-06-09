import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/media/domain/image_picker_gateway.dart';

@injectable
class PickMomentImagesUseCase {
  final ImagePickerGateway _imagePickerGateway;

  PickMomentImagesUseCase(this._imagePickerGateway);

  Future<Either<Failure, List<File>>> call(List<File> existing) async {
    final result = await _imagePickerGateway.pickMultiImage();
    return result.map((picked) {
      final existingPaths = existing.map((f) => f.path).toSet();
      return picked.where((f) => existingPaths.add(f.path)).toList();
    });
  }
}
