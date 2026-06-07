import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/mood_tone/domain/models/mood_entity.dart';
import 'package:music_app/features/mood_tone/domain/repositories/mood_tone_repository.dart';

@injectable
class GetMoodsUseCase {
  final MoodToneRepository _repository;

  GetMoodsUseCase(this._repository);

  Future<Either<Failure, List<MoodEntity>>> call() => _repository.getMoods();
}
