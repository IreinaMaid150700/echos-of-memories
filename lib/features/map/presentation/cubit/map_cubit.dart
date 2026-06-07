import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/core/utils/models/loaded.dart';
import 'package:music_app/features/moment/domain/models/moment_entity.dart';
import 'package:music_app/features/moment/domain/usecases/get_moments_usecase.dart';

part 'map_state.dart';
part 'map_cubit.freezed.dart';

class MapCubit extends BaseCubit<MapState> {
  final GetMomentsUseCase _getMomentsUseCase;

  MapCubit({required GetMomentsUseCase getMomentsUseCase})
    : _getMomentsUseCase = getMomentsUseCase,
      super(const MapState());

  Future<void> loadMoments() async {
    await execute(
      loadingState: state.copyWith(moments: state.moments.toLoading()),
      action: () => _getMomentsUseCase(),
      onSuccess: (moments) =>
          state.copyWith(moments: state.moments.toSuccess(moments)),
      onFailure: (f) =>
          state.copyWith(moments: state.moments.toFailure(f.message)),
    );
  }

  /// Lấy vị trí hiện tại của thiết bị (xin quyền nếu cần).
  ///
  /// Thành công: tăng [MapState.focusTick] để UI recenter dù toạ độ trùng.
  /// Thất bại (tắt GPS / từ chối quyền / lỗi): set [MapState.locateMessage]
  /// để UI báo cho người dùng thay vì nuốt êm.
  Future<void> locateMe() async {
    if (state.isLocating) return;
    emit(state.copyWith(isLocating: true, locateMessage: null));
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(
          state.copyWith(
            isLocating: false,
            locateMessage: 'Dịch vụ vị trí đang tắt. Hãy bật GPS rồi thử lại.',
          ),
        );
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        emit(
          state.copyWith(
            isLocating: false,
            locateMessage: 'Ứng dụng chưa được cấp quyền vị trí.',
          ),
        );
        return;
      }

      final position = await Geolocator.getCurrentPosition();
      emit(
        state.copyWith(
          isLocating: false,
          currentLatitude: position.latitude,
          currentLongitude: position.longitude,
          focusTick: state.focusTick + 1,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLocating: false,
          locateMessage: 'Không lấy được vị trí. Hãy thử lại.',
        ),
      );
    }
  }
}
