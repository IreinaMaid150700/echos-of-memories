import 'package:geolocator/geolocator.dart';

/// Cổng truy cập vị trí thiết bị — che static calls của Geolocator
/// để Cubit có thể mock được trong unit test.
abstract class LocationGateway {
  /// Dịch vụ vị trí (GPS) của thiết bị có đang bật không.
  Future<bool> isLocationServiceEnabled();

  /// Lấy toạ độ hiện tại của thiết bị.
  Future<Position> getCurrentPosition();
}
