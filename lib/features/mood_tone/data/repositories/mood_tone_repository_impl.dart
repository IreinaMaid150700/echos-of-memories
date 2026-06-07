import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/storage/app_database.dart';
import 'package:music_app/features/mood_tone/domain/models/mood_entity.dart';
import 'package:music_app/features/mood_tone/domain/models/tone_entity.dart';
import 'package:music_app/features/mood_tone/domain/repositories/mood_tone_repository.dart';

@LazySingleton(as: MoodToneRepository)
class MoodToneRepositoryImpl implements MoodToneRepository {
  final AppDatabase _db;

  MoodToneRepositoryImpl(this._db);

  @override
  Future<Either<Failure, List<MoodEntity>>> getMoods() async {
    try {
      final packs = await (_db.select(_db.momentMoodPacks)
            ..where((p) => p.isBuiltIn.equals(true) & p.isEnabled.equals(true)))
          .get();
      final packIds = packs.map((p) => p.id).toList();
      if (packIds.isEmpty) return const Right([]);

      final rows = await (_db.select(_db.momentMoods)
            ..where((m) =>
                m.moodPackId.isIn(packIds) & m.isArchived.equals(false)))
          .get();
      return Right(rows.map(_toMood).toList());
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to fetch moods: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ToneEntity>>> getTones() async {
    try {
      final packs = await (_db.select(_db.momentTonePacks)
            ..where((p) => p.isBuiltIn.equals(true) & p.isEnabled.equals(true)))
          .get();
      final packIds = packs.map((p) => p.id).toList();
      if (packIds.isEmpty) return const Right([]);

      final rows = await (_db.select(_db.momentTones)
            ..where((t) =>
                t.tonePackId.isIn(packIds) & t.isArchived.equals(false))
            ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
          .get();
      return Right(rows.map(_toTone).toList());
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to fetch tones: $e'));
    }
  }

  MoodEntity _toMood(MomentMood m) => MoodEntity(
        id: m.id,
        code: m.code,
        name: m.name,
        emoji: m.emoji,
        key: m.key,
        colorHex: m.colorHex,
      );

  ToneEntity _toTone(MomentTone t) => ToneEntity(
        id: t.id,
        code: t.code,
        name: t.name,
        key: t.key,
        lightColorHex: t.lightColorHex,
        darkColorHex: t.darkColorHex,
        sortOrder: t.sortOrder,
      );
}
