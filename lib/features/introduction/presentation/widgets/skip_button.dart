part of '../introduction_screen.dart';
class _SkipButton extends StatelessWidget {
  const _SkipButton({required this.onSkip, required this.visible});

  final VoidCallback onSkip;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSpacing.md,
            right: AppSpacing.xl,
          ),
          child: GestureDetector(
            onTap: visible ? onSkip : null,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xs),
              child: Text(
                'Bỏ qua',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.themeColors.textSecondary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}