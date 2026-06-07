part of '../create_moment_screen.dart';

class _CollectionRow extends StatelessWidget {
  const _CollectionRow();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppRadius.lg),
      onTap: () => context.router.push(const CreateCollectionRoute()),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: context.themeColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: context.themeColors.borderSubtle),
        ),
        child: Row(
          children: [
            _CollectionIconContainer(icon: Icons.collections_bookmark_outlined),
            const Gap(AppSpacing.sm),
            Expanded(
              child: Text(
                'Thêm vào bộ sưu tập',
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.themeColors.textMuted,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: context.themeColors.textMuted,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _CollectionIconContainer extends StatelessWidget {
  final IconData icon;

  const _CollectionIconContainer({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: context.themeColors.tertiary.withValues(alpha: 0.3),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16, color: context.themeColors.textSecondary),
    );
  }
}
