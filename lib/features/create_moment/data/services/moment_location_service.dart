import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_moment/domain/models/moment_location_data.dart';
import 'package:music_app/features/create_moment/domain/repositories/moment_location_repository.dart';

/// Wraps Geolocator + Geocoding.
@LazySingleton(as: MomentLocationRepository)
class MomentLocationService implements MomentLocationRepository {
  @override
  Future<Either<Failure, MomentLocationData>> getCurrentLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return const Left(
          UnknownFailure(
            message: 'Dịch vụ vị trí đang tắt. Hãy bật GPS rồi thử lại.',
          ),
        );
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return const Left(
          UnknownFailure(message: 'Ứng dụng chưa được cấp quyền vị trí.'),
        );
      }

      final position = await Geolocator.getCurrentPosition();
      final name = await _resolveAddress(position.latitude, position.longitude);
      return Right(
        MomentLocationData(
          latitude: position.latitude,
          longitude: position.longitude,
          name: name,
        ),
      );
    } catch (_) {
      return const Left(
        UnknownFailure(message: 'Không lấy được vị trí. Hãy thử lại.'),
      );
    }
  }

  Future<String> _resolveAddress(double lat, double lng) async {
    final fallback = '${lat.toStringAsFixed(5)}, ${lng.toStringAsFixed(5)}';
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isEmpty) return fallback;
      final pm = placemarks.first;
      final parts = <String?>[
        pm.street,
        pm.subAdministrativeArea,
        pm.administrativeArea,
        pm.country,
      ].where((e) => e != null && e.trim().isNotEmpty).toList();
      return parts.isEmpty ? fallback : parts.join(', ');
    } catch (_) {
      return fallback;
    }
  }
}
