import 'package:equatable/equatable.dart';

class ToneEntity extends Equatable {
  final String id;
  final String code;
  final String name;
  final String key;
  final String lightColorHex;
  final String? darkColorHex;
  final int sortOrder;

  const ToneEntity({
    required this.id,
    required this.code,
    required this.name,
    required this.key,
    required this.lightColorHex,
    this.darkColorHex,
    this.sortOrder = 0,
  });

  @override
  List<Object?> get props => [
    id,
    code,
    name,
    key,
    lightColorHex,
    darkColorHex,
    sortOrder,
  ];
}
