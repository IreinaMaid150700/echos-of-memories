import 'package:music_app/features/create_moment/domain/models/tag_entity.dart';

class CreateMomentParams {
  final String? title;
  final String? note;
  final DateTime momentDate;
  final List<TagEntity> tags;
  final bool isFavorite;
  final bool isHiddenFromWidget;
  final bool isLocked;

  const CreateMomentParams({
    this.title,
    this.note,
    required this.momentDate,
    required this.tags,
    required this.isFavorite,
    required this.isHiddenFromWidget,
    required this.isLocked,
  });
}
