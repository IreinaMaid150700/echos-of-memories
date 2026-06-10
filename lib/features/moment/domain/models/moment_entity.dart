import 'package:equatable/equatable.dart';
import 'package:music_app/features/moment/domain/models/tag_entity.dart';

class MomentEntity extends Equatable {
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
  final String? moodId;
  final String? toneId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? coverAssetId;
  final String? coverAsset;
  final List<TagEntity> tags;

  const MomentEntity({
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
    this.moodId,
    this.toneId,
    required this.createdAt,
    required this.updatedAt,
    this.coverAssetId,
    this.tags = const [],
    this.coverAsset,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    note,
    momentDate,
    locationName,
    address,
    city,
    country,
    latitude,
    longitude,
    isFavorite,
    isPinned,
    isHiddenFromWidget,
    isLocked,
    moodId,
    toneId,
    createdAt,
    updatedAt,
    tags,
    coverAssetId,
  ];
}
