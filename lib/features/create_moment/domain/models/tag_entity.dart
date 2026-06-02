import 'package:equatable/equatable.dart';

class TagEntity extends Equatable {
  final String id;
  final String name;
  final String normalizedName;
  final String? colorHex;
  final String? groupKey;
  final int usageCount;

  const TagEntity({
    required this.id,
    required this.name,
    required this.normalizedName,
    this.colorHex,
    this.groupKey,
    this.usageCount = 0,
  });

  @override
  List<Object?> get props =>
      [id, name, normalizedName, colorHex, groupKey, usageCount];
}