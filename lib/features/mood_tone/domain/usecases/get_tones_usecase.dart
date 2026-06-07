import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/mood_tone/domain/models/tone_entity.dart';
import 'package:music_app/features/mood_tone/domain/repositories/mood_tone_repository.dart';

@injectable
class GetTonesUseCase {
  final MoodToneRepository _repository;

  GetTonesUseCase(this._repository);

  Future<Either<Failure, List<ToneEntity>>> call() => _repository.getTones();
}
