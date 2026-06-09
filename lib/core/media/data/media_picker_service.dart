import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/media/domain/media_picker_gateway.dart';
import 'package:music_app/core/media/domain/media_type.dart';

@LazySingleton(as: MediaPickerGateway)
class MediaPickerService implements MediaPickerGateway {
  final ImagePicker _picker;

  MediaPickerService(this._picker);

  @override
  Future<Either<Failure, List<File>>> pickMultiple(MediaType type) async {
    try {
      switch (type) {
        case MediaType.image:
          final picked = await _picker.pickMultiImage();
          return Right(picked.map((x) => File(x.path)).toList());
        case MediaType.video:
          final picked = await _picker.pickVideo(source: ImageSource.gallery);
          return Right(picked == null ? <File>[] : [File(picked.path)]);
      }
    } catch (_) {
      return const Left(
        UnknownFailure(
          message: 'Không thể mở thư viện. Kiểm tra quyền và thử lại.',
        ),
      );
    }
  }
}
