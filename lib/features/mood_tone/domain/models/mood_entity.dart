import 'package:equatable/equatable.dart';

class MoodEntity extends Equatable {
  final String id;
  final String code;
  final String name;
  final String emoji;
  final String key;
  final String? colorHex;

  const MoodEntity({
    required this.id,
    required this.code,
    required this.name,
    required this.emoji,
    required this.key,
    this.colorHex,
  });

  @override
  List<Object?> get props => [id, code, name, emoji, key, colorHex];
}
