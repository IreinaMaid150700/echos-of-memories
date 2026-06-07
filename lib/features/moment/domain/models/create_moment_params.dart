import 'package:music_app/features/create_moment/domain/models/tag_entity.dart';
import 'package:music_app/features/moment/domain/models/moment_asset_input.dart';

class CreateMomentParams {
  final String? title;
  final String? note;
  final DateTime momentDate;
  final List<TagEntity> tags;
  final bool isFavorite;
  final bool isHiddenFromWidget;
  final bool isLocked;
  final double? latitude;
  final double? longitude;
  final String? locationName;
  final String? moodId;
  final String? toneId;
  final List<MomentAssetInput> assets;

  const CreateMomentParams({
    this.title,
    this.note,
    required this.momentDate,
    required this.tags,
    required this.isFavorite,
    required this.isHiddenFromWidget,
    required this.isLocked,
    this.latitude,
    this.longitude,
    this.locationName,
    this.moodId,
    this.toneId,
    this.assets = const [],
  });
}
