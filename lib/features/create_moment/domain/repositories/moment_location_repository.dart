import 'package:dartz/dartz.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_moment/domain/models/moment_location_data.dart';

abstract class MomentLocationRepository {
  Future<Either<Failure, MomentLocationData>> getCurrentLocation();
}
