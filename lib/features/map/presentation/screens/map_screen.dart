import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:music_app/core/di/injector.dart';
import 'package:music_app/core/router/app_routers.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/core/utils/extensions/date_time_extension.dart';
import 'package:music_app/features/map/presentation/cubit/map_cubit.dart';
import 'package:music_app/features/moment/domain/models/moment_entity.dart';
import 'package:music_app/features/moment/domain/usecases/get_moments_usecase.dart';

/// Bản đồ hiển thị các moment có toạ độ + vị trí hiện tại của người dùng.
/// Tile dùng OpenStreetMap (không cần API key).
class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MapCubit(getMomentsUseCase: getIt<GetMomentsUseCase>())
        ..loadMoments(),
      child: const _MapScreenRoot(),
    );
  }
}

class _MapScreenRoot extends StatefulWidget {
  const _MapScreenRoot();

  @override
  State<_MapScreenRoot> createState() => _MapScreenRootState();
}

class _MapScreenRootState extends State<_MapScreenRoot> {
  static const _fallbackCenter = LatLng(16.047079, 108.206230); // Việt Nam
  static const _osmTileUrl =
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  final MapController _mapController = MapController();

  List<MomentEntity> _withCoords(List<MomentEntity>? moments) =>
      (moments ?? [])
          .where((m) => m.latitude != null && m.longitude != null)
          .toList();

  LatLng _initialCenter(List<MomentEntity> located) =>
      located.isNotEmpty
          ? LatLng(located.first.latitude!, located.first.longitude!)
          : _fallbackCenter;

  void _showMomentSheet(BuildContext context, MomentEntity moment) {
    final colors = context.themeColors;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: colors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  moment.title ?? moment.locationName ?? 'Khoảnh khắc',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  moment.momentDate.toDateString(),
                  style: context.textTheme.bodySmall?.copyWith(
                    color: colors.textMuted,
                  ),
                ),
                if (moment.locationName != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        size: 16,
                        color: colors.textMuted,
                      ),
                      const SizedBox(width: AppSpacing.xxs),
                      Expanded(
                        child: Text(
                          moment.locationName!,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: colors.textMuted,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                if (moment.note != null) ...[
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    moment.note!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ],
                const SizedBox(height: AppSpacing.lg),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.of(sheetContext).pop();
                      context.router.push(
                        MomentDetailRoute(momentId: moment.id),
                      );
                    },
                    child: const Text('Xem chi tiết'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    return BlocConsumer<MapCubit, MapState>(
      listenWhen: (prev, curr) =>
          prev.focusTick != curr.focusTick ||
          prev.locateMessage != curr.locateMessage,
      listener: (context, state) {
        // Recenter mỗi lần lấy vị trí thành công (focusTick tăng), kể cả khi
        // toạ độ trùng lần trước.
        if (state.focusTick > 0 &&
            state.currentLatitude != null &&
            state.currentLongitude != null) {
          _mapController.move(
            LatLng(state.currentLatitude!, state.currentLongitude!),
            15,
          );
        }
        // Báo lỗi lấy vị trí (tắt GPS / từ chối quyền / lỗi).
        if (state.locateMessage != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.locateMessage!)));
        }
      },
      builder: (context, state) {
        final located = _withCoords(state.moments.data);
        return Scaffold(
          body: FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _initialCenter(located),
              initialZoom: located.isNotEmpty ? 12 : 5,
              minZoom: 2,
              maxZoom: 18,
            ),
            children: [
              TileLayer(
                urlTemplate: _osmTileUrl,
                userAgentPackageName: 'com.example.music_app',
              ),
              if (state.currentLatitude != null &&
                  state.currentLongitude != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(
                        state.currentLatitude!,
                        state.currentLongitude!,
                      ),
                      width: 22,
                      height: 22,
                      child: _CurrentLocationDot(color: colors.primary),
                    ),
                  ],
                ),
              MarkerLayer(
                markers: [
                  for (final moment in located)
                    Marker(
                      point: LatLng(moment.latitude!, moment.longitude!),
                      width: 44,
                      height: 44,
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () => _showMomentSheet(context, moment),
                        child: Icon(
                          Icons.location_on,
                          size: 40,
                          color: colors.primary,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          floatingActionButton: Padding(
            // Nâng lên trên thanh điều hướng nổi của Home (66 + padding) cộng
            // safe-area, vì Scaffold cha dùng extendBody.
            padding: EdgeInsets.only(
              bottom: 86 + MediaQuery.paddingOf(context).bottom,
            ),
            child: FloatingActionButton(
              onPressed: () => context.read<MapCubit>().locateMe(),
              backgroundColor: colors.surface,
              foregroundColor: colors.primary,
              child: state.isLocating
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.my_location),
            ),
          ),
        );
      },
    );
  }
}

class _CurrentLocationDot extends StatelessWidget {
  final Color color;

  const _CurrentLocationDot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 6,
          ),
        ],
      ),
    );
  }
}
