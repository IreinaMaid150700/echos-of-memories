part of '../screens/moment_detail_screen.dart';

class _FullscreenButton extends StatelessWidget {
  const _FullscreenButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: context.themeColors.surface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Icon(
        Icons.fullscreen_outlined,
        size: 18,
        color: context.themeColors.textSecondary,
      ),
    );
  }
}