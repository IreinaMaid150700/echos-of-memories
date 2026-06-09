import 'dart:io';
import 'dart:ui' as ui;

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
import 'package:music_app/features/moment/domain/usecases/watch_moments_usecase.dart';

/// Bản đồ hiển thị các moment có toạ độ + vị trí hiện tại của người dùng.
/// Tile dùng OpenStreetMap (không cần API key).
class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MapCubit(watchMomentsUseCase: getIt<WatchMomentsUseCase>())
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
  // CartoDB Positron: style phẳng, sáng, tối giản (sạch hơn OSM chuẩn).
  static const _tileUrl =
      'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png';
  static const _tileSubdomains = ['a', 'b', 'c', 'd'];

  final MapController _mapController = MapController();

  // Bảng màu xoay vòng cho marker → trông đa dạng như ảnh mẫu.
  static const _markerPalette = [
    Color(0xFFC2613C), // terracotta
    Color(0xFF3F6CA6), // blue
    Color(0xFF8C5A3C), // brown
    Color(0xFFD68A3C), // amber
    Color(0xFF5B8C6E), // green
  ];

  Color _markerColor(MomentEntity m) =>
      _markerPalette[m.id.hashCode.abs() % _markerPalette.length];

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
                urlTemplate: _tileUrl,
                subdomains: _tileSubdomains,
                retinaMode: RetinaMode.isHighDensity(context),
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
                      width: 48,
                      height: 56,
                      // Đáy (mũi pin) trùng đúng toạ độ.
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () => _showMomentSheet(context, moment),
                        child: _MomentMarker(
                          color: _markerColor(moment),
                          icon: moment.isFavorite
                              ? Icons.favorite
                              : Icons.place,
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

/// Marker dạng pin giọt nước: vòng tròn viền màu chứa ảnh hoặc icon, đuôi nhọn
/// chỉ xuống đúng toạ độ. [imagePath] != null → hiển thị ảnh bìa của moment.
class _MomentMarker extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String? imagePath;

  const _MomentMarker({
    required this.color,
    required this.icon,
    // ignore: unused_element_parameter
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 46,
          height: 46,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.22),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            child: imagePath != null
                ? Image.file(File(imagePath!), fit: BoxFit.cover)
                : Icon(icon, size: 20, color: color),
          ),
        ),
        // Đuôi nhọn chồng nhẹ lên đáy vòng tròn để thành hình giọt nước.
        Transform.translate(
          offset: const Offset(0, -4),
          child: CustomPaint(
            size: const Size(14, 9),
            painter: _PinTailPainter(color),
          ),
        ),
      ],
    );
  }
}

class _PinTailPainter extends CustomPainter {
  final Color color;

  const _PinTailPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = ui.Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _PinTailPainter old) => old.color != color;
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
