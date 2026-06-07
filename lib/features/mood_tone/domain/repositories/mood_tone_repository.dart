import 'package:dartz/dartz.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/mood_tone/domain/models/mood_entity.dart';
import 'package:music_app/features/mood_tone/domain/models/tone_entity.dart';

/// Read-only access to the built-in mood & tone packs seeded at startup.
abstract class MoodToneRepository {
  /// Moods belonging to enabled built-in mood packs (non-archived).
  Future<Either<Failure, List<MoodEntity>>> getMoods();

  /// Tones belonging to enabled built-in tone packs (non-archived),
  /// ordered by `sortOrder`.
  Future<Either<Failure, List<ToneEntity>>> getTones();
}
