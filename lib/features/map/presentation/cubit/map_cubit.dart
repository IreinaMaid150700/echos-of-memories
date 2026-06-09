import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/core/utils/models/loaded.dart';
import 'package:music_app/features/moment/domain/models/moment_entity.dart';
import 'package:music_app/features/moment/domain/usecases/watch_moments_usecase.dart';

part 'map_state.dart';
part 'map_cubit.freezed.dart';

class MapCubit extends BaseCubit<MapState> {
  final WatchMomentsUseCase _watchMomentsUseCase;
  StreamSubscription<List<MomentEntity>>? _sub;

  MapCubit({required WatchMomentsUseCase watchMomentsUseCase})
      : _watchMomentsUseCase = watchMomentsUseCase,
        super(const MapState());

  void loadMoments() {
    _sub?.cancel();
    emit(state.copyWith(moments: state.moments.toLoading()));
    _sub = _watchMomentsUseCase().listen(
      (moments) => emit(state.copyWith(moments: state.moments.toSuccess(moments))),
      onError: (Object e) =>
          emit(state.copyWith(moments: state.moments.toFailure(e.toString()))),
    );
  }

  Future<void> locateMe() async {
    if (state.isLocating) return;
    emit(state.copyWith(isLocating: true, locateMessage: null));
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(state.copyWith(
          isLocating: false,
          locateMessage: 'Dịch vụ vị trí đang tắt. Hãy bật GPS rồi thử lại.',
        ));
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        emit(state.copyWith(
          isLocating: false,
          locateMessage: 'Ứng dụng chưa được cấp quyền vị trí.',
        ));
        return;
      }

      final position = await Geolocator.getCurrentPosition();
      emit(state.copyWith(
        isLocating: false,
        currentLatitude: position.latitude,
        currentLongitude: position.longitude,
        focusTick: state.focusTick + 1,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLocating: false,
        locateMessage: 'Không lấy được vị trí. Hãy thử lại.',
      ));
    }
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
