part of 'map_cubit.dart';

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    @Default(Loaded<List<MomentEntity>>()) Loaded<List<MomentEntity>> moments,
    @Default(false) bool isLocating,
    double? currentLatitude,
    double? currentLongitude,
    // Tăng mỗi lần lấy vị trí thành công để UI recenter lại dù toạ độ trùng.
    @Default(0) int focusTick,
    // Thông báo tạm thời khi không lấy được vị trí (tắt GPS / từ chối quyền).
    String? locateMessage,
  }) = _MapState;
}
