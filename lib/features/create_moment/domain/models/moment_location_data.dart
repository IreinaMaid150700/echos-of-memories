import 'package:equatable/equatable.dart';

class MomentLocationData extends Equatable {
  final double latitude;
  final double longitude;
  final String name;

  const MomentLocationData({
    required this.latitude,
    required this.longitude,
    required this.name,
  });

  @override
  List<Object?> get props => [latitude, longitude, name];
}
