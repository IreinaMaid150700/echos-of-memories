import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_moment/domain/models/moment_location_data.dart';
import 'package:music_app/features/create_moment/domain/repositories/moment_location_repository.dart';

@injectable
class GetCurrentMomentLocationUseCase {
  final MomentLocationRepository _repository;

  GetCurrentMomentLocationUseCase(this._repository);

  Future<Either<Failure, MomentLocationData>> call() =>
      _repository.getCurrentLocation();
}
