import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:music_app/core/error/failure.dart';

abstract class ImagePickerGateway {
  Future<Either<Failure, List<File>>> pickMultiImage();
}
