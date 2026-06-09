import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/media/domain/image_picker_gateway.dart';

@LazySingleton(as: ImagePickerGateway)
class ImagePickerService implements ImagePickerGateway {
  final ImagePicker _picker;

  ImagePickerService(this._picker);

  @override
  Future<Either<Failure, List<File>>> pickMultiImage() async {
    try {
      final picked = await _picker.pickMultiImage();
      return Right(picked.map((x) => File(x.path)).toList());
    } catch (_) {
      return const Left(
        UnknownFailure(
          message: 'Không thể mở thư viện ảnh. Kiểm tra quyền và thử lại.',
        ),
      );
    }
  }
}
