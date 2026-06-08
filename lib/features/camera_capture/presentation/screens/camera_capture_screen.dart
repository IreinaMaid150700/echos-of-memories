import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:music_app/core/router/app_routers.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/features/camera_capture/presentation/cubit/camera_capture_cubit.dart';

@RoutePage()
class CameraCaptureScreen extends StatelessWidget {
  const CameraCaptureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CameraCaptureCubit()..init(),
      child: const _CameraCaptureView(),
    );
  }
}

class _CameraCaptureView extends StatelessWidget {
  const _CameraCaptureView();

  void _goToCreate(BuildContext context, List<File> images) {
    context.router.replace(CreateMomentRoute(initialImages: images));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocConsumer<CameraCaptureCubit, CameraCaptureState>(
          listenWhen: (p, c) => p.errorMessage != c.errorMessage,
          listener: (context, state) {
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(state.errorMessage!)));
            }
          },
          builder: (context, state) {
            final cubit = context.read<CameraCaptureCubit>();

            if (state.permissionDenied) {
              return _PermissionDenied(
                onSkip: () => _goToCreate(context, const []),
              );
            }
            if (state.isInitializing || !state.isReady) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            return Stack(
              fit: StackFit.expand,
              children: [
                CameraPreview(cubit.controller!),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: TextButton(
                      onPressed: () => _goToCreate(context, state.captured),
                      child: const Text(
                        'Bỏ qua',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _CaptureBar(
                    captured: state.captured,
                    isCapturing: state.isCapturing,
                    onCapture: cubit.capture,
                    onRemove: cubit.removeCaptured,
                    onContinue: state.captured.isEmpty
                        ? null
                        : () => _goToCreate(context, state.captured),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CaptureBar extends StatelessWidget {
  final List<File> captured;
  final bool isCapturing;
  final VoidCallback onCapture;
  final void Function(int index) onRemove;
  final VoidCallback? onContinue;

  const _CaptureBar({
    required this.captured,
    required this.isCapturing,
    required this.onCapture,
    required this.onRemove,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      color: Colors.black.withValues(alpha: 0.45),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (captured.isNotEmpty)
            SizedBox(
              height: 56,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: captured.length,
                separatorBuilder: (_, __) => const Gap(AppSpacing.xs),
                itemBuilder: (context, i) => Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                      child: Image.file(
                        captured[i],
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () => onRemove(i),
                        child: const CircleAvatar(
                          radius: 9,
                          backgroundColor: Colors.black54,
                          child: Icon(Icons.close, size: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          const Gap(AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 72),
              GestureDetector(
                onTap: isCapturing ? null : onCapture,
                child: Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.white70, width: 4),
                  ),
                  child: isCapturing
                      ? const Padding(
                          padding: EdgeInsets.all(18),
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : null,
                ),
              ),
              SizedBox(
                width: 72,
                child: TextButton(
                  onPressed: onContinue,
                  child: Text(
                    'Tiếp tục',
                    style: TextStyle(
                      color: onContinue == null ? Colors.white38 : Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PermissionDenied extends StatelessWidget {
  final VoidCallback onSkip;
  const _PermissionDenied({required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.no_photography_outlined,
                color: Colors.white, size: 48),
            const Gap(AppSpacing.md),
            const Text(
              'Chưa được cấp quyền camera.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            const Gap(AppSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => openAppSettings(),
                  child: const Text('Mở cài đặt'),
                ),
                const Gap(AppSpacing.sm),
                TextButton(
                  onPressed: onSkip,
                  child: const Text('Bỏ qua',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
