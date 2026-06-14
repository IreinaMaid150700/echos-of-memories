import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/location/domain/location_gateway.dart';

@LazySingleton(as: LocationGateway)
class LocationService implements LocationGateway {
  @override
  Future<bool> isLocationServiceEnabled() =>
      Geolocator.isLocationServiceEnabled();

  @override
  Future<Position> getCurrentPosition() => Geolocator.getCurrentPosition();
}
