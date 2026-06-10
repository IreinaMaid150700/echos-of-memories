import 'package:equatable/equatable.dart';
import 'package:music_app/features/moment/domain/models/moment_asset_entity.dart';
import 'package:music_app/features/moment/domain/models/tag_entity.dart';
import 'package:music_app/features/mood_tone/domain/models/mood_entity.dart';
import 'package:music_app/features/mood_tone/domain/models/tone_entity.dart';

/// Full read model for detail screen and createMoment result.
class MomentDetailEntity extends Equatable {
  final String id;
  final String? title;
  final String? note;
  final DateTime momentDate;
  final String? locationName;
  final String? address;
  final String? city;
  final String? country;
  final double? latitude;
  final double? longitude;
  final bool isFavorite;
  final bool isPinned;
  final bool isHiddenFromWidget;
  final bool isLocked;
  final MoodEntity? mood;
  final ToneEntity? tone;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<MomentAssetEntity> assets;
  final List<TagEntity> tags;

  const MomentDetailEntity({
    required this.id,
    this.title,
    this.note,
    required this.momentDate,
    this.locationName,
    this.address,
    this.city,
    this.country,
    this.latitude,
    this.longitude,
    this.isFavorite = false,
    this.isPinned = false,
    this.isHiddenFromWidget = false,
    this.isLocked = false,
    this.mood,
    this.tone,
    required this.createdAt,
    required this.updatedAt,
    this.assets = const [],
    this.tags = const [],
  });

  @override
  List<Object?> get props => [
    id, title, note, momentDate, locationName, address, city, country,
    latitude, longitude, isFavorite, isPinned, isHiddenFromWidget, isLocked,
    mood, tone, createdAt, updatedAt, assets, tags,
  ];
}
