import 'package:equatable/equatable.dart';
import 'package:music_app/features/moment/domain/models/tag_entity.dart';
import 'package:music_app/features/mood_tone/domain/models/mood_entity.dart';
import 'package:music_app/features/mood_tone/domain/models/tone_entity.dart';

/// Read model for list screens (timeline / map / calendar).
/// All relations resolved — no raw foreign key IDs.
class MomentSummary extends Equatable {
  final String id;
  final String? title;
  final String? note;
  final DateTime momentDate;
  final String? coverAssetPath;
  final String? coverThumbnailPath;
  final List<TagEntity> tags;
  final MoodEntity? mood;
  final ToneEntity? tone;
  final bool isPinned;
  final bool isFavorite;
  final bool isLocked;
  final double? latitude;
  final double? longitude;

  const MomentSummary({
    required this.id,
    this.title,
    this.note,
    required this.momentDate,
    this.coverAssetPath,
    this.coverThumbnailPath,
    this.tags = const [],
    this.mood,
    this.tone,
    this.isPinned = false,
    this.isFavorite = false,
    this.isLocked = false,
    this.latitude,
    this.longitude,
  });

  @override
  List<Object?> get props => [
    id, title, note, momentDate, coverAssetPath, coverThumbnailPath,
    tags, mood, tone, isPinned, isFavorite, isLocked, latitude, longitude,
  ];
}
