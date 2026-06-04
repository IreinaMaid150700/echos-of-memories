import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/core/gen/assets.gen.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';

class EmptyStateWidget extends StatelessWidget {
  final VoidCallback? onCreatePressed;
  final String? title;
  final String? subtitle;
  final String? buttonLabel;

  const EmptyStateWidget({
    super.key,
    this.onCreatePressed,
    this.title,
    this.subtitle,
    this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.screen,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _IllustrationCircle(colors: colors),
            const SizedBox(height: AppSpacing.xl),
            Text(
              title ?? 'Chưa có khoảnh khắc nào',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.heading,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colors.textPrimary,
                height: 1.3,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              subtitle ?? 'Hãy lưu lại những khoảnh khắc\nđặc biệt của bạn',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.body,
                fontSize: 13.5,
                color: colors.textMuted,
                height: 1.6,
              ),
            ),
            if (onCreatePressed != null) ...[
              const SizedBox(height: AppSpacing.xxl),
              _CreateButton(
                colors: colors,
                onPressed: onCreatePressed!,
                label: buttonLabel ?? 'Tạo khoảnh khắc đầu tiên',
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _IllustrationCircle extends StatelessWidget {
  final AppCustomColors colors;

  const _IllustrationCircle({required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: colors.tertiary.withValues(alpha: 0.45),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          Assets.icons.icEmptyCenter,
          width: 52,
          height: 52,
          colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
        ),
      ),
    );
  }
}

class _CreateButton extends StatelessWidget {
  final AppCustomColors colors;
  final VoidCallback onPressed;
  final String label;

  const _CreateButton({
    required this.colors,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: colors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        minimumSize: const Size(160, 44),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: AppFonts.body,
          fontSize: 13.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
