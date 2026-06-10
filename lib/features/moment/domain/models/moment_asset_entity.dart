import 'package:equatable/equatable.dart';

class MomentAssetEntity extends Equatable {
  final String id;
  final String type; // 'image' | 'video'
  final String path;
  final String? thumbnailPath;
  final int width;
  final int height;
  final int sortOrder;
  final int? durationMs;
  final String? mimeType;

  const MomentAssetEntity({
    required this.id,
    required this.type,
    required this.path,
    this.thumbnailPath,
    required this.width,
    required this.height,
    required this.sortOrder,
    this.durationMs,
    this.mimeType,
  });

  @override
  List<Object?> get props => [
    id, type, path, thumbnailPath, width, height, sortOrder, durationMs, mimeType,
  ];
}
