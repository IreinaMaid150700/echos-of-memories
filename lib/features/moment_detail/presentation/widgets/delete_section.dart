part of '../screens/moment_detail_screen.dart';
class _DeleteCard extends StatelessWidget {
  const _DeleteCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: context.themeColors.dangerBackground.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: context.themeColors.dangerText.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.delete_outline,
                size: 18,
                color: context.themeColors.dangerText,
              ),
              const Gap(AppSpacing.xs),
              Text(
                'Delete this memory',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.themeColors.dangerText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Gap(AppSpacing.xxs),
          Text(
            'Removed gently from your timeline. This can\'t be undone.',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.themeColors.dangerText.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}
