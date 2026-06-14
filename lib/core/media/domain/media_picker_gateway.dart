import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/media/domain/media_type.dart';

abstract class MediaPickerGateway {
  Future<Either<Failure, List<File>>> pickMultiple(MediaType type);
}
